local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua"))()

--Script locals
local SCRtoEXEC = ""
local UserToSearch = 0
local WalkSpeed_New = 16
local JumpPower_New = 50


--Script Functions
local function isPlayerInGame(userId)
    for _, player in pairs(game.Players:GetChildren()) do
        if player.UserId == userId then
            return true
        end
    end
    return false
end

local function showMessage(Message)
    local Message = Instance.new("Message")
    Message.Text = Message
    task.wait(0.5)
    Message:Destroy()
end

local GUI = Mercury:Create{
    Name = "R_INT",
    Size = UDim2.fromOffset(600, 400),
    Theme = Mercury.Themes.Dark,
    Link = "R_INT/"
}
local Tab1 = GUI:Tab{
	Name = "MAIN",
	Icon = "rbxassetid://8569322835"
}
Tab1:Button{
	Name = "Loop Health",
	Description = nil,
	Callback = function()
        local sh = 1
        while sh <= 100000 do
           game.Players.LocalPlayer.Character.Humanoid.Health = 100
           print(game.Players.LocalPlayer.Character.Humanoid.Health)
           sh = sh + 1
           print(sh)
           wait(0.001)
        end
    end
}
Tab1:Button{
	Name = "KYS",
	Description = nil,
	Callback = function() 
        game.Players.LocalPlayer.Character.Humanoid.Health = -1
    end
}
Tab1:Button{
	Name = "Rejoin Game",
	Description = nil,
	Callback = function() 
        game:GetService('TeleportService'):Teleport(game.PlaceId)
    end
}
Tab1:Button{
	Name = "Destroy Lights",
	Description = nil,
	Callback = function() 
        for _, object in pairs(workspace:GetDescendants()) do
            -- Check if the object is a type of light
            if object:IsA("PointLight") or object:IsA("SpotLight") or object:IsA("SurfaceLight") then
                -- Delete the light
                object:Destroy()
            end
        end
    end
}
Tab1:Button{
	Name = "Fullbright",
	Description = nil,
	Callback = function() 
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
    end
}
Tab1:Slider{
	Name = "WalkSpeed",
	Default = 16,
	Min = 0,
	Max = 500,
	Callback = function(value) 
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
        WalkSpeed_New = value
        print(value, "<>", WalkSpeed_New)
    end
}
Tab1:Slider{
	Name = "JumpPower",
	Default = 16,
	Min = 0,
	Max = 500,
	Callback = function(value) 
        game.Players.LocalPlayer.Character.Humanoid.JumpHeight = value
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
        JumpPower_New = value
        print(value, "<>", JumpPower_New)
    end
}
Tab1:Button{
	Name = "Loop WalkSpeed",
	Description = nil,
	Callback = function() 
        local count = 0
        while count <= 99999 do
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = WalkSpeed_New
            wait(0.01)
            print(WalkSpeed_New)
        end
    end
}
Tab1:Button{
	Name = "Loop JumpPower",
	Description = nil,
	Callback = function() 
        local count = 0
        while count <= 99999 do
            game.Players.LocalPlayer.Character.Humanoid.JumpHeight = JumpPower_New
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = JumpPower_New
            wait(0.01)
            print(JumpPower_New)
        end   
    end
}
local Tab = GUI:Tab{
	Name = "Script Executor",
	Icon = "rbxassetid://8569322835"
}
Tab:Textbox{
	Name = "ScriptBox",
	Callback = function(text) 
    SCRtoEXEC = text
    end
}
Tab:Button{
	Name = "Execute",
	Description = nil,
	Callback = function() 
        loadstring(SCRtoEXEC)()
        GUI:Notification{
            Title = "R_INT",
            Text = "Script Executed!",
            Duration = 3,
            Callback = function() end
        }
    end
}

local Tab2 = GUI:Tab{
	Name = "User Checker",
	Icon = "rbxassetid://8569322835"
}
Tab2:Textbox{
	Name = "userID",
	Callback = function(val) 
    UserToSearch = UserToSearch + val
    end
}
Tab2:Button{
	Name = "Check",
	Description = nil,
	Callback = function() 
    if isPlayerInGame(UserToSearch) then
        GUI:Notification{
            Title = "R_INT",
            Text = "User Found!",
            Duration = 3,
            Callback = function() end
        }
    end
    end
}

local Tab3 = GUI:Tab{
	Name = "Utility Scripts",
	Icon = "rbxassetid://8569322835"
}
Tab3:Button{
	Name = "Infinite Yield",
	Description = nil,
	Callback = function() 
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/refs/heads/master/source"))()
end
}
Tab3:Button{
	Name = "CMD-X",
	Description = nil,
	Callback = function()     
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/refs/heads/master/Source"))()
    end
}
Tab3:Button{
	Name = "SimpleSpy",
	Description = nil,
	Callback = function()     
        loadstring(game:HttpGet("https://github.com/exxtremestuffs/SimpleSpySource/raw/master/SimpleSpy.lua"))()
    end
}