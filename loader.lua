local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer

local function showMessage(txt)
    local Message = Instance.new("Message")
    Message.Parent = game.Workspace
    Message.Text = txt
    task.wait(2)
    Message:Destroy()
end


local function detectPlatform()
	if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
		print("Player is on Mobile.")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1hyzh/R_INT/refs/heads/main/mobile.lua"))()
	elseif UserInputService.KeyboardEnabled and not UserInputService.TouchEnabled then
		print("Player is on PC.")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/1hyzh/R_INT/refs/heads/main/pc.lua"))()
	else
		print("Player platform is ambiguous (could be tablet, hybrid device, etc).")
        showMessage("Force the needed ui for your device!")
	end
end

-- Run on start
detectPlatform()
