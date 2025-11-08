local ts = game:GetService("TweenService")
task.wait(2)
local Gui = Instance.new("ScreenGui")
Gui.Name = "Gui"
Gui.IgnoreGuiInset = true
Gui.ResetOnSpawn = false
Gui.DisplayOrder = 5201314
Gui.Parent = game.Players.LocalPlayer.PlayerGui
local Fpstime = 0.5
local liang = 3
local guanbi_time = 1
local dakai_time = 0.1


local tanchuang = Instance.new("Frame")
tanchuang.Size = UDim2.new(0.005,0,0.05,0)
tanchuang.AnchorPoint = Vector2.new(0.5,0.5)
tanchuang.Position = UDim2.new(0.5,0,-0.5,0)
tanchuang.BackgroundColor3 = Color3.new(0, 0, 0)
tanchuang.BackgroundTransparency = 0.6

tanchuang.Parent = game.Players.LocalPlayer.PlayerGui.Gui

local yuanrun = Instance.new("UICorner")
yuanrun.CornerRadius = UDim.new(1,0)
yuanrun.Parent = tanchuang

local FPS = Instance.new("TextLabel")
FPS.Size = UDim2.new(0.2,0,1,0)
FPS.TextScaled = true
FPS.Text = "  FPS:"
FPS.TextColor3 = Color3.new(1, 1, 1)
FPS.TextXAlignment = Enum.TextXAlignment.Left
FPS.BackgroundTransparency = 1
FPS.Parent = tanchuang

local FPS = Instance.new("TextLabel")
FPS.Size = UDim2.new(0.2,0,1,0)
FPS.Position = UDim2.new(0.13,0,0,0)
FPS.TextScaled = true
FPS.Text = " Fps"
FPS.TextXAlignment = Enum.TextXAlignment.Left
FPS.BackgroundTransparency = 1
FPS.Parent = tanchuang
ts:Create(tanchuang,TweenInfo.new(0.5,Enum.EasingStyle.Back),{Position = UDim2.new(0.5,0,0.05,0)}):Play()
task.wait(0.5)
ts:Create(tanchuang,TweenInfo.new(1.5,Enum.EasingStyle.Elastic),{Size =UDim2.new(0.6,0,0.05,0)}):Play()





--帧率
local RunService = game:GetService("RunService")

-- 帧率统计配置
local frameCount = 0
local fps = 0
local lastTime = os.clock()
local sampleInterval = Fpstime -- 采样间隔(秒)

local function advancedFPSMonitor()
	frameCount = frameCount + 1

	local currentTime = os.clock()
	local elapsedTime = currentTime - lastTime

	if elapsedTime >= sampleInterval then
		fps = frameCount / elapsedTime


		-- 输出详细的帧率统计
		FPS.Text = (string.format("%.0f", fps))
		if fps > 30 then
			FPS.TextColor3 = Color3.new(0, 1, 0) -- 绿色
		elseif fps > 20 and fps > 10 then
			FPS.TextColor3 = Color3.new(1, 1, 0) -- 黄色
		else
			FPS.TextColor3 = Color3.new(1, 0, 0) -- 红色
		end
		frameCount = 0
		lastTime = currentTime
	end
end

-- 启动高级FPS监控
RunService.RenderStepped:Connect(advancedFPSMonitor)


local Health = Instance.new("TextLabel")
Health.Size = UDim2.new(0.2,0,1,0)
Health.Position = UDim2.new(0.3,0,-0.1,0)
Health.TextScaled = true
Health.Text = "  生命值:"
Health.TextColor3 = Color3.new(1, 1, 1)
Health.TextXAlignment = Enum.TextXAlignment.Left
Health.BackgroundTransparency = 1
Health.Parent = tanchuang

local Health = Instance.new("TextLabel")
Health.Size = UDim2.new(0.4,0,1,0)
Health.Position = UDim2.new(0.435,0,0,0)
Health.TextScaled = true
Health.Text = " Health"
Health.TextColor3 = Color3.new(1, 0, 0)
Health.TextXAlignment = Enum.TextXAlignment.Left
Health.BackgroundTransparency = 1
Health.Parent = tanchuang

