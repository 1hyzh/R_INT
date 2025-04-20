local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Consistt/Ui/main/UnLeaked"))()


--Script locals
local SCRtoEXEC = ""
local UserToSearch = 0
local WalkSpeed_New = 16
local JumpPower_New = 50
local doorsfakeknobs = 0
local doorsfakegold = 0


--Script Functions
local function isPlayerInGame(userId)
    for _, player in pairs(game.Players:GetChildren()) do
        if player.UserId == userId then
            return true
        end
    end
    return false
end

local function showMessage(txt)
    local Message = Instance.new("Message")
    Message.Parent = game.Workspace
    Message.Text = txt
    task.wait(0.5)
    Message:Destroy()
end




library.rank = "developer"
local Wm = library:Watermark("R_INT | v" .. library.version ..  " | " .. library:GetUsername() .. " | rank: " .. library.rank)
local FpsWm = Wm:AddWatermark("fps: " .. library.fps)
coroutine.wrap(function()
    while task.wait(.75) do
        FpsWm:Text("fps: " .. library.fps)
    end
end)()

local Notif = library:InitNotifications()

library:Introduction()
task.wait(1)
local Init = library:Init()

--[[

TAB 1, Main utilities such as changing the walkspeed

]]--

local Tab1 = Init:NewTab("MAIN")

local Button1 = Tab1:NewButton("Loop health", function()
    local sh = 1
   while sh <= 100000 do
      game.Players.LocalPlayer.Character.Humanoid.Health = 100
      print(game.Players.LocalPlayer.Character.Humanoid.Health)
      sh = sh + 1
      print(sh)
      wait(0.001)
   end
end)
local Button2 = Tab1:NewButton("Kill Yourself", function()
    game.Players.LocalPlayer.Character.Humanoid.Health = -1
end)
local Button3 = Tab1:NewButton("Rejoin Game", function()
    game:GetService('TeleportService'):Teleport(game.PlaceId)
end)
local Label1 = Tab1:NewLabel("Usually helps with softlocks and bad anticheats", "left")

local Button4 = Tab1:NewButton("Destroy Lights", function()
    for _, object in pairs(workspace:GetDescendants()) do
        -- Check if the object is a type of light
        if object:IsA("PointLight") or object:IsA("SpotLight") or object:IsA("SurfaceLight") then
            -- Delete the light
            object:Destroy()
        end
    end
end)

local Button5 = Tab1:NewButton("Fullbright", function()
local Lighting = game:GetService("Lighting")

Lighting.Ambient = Color3.fromRGB(255, 255, 255)
Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
Lighting.Brightness = 2
Lighting.ExposureCompensation = 0
Lighting.GeographicLatitude = 0
Lighting.TimeOfDay = "14:00:00"
Lighting.FogStart = 100000
Lighting.FogEnd = 1000000
Lighting.GlobalShadows = false
end)

