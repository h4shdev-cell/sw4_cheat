-- InjectorScript.lua

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local function injectMenu()
    local menu = Instance.new("ScreenGui")
    menu.Name = "MoneyMenu"
    menu.Parent = LocalPlayer:WaitForChild("PlayerGui")

    local frame = Instance.new("Frame")
    frame.Name = "Frame"
    frame.Parent = menu
    frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    frame.Position = UDim2.new(0.5, -150, 0.5, -150)
    frame.Size = UDim2.new(0, 300, 0, 200)
    frame.Visible = false

    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.Parent = frame
    title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    title.Size = UDim2.new(1, 0, 0.1, 0)
    title.Position = UDim2.new(0, 0, 0, 0)
    title.Text = "Money Cheat"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.TextSize = 14
    title.TextXAlignment = Enum.TextXAlignment.Center

    local input = Instance.new("TextBox")
    input.Name = "Input"
    input.Parent = frame
    input.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    input.Size = UDim2.new(0.8, 0, 0.2, 0)
    input.Position = UDim2.new(0.1, 0, 0.2, 0)
    input.Text = ""
    input.TextColor3 = Color3.fromRGB(255, 255, 255)
    input.TextSize = 14
    input.PlaceholderText = "Digite o valor do dinheiro"
    input.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)

    local button = Instance.new("TextButton")
    button.Name = "Button"
    button.Parent = frame
    button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    button.Size = UDim2.new(0.8, 0, 0.2, 0)
    button.Position = UDim2.new(0.1, 0, 0.5, 0)
    button.Text = "Confirmar"
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = 14

    button.MouseButton1Click:Connect(function()
        local value = tonumber(input.Text)
        if value then
            giveMoney(value)
        else
            print("Valor inválido")
        end
    end)

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

local function giveMoney(value)
    local remoteEvent = ReplicatedStorage:FindFirstChild("AddMoneyEvent")
    if remoteEvent then
        remoteEvent:FireServer(value)
    else
        print("RemoteEvent não encontrado")
    end
end

local function fetchElementData()
    local elementData = {}
    for _, data in ipairs(ReplicatedStorage:GetChildren()) do
        if data:IsA("ModuleScript") and data.Name == "ElementData" then
            local module = require(data)
            for key, value in pairs(module) do
                elementData[key] = value
            end
        end
    end
    return elementData
end

local function breakProtection()
    local elementData = fetchElementData()
    for key, value in pairs(elementData) do
        print("ElementData:", key, value)
        -- Aqui você pode adicionar a lógica para quebrar a proteção
        -- Por exemplo, alterar valores ou chamar funções específicas
    end
end

injectMenu()
breakProtection()