local Healthtiao = Instance.new("Frame")
Healthtiao.Size = UDim2.new(0.2,0,0.15,0)
Healthtiao.Position = UDim2.new(0.29,0,0.85,0)
Healthtiao.BackgroundColor3 = Color3.new(1, 0, 0)
Healthtiao.BorderSizePixel = 0
Healthtiao.Parent = tanchuang

local yuanrun = Instance.new("UICorner")
yuanrun.CornerRadius = UDim.new(1,0)
yuanrun.Parent = Healthtiao



local ts = game:GetService("TweenService")
game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Health, false)
local timee = TweenInfo.new(0.5)

local player = game.Players.LocalPlayer
local Gui = Healthtiao
local textLabel = Health

local lastHealth = nil

-- 刷新血条显示（带文本丝滑动画）
local function refreshHealthBar(humanoid)
	local currentHealth = humanoid.Health
	local maxHealth = humanoid.MaxHealth

	-- 血条宽度动画
	local zzz = {
		Size = UDim2.new(currentHealth / maxHealth/3.2, 0, 0.15, 0)
	}
	local donhua = ts:Create(Gui, timee, zzz)
	donhua:Play()

	-- 文本丝滑动画
	if lastHealth == nil then
		lastHealth = currentHealth
	end

	local numberValue = Instance.new("NumberValue")
	numberValue.Value = lastHealth

	local tween = ts:Create(numberValue, timee, {Value = currentHealth})
	tween:Play()

	local function updateText()
		local value = numberValue.Value
		textLabel.Text = string.format(" %.0f%%",value/maxHealth*100)
	end

	numberValue:GetPropertyChangedSignal("Value"):Connect(updateText)
	tween.Completed:Connect(function()
		numberValue:Destroy()
		textLabel.Text = string.format(" %.0f%%",currentHealth/maxHealth*100)
		lastHealth = currentHealth
	end)
	updateText()
end

-- 绑定角色和血量事件
local function onCharacterAdded(character)
	local humanoid = character:WaitForChild("Humanoid")
	lastHealth = humanoid.Health
	refreshHealthBar(humanoid)
	humanoid.HealthChanged:Connect(function()
		refreshHealthBar(humanoid)
	end)
end

-- 首次加载时处理
if player.Character then
	onCharacterAdded(player.Character)
end

-- 玩家重生时处理
player.CharacterAdded:Connect(onCharacterAdded)

local Mod = Instance.new("ImageButton")
Mod.Image = "rbxassetid://85791515600637"
Mod.AnchorPoint= Vector2.new(0.5,0.5)
Mod.Parent =tanchuang
local daxiao = Instance.new("UIAspectRatioConstraint")
daxiao.Parent = Mod
Mod.Size = UDim2.new(1,0,1,0)
Mod.BackgroundTransparency = 1
Mod.Position = UDim2.new(0.95,0,0.5,0)

local main = Instance.new("Frame")
main.Size = UDim2.new(0.6,0,0.8,0)

main.Position = UDim2.new(0.2,0,-0.8,0)
main.BackgroundColor3 = Color3.new(0, 0, 0)
main.BackgroundTransparency = 0.6

main.Parent = game.Players.LocalPlayer.PlayerGui.Gui

local yuanrun = Instance.new("UICorner")
yuanrun.CornerRadius = UDim.new(0,20)
yuanrun.Parent = main

local close = Instance.new("ImageButton")
close.Image ="rbxassetid://98914161718128"
close.AnchorPoint = Vector2.new(0.5,0.5)
local daxiao = Instance.new("UIAspectRatioConstraint")
daxiao.Parent = close
close.Size = UDim2.new(0.05,0,0.05,0)
close.Position = UDim2.new(0.94,0,0.07,0)
close.BackgroundTransparency = 1
close.Parent = main

close.MouseButton1Click:Connect(function()
	ts:Create(main,TweenInfo.new(0.5,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Position = UDim2.new(0.2,0,-0.8,0)}):Play()ts:Create(close,TweenInfo.new(0.2,Enum.EasingStyle.Linear),{Size = UDim2.new(0.02,0,0.02,0)}):Play()
	task.wait(0.2)
	ts:Create(close,TweenInfo.new(0.5,Enum.EasingStyle.Bounce),{Size = UDim2.new(0.05,0,0.05,0)}):Play()
end)
Mod.MouseButton1Click:Connect(function()
	ts:Create(main,TweenInfo.new(0.5,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Position = UDim2.new(0.2,0,0.12,0)}):Play()ts:Create(Mod,TweenInfo.new(0.2,Enum.EasingStyle.Linear),{Size = UDim2.new(0.5,0,0.5,0)}):Play()
	task.wait(0.2)
	ts:Create(Mod,TweenInfo.new(0.5,Enum.EasingStyle.Bounce),{Size = UDim2.new(1,0,1,0)}):Play()
end)