local Slider1 = Tab1:NewSlider("WalkSpeed", "", true, "/", {min = 1, max = 500, default = 16}, function(value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
    WalkSpeed_New = value
    print(value, "<>", WalkSpeed_New)
end)

local Slider2 = Tab1:NewSlider("JumpPower", "", true, "/", {min = 1, max = 500, default = 50}, function(value)
    game.Players.LocalPlayer.Character.Humanoid.JumpHeight = value
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
    JumpPower_New = value
    print(value, "<>", JumpPower_New)
end)

local Button6 = Tab1:NewButton("Loop WalkSpeed", function ()
    local count = 0
    while count <= 99999 do
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = WalkSpeed_New
        wait(0.01)
        print(WalkSpeed_New)
    end
end)
local Button7 = Tab1:NewButton("Loop JumpPower", function ()
    local count = 0
    while count <= 99999 do
        game.Players.LocalPlayer.Character.Humanoid.JumpHeight = JumpPower_New
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = JumpPower_New
        wait(0.01)
        print(JumpPower_New)
    end
end)

local _Button = Tab1:NewButton("Reload Script", function ()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/1hyzh/R_INT/refs/heads/main/pc.lua"))()
end)

--[[

TAB 2, Script Executor, so you don't have to hop off roblox to execute another script

]]--

local Tab2 = Init:NewTab("Script Executor")

local Label1 = Tab2:NewLabel("Script Box", "left")
local Textbox3 = Tab2:NewTextbox("ScriptBox", "", "--ROINT", "all", "large", true, false, function(val)
    SCRtoEXEC = val
end)
local Button1 = Tab2:NewButton("Execute", function()
    loadstring(SCRtoEXEC)()
    Notif:Notify("Script Executed!", 3, "information")
end)

--[[

TAB 3, User checker, checks if an suer is on the same server as you

]]--

local Tab3 = Init:NewTab("User Checker")
local Label1 = Tab3:NewLabel("Check if an user is on the same server as you!", "left")


local Textbox3 = Tab3:NewTextbox("Paste UserID here.", "", "userID", "all", "small", true, false, function(val)
    UserToSearch = val
end)
local Button2 = Tab3:NewButton("Check", function()
    if isPlayerInGame(UserToSearch) then
        Notif:Notify("user found", 3, "information")    
    end
end)

--[[

TAB 4, Other utility scripts.

]]--

local Tab4 = Init:NewTab("Utility Scripts")

local Button1 = Tab4:NewButton("Infinite yield", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/refs/heads/master/source"))()
end)

local Button2 = Tab4:NewButton("CMD-X", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/refs/heads/master/Source"))()
end)

local Button3 = Tab4:NewButton("SimpleSpy", function()
    loadstring(game:HttpGet("https://github.com/exxtremestuffs/SimpleSpySource/raw/master/SimpleSpy.lua"))()
end)

if game.PlaceId == 6839171747 then
    local Button4 = Tab4:NewButton("BobHub", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/DarkDoorsKing/DoorsCode/main/main"))()
        
    end)
end

--[[

TAB 5, Door only things, currently almost nothing so...

]]--

if game.PlaceId == 6839171747 then
    local Tab5 = Init:NewTab("Doors")
    local Textbox3 = Tab5:NewTextbox("fake knobs", "", "knobs", "all", "small", true, false, function(val)
    doorsfakeknobs = val
    end)
    local Button2 = Tab5:NewButton("Fake!", function()
        game:GetService("ReplicatedStorage").ReplicaDataModule.KnobsUpdated:Fire(doorsfakeknobs)
    end)
    local Textbox = Tab5:NewTextbox(" fake gold", game:GetService("Players").LocalPlayer.PlayerGui.TopbarUI.Topbar.StatsTopbarHandler.StatModules.Gold.Gold, "gold", "all", "small", true, false, function(val)
    doorsfakegold = val
    end)
    local Button = Tab5:NewButton("Fake!", function()
        game:GetService("ReplicatedStorage").RemotesFolder.GetGold:FireServer(doorsfakegold)
        end)
    
    local Toggle1 = Tab5:NewToggle("force crouch", false, function(value)
        local vl = false
        if value == true then
            vl = true
            while vl == true do
                game:GetService("ReplicatedStorage").RemotesFolder.Crouch:FireServer(true)
                wait(3)
            end
        end
        if value == false then
            game:GetService("ReplicatedStorage").RemotesFolder.Crouch:FireServer(false)
            vl = false
        end               
    end)
    local Toggle2 = Tab5:NewToggle("butter hands", false, function(value)
        local vl = false
        if value == true then
            vl = true
            while vl == true do
                game:GetService("ReplicatedStorage").RemotesFolder.DropItem:FireServer()
                task.wait(2)
            end
        end
        if value == false then
            vl = false
        end
    end)
    --Door ESP
    local Toggle3 = Tab5:NewToggle("Door ESP", false, function(value)
            if value then
                for _, group in pairs(workspace:GetChildren()) do
                    if group:IsA("Model") and tonumber(group.Name) then -- Check if the group is named numerically
                        for _, door in pairs(group:GetDescendants()) do
                            if door:IsA("MeshPart") and door.Name == "Door" then
                                local highlight = Instance.new("Highlight")
                                highlight.Parent = door
                                highlight.FillColor = Color3.fromRGB(255, 0, 0)
                                highlight.OutlineColor = Color3.fromRGB(255, 0, 0)
                            end
                        end
                    end
                end
            else
                for _, group in pairs(workspace:GetChildren()) do
                    if group:IsA("Model") and tonumber(group.Name) then -- Check if the group is named numerically
                        for _, door in pairs(group:GetDescendants()) do
                            if door:IsA("MeshPart") and door.Name == "Door" then
                                local highlight = door:FindFirstChildOfClass("Highlight")
                                if highlight then
                                    highlight:Destroy()
                                end
                            end
                        end
                    end
                end
            end
        end)
        local vl = false
        local Button69 = Tab5:NewButton("Fake Door", function()
             vl = true
                while vl == true do
                    game.Workspace.CurrentRooms["0"].Door.ClientOpen:FireServer()
                    task.wait(0.1)
                end
        end)
        local Button62 = Tab5:NewButton("Fake Door", function()
            
                while vl == true do
                    game.Workspace.CurrentRooms["0"].Door.ClientOpen:FireServer()
                    task.wait(0.001)
                end
        end)

    end
    