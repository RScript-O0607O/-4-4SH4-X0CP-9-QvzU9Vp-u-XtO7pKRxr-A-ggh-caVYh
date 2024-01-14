_G.Gears = "string"
_G.Classic = "Classic Sword"
_G.Bit = "8 Bit Sword"
_G.Pot = "Pot O' Gold Sword"
_G.Fuse = "Fuse Bomb"
_G.Laser = "Laser Gun"
_G.Hyper = "Hyper Laser"
_G.Fingers = "Laser Fingers"
_G.Chartreuse = "Chartreuse Periastron"

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
	Reach = Window:AddTab({ Title = "Reach", Icon = "" }),
	Gears = Window:AddTab({ Title = "Gears", Icon = "" }),
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
        Title = "TP to Top",
        Description = "",
        Callback = function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Workspace.Spawns.Winners.Position)
		end
    })
	Tabs.Main:AddButton({
        Title = "Be Winners Instantly",
        Description = "",
        Callback = function()
		firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,workspace.Spawns.Winners,0)
		firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,workspace.Spawns.Winners,1)
		end
    })
	Tabs.Reach:AddParagraph({
        Title = "Reminder",
        Content = "Reach size cannot be lower than the orginal size."
    })
	local Input = Tabs.Reach:AddInput("Reach", {
        Title = "Reach Size",
        Default = "",
        Placeholder = "",
        Numeric = true,
        Finished = false,
        Callback = function(value)
            local active = true
local trueActive = true
local reachType = "Sphere"
local visualizer = Instance.new("Part")
local ScreenGui = Instance.new("ScreenGui")

game:GetService("UserInputService").InputBegan:connect(function(inp,gpe)
	if gpe then return end
	if inp.KeyCode == Enum.KeyCode.H then
		ScreenGui.Enabled = not ScreenGui.Enabled
	end
end)

local plr = game.Players.LocalPlayer

local function onHit(hit,handle)
    local victim = hit.Parent:FindFirstChildOfClass("Humanoid")
	    if victim and victim.Parent.Name ~= game.Players.LocalPlayer.Name then
	        for _,v in pairs(hit.Parent:GetChildren()) do
	            if v:IsA("Part") then
	                firetouchinterest(v,handle,0)
	                firetouchinterest(v,handle,1)
	            end
			end
    end
end

local function getWhiteList()
    local wl = {}
    for _,v in pairs(game.Players:GetPlayers()) do
        if v ~= plr then
            local char = v.Character
            if char then
                for _,q in pairs(char:GetChildren()) do
                    if q:IsA("Part") then
                        table.insert(wl,q)
                    end
                end
            end
        end
    end
    return wl
end

game:GetService("RunService").RenderStepped:connect(function()
    if not active or not trueActive then return end
	local s = plr.Character and plr.Character:FindFirstChildOfClass("Tool")
	if not s then visualizer.Parent = nil end
    if s then
        local handle = s:FindFirstChild("Handle") or s:FindFirstChildOfClass("Part")
		if handle then
			local reach = tonumber(value)
			if reach then
				 if reachType == "Sphere" then
					visualizer.Shape = Enum.PartType.Ball
					visualizer.Size = Vector3.new(reach,reach,reach)
					visualizer.CFrame = handle.CFrame
		            for _,v in pairs(game.Players:GetPlayers()) do
		                local hrp = v.Character and v.Character:FindFirstChild("HumanoidRootPart")
		                if hrp and handle then
		                    local mag = (hrp.Position-handle.Position).magnitude
		                    if mag <= reach then
		                        onHit(hrp,handle)
		                    end
		                end
					end
				
		    		end
				end
			end
			end
		end)
        end
    })
	Tabs.Gears:AddParagraph({
        Title = "Reminder",
        Content = "You need enough wins to get the gears."
    })
	Tabs.Gears:AddButton({
        Title = "Get All Gears",
        Description = "",
        Callback = function()
		firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,workspace.WinnerPads.ClassicSword.Pad.Union,0)
firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,workspace.WinnerPads.ClassicSword.Pad.Union,1)
firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,workspace.WinnerPads["8BitSword"].Pad.Union,0)
firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,workspace.WinnerPads["8BitSword"].Pad.Union,1)
firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,workspace.WinnerPads.PotoGoldSword.Pad.Union,0)
firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,workspace.WinnerPads.PotoGoldSword.Pad.Union,1)
firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,workspace.WinnerPads.FuseBomb.Pad.Union,0)
firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,workspace.WinnerPads.FuseBomb.Pad.Union,1)
firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,workspace.WinnerPads.LaserGun.Pad.Union,0)
firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,workspace.WinnerPads.LaserGun.Pad.Union,1)
firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,workspace.WinnerPads.HyperLaser.Pad.Union,0)
firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,workspace.WinnerPads.HyperLaser.Pad.Union,1)
firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,workspace.WinnerPads.LaserFingers.Pad.Union,0)
firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,workspace.WinnerPads.LaserFingers.Pad.Union,1)
firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,workspace.WinnerPads.ChartreusePeriastron.Pad.Union,0)
firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,workspace.WinnerPads.ChartreusePeriastron.Pad.Union,1)
		end
    })
	local Dropdown = Tabs.Gears:AddDropdown("Gears", {
        Title = "Gears",
        Values = {"None", "Classic Sword", "8 Bit Sword", "Pot O' Gold Sword", "Fuse Bomb", "Laser Gun", "Hyper Laser", "Laser Fingers", "Chartreuse Periastron"},
        Multi = false,
        Default = 1,
    })

    Dropdown:OnChanged(function(Value)
        _G.Gears = Value
		if _G.Gears == _G.Classic then
		firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,workspace.WinnerPads.ClassicSword.Pad.Union,0)
firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,workspace.WinnerPads.ClassicSword.Pad.Union,1)
elseif _G.Gears == _G.Bit then
	firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,workspace.WinnerPads["8BitSword"].Pad.Union,0)
firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,workspace.WinnerPads["8BitSword"].Pad.Union,1)
elseif _G.Gears == _G.Pot then
	firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,workspace.WinnerPads.PotoGoldSword.Pad.Union,0)
firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,workspace.WinnerPads.PotoGoldSword.Pad.Union,1)
elseif _G.Gears == _G.Fuse then
	firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,workspace.WinnerPads.FuseBomb.Pad.Union,0)
firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,workspace.WinnerPads.FuseBomb.Pad.Union,1)
elseif _G.Gears == _G.Laser then
	firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,workspace.WinnerPads.LaserGun.Pad.Union,0)
firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,workspace.WinnerPads.LaserGun.Pad.Union,1)
elseif _G.Gears == _G.Hyper then
	firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,workspace.WinnerPads.HyperLaser.Pad.Union,0)
firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,workspace.WinnerPads.HyperLaser.Pad.Union,1)
elseif _G.Gears == _G.Fingers then
	firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,workspace.WinnerPads.LaserFingers.Pad.Union,0)
firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,workspace.WinnerPads.LaserFingers.Pad.Union,1)
elseif _G.Gears == _G.Chartreuse then
	firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,workspace.WinnerPads.ChartreusePeriastron.Pad.Union,0)
firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,workspace.WinnerPads.ChartreusePeriastron.Pad.Union,1)
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