local xiaoxi = Instance.new("Frame")
xiaoxi.BorderSizePixel = 0
xiaoxi.BackgroundColor3 = Color3.new(0,0,0)
xiaoxi.BackgroundTransparency = 0.7
xiaoxi.Size = UDim2.new(0.25,0,0.05,0)
xiaoxi.Position = UDim2.new(1,0,0.2,0)
local yuanrun = Instance.new("UICorner")
yuanrun.CornerRadius = UDim.new(1,0)
yuanrun.Parent = xiaoxi

local tupian = Instance.new("ImageLabel")
tupian.Size = UDim2.new(1.3,0,1.3,0)
tupian.Position = UDim2.new(-0.02,0,-0.1,0)
tupian.BackgroundTransparency = 1
local UI = Instance.new("UIAspectRatioConstraint")
UI.Parent = tupian
tupian.Image = "rbxassetid://4871684504"
tupian.Parent =xiaoxi

local text = Instance.new("TextLabel")
text.Size = UDim2.new(0.87,0,1,0)
text.Position = UDim2.new(0.13,0,0,0)
text.BackgroundTransparency = 1
text.TextScaled = true
text.TextXAlignment = Enum.TextXAlignment.Left
text.TextColor3 = Color3.new(1, 1, 1)
text.Parent = xiaoxi

local jingdu = Instance.new("Frame")
jingdu .AnchorPoint = Vector2.new(1,0)
jingdu.Size = UDim2.new(0.85,0,0.1,0)
jingdu.Position = UDim2.new(0.95,0,0.9,0)
jingdu .BorderSizePixel = 0
jingdu.Name = "jingdu"
jingdu.BackgroundColor3 = Color3.new(1, 1, 1)
jingdu.Parent = xiaoxi

local function tongzhi(Text,waittime,R,G,B,tupianid) 
	local b = true
	local xiaoxi = xiaoxi:Clone()
	local lie = #game.Players.LocalPlayer.PlayerGui.Gui:GetChildren() - liang
	xiaoxi.Parent = game.Players.LocalPlayer.PlayerGui.Gui
	xiaoxi.Position = UDim2.new(1,0,0.2+lie*0.06,0)
	if R == nil then
		R = 0
	end
	if G == nil then
		G = 0
	end	
	if B == nil then
		B = 0
	end


	if tupianid == nil then
		tupianid = 4871684504
	end
	xiaoxi.ImageLabel.Image = "rbxassetid://"..tupianid
	xiaoxi.BackgroundColor3 = Color3.new(R,G,B)
	ts:Create(xiaoxi,TweenInfo.new(0.5,Enum.EasingStyle.Sine),{Position = UDim2.new(0.75,0,0.2+lie*0.06,0)}):Play()
	xiaoxi.TextLabel.TextScaled = true
	xiaoxi.TextLabel.Text = Text
	game.Players.LocalPlayer.PlayerGui.Gui.ChildRemoved:Connect(function()
		if b == true then
			lie -= 1
			ts:Create(xiaoxi,TweenInfo.new(0.5,Enum.EasingStyle.Sine),{Position = UDim2.new(0.75,0,0.2+lie*0.06,0)}):Play()
		end	
	end)
	ts:Create(xiaoxi.jingdu,TweenInfo.new(waittime,Enum.EasingStyle.Linear),{Size = UDim2.new(0,0,0.1,0)}):Play()
	task.wait(waittime)
	b = false
	ts:Create(xiaoxi,TweenInfo.new(1,Enum.EasingStyle.Sine,Enum.EasingDirection.In),{Position = UDim2.new(1,0,0.2+lie*0.06,0)}):Play()
	task.wait(1)
	xiaoxi:Destroy()
end


