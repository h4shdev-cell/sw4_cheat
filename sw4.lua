-- InjectorScript.lua

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function giveInfiniteMoney()
    -- Substitua 'Money' pelo nome do objeto ou valor que representa o dinheiro no jogo
    local money = Instance.new("IntValue")
    money.Name = "Money"
    money.Value = 9999999999 -- Valor alto para simular dinheiro infinito
    money.Parent = LocalPlayer

    -- Se o jogo usa um sistema de moeda específico, você pode precisar ajustar o código abaixo
    -- Por exemplo, se o jogo usa um RemoteEvent para adicionar dinheiro, você pode precisar chamar esse evento
    -- local remoteEvent = game:GetService("ReplicatedStorage"):FindFirstChild("AddMoneyEvent")
    -- if remoteEvent then
    --     remoteEvent:FireServer(money.Value)
    -- end
end

giveInfiniteMoney()
