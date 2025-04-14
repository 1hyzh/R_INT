--MAIN FRAME
local mainGUI = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local camera = workspace.CurrentCamera
local viewportSize = camera.ViewportSize
local centerOfScreen = Vector2.new(viewportSize.X / 2, viewportSize.Y / 2)
mainGUI.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
MainFrame.Parent = mainGUI
MainFrame.BackgroundColor3 = Color3.fromRGB(32, 40, 56)
MainFrame.Size = UDim2.new(0,450, 0, 500)
MainFrame.Position = UDim2.new(0.5, -MainFrame.Size.X.Offset * 1.7, 0.5, -MainFrame.Size.Y.Offset / 3)
MainFrame.Visible = true

--Reopen button
local reopenButton = Instance.new("TextButton")
reopenButton.Parent = mainGUI
reopenButton.Position = UDim2.new(0.5, -MainFrame.Size.X.Offset * 1.75, 0.5, -MainFrame.Size.Y.Offset * -0.65)
reopenButton.Size = UDim2.new(0, 50, 0, 50)
reopenButton.TextColor3 = Color3.fromRGB(255, 255, 255)
reopenButton.TextScaled = true
reopenButton.Modal = true
reopenButton.FontFace = Font.fromName("Ubuntu")
reopenButton.Text = "-"
reopenButton.BackgroundColor3 = Color3.fromHex(374054)
reopenButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = true
end)

--Close Button
local closeButton = Instance.new("TextButton")
closeButton.Parent = MainFrame
closeButton.Size = UDim2.new(0, 50, 0, 50)
closeButton.Position = UDim2.new(0.85, 0, 0, 10)
closeButton.BackgroundTransparency = 1
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.TextScaled = true
closeButton.Modal = true
closeButton.FontFace = Font.fromName("Ubuntu")

closeButton.MouseButton1Click:Connect(function()
	MainFrame.Visible = false
end)

local drag = Instance.new("DragDetector")
drag.Parent = MainFrame

--Rounded Corner -> mainframe
local Rounded_Corner_MainFrame = Instance.new("UICorner")
Rounded_Corner_MainFrame.Parent = MainFrame

--Rounded Cornder -> reopen button
local Rounded_Corner_reopenButton = Instance.new("UICorner")
Rounded_Corner_reopenButton.Parent = reopenButton