local serverplayer = Instance.new("TextLabel")
serverplayer.Size = UDim2.new(0.35,0,1,0)
serverplayer.Position = UDim2.new(0.6,0,0,0)
serverplayer.TextScaled = true
serverplayer.Text = "  玩家人数:"
serverplayer.TextColor3 = Color3.new(1, 1, 1)
serverplayer.TextXAlignment = Enum.TextXAlignment.Left
serverplayer.BackgroundTransparency = 1
serverplayer.Parent = tanchuang

local a = #game.Players:GetChildren()
local serverplayer = Instance.new("TextLabel")
serverplayer.Size = UDim2.new(0.3,0,1,0)
serverplayer.Position = UDim2.new(0.79,0,0.05,0)
serverplayer.TextScaled = true
serverplayer.Text = a
serverplayer.TextColor3 = Color3.new(1, 1, 1)
serverplayer.TextXAlignment = Enum.TextXAlignment.Left
serverplayer.BackgroundTransparency = 1
serverplayer.Parent = tanchuang

game.Players.ChildAdded:Connect(function(a)
	a = #game.Players:GetChildren()
	serverplayer.Text = a
end)
game.Players.ChildRemoved:Connect(function(a)
	a = #game.Players:GetChildren()
	serverplayer.Text = a
end)

game.Players.ChildAdded:Connect(function(player)
	local waittime = 2
	local b = true
	local xiaoxi = xiaoxi:Clone()
	local lie = #game.Players.LocalPlayer.PlayerGui.Gui:GetChildren() - liang
	xiaoxi.Parent = game.Players.LocalPlayer.PlayerGui.Gui
	xiaoxi.Position = UDim2.new(1,0,0.2+lie*0.06,0)
	xiaoxi.BackgroundColor3 = Color3.new(0,0.5,0)
	ts:Create(xiaoxi,TweenInfo.new(0.5,Enum.EasingStyle.Sine),{Position = UDim2.new(0.75,0,0.2+lie*0.06,0)}):Play()
	xiaoxi.TextLabel.TextScaled = true
	xiaoxi.TextLabel.Text = "玩家 "..player.Name.." 进入游戏"
	game.Players.LocalPlayer.PlayerGui.Gui.ChildRemoved:Connect(function()
		if b == true then
			lie -= 1
			ts:Create(xiaoxi,TweenInfo.new(0.5,Enum.EasingStyle.Sine),{Position = UDim2.new(0.75,0,0.2+lie*0.06,0)}):Play()
		end	
	end)
	ts:Create(xiaoxi.jingdu,TweenInfo.new(waittime,Enum.EasingStyle.Linear),{Size = UDim2.new(0,0,0.1,0)}):Play()
	task.wait(waittime)
	b = false
	ts:Create(xiaoxi,TweenInfo.new(1,Enum.EasingStyle.Sine,Enum.EasingDirection.In),{Position = UDim2.new(1,0,0.2+lie*0.06,0)}):Play()
	task.wait(1)
	xiaoxi:Destroy()
end)
game.Players.ChildRemoved:Connect(function(player)
	local waittime = 2
	local b = true
	local xiaoxi = xiaoxi:Clone()
	local lie = #game.Players.LocalPlayer.PlayerGui.Gui:GetChildren() - liang
	xiaoxi.Parent = game.Players.LocalPlayer.PlayerGui.Gui
	xiaoxi.Position = UDim2.new(1,0,0.2+lie*0.06,0)
	xiaoxi.BackgroundColor3 = Color3.new(0.5,0,0)
	ts:Create(xiaoxi,TweenInfo.new(0.5,Enum.EasingStyle.Sine),{Position = UDim2.new(0.75,0,0.2+lie*0.06,0)}):Play()
	xiaoxi.TextLabel.TextScaled = true
	xiaoxi.TextLabel.Text = "玩家 "..player.Name.." 退出了游戏"
	game.Players.LocalPlayer.PlayerGui.Gui.ChildRemoved:Connect(function()
		if b == true then
			lie -= 1
			ts:Create(xiaoxi,TweenInfo.new(0.5,Enum.EasingStyle.Sine),{Position = UDim2.new(0.75,0,0.2+lie*0.06,0)}):Play()
		end	
	end)
	ts:Create(xiaoxi.jingdu,TweenInfo.new(waittime,Enum.EasingStyle.Linear),{Size = UDim2.new(0,0,0.1,0)}):Play()
	task.wait(waittime)
	b = false
	ts:Create(xiaoxi,TweenInfo.new(1,Enum.EasingStyle.Sine,Enum.EasingDirection.In),{Position = UDim2.new(1,0,0.2+lie*0.06,0)}):Play()
	task.wait(1)
	xiaoxi:Destroy()
end)

