-- InjectorScript.lua

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function injectMenu()
    local menu = Instance.new("ScreenGui")
    menu.Name = "Menu"
    menu.Parent = LocalPlayer:WaitForChild("PlayerGui")

    local frame = Instance.new("Frame")
    frame.Name = "Frame"
    frame.Parent = menu
    frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    frame.Position = UDim2.new(0.5, -150, 0.5, -150)
    frame.Size = UDim2.new(0, 300, 0, 300)
    frame.Visible = false

    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.Parent = frame
    title.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    title.Size = UDim2.new(1, 0, 0.1, 0)
    title.Position = UDim2.new(0, 0, 0, 0)
    title.Text = "Cheat Menu"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.TextSize = 14

    local options = {
        "Option 1",
        "Option 2",
        "Option 3"
    }

    for i, option in ipairs(options) do
        local button = Instance.new("TextButton")
        button.Name = "Button" .. i
        button.Parent = frame
        button.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
        button.Size = UDim2.new(1, 0, 0.2, 0)
        button.Position = UDim2.new(0, 0, 0.1 + (i-1)*0.2, 0)
        button.Text = option
        button.TextColor3 = Color3.fromRGB(0, 0, 0)
        button.TextSize = 14

        button.MouseButton1Click:Connect(function()
            print(option .. " selected")
            -- Adicione aqui a lógica para cada opção
        end)
    end

    local UserInputService = game:GetService("UserInputService")
    local TweenService = game:GetService("TweenService")

    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if input.KeyCode == Enum.KeyCode.Quote and not gameProcessed then
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

LocalPlayer.CharacterAdded:Connect(function(character)
    injectMenu()
    manipulatePlayer()
end)

injectMenu()
manipulatePlayer()
