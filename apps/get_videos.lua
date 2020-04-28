#!/usr/bin/lua

-- Add libs to path
package.path = package.path..";/root/?.lua"
package.path = package.path..";../?.lua"

-- Require the HTTP portion of LuaSocket
local http  = require("ssl.https")
local socket = require("socket")
local ltn12 = require("ltn12")
local json    = require("utils/json")

local server_file_data = io.open('/root/config/.server', 'r'):read('*all')
local sm_id_file_data = io.open('/root/config/auth/sm_id', 'r'):read()
local sm_auth_file_data = io.open('/root/config/auth/sm_auth2', 'r'):read()
local sm_network_file_data = io.open('/root/config/auth/network_id', 'r'):read()
local update_file_data = nil
local last_update_file = io.open('/root/apps/bling/last_update', 'r');
local last_update_file_data
local device = "/mnt/usb"

local credentials = json.decode(sm_auth_file_data)

function log(message)
    print("BlingWRT: " .. message)
end

function download_video(video)
    local date = string.sub(video["created_at"], 0, 10) 
    local path = string.gsub(date, "-", "/")

    local video_file = io.open(device .. "/video/" .. path .. "/" .. video["media"]:match("^.+/(.+)$"), 'r')

    if video_file == nil then
        log("Downloading video " .. device .. "/video/" .. path .. "/" ..video["media"]:match("^.+/(.+)$"))

        os.execute("mkdir -p ".. device .. "/video/" .. path)

        local video_data = {}
        local  body, code, headers, status = http.request{
            url     = "https://rest-" .. server_file_data .. video["media"],
            method  = "GET",
            headers = {
                    ["TOKEN-AUTH"] = credentials["authtoken"]["authtoken"],
            },
            sink    = ltn12.sink.file(io.open(device .. "/video/" .. path .. "/" .. video["media"]:match("^.+/(.+)$"), "w"))
        }

        if tostring(code) == "200" then
            log("Done")
        else
            log("Error " .. code)
        end

        os.execute("sleep 1s")
    else
        log("<Skipping video " .. device .. "/video/" .. path .. "/" ..video["media"]:match("^.+/(.+)$") .. ", already downloaded>")
        video_file:close()
    end
end

function get_videos(page)
    local result_table = {}
    local  body, code, headers, status = http.request{
        url     = "https://rest-" .. server_file_data .. "/api/v1/accounts/" .. credentials["account"]["id"] .. "/media/changed?since=" .. last_update_file_data .. "&page=" .. page,
        method  = "GET",
        headers = {
                ["TOKEN-AUTH"] = credentials["authtoken"]["authtoken"],
        },
        sink    = ltn12.sink.table(result_table)
    }

    log(tostring("https://rest-" .. server_file_data .. "/api/v1/accounts/" .. credentials["account"]["id"] .. "/media/changed?since=" .. last_update_file_data .. "&page=" .. page) .. " " .. tostring(code))

    if tostring(code) == "200" then
        result_table=json.decode(table.concat(result_table))

        if table.getn(result_table["media"]) > 0 then
            for key,value in pairs(result_table["media"]) do
                if value["deleted"] == false then
                    download_video(value)
                    if update_file_data == nil then
                        update_file_data = value["created_at"]
                    end
                end
            end
            os.execute("sleep 5s")
            get_videos(page + 1)
        end
    else
        log("error " .. tostring(body))
    end
end

function update_time(date)
    local last_update_file = io.open('/root/apps/bling/last_update', 'w');
    last_update_file:write(date)
    last_update_file:close()
    log("Updating date to " .. date)
end

local handle = io.popen("findmnt | grep " .. device)
local result = handle:read("*a")
handle:close()

if result ~= "" then
    if last_update_file == nil then
        last_update_file_data = "-999999999-01-01T00:00:00+18:00"
    else
        last_update_file_data = last_update_file:read()
    end
    
    get_videos(1)
    
    if update_file_data ~= nil then
        -- update_time(update_file_data)
    end
else
    log("There is no device mounted in " .. device)
end