_G.NameInput = "string"

local PathfindingService = game:GetService("PathfindingService")
local Players = game:GetService("Players")
local Character = Players.LocalPlayer.Character or Players.LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local tasks = {}
local proximityprompts = {}
local path = PathfindingService:CreatePath({AgentCanJump = false,AgentCanClimb = false,})
local config = require(game:GetService("ReplicatedStorage").config)
local HumanoidRootPart = Character.HumanoidRootPart

local function GetPlayer(Input)
    for _, Player in ipairs(Players:GetPlayers()) do
        if (string.lower(Input) == string.sub(string.lower(Player.Name), 1, #Input)) then
            return Player;
        end
    end
end

local function getclosestprompt()
    local Character = Players.LocalPlayer.Character or Players.LocalPlayer.CharacterAdded:Wait()
    local prompt, distance = nil, 9e9

    for i,v in pairs(proximityprompts) do
        if Character and Character:FindFirstChild("HumanoidRootPart") then
            local distanceBetween = (Character.HumanoidRootPart.Position - i.Position).Magnitude

            if distanceBetween < distance then
                distance = distanceBetween
                prompt = v
            end
        end
    end

    return prompt
end

local function fireproximityprompt(Obj, Amount, Skip)
    if Obj.ClassName == "ProximityPrompt" then 
        Amount = Amount or 1
        local PromptTime = Obj.HoldDuration
        if Skip then 
            Obj.HoldDuration = 0
        end
        for i = 1, Amount do 
            Obj:InputHoldBegin()
            if not Skip then 
                task.wait(Obj.HoldDuration + 1)
            end
            Obj:InputHoldEnd()
        end
        Obj.HoldDuration = PromptTime
    else 
        error("userdata<ProximityPrompt> expected")
    end
end

local function killplayer(name)
    if name == "all" then
        for i,v in pairs(Players:GetChildren()) do
            if v ~= Players.LocalPlayer then
                game:GetService("ReplicatedStorage").Remotes.KillCharacter:InvokeServer(v.Character)
            end
        end
    else
        game:GetService("ReplicatedStorage").Remotes.KillCharacter:InvokeServer(GetPlayer(name).Character)
    end
end

for i,v in pairs(game:GetService("ReplicatedStorage").Remotes.RequestTaskList:InvokeServer()) do
    if v.TaskRequired then
        tasks[v.TaskName] = v
        print(v.TaskName .. " | " .. v.TaskDescriptor .. " | " .. v.TaskType)
    end
end

for i,v in pairs(workspace.LoadedMap:GetDescendants()) do
    if v:IsA("ProximityPrompt") then
        proximityprompts[v.Parent.Parent] = v
    end
end


local function doTasks()
    for i,v in pairs(tasks) do
        print(Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position)
        path:ComputeAsync(Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart", 2).Position, v.CFrame.Position)

        for i2, v2 in pairs(path:GetWaypoints()) do
            Humanoid:MoveTo(v2.Position)
            Humanoid.MoveToFinished:Wait()
        end

        task.wait(0.1)
        fireproximityprompt(getclosestprompt())
        task.wait(math.random(0.5, 2))
    end
end
local TaskTable = {{20,19,16,18},{6,7,8,9}}
local ChangeColorTable = {17,10}
function GetMap()
  if game.Workspace.LoadedMap:FindFirstChild("Bank") then
    return 2
  else
    return 1
  end
end
function RoundStarted()
  return game:GetService("ReplicatedStorage").RoundActive.Value
end

function PlayerTeam()
  if RoundStarted() then
    if game.Players.LocalPlayer.Character.FancyHat.Transparency == 0 then
      return 2
    else
      return 1
    end
  end
end

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://github.com/rscript-O0607O/-4-4SH4-X0CP-9-QvzU9Vp-u-XtO7pKRxr-A-ggh-caVYh/raw/main/loader/scripts/main/config.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "RoScript V5",
    SubTitle = "by R9OKM",
    TabWidth = 100,
    Size = UDim2.fromOffset(425, 300),
    Acrylic = true,
    Theme = "Amethyst",
    MinimizeKey = Enum.KeyCode.LeftControl 
})

local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "" }),
	Hunter = Window:AddTab({ Title = "Hunter", Icon = "" }),
  Troll = Window:AddTab({ Title = "Troll", Icon = "" }),
	Player = Window:AddTab({ Title = "Player", Icon = "" }),
	Game = Window:AddTab({ Title = "Game", Icon = "" }),
	Credit = Window:AddTab({ Title = "Credit", Icon = "" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}
Window:Dialog({
                Title = "Credit",
                Content = "This script is made by R9OKM.",
                Buttons = {
                    {
                        Title = "OK",
                        Callback = function()
                            return
                        end
                    }
				}
				})
Tabs.Main:AddButton({
        Title = "Kill All",
        Description = "",
        Callback = function()
		killplayer("all")
		end
    })
Tabs.Main:AddButton({
  Title = "ESP",
  Description = "",
  Callback = function()
      loadstring(game:HttpGet('https://raw.githubusercontent.com/Lucasfin000/SpaceHub/main/UESP'))()
end
})
	Tabs.Main:AddButton({
        Title = "Complete All Tasks",
        Description = "",
        Callback = function()
		local args = {
        [1] = 1
    }
    
    game:GetService("ReplicatedStorage").Remotes.InvokeTaskCompleted:InvokeServer(unpack(args))
    local args = {
        [1] = 2
    }
    
    game:GetService("ReplicatedStorage").Remotes.InvokeTaskCompleted:InvokeServer(unpack(args))
    local args = {
        [1] = 3
    }
    
    game:GetService("ReplicatedStorage").Remotes.InvokeTaskCompleted:InvokeServer(unpack(args))
    local args = {
        [1] = 4
    }
    
    game:GetService("ReplicatedStorage").Remotes.InvokeTaskCompleted:InvokeServer(unpack(args))
    local args = {
        [1] = 5
    }
    
    game:GetService("ReplicatedStorage").Remotes.InvokeTaskCompleted:InvokeServer(unpack(args))
    local args = {
        [1] = 6
    }
    
    game:GetService("ReplicatedStorage").Remotes.InvokeTaskCompleted:InvokeServer(unpack(args))
    local args = {
        [1] = 7
    }
    
    game:GetService("ReplicatedStorage").Remotes.InvokeTaskCompleted:InvokeServer(unpack(args))
    local args = {
        [1] = 8
    }
    
    game:GetService("ReplicatedStorage").Remotes.InvokeTaskCompleted:InvokeServer(unpack(args))
    local args = {
        [1] = 9
    }
    
    game:GetService("ReplicatedStorage").Remotes.InvokeTaskCompleted:InvokeServer(unpack(args))
    local args = {
        [1] = 10
    }
    
    game:GetService("ReplicatedStorage").Remotes.InvokeTaskCompleted:InvokeServer(unpack(args))
    local args = {
        [1] = 11
    }
    
    game:GetService("ReplicatedStorage").Remotes.InvokeTaskCompleted:InvokeServer(unpack(args))
    local args = {
        [1] = 12
    }
    
    game:GetService("ReplicatedStorage").Remotes.InvokeTaskCompleted:InvokeServer(unpack(args))
    local args = {
        [1] = 13
    }
    
    game:GetService("ReplicatedStorage").Remotes.InvokeTaskCompleted:InvokeServer(unpack(args))
    local args = {
        [1] = 14
    }
    
    game:GetService("ReplicatedStorage").Remotes.InvokeTaskCompleted:InvokeServer(unpack(args))
    local args = {
        [1] = 15
    }
    
    game:GetService("ReplicatedStorage").Remotes.InvokeTaskCompleted:InvokeServer(unpack(args))
    local args = {
        [1] = 16
    }
    
    game:GetService("ReplicatedStorage").Remotes.InvokeTaskCompleted:InvokeServer(unpack(args))
    local args = {
        [1] = 17
    }
    
    game:GetService("ReplicatedStorage").Remotes.InvokeTaskCompleted:InvokeServer(unpack(args))
    local args = {
        [1] = 18
    }
    
    game:GetService("ReplicatedStorage").Remotes.InvokeTaskCompleted:InvokeServer(unpack(args))
    local args = {
        [1] = 19
    }
    
    game:GetService("ReplicatedStorage").Remotes.InvokeTaskCompleted:InvokeServer(unpack(args))
    local args = {
        [1] = 20
    }
    
    game:GetService("ReplicatedStorage").Remotes.InvokeTaskCompleted:InvokeServer(unpack(args))
    local args = {
        [1] = 21
    }
    
    game:GetService("ReplicatedStorage").Remotes.InvokeTaskCompleted:InvokeServer(unpack(args))
    local args = {
        [1] = 22
    }
    
    game:GetService("ReplicatedStorage").Remotes.InvokeTaskCompleted:InvokeServer(unpack(args))
    local args = {
        [1] = 23
    }
    
    game:GetService("ReplicatedStorage").Remotes.InvokeTaskCompleted:InvokeServer(unpack(args))
    local args = {
        [1] = 24
    }
    
    game:GetService("ReplicatedStorage").Remotes.InvokeTaskCompleted:InvokeServer(unpack(args))
    local args = {
        [1] = 25
    }
    
    game:GetService("ReplicatedStorage").Remotes.InvokeTaskCompleted:InvokeServer(unpack(args))
    local args = {
        [1] = 26
    }
    
    game:GetService("ReplicatedStorage").Remotes.InvokeTaskCompleted:InvokeServer(unpack(args))
    local args = {
        [1] = 27
    }
    
    game:GetService("ReplicatedStorage").Remotes.InvokeTaskCompleted:InvokeServer(unpack(args))
    local args = {
        [1] = 28
    }
    
    game:GetService("ReplicatedStorage").Remotes.InvokeTaskCompleted:InvokeServer(unpack(args))
    local args = {
        [1] = 29
    }
    
    game:GetService("ReplicatedStorage").Remotes.InvokeTaskCompleted:InvokeServer(unpack(args))
    local args = {
        [1] = 30
    }
    
    game:GetService("ReplicatedStorage").Remotes.InvokeTaskCompleted:InvokeServer(unpack(args))
		end
    })
Tabs.Main:AddButton({
  Title = "Instant Press",
  Description = "",
  Callback = function()
while true do
wait()
for L_8_forvar0, L_9_forvar1 in pairs(workspace:GetDescendants()) do
  if L_9_forvar1.ClassName == "ProximityPrompt" then
      L_9_forvar1.HoldDuration = 0.001
  end
end
end
end
})
	Tabs.Hunter:AddParagraph({
        Title = "Reminder",
        Content = "You can kill anyone (even yourself) if you entered the USERNAME down below."
    })
	local Input = Tabs.Hunter:AddInput("Kill", {
        Title = "Kill a Player",
        Default = "",
        Placeholder = "",
        Numeric = false,
        Finished = false,
        Callback = function(value)
            _G.NameInput = value
        end
    })
	Tabs.Hunter:AddButton({
        Title = "Kill Player",
        Description = "",
        Callback = function()
		killplayer(_G.NameInput)
		end
    })
local Toggle = Tabs.Hunter:AddToggle("Blind", {Title = "No Blindness", Default = false })

Toggle:OnChanged(function(value)
    _G.Blind = value
if _G.Blind == true then
      config.HUNTER_MISS_BLIND_TIME = 0
    else
      config.HUNTER_MISS_BLIND_TIME = 12
    end
end)
Tabs.Hunter:AddButton({
  Title = "Remove NPCs",
  Description = "",
  Callback = function()
        for i, v in pairs(workspace:GetChildren()) do
        if v.Name == "Civilian" then
          v:Destroy()
        end
        end
end
})
local Toggle = Tabs.Troll:AddToggle("Smoke", {Title = "Smoke Safe Zone", Default = false })

Toggle:OnChanged(function(value)
    _G.Smoke = value
while _G.Smoke do
      wait()
      for i,v in pairs(TaskTable[GetMap()]) do
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("InvokeTaskCompleted"):InvokeServer(v)
      end
    end
end) 
Tabs.Troll:AddButton({
  Title = "Change Color",
  Description = "",
  Callback = function()    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("InvokeTaskCompleted"):InvokeServer(ChangeColorTable[GetMap()])
end
})
local Toggle = Tabs.Troll:AddToggle("Color", {Title = "Loop Change Color", Default = false })

Toggle:OnChanged(function(value)
    _G.Color = value
while _G.Color do
      wait()
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("InvokeTaskCompleted"):InvokeServer(ChangeColorTable[GetMap()])
    end
end) 
	Tabs.Player:AddButton({
        Title = "Reset Character",
        Description = "",
        Callback = function()
		game.Players.LocalPlayer.Character:BreakJoints()
		end
    })
local Input = Tabs.Player:AddInput("WS", {
        Title = "Walk Speed",
        Default = "",
        Placeholder = "",
        Numeric = true,
        Finished = false,
        Callback = function(value)
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (value)
        end
    })
	local Input = Tabs.Player:AddInput("JP", {
        Title = "Jump Power",
        Default = "",
        Placeholder = "",
        Numeric = true,
        Finished = false,
        Callback = function(value)
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = (value)
        end
    })
	local Input = Tabs.Player:AddInput("FOV", {
        Title = "Field Of View",
        Default = "",
        Placeholder = "",
        Numeric = true,
        Finished = false,
        Callback = function(value)
            workspace.CurrentCamera.FieldOfView = (value)
        end
    })
	local Input = Tabs.Player:AddInput("G", {
        Title = "Gravity",
        Default = "",
        Placeholder = "",
        Numeric = true,
        Finished = false,
        Callback = function(value)
            workspace.Gravity = (value)
        end
    })
	local Input = Tabs.Player:AddInput("HH", {
        Title = "HipHeight",
        Default = "",
        Placeholder = "",
        Numeric = true,
        Finished = false,
        Callback = function(value)
            game.Players.LocalPlayer.Character.Humanoid.HipHeight = (value)
        end
    })
	local Toggle = Tabs.Player:AddToggle("Inf", {Title = "Infinite Jump", Default = false })

    Toggle:OnChanged(function(value)
        Infinite = value
game:GetService("UserInputService").JumpRequest:connect(function()
	if Infinite then
		game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
	end
end)
    end)
	Tabs.Player:AddButton({
        Title = "TP to a Random Player",
        Description = "",
        Callback = function()
		local randomPlayer = game.Players:GetPlayers()[math.random(1, #game.Players:GetPlayers())]

game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
    CFrame.new(
    Vector3.new(
        randomPlayer.Character.Head.Position.X,
        randomPlayer.Character.Head.Position.Y,
        randomPlayer.Character.Head.Position.Z
    )
)
		end
    })
	Tabs.Game:AddButton({
        Title = "Rejoin",
        Description = "",
        Callback = function()
		game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
		end
    })
	Tabs.Game:AddButton({
        Title = "Server Hop",
        Description = "",
        Callback = function()
		local PlaceID = game.PlaceId
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour
local Deleted = false
local File = pcall(function()
    AllIDs = game:GetService('HttpService'):JSONDecode(readfile("Server Hop.json"))
end)
if not File then
    table.insert(AllIDs, actualHour)
    writefile("Server Hop.json", game:GetService('HttpService'):JSONEncode(AllIDs))
end
function TPReturner()
    local Site;
    if foundAnything == "" then
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
    else
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
    end
    local ID = ""
    if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
        foundAnything = Site.nextPageCursor
    end
    local num = 0;
    for i,v in pairs(Site.data) do
        local Possible = true
        ID = tostring(v.id)
        if tonumber(v.maxPlayers) > tonumber(v.playing) then
            for _,Existing in pairs(AllIDs) do
                if num ~= 0 then
                    if ID == tostring(Existing) then
                        Possible = false
                    end
                else
                    if tonumber(actualHour) ~= tonumber(Existing) then
                        local delFile = pcall(function()
                            delfile("Server Hop.json")
                            AllIDs = {}
                            table.insert(AllIDs, actualHour)
                        end)
                    end
                end
                num = num + 1
            end
            if Possible == true then
                table.insert(AllIDs, ID)
                wait()
                pcall(function()
                    writefile("Server Hop.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                    wait()
                    game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                end)
                wait(4)
            end
        end
    end
end

function Teleport()
    while wait() do
        pcall(function()
            TPReturner()
            if foundAnything ~= "" then
                TPReturner()
            end
        end)
    end
end

Teleport()
		end
    })
	Tabs.Game:AddButton({
        Title = "Auto Rejoin",
        Description = "",
        Callback = function()
		getgenv().rejoin = game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
    if child.Name == 'ErrorPrompt' and child:FindFirstChild('MessageArea') and child.MessageArea:FindFirstChild("ErrorFrame") then
        game:GetService("TeleportService"):Teleport(game.PlaceId)
    end
end)
		end
    })
	Tabs.Game:AddButton({
        Title = "Lag Switch F3",
        Description = "",
        Callback = function()
		local ass = false
local back = settings()

game:service "UserInputService".InputEnded:connect(
    function(i)
        if i.KeyCode == Enum.KeyCode.F3 then
            ass = not ass
            back.Network.IncomingReplicationLag = ass and 10 or 0
        end
    end
)
		end
    })
	Tabs.Game:AddButton({
        Title = "Anti Lag",
        Description = "",
        Callback = function()
		for _, v in pairs(game:GetService("Workspace"):GetDescendants()) do
    if v:IsA("BasePart") and not v.Parent:FindFirstChild("Humanoid") then
        v.Material = Enum.Material.SmoothPlastic
        if v:IsA("Texture") then
            v:Destroy()
        end
    end
end
		end
    })
	Tabs.Credit:AddParagraph({
        Title = "Credit",
        Content = "This script is made by R9OKM."
    })
	Tabs.Credit:AddButton({
        Title = "Copy Discord Invite",
        Description = "",
        Callback = function()
		setclipboard("https://discord.gg/eyEwHCVjQy")
		end
    })
	Tabs.Credit:AddButton({
        Title = "Join Discord (Cilent)",
        Description = "",
        Callback = function()
		local http = game:GetService("HttpService")
   if identifyexecutor() == "Synapse X" then
            requesttype = syn.request;
        else
            requesttype = http_request;
        end
        local http = game:GetService("HttpService")
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
      end
		end
    })

SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})
InterfaceManager:SetFolder("RoScript V5")
SaveManager:SetFolder("RoScript V5/"..game.PlaceId)
InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)

Window:SelectTab(1)

SaveManager:LoadAutoloadConfig()
