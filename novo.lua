-- InjectorScript.lua

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")

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

local function giveMoney(value)
    local remoteEvent = ReplicatedStorage:FindFirstChild("AddMoneyEvent")
    if remoteEvent then
        remoteEvent:FireServer(value)
    else
        print("RemoteEvent não encontrado")
    end
end

breakProtection()
giveMoney(50000000000)
