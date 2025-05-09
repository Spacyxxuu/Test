-- ZYPHERION-Lite Universal Hub avec ESP, Aimbot, WalkSpeed, etc.

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = game:GetService("Workspace").CurrentCamera
local Mouse = LocalPlayer:GetMouse()

-- GUI Setup
local ScreenGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
ScreenGui.Name = "ZypherionLiteHub"

local Frame = Instance.new("Frame", ScreenGui)
Frame.Position = UDim2.new(0.3, 0, 0.3, 0)
Frame.Size = UDim2.new(0, 300, 0, 250)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

local Title = Instance.new("TextLabel", Frame)
Title.Text = "Zypherion Lite Hub"
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)

-- WalkSpeed Functionality
local WalkSpeedButton = Instance.new("TextButton", Frame)
WalkSpeedButton.Text = "Set WalkSpeed to 100"
WalkSpeedButton.Position = UDim2.new(0.1, 0, 0.3, 0)
WalkSpeedButton.Size = UDim2.new(0.8, 0, 0, 40)
WalkSpeedButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
WalkSpeedButton.TextColor3 = Color3.fromRGB(255, 255, 255)

WalkSpeedButton.MouseButton1Click:Connect(function()
    LocalPlayer.Character.Humanoid.WalkSpeed = 100
end)

-- ESP Player Feature
local function createESP(player)
    local espPart = Instance.new("Part")
    espPart.Size = Vector3.new(4, 4, 4)
    espPart.Shape = Enum.PartType.Ball
    espPart.Color = Color3.fromRGB(255, 0, 0)
    espPart.Transparency = 0.7
    espPart.Anchored = true
    espPart.CanCollide = false
    espPart.Parent = game.Workspace
    local head = player.Character:WaitForChild("Head")
    espPart.Position = head.Position + Vector3.new(0, 2, 0)

    -- Updating ESP position
    game:GetService("RunService").Heartbeat:Connect(function()
        if player.Character and player.Character:FindFirstChild("Head") then
            espPart.Position = player.Character.Head.Position + Vector3.new(0, 2, 0)
        else
            espPart:Destroy()
        end
    end)
end

-- ESP activation for each player
Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        createESP(player)
    end)
end)

-- Aimbot Functionality
local aimbotEnabled = true
local aimbotTarget = nil

local function getClosestTarget()
    local closestDistance = math.huge
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local target = player.Character.HumanoidRootPart
            local screenPos, onScreen = Camera:WorldToScreenPoint(target.Position)
            local distance = (Vector2.new(screenPos.X, screenPos.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude
            if distance < closestDistance and onScreen then
                closestDistance = distance
                aimbotTarget = target
            end
        end
    end
end

local function aimAtTarget()
    if aimbotTarget then
        local targetPosition = aimbotTarget.Position
        Camera.CFrame = CFrame.new(Camera.CFrame.Position, targetPosition)
    end
end

-- Aimbot loop
game:GetService("RunService").Heartbeat:Connect(function()
    if aimbotEnabled then
        getClosestTarget()
        aimAtTarget()
    end
end)

-- Toggle Aimbot
local AimbotToggleButton = Instance.new("TextButton", Frame)
AimbotToggleButton.Text = "Toggle Aimbot"
AimbotToggleButton.Position = UDim2.new(0.1, 0, 0.4, 0)
AimbotToggleButton.Size = UDim2.new(0.8, 0, 0, 40)
AimbotToggleButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
AimbotToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)

AimbotToggleButton.MouseButton1Click:Connect(function()
    aimbotEnabled = not aimbotEnabled
end)

print("Zypherion Lite Hub Loaded.")
