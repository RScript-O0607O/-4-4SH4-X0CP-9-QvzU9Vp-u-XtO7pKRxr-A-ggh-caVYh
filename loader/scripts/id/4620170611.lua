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
Items = Window:AddTab({ Title = "Items", Icon = "" }),
Teleport = Window:AddTab({ Title = "Teleport", Icon = "" }),
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
      Title = "Kill Enemies",
      Description = "",
      Callback = function()
for i,v in pairs(game.Workspace.BadGuys:GetChildren()) do
      for i = 1, 50 do
          game:GetService("ReplicatedStorage").RemoteEvents.HitBadguy:FireServer(v,10)
          game:GetService("ReplicatedStorage").RemoteEvents.HitBadguy:FireServer(v,996)
          game:GetService("ReplicatedStorage").RemoteEvents.HitBadguy:FireServer(v,9)
          game:GetService("ReplicatedStorage").RemoteEvents.HitBadguy:FireServer(v,8)
          game:GetService("ReplicatedStorage").RemoteEvents.HitBadguy:FireServer(v,996)
      end
  end
  end
  })
Tabs.Main:AddButton({
  Title = "Heal All",
  Description = "",
  Callback = function()
      for i,v in pairs(game:GetService("Players"):GetChildren()) do
          game:GetService("ReplicatedStorage").RemoteEvents.CurePlayer:FireServer(v)
          game:GetService("ReplicatedStorage").RemoteEvents.HealPlayer:FireServer(v)

      end
end
})
Tabs.Main:AddButton({
  Title = "Cooking Pan / Bloxy Pack",
  Description = "",
  Callback = function()
      game.ReplicatedStorage.RemoteEvents.BloxyPack:FireServer(1)
end
})
Tabs.Main:AddButton({
  Title = "Buy Cooking Pan",
  Description = "",
  Callback = function()
      game.ReplicatedStorage.RemoteEvents.BuyItem:FireServer("Pan", 0)
end
})
Tabs.Main:AddButton({
      Title = "Basement Light",
      Description = "",
      Callback = function()
game:GetService("ReplicatedStorage").RemoteEvents.BasementMission:FireServer()
game:GetService("ReplicatedStorage").RemoteFunctions.GetAmbient:InvokeServer()
  end
  })
Tabs.Main:AddButton({
  Title = "Bring Ladder",
  Description = "",
  Callback = function()
local args = {
          [1] = 1
      }
      game:GetService("ReplicatedStorage").RemoteEvents.Ladder:FireServer(unpack(args))
end
})
Tabs.Main:AddButton({
  Title = "Full Bright",
  Description = "",
  Callback = function()
      loadstring(game:HttpGet("https://pastebin.com/raw/06iG6YkU", true))()
end
})
Tabs.Main:AddButton({
      Title = "Unlock Basement",
      Description = "",
      Callback = function()
game.ReplicatedStorage.RemoteEvents.UnlockDoor:FireServer()
  end
  })
Tabs.Main:AddButton({
      Title = "Unlock Vault",
      Description = "",
      Callback = function()
game.ReplicatedStorage.RemoteEvents.Safe:FireServer(game:GetService("Workspace").CodeNote.SurfaceGui.TextLabel.Text)
  end
  })
Tabs.Main:AddButton({
      Title = "Instant Heal",
      Description = "",
      Callback = function()
for i = 1, 200 do
      wait(0.005)
      local A_1 = "Cat"
      local Event = game:GetService("ReplicatedStorage").RemoteEvents.Energy
      Event:FireServer(A_1)
  end
  end
  })
Tabs.Main:AddButton({
      Title = "Remove Tools",
      Description = "",
      Callback = function()
for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
          if v:IsA("Tool") then
              v:Destroy()
          end
      end
  end
  })
Tabs.Main:AddButton({
      Title = "Befriend Cat",
      Description = "",
      Callback = function()
local Target = game:GetService("ReplicatedStorage").RemoteEvents.Cattery;
  Target:FireServer();
  end
  })
