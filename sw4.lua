-- InjectorScript.lua

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "SW4_UI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- MAIN
local main = Instance.new("Frame")
main.Size = UDim2.new(0, 620, 0, 360)
main.Position = UDim2.new(0.5, -310, 0.5, -180)
main.BackgroundColor3 = Color3.fromRGB(22,22,22)
main.BorderSizePixel = 0
main.Parent = gui

Instance.new("UICorner", main).CornerRadius = UDim.new(0,18)

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(55,55,55)
stroke.Thickness = 1.5
stroke.Parent = main

-- SHADOW EFFECT
local shadow = Instance.new("ImageLabel")
shadow.Name = "Shadow"
shadow.AnchorPoint = Vector2.new(0.5,0.5)
shadow.Position = UDim2.new(0.5,0,0.5,0)
shadow.Size = UDim2.new(1,55,1,55)
shadow.BackgroundTransparency = 1
shadow.Image = "rbxassetid://1316045217"
shadow.ImageTransparency = 0.6
shadow.ScaleType = Enum.ScaleType.Slice
shadow.SliceCenter = Rect.new(10,10,118,118)
shadow.ZIndex = 0
shadow.Parent = main

-- TOPBAR
local top = Instance.new("Frame")
top.Size = UDim2.new(1,0,0,55)
top.BackgroundColor3 = Color3.fromRGB(30,30,30)
top.BorderSizePixel = 0
top.Parent = main

Instance.new("UICorner", top).CornerRadius = UDim.new(0,18)

local fix = Instance.new("Frame")
fix.Size = UDim2.new(1,0,0,20)
fix.Position = UDim2.new(0,0,1,-20)
fix.BackgroundColor3 = Color3.fromRGB(30,30,30)
fix.BorderSizePixel = 0
fix.Parent = top

local title = Instance.new("TextLabel")
title.Text = "SW4 CLIENT PANEL"
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.TextColor3 = Color3.fromRGB(240,240,240)
title.BackgroundTransparency = 1
title.Position = UDim2.new(0,20,0,0)
title.Size = UDim2.new(0,300,1,0)
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = top

-- SIDEBAR
local sidebar = Instance.new("Frame")
sidebar.Size = UDim2.new(0,170,1,-55)
sidebar.Position = UDim2.new(0,0,0,55)
sidebar.BackgroundColor3 = Color3.fromRGB(26,26,26)
sidebar.BorderSizePixel = 0
sidebar.Parent = main

local layout = Instance.new("UIListLayout")
layout.Padding = UDim.new(0,10)
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
layout.VerticalAlignment = Enum.VerticalAlignment.Top
layout.Parent = sidebar

local pad = Instance.new("UIPadding")
pad.PaddingTop = UDim.new(0,20)
pad.Parent = sidebar

local function createButton(text)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(0,145,0,42)
	btn.BackgroundColor3 = Color3.fromRGB(36,36,36)
	btn.Text = text
	btn.Font = Enum.Font.GothamMedium
	btn.TextSize = 14
	btn.TextColor3 = Color3.fromRGB(230,230,230)
	btn.BorderSizePixel = 0
	btn.AutoButtonColor = false
	btn.Parent = sidebar

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0,12)
	corner.Parent = btn

	local stroke = Instance.new("UIStroke")
	stroke.Color = Color3.fromRGB(55,55,55)
	stroke.Parent = btn

	btn.MouseEnter:Connect(function()
		TweenService:Create(btn,TweenInfo.new(0.15),{
			BackgroundColor3 = Color3.fromRGB(50,50,50)
		}):Play()
	end)

	btn.MouseLeave:Connect(function()
		TweenService:Create(btn,TweenInfo.new(0.15),{
			BackgroundColor3 = Color3.fromRGB(36,36,36)
		}):Play()
	end)

	return btn
end

createButton("Dashboard")
createButton("Players")
createButton("Inventory")
createButton("Scripts")
createButton("Executor")
createButton("Settings")

-- CONTENT
local content = Instance.new("Frame")
content.Size = UDim2.new(1,-190,1,-75)
content.Position = UDim2.new(0,180,0,65)
content.BackgroundTransparency = 1
content.Parent = main