player.CharacterAdded:Connect(function(character)
	local humanoid = character:WaitForChild("Humanoid")
	humanoid.Died:Connect(function()
		tongzhi("你的角色已经死亡,正在等待重生",2,1,0,0,98032237150628)
	end)
end)

player.CharacterAdded:Connect(function()
	tongzhi("你的角色已经重生",2,0,1,0)
end)

local liebiao = Instance.new("Frame")
liebiao.Size = UDim2.new(0.26,0,0.02,0)
liebiao.Position = UDim2.new(0.755,0,0.175,0)
liebiao.BackgroundTransparency = 1
liebiao.Parent = game.Players.LocalPlayer.PlayerGui.Gui
local tupian = Instance.new("ImageLabel")
tupian.Size = UDim2.new(1,0,1,0)
tupian.ImageTransparency = 0
tupian.BackgroundTransparency = 1
tupian.ImageTransparency = 1
local daxiao = Instance.new("UIAspectRatioConstraint")
daxiao.Parent = tupian
tupian.Image = "rbxassetid://5946093983"
tupian.Parent =liebiao

local tupian2 = Instance.new("ImageLabel")
tupian2.Size = UDim2.new(1,0,1,0)
tupian2.Position = UDim2.new(0.9,0,0,0)
tupian2.ImageTransparency = 0
tupian2.BackgroundTransparency = 1
tupian2.ImageTransparency = 1
local daxiao = Instance.new("UIAspectRatioConstraint")
daxiao.Parent = tupian2
tupian2.Image = "rbxassetid://5946093983"
tupian2.Parent =liebiao

local zhuangshi = Instance.new("Frame")
zhuangshi.Size = UDim2.new(0.85,0,0.1,0)
zhuangshi.Position = UDim2.new(0.05,0,0.5,0)
zhuangshi.BackgroundTransparency = 1
zhuangshi.BorderSizePixel = 0
zhuangshi.Parent = liebiao

local zi = Instance.new("TextLabel")
zi.Size = UDim2.new(0.5,0,2,0)
zi.Position = UDim2.new(0.22,0,-1.5,0)
zi.BackgroundTransparency = 1
zi.TextTransparency = 1
zi.TextScaled = true
zi.Text = "通知"
zi.TextColor3 = Color3.new(0.5,0.5,0.5)
zi.TextStrokeTransparency = 1
zi.Parent = liebiao

game.Players.LocalPlayer.PlayerGui.Gui.ChildAdded:Connect(function()
	local a = #game.Players.LocalPlayer.PlayerGui.Gui:GetChildren() - liang
	if a > 0 then
		ts:Create(tupian,TweenInfo.new(guanbi_time,Enum.EasingStyle.Sine),{ ImageTransparency = 0}):Play()
		ts:Create(tupian2,TweenInfo.new(guanbi_time,Enum.EasingStyle.Sine),{ ImageTransparency = 0}):Play()
		ts:Create(zi,TweenInfo.new(guanbi_time,Enum.EasingStyle.Sine),{ TextTransparency = 0}):Play()
		ts:Create(zhuangshi,TweenInfo.new(guanbi_time,Enum.EasingStyle.Sine),{ BackgroundTransparency = 0}):Play()
	end
end)
game.Players.LocalPlayer.PlayerGui.Gui.ChildRemoved:Connect(function()
	local a = #game.Players.LocalPlayer.PlayerGui.Gui:GetChildren() - liang
	if a <= 0 then
		ts:Create(tupian,TweenInfo.new(guanbi_time,Enum.EasingStyle.Sine),{ ImageTransparency = 1}):Play()
		ts:Create(tupian2,TweenInfo.new(guanbi_time,Enum.EasingStyle.Sine),{ ImageTransparency = 1}):Play()
		ts:Create(zi,TweenInfo.new(guanbi_time,Enum.EasingStyle.Sine),{ TextTransparency = 1}):Play()
		ts:Create(zhuangshi,TweenInfo.new(guanbi_time,Enum.EasingStyle.Sine),{ BackgroundTransparency = 1}):Play()
	end
end)
