-- ZYPHERION-Inspired Universal Hub (Lite Version)

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- GUI Setup
local ScreenGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
ScreenGui.Name = "ZypherionLiteHub"

local Frame = Instance.new("Frame", ScreenGui)
Frame.Position = UDim2.new(0.3, 0, 0.3, 0)
Frame.Size = UDim2.new(0, 300, 0, 200)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

local Title = Instance.new("TextLabel", Frame)
Title.Text = "Zypherion Lite Hub"
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Simple function: WalkSpeed changer
local WalkSpeedButton = Instance.new("TextButton", Frame)
WalkSpeedButton.Text = "Set WalkSpeed to 100"
WalkSpeedButton.Position = UDim2.new(0.1, 0, 0.3, 0)
WalkSpeedButton.Size = UDim2.new(0.8, 0, 0, 40)
WalkSpeedButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
WalkSpeedButton.TextColor3 = Color3.fromRGB(255, 255, 255)

WalkSpeedButton.MouseButton1Click:Connect(function()
    LocalPlayer.Character.Humanoid.WalkSpeed = 100
end)

-- Add more buttons/functions below as needed

print("Zypherion Lite Loaded.")
