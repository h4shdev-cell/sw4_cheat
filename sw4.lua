-- InjectorScript.lua

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")

local function injectMenu()
    local menu = Instance.new("ScreenGui")
    menu.Name = "Menu"
    menu.Parent = LocalPlayer:WaitForChild("PlayerGui")

    local frame = Instance.new("Frame")
    frame.Name = "Frame"
    frame.Parent = menu
    frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    frame.Position = UDim2.new(0.5, -150, 0.5, -150)
    frame.Size = UDim2.new(0, 300, 0, 300)
    frame.Visible = false

    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.Parent = frame
    title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    title.Size = UDim2.new(1, 0, 0.1, 0)
    title.Position = UDim2.new(0, 0, 0, 0)
    title.Text = "Cheat Menu"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.TextSize = 14

    local options = {
        "Increase Speed",
        "Decrease Speed",
        "Get Free Items",
        "Teleport to Player"
    }

    for i, option in ipairs(options) do
        local button = Instance.new("TextButton")
        button.Name = "Button" .. i
        button.Parent = frame
        button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        button.Size = UDim2.new(1, 0, 0.2, 0)
        button.Position = UDim2.new(0, 0, 0.1 + (i-1)*0.2, 0)
        button.Text = option
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.TextSize = 14

        button.MouseButton1Click:Connect(function()
            if option == "Increase Speed" then
                local character = LocalPlayer.Character
                if character then
                    local humanoid = character:FindFirstChildOfClass("Humanoid")
                    if humanoid then
                        humanoid.WalkSpeed = humanoid.WalkSpeed + 5
                    end
                end
            elseif option == "Decrease Speed" then
                local character = LocalPlayer.Character
                if character then
                    local humanoid = character:FindFirstChildOfClass("Humanoid")
                    if humanoid then
                        humanoid.WalkSpeed = humanoid.WalkSpeed - 5
                    end
                end
            elseif option == "Get Free Items" then
                for _, item in ipairs(ReplicatedStorage:GetChildren()) do
                    if item:IsA("Tool") then
                        local clone = item:Clone()
                        clone.Parent = LocalPlayer.Backpack
                    end
                end
            elseif option == "Teleport to Player" then
                local targetPlayer = Players:GetPlayers()[math.random(1, #Players:GetPlayers())]
                if targetPlayer and targetPlayer.Character then
                    LocalPlayer.Character:MoveTo(targetPlayer.Character.HumanoidRootPart.Position)
                end
            end
        end)
    end

    local UserInputService = game:GetService("UserInputService")

    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if input.KeyCode == Enum.KeyCode.K and not gameProcessed then
            frame.Visible = not frame.Visible
            if frame.Visible then
                TweenService:Create(frame, TweenInfo.new(0.3), {Position = UDim2.new(0.5, 0, 0.5, 0)}):Play()
            else
                TweenService:Create(frame, TweenInfo.new(0.3), {Position = UDim2.new(0.5, -150, 0.5, -150)}):Play()
            end
        end
    end)
end

local function manipulatePlayer()
    local character = LocalPlayer.Character
    if character then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = 50 -- Ajuste a velocidade do jogador
            humanoid.JumpPower = 100 -- Ajuste a força do pulo
        end
    end
end

local function injectCheatScript()
    local cheatScript = game:HttpGet("https://raw.githubusercontent.com/h4shdev-cell/sw4_cheat/refs/heads/main/sw4.lua")
    loadstring(cheatScript)()
end

LocalPlayer.CharacterAdded:Connect(function(character)
    injectMenu()
    manipulatePlayer()
    injectCheatScript()
end)

injectMenu()
manipulatePlayer()
injectCheatScript()
