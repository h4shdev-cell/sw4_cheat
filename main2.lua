-- Script para Roube um Brainrot - Dinheiro Infinito (30 bilhões a cada 10 segundos)

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
    addMoney(30000000000) -- Adiciona 30 bilhões de dinheiro
    wait(10) -- Intervalo de 10 segundos entre cada adição
end