local welcome = Instance.new("TextLabel")
welcome.Text = "Brainrot Teleporter"
welcome.Font = Enum.Font.GothamBold
welcome.TextSize = 28
welcome.TextColor3 = Color3.fromRGB(255,255,255)
welcome.BackgroundTransparency = 1
welcome.Position = UDim2.new(0,10,0,10)
welcome.Size = UDim2.new(1,0,0,40)
welcome.TextXAlignment = Enum.TextXAlignment.Left
welcome.Parent = content

local desc = Instance.new("TextLabel")
desc.Text = "Teleport Brainrots to your base"
desc.Font = Enum.Font.Gotham
desc.TextSize = 15
desc.TextColor3 = Color3.fromRGB(170,170,170)
desc.BackgroundTransparency = 1
desc.Position = UDim2.new(0,10,0,50)
desc.Size = UDim2.new(1,0,0,25)
desc.TextXAlignment = Enum.TextXAlignment.Left
desc.Parent = content

-- CARDS
local function createCard(x,y,titleText, brainrotName)
	local card = Instance.new("Frame")
	card.Size = UDim2.new(0,180,0,110)
	card.Position = UDim2.new(0,x,0,y)
	card.BackgroundColor3 = Color3.fromRGB(32,32,32)
	card.BorderSizePixel = 0
	card.Parent = content

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0,15)
	corner.Parent = card

	local stroke = Instance.new("UIStroke")
	stroke.Color = Color3.fromRGB(50,50,50)
	stroke.Parent = card

	local txt = Instance.new("TextLabel")
	txt.Text = titleText
	txt.Font = Enum.Font.GothamBold
	txt.TextSize = 18
	txt.TextColor3 = Color3.fromRGB(240,240,240)
	txt.BackgroundTransparency = 1
	txt.Position = UDim2.new(0,15,0,15)
	txt.Size = UDim2.new(1,-20,0,25)
	txt.TextXAlignment = Enum.TextXAlignment.Left
	txt.Parent = card

	local small = Instance.new("TextLabel")
	small.Text = brainrotName
	small.Font = Enum.Font.Gotham
	small.TextSize = 13
	small.TextColor3 = Color3.fromRGB(160,160,160)
	small.BackgroundTransparency = 1
	small.Position = UDim2.new(0,15,0,45)
	small.Size = UDim2.new(1,-20,0,20)
	small.TextXAlignment = Enum.TextXAlignment.Left
	small.Parent = card

	local spawnButton = Instance.new("TextButton")
	spawnButton.Text = "Spawn"
	spawnButton.Font = Enum.Font.GothamMedium
	spawnButton.TextSize = 14
	spawnButton.TextColor3 = Color3.fromRGB(230,230,230)
	spawnButton.BackgroundColor3 = Color3.fromRGB(40,40,40)
	spawnButton.Size = UDim2.new(0,150,0,30)
	spawnButton.Position = UDim2.new(0,15,0,75)
	spawnButton.Parent = card

	spawnButton.MouseButton1Click:Connect(function()
		local brainrot = ReplicatedStorage:FindFirstChild(brainrotName)
		if brainrot then
			local clone = brainrot:Clone()
			clone.Parent = player.Backpack
			clone.Handle.CFrame = player.Character.HumanoidRootPart.CFrame
		end
	end)

	return card
end

local brainrots = {
	"Rare Brainrot 1",
	"Rare Brainrot 2",
	"Rare Brainrot 3"
}

local x, y = 10, 100
for i, brainrot in ipairs(brainrots) do
	createCard(x, y, "Rare Brainrot", brainrot)
	x = x + 200
	if x > 600 then
		x = 10
		y = y + 120
	end
end

-- DRAG SYSTEM
local dragging
local dragInput
local dragStart
local startPos

local function update(input)
	local delta = input.Position - dragStart
	main.Position = UDim2.new(
		startPos.X.Scale,
		startPos.X.Offset + delta.X,
		startPos.Y.Scale,
		startPos.Y.Offset + delta.Y
	)
end

top.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = main.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

top.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement then
		dragInput = input
	end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		update(input)
	end
end)