Tabs.Main:AddButton({
  Title = "Easter Ending",
  Description = "",
  Callback = function()
      while true do
      wait(1.25)
      local args = {
          [1] = 1,
          [2] = "IcePart1"
      }
      game:GetService("ReplicatedStorage").RemoteEvents.EggHuntEvent:FireServer(unpack(args))
      local args = {
          [1] = 1,
          [2] = "IcePart2"
      }
      game:GetService("ReplicatedStorage").RemoteEvents.EggHuntEvent:FireServer(unpack(args))
      local args = {
          [1] = 1,
          [2] = "IcePart3"
      }
      game:GetService("ReplicatedStorage").RemoteEvents.EggHuntEvent:FireServer(unpack(args))
      local args = {
          [1] = 1,
          [2] = "IcePart4"
      }
      game:GetService("ReplicatedStorage").RemoteEvents.EggHuntEvent:FireServer(unpack(args))
      local args = {
          [1] = 1,
          [2] = "IcePart5"
      }
      game:GetService("ReplicatedStorage").RemoteEvents.EggHuntEvent:FireServer(unpack(args))
      local args = {
          [1] = 1,
          [2] = "IcePart6"
      }
      game:GetService("ReplicatedStorage").RemoteEvents.EggHuntEvent:FireServer(unpack(args))
      local args = {
          [1] = 1,
          [2] = "IcePart7"
      }
      game:GetService("ReplicatedStorage").RemoteEvents.EggHuntEvent:FireServer(unpack(args))
      local args = {
          [1] = 1,
          [2] = "IcePart8"
      }
      game:GetService("ReplicatedStorage").RemoteEvents.EggHuntEvent:FireServer(unpack(args))
      local args = {
          [1] = 2,
          [2] = "IcePart1"
      }
      game:GetService("ReplicatedStorage").RemoteEvents.EggHuntEvent:FireServer(unpack(args))
      local args = {
          [1] = 2,
          [2] = "IcePart2"
      }
      game:GetService("ReplicatedStorage").RemoteEvents.EggHuntEvent:FireServer(unpack(args))
      local args = {
          [1] = 2,
          [2] = "IcePart3"
      }
      game:GetService("ReplicatedStorage").RemoteEvents.EggHuntEvent:FireServer(unpack(args))
      local args = {
          [1] = 2,
          [2] = "IcePart4"
      }
      game:GetService("ReplicatedStorage").RemoteEvents.EggHuntEvent:FireServer(unpack(args))
      local args = {
          [1] = 2,
          [2] = "IcePart5"
      }
      game:GetService("ReplicatedStorage").RemoteEvents.EggHuntEvent:FireServer(unpack(args))
      local args = {
          [1] = 2,
          [2] = "IcePart6"
      }
      game:GetService("ReplicatedStorage").RemoteEvents.EggHuntEvent:FireServer(unpack(args))
      local args = {
          [1] = 2,
          [2] = "IcePart7"
      }
      game:GetService("ReplicatedStorage").RemoteEvents.EggHuntEvent:FireServer(unpack(args))
      local args = {
          [1] = 2,
          [2] = "IcePart8"
      }
      game:GetService("ReplicatedStorage").RemoteEvents.EggHuntEvent:FireServer(unpack(args))
      local args = {
          [1] = 3,
          [2] = "IcePart1"
      }
      game:GetService("ReplicatedStorage").RemoteEvents.EggHuntEvent:FireServer(unpack(args))
      local args = {
          [1] = 3,
          [2] = "IcePart2"
      }
      game:GetService("ReplicatedStorage").RemoteEvents.EggHuntEvent:FireServer(unpack(args))
      local args = {
          [1] = 3,
          [2] = "IcePart3"
      }
      game:GetService("ReplicatedStorage").RemoteEvents.EggHuntEvent:FireServer(unpack(args))
      local args = {
          [1] = 3,
          [2] = "IcePart4"
      }
      game:GetService("ReplicatedStorage").RemoteEvents.EggHuntEvent:FireServer(unpack(args))
      local args = {
          [1] = 3,
          [2] = "IcePart5"
      }
      game:GetService("ReplicatedStorage").RemoteEvents.EggHuntEvent:FireServer(unpack(args))
      local args = {
          [1] = 3,
          [2] = "IcePart6"
      }
      game:GetService("ReplicatedStorage").RemoteEvents.EggHuntEvent:FireServer(unpack(args))
      local args = {
          [1] = 3,
          [2] = "IcePart7"
      }
      game:GetService("ReplicatedStorage").RemoteEvents.EggHuntEvent:FireServer(unpack(args))
      local args = {
          [1] = 3,
          [2] = "IcePart8"
      }
      game:GetService("ReplicatedStorage").RemoteEvents.EggHuntEvent:FireServer(unpack(args))
      end
end
})
Tabs.Items:AddButton({
      Title = "Give Apple",
      Description = "",
      Callback = function()
 game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("Apple")
  end
  })
Tabs.Items:AddButton({
      Title = "Give Cookie",
      Description = "",
      Callback = function()
game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("Cookie")
  end
  })
Tabs.Items:AddButton({
      Title = "Give Chips",
      Description = "",
      Callback = function()
game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("Chips") 
  end
  })
Tabs.Items:AddButton({
      Title = "Give Lollipop",
      Description = "",
      Callback = function()
game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("Lollipop")
  end
  })
Tabs.Items:AddButton({
      Title = "Give Cure",
      Description = "",
      Callback = function()
game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("Cure") 
  end
  })
