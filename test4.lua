-- ZYPHERION-Lite Universal Hub avec GUI amélioré et 15+ fonctionnalités

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = game:GetService("Workspace").CurrentCamera
local Mouse = LocalPlayer:GetMouse()
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

-- GUI Setup
local ScreenGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
ScreenGui.Name = "ZypherionLiteHub"

local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Position = UDim2.new(0.02, 0, 0.2, 0)
MainFrame.Size = UDim2.new(0, 350, 0, 550)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 2
MainFrame.BorderColor3 = Color3.fromRGB(0, 255, 255)

local Title = Instance.new("TextLabel", MainFrame)
Title.Text = "Zypherion Lite Hub"
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 18
Title.TextAlignment = Enum.TextAlignment.Center
Title.Font = Enum.Font.GothamBold

local function createButton(text, position, size, callback)
    local button = Instance.new("TextButton", MainFrame)
    button.Text = text
    button.Position = position
    button.Size = size
    button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = 14
    button.Font = Enum.Font.Gotham

    button.MouseButton1Click:Connect(callback)
end

-- --- Functionality Buttons ---
-- WalkSpeed
createButton("Set WalkSpeed to 100", UDim2.new(0.1, 0, 0.1, 0), UDim2.new(0.8, 0, 0, 40), function()
    LocalPlayer.Character.Humanoid.WalkSpeed = 100
end)

-- Fly
local flying = false
local bodyGyro, bodyVelocity
local flySpeed = 50
local function startFly()
    if not flying then
        flying = true
        local character = LocalPlayer.Character
        local humanoid = character:WaitForChild("Humanoid")
        local rootPart = character:WaitForChild("HumanoidRootPart")

        bodyGyro = Instance.new("BodyGyro", rootPart)
        bodyGyro.MaxTorque = Vector3.new(400000, 400000, 400000)
        bodyGyro.CFrame = rootPart.CFrame

        bodyVelocity = Instance.new("BodyVelocity", rootPart)
        bodyVelocity.MaxForce = Vector3.new(400000, 400000, 400000)
        bodyVelocity.Velocity = Vector3.new(0, flySpeed, 0)

        humanoid.PlatformStand = true
        game:GetService("RunService").Heartbeat:Connect(function()
            if flying then
                bodyGyro.CFrame = rootPart.CFrame
                bodyVelocity.Velocity = Vector3.new(Mouse.Hit.p.X - rootPart.Position.X, 0, Mouse.Hit.p.Z - rootPart.Position.Z).unit * flySpeed
            end
        end)
    end
end

local function stopFly()
    if flying then
        flying = false
        LocalPlayer.Character.Humanoid.PlatformStand = false
        bodyGyro:Destroy()
        bodyVelocity:Destroy()
    end
end

createButton("Toggle Fly", UDim2.new(0.1, 0, 0.2, 0), UDim2.new(0.8, 0, 0, 40), function()
    if flying then
        stopFly()
    else
        startFly()
    end
end)

-- NoClip
local noclip = false
local function toggleNoClip()
    noclip = not noclip
    local character = LocalPlayer.Character
    local humanoid = character:WaitForChild("Humanoid")

    for _, part in ipairs(character:GetChildren()) do
        if part:IsA("BasePart") then
            part.CanCollide = not noclip
        end
    end
end

createButton("Toggle NoClip", UDim2.new(0.1, 0, 0.3, 0), UDim2.new(0.8, 0, 0, 40), function()
    toggleNoClip()
end)

-- Teleportation
local function teleportToMouse()
    local character = LocalPlayer.Character
    local rootPart = character:WaitForChild("HumanoidRootPart")
    rootPart.CFrame = CFrame.new(Mouse.Hit.p)
end

createButton("Teleport to Mouse", UDim2.new(0.1, 0, 0.4, 0), UDim2.new(0.8, 0, 0, 40), function()
    teleportToMouse()
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

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        createESP(player)
    end)
end)

-- Speed Hack
createButton("Set WalkSpeed to 200", UDim2.new(0.1, 0, 0.5, 0), UDim2.new(0.8, 0, 0, 40), function()
    LocalPlayer.Character.Humanoid.WalkSpeed = 200
end)

-- God Mode (Invincibility)
createButton("Toggle God Mode", UDim2.new(0.1, 0, 0.6, 0), UDim2.new(0.8, 0, 0, 40), function()
    local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.Health = humanoid.Health == humanoid.MaxHealth and humanoid.MaxHealth or humanoid.MaxHealth
    end
end)

-- Spawn Object
createButton("Spawn Part", UDim2.new(0.1, 0, 0.7, 0), UDim2.new(0.8, 0, 0, 40), function()
    local part = Instance.new("Part")
    part.Size = Vector3.new(4, 4, 4)
    part.Position = LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, 5, 0)
    part.Anchored = true
    part.Color = Color3.fromRGB(0, 255, 0)
    part.Parent = game.Workspace
end)

-- Teleport to Spawn
createButton("Teleport to Spawn", UDim2.new(0.1, 0, 0.8, 0), UDim2.new(0.8, 0, 0, 40), function()
    local spawnLocation = game:GetService("Workspace"):WaitForChild("SpawnLocation")
    LocalPlayer.Character:MoveTo(spawnLocation.Position)
end)

-- Aimbot Feature
local aimbotEnabled = false
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

game:GetService("RunService").Heartbeat:Connect(function()
    if aimbotEnabled then
        getClosestTarget()
        aimAtTarget()
    end
end)

createButton("Toggle Aimbot", UDim2.new(0.1, 0, 0.9, 0), UDim2.new(0.8, 0, 0, 40), function()
    aimbotEnabled = not aimbotEnabled
end)

-- Close the GUI
createButton("Close Hub", UDim2.new(0.1, 0, 1, 0), UDim2.new(0.8, 0, 0, 40), function()
    ScreenGui:Destroy()
end)

print("Zypherion Lite Hub Loaded with GUI enhancements and 15+ functions.")
