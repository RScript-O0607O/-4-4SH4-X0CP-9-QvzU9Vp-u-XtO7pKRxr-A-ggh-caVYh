local Library = loadstring(game:HttpGet('https://roblox-scripts.poliju.repl.co/scripts/main/admin.lua', true))()

local Window = Library:CreateWindow({
  Name = 'RoAdmin (Developing - Universal)',
  IntroText = 'Thanks for using RoAdmin!',
  IntroIcon = '',
  IntroBlur = true,
  IntroBlurIntensity = 10,
  Theme = Library.Themes.Kiriot,
  Position = 'bottomright',
  Draggable = true,
  Prefix = ';'
})
Window:AddCommand('ClickDel', {}, 'Control + Click A Part To Delete', function(Arguments, Speaker)
local Plr = game:GetService("Players").LocalPlayer
local Mouse = Plr:GetMouse()

Mouse.Button1Down:connect(function()
if not game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl) then return end
if not Mouse.Target then return end
Mouse.Target:Destroy()
        Window:CreateNotification('Reminder', 'To delete a part, press control & click a part to delete.', 5)
end)
end)
Window:AddCommand('AntiAfk', {}, 'Avoid Getting Kicked For Being Idle 20 Minutes', function(Arguments, Speaker)
  local VirtualUser = game:service'VirtualUser'
game:service'Players'.LocalPlayer.Idled:connect(function()
VirtualUser:CaptureController()
VirtualUser:ClickButton2(Vector2.new())
end)
Window:CreateNotification('Notification', 'Anti AFK loaded.', 5)
end)
Window:AddCommand('SaveTools', {}, 'Save Tools In Your Inventory', function(Arguments, Speaker)
  for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
if (v:IsA("Tool")) then
v.Parent = game.Players.LocalPlayer
end
    end
Window:CreateNotification('Success', 'Tools have been saved.', 5)
end)
Window:AddCommand('LoadTools', {}, 'Load The Saved Tools', function(Arguments, Speaker)
  for _,v in pairs(game.Players.LocalPlayer:GetChildren()) do
if (v:IsA("Tool")) then
v.Parent = game.Players.LocalPlayer.Backpack
end
  end
Window:CreateNotification('Success', 'Tools have been loaded.', 5)
end)
Window:AddCommand('SetPrefix', {'New Prefix'}, 'Changes The Prefix', function(Arguments, Speaker)
  Window:ChangePrefix(Arguments[1])
Window:CreateNotification('Success', 'The prefix have been changed.', 5)
end)