Tabs.Items:AddButton({
      Title = "Give Linked Sword",
      Description = "",
      Callback = function()
game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("LinkedSword") 
  end
  })
Tabs.Items:AddButton({
      Title = "Give Teddy Bloxpin",
      Description = "",
      Callback = function()
game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("TeddyBloxpin")
  end
  })
Tabs.Items:AddButton({
      Title = "Give Bat",
      Description = "",
      Callback = function()
game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("Bat")
  end
  })
Tabs.Items:AddButton({
      Title = "Give Planks",
      Description = "",
      Callback = function()
game:GetService("ReplicatedStorage").RemoteEvents.RefreshPlanks:FireServer()
  end
  })
Tabs.Items:AddButton({
      Title = "Give Bloxy Cola",
      Description = "",
      Callback = function()
game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("BloxyCola")
  end
  })
Tabs.Items:AddButton({
      Title = "Give Pizza",
      Description = "",
      Callback = function()
game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("Pizza3")
  end
  })
Tabs.Items:AddButton({
      Title = "Give Medkit",
      Description = "",
      Callback = function()
game:GetService("ReplicatedStorage").RemoteEvents.GiveTool:FireServer("MedKit")  
end
  })
Tabs.Items:AddButton({
      Title = "Give Hammer",
      Description = "",
      Callback = function()
local A_1 = true
local A_2 = "Hammer"
local Event = game:GetService("ReplicatedStorage").RemoteEvents.BasementWeapon
Event:FireServer(A_1, A_2)  end
  })
Tabs.Items:AddButton({
      Title = "Give Cowbar",
      Description = "",
      Callback = function()
local args = {
      [1] = true,
      [2] = "Crowbar"
    }
  game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("BasementWeapon"):FireServer(unpack(args))
  end
  })
Tabs.Items:AddButton({
  Title = "Give Epic Pizza",
  Description = "",
  Callback = function()
      local args = {
        [1] = "EpicPizza"
      }

      game:GetService("ReplicatedStorage").RemoteEvents.GiveTool:FireServer(unpack(args))
end
})
Tabs.Items:AddButton({
  Title = "Give Final Ending Key",
  Description = "",
  Callback = function()
      Fluent:Notify({
          Title = "RoScript V5",
          Content = "Generating Final Ending Key... (Wait 15 seconds)",
          Duration = 8
      })
      game:GetService("ReplicatedStorage").RemoteEvents.GetKeys:FireServer()
end
})
Tabs.Items:AddButton({
  Title = "Give Pitchfork",
  Description = "",
  Callback = function()
      local args = {
        [1] = true,
        [2] = "Pitchfork"
      }
game:GetService("ReplicatedStorage").RemoteEvents.BasementWeapon:FireServer(unpack(args))
end
})
Tabs.Items:AddButton({
      Title = "Give Basement Key",
      Description = "",
      Callback = function()
game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("Key")
  end
  })
Tabs.Items:AddButton({
      Title = "Give Expired Bloxy Pack",
      Description = "",
      Callback = function()
local args = {
    [1] = "ExpiredBloxyCola"
}
game:GetService("ReplicatedStorage").RemoteEvents.GiveTool:FireServer(unpack(args))
  end
  })
Tabs.Teleport:AddButton({
      Title = "TP to House",
      Description = "",
      Callback = function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-36, 3, -200)
  end
  })
Tabs.Teleport:AddButton({
      Title = "TP to Outside",
      Description = "",
      Callback = function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Workspace").Spawns.Outside.Part.Position)
  end
  })
Tabs.Teleport:AddButton({
      Title = "TP to Basement",
      Description = "",
      Callback = function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(71, -15, -163)
  end
  })
Tabs.Teleport:AddButton({
      Title = "TP to Hiding Spot",
      Description = "",
      Callback = function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-42.86656951904297, 6.433286666870117, -222.01171875)
  end
  })
Tabs.Teleport:AddButton({
      Title = "TP to Bad Ending",
      Description = "",
      Callback = function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Workspace").Spawns.BadEnding.Part.Position)
  end
  })
Tabs.Teleport:AddButton({
      Title = "TP to Egg Boss",
      Description = "",
      Callback = function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Workspace").Spawns.EggBoss.Part.Position)
  end
  })
Tabs.Teleport:AddButton({
      Title = "TP to Attic",
      Description = "",
      Callback = function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-16, 35, -220)
  end
  })
Tabs.Teleport:AddButton({
      Title = "TP to Store",
      Description = "",
      Callback = function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-422, 3, -121)
  end
  })
Tabs.Teleport:AddButton({
      Title = "TP to Sewer",
      Description = "",
      Callback = function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(129, 3, -125)
  end
  })
Tabs.Teleport:AddButton({
      Title = "TP to Boss Room",
      Description = "",
      Callback = function()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-39, -287, -1480)
  end
  })
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
