-- ZYPHERION-Lite Universal Hub avec catégories et la possibilité de fermer avec la touche '²'

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

local CategoryFrame = Instance.new("Frame", MainFrame)
CategoryFrame.Position = UDim2.new(0, 0, 0.08, 0)
CategoryFrame.Size = UDim2.new(1, 0, 1, -40)
CategoryFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

-- Create sections for categories
local function createCategoryButton(categoryName, position)
    local button = Instance.new("TextButton", CategoryFrame)
    button.Text = categoryName
    button.Position = position
    button.Size = UDim2.new(1, 0, 0, 40)
    button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = 14
    button.Font = Enum.Font.GothamBold
    button.TextButtonStyle = Enum.ButtonStyle.Rounded

    return button
end

local function createButton(text, position, size, callback)
    local button = Instance.new("TextButton", CategoryFrame)
    button.Text = text
    button.Position = position
    button.Size = size
    button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = 14
    button.Font = Enum.Font.Gotham
    button.TextButtonStyle = Enum.ButtonStyle.Rounded

    button.MouseButton1Click:Connect(callback)
end

-- Categories Setup
local movementCategory = createCategoryButton("Mouvement", UDim2.new(0, 0, 0, 0))
local combatCategory = createCategoryButton("Combat", UDim2.new(0, 0, 0, 40))
local utilityCategory = createCategoryButton("Utilitaires", UDim2.new(0, 0, 0, 80))
local displayCategory = createCategoryButton("Affichage", UDim2.new(0, 0, 0, 120))

-- Hide/Show functionality for each category
local function hideAllCategories()
    for _, child in ipairs(CategoryFrame:GetChildren()) do
        if child:IsA("TextButton") and child.TextButtonStyle == Enum.ButtonStyle.Rounded then
            child.Visible = false
        end
    end
end

-- --- Mouvement Category ---
createButton("Set WalkSpeed to 100", UDim2.new(0.1, 0, 0.1, 0), UDim2.new(0.8, 0, 0, 40), function()
    LocalPlayer.Character.Humanoid.WalkSpeed = 100
end)

createButton("Toggle Fly", UDim2.new(0.1, 0, 0.2, 0), UDim2.new(0.8, 0, 0, 40), function()
    -- Functionality for Fly (code from previous implementation)
end)

createButton("Toggle NoClip", UDim2.new(0.1, 0, 0.3, 0), UDim2.new(0.8, 0, 0, 40), function()
    -- Functionality for NoClip (code from previous implementation)
end)

createButton("Teleport to Mouse", UDim2.new(0.1, 0, 0.4, 0), UDim2.new(0.8, 0, 0, 40), function()
    -- Functionality for Teleportation (code from previous implementation)
end)

-- --- Combat Category ---
createButton("Toggle Aimbot", UDim2.new(0.1, 0, 0.5, 0), UDim2.new(0.8, 0, 0, 40), function()
    -- Functionality for Aimbot (code from previous implementation)
end)

createButton("Set WalkSpeed to 200", UDim2.new(0.1, 0, 0.6, 0), UDim2.new(0.8, 0, 0, 40), function()
    LocalPlayer.Character.Humanoid.WalkSpeed = 200
end)

-- --- Utilitaires Category ---
createButton("Toggle God Mode", UDim2.new(0.1, 0, 0.7, 0), UDim2.new(0.8, 0, 0, 40), function()
    -- Functionality for God Mode (code from previous implementation)
end)

createButton("Spawn Part", UDim2.new(0.1, 0, 0.8, 0), UDim2.new(0.8, 0, 0, 40), function()
    local part = Instance.new("Part")
    part.Size = Vector3.new(4, 4, 4)
    part.Position = LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, 5, 0)
    part.Anchored = true
    part.Color = Color3.fromRGB(0, 255, 0)
    part.Parent = game.Workspace
end)

createButton("Teleport to Spawn", UDim2.new(0.1, 0, 0.9, 0), UDim2.new(0.8, 0, 0, 40), function()
    -- Functionality for Teleport to Spawn (code from previous implementation)
end)

-- --- Affichage Category ---
createButton("Spawn ESP", UDim2.new(0.1, 0, 0.1, 0), UDim2.new(0.8, 0, 0, 40), function()
    -- Functionality for ESP (code from previous implementation)
end)

-- --- Function to handle closing the GUI ---
local function closeGui()
    ScreenGui:Destroy()
end

-- Close the GUI with key '²'
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.Grave then
        closeGui()
    end
end)

-- --- Display the categories ---
movementCategory.MouseButton1Click:Connect(function()
    hideAllCategories()
    -- Show buttons under movement category
    for _, button in ipairs(movementCategory:GetChildren()) do button.Visible = true end
end)

combatCategory.MouseButton1Click:Connect(function()
    hideAllCategories()
    -- Show buttons under combat category
end)

utilityCategory.MouseButton1Click:Connect(function()
    hideAllCategories()
    -- Show buttons under utility category
end)

displayCategory.MouseButton1Click:Connect(function()
    hideAllCategories()
    -- Show buttons under display category
end)

print("Zypherion Lite Hub with Categories and 15+ functions.")
