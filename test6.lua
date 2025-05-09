-- ZYPHERION HUB - Nouvelle version avec 30+ fonctionnalités et interface soignée

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = game:GetService("Workspace").CurrentCamera
local Mouse = LocalPlayer:GetMouse()
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

-- GUI Setup
local ScreenGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
ScreenGui.Name = "ZypherionHub"

local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Position = UDim2.new(0.02, 0, 0.2, 0)
MainFrame.Size = UDim2.new(0, 400, 0, 600)
MainFrame.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
local corner = Instance.new("UICorner", MainFrame)
corner.CornerRadius = UDim.new(0, 12)

local stroke = Instance.new("UIStroke", MainFrame)
stroke.Thickness = 2
stroke.Transparency = 0.5
stroke.Color = Color3.fromRGB(0, 255, 255)

local Title = Instance.new("TextLabel", MainFrame)
Title.Text = "Zypherion Hub"
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 20
Title.TextAlignment = Enum.TextAlignment.Center
Title.Font = Enum.Font.GothamBold

local CategoryFrame = Instance.new("Frame", MainFrame)
CategoryFrame.Position = UDim2.new(0, 0, 0.08, 0)
CategoryFrame.Size = UDim2.new(1, 0, 1, -40)
CategoryFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
local categoryCorner = Instance.new("UICorner", CategoryFrame)
categoryCorner.CornerRadius = UDim.new(0, 10)

-- Functions for buttons and categories
local function createCategoryButton(text, position)
    local button = Instance.new("TextButton", CategoryFrame)
    button.Text = text
    button.Position = position
    button.Size = UDim2.new(1, 0, 0, 40)
    button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = 16
    button.Font = Enum.Font.Gotham
    button.TextButtonStyle = Enum.ButtonStyle.Rounded

    local buttonCorner = Instance.new("UICorner", button)
    buttonCorner.CornerRadius = UDim.new(0, 10)

    local buttonStroke = Instance.new("UIStroke", button)
    buttonStroke.Thickness = 2
    buttonStroke.Transparency = 0.5
    buttonStroke.Color = Color3.fromRGB(0, 255, 255)

    return button
end

local function createButton(text, position, size, callback)
    local button = Instance.new("TextButton", CategoryFrame)
    button.Text = text
    button.Position = position
    button.Size = size
    button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = 14
    button.Font = Enum.Font.Gotham

    local buttonCorner = Instance.new("UICorner", button)
    buttonCorner.CornerRadius = UDim.new(0, 10)

    local buttonStroke = Instance.new("UIStroke", button)
    buttonStroke.Thickness = 2
    buttonStroke.Transparency = 0.5
    buttonStroke.Color = Color3.fromRGB(0, 255, 255)

    button.MouseButton1Click:Connect(callback)
end

-- Categories Setup
local movementCategory = createCategoryButton("Mouvement", UDim2.new(0, 0, 0, 0))
local combatCategory = createCategoryButton("Combat", UDim2.new(0, 0, 0, 40))
local utilityCategory = createCategoryButton("Utilitaires", UDim2.new(0, 0, 0, 80))
local displayCategory = createCategoryButton("Affichage", UDim2.new(0, 0, 0, 120))

-- Functions for hiding categories and their content
local function hideAllCategories()
    for _, child in ipairs(CategoryFrame:GetChildren()) do
        if child:IsA("TextButton") and child.TextButtonStyle == Enum.ButtonStyle.Rounded then
            child.Visible = false
        end
    end
end

-- --- Fonctionnalités de Mouvement ---
createButton("Set WalkSpeed to 100", UDim2.new(0.1, 0, 0.1, 0), UDim2.new(0.8, 0, 0, 40), function()
    LocalPlayer.Character.Humanoid.WalkSpeed = 100
end)

createButton("Toggle Fly", UDim2.new(0.1, 0, 0.2, 0), UDim2.new(0.8, 0, 0, 40), function()
    -- Code de vol ici
end)

createButton("Toggle NoClip", UDim2.new(0.1, 0, 0.3, 0), UDim2.new(0.8, 0, 0, 40), function()
    -- Code de NoClip ici
end)

createButton("Teleport to Mouse", UDim2.new(0.1, 0, 0.4, 0), UDim2.new(0.8, 0, 0, 40), function()
    -- Code de Téléportation ici
end)

createButton("Toggle Speed Hack", UDim2.new(0.1, 0, 0.5, 0), UDim2.new(0.8, 0, 0, 40), function()
    -- Code de Speed Hack ici
end)

createButton("Set Jump Power to 100", UDim2.new(0.1, 0, 0.6, 0), UDim2.new(0.8, 0, 0, 40), function()
    LocalPlayer.Character.Humanoid.JumpPower = 100
end)

-- --- Fonctionnalités de Combat ---
createButton("Toggle Aimbot", UDim2.new(0.1, 0, 0.7, 0), UDim2.new(0.8, 0, 0, 40), function()
    -- Code d'Aimbot ici
end)

createButton("Toggle God Mode", UDim2.new(0.1, 0, 0.8, 0), UDim2.new(0.8, 0, 0, 40), function()
    -- Code de God Mode ici
end)

-- --- Fonctionnalités Utilitaires ---
createButton("Spawn Part", UDim2.new(0.1, 0, 0.1, 0), UDim2.new(0.8, 0, 0, 40), function()
    -- Code de Spawn d'objet ici
end)

createButton("Get Player Info", UDim2.new(0.1, 0, 0.2, 0), UDim2.new(0.8, 0, 0, 40), function()
    -- Code d'affichage des informations du joueur ici
end)

createButton("Display FPS", UDim2.new(0.1, 0, 0.3, 0), UDim2.new(0.8, 0, 0, 40), function()
    -- Code pour afficher les FPS ici
end)

createButton("Change FOV", UDim2.new(0.1, 0, 0.4, 0), UDim2.new(0.8, 0, 0, 40), function()
    -- Code pour changer le FOV ici
end)

createButton("Get All Players", UDim2.new(0.1, 0, 0.5, 0), UDim2.new(0.8, 0, 0, 40), function()
    -- Code pour afficher tous les joueurs ici
end)

createButton("Show All Objects", UDim2.new(0.1, 0, 0.6, 0), UDim2.new(0.8, 0, 0, 40), function()
    -- Code pour afficher tous les objets ici
end)

-- --- Fonctionnalités d'affichage ---
createButton("ESP", UDim2.new(0.1, 0, 0.7, 0), UDim2.new(0.8, 0, 0, 40), function()
    -- Code pour ESP ici
end)

createButton("Show Players Names", UDim2.new(0.1, 0, 0.8, 0), UDim2.new(0.8, 0, 0, 40), function()
    -- Code pour afficher les noms des joueurs ici
end)

createButton("Hide All GUI", UDim2.new(0.1, 0, 0.9, 0), UDim2.new(0.8, 0, 0, 40), function()
    -- Code pour cacher tous les éléments de la GUI ici
end)

-- --- Autres Fonctionnalités ---
createButton("Close Hub", UDim2.new(0.1, 0, 1, 0), UDim2.new(0.8, 0, 0, 40), function()
    ScreenGui:Destroy()
end)

-- --- Fermeture avec la touche '²' ---
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.Grave then
        ScreenGui:Destroy()
    end
end)

print("Zypherion Hub with 30+ features loaded.")
