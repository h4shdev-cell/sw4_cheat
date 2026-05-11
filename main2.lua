-- Script para Roube um Brainrot - Dinheiro Infinito

local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Função para adicionar dinheiro ao jogador
local function addMoney(amount)
    local leaderstats = player:FindFirstChild("leaderstats")
    if leaderstats then
        local money = leaderstats:FindFirstChild("Money")
        if money then
            money.Value = money.Value + amount
        end
    end
end

-- Loop para adicionar dinheiro infinito
while true do
    addMoney(1000) -- Ajuste o valor conforme necessário
    wait(1) -- Intervalo de tempo entre cada adição de dinheiro
end
