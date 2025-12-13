local ts = game:GetService("TweenService") 
local Player = game:GetService("Players").LocalPlayer

------参数设置------
local banbeng = "V3.00" --版本号
local chuangzaoshijian = "北京时间-2025/12/13-星期五-2:21:36" --制作时间
local shangcigengxingshijian = "北京时间-2025/12/13-星期五-2:21:36" --上次更新时间
-------------------

local Open = false
local fangda = false
local button_guanbi_nengque = true

--Gui--

local Gui = Instance.new("ScreenGui")
Gui.ResetOnSpawn = false
Gui.Name = "Lingdongdao_v3"
Gui.Parent = Player.PlayerGui
Gui.IgnoreGuiInset = true

local lingdongdao = Instance.new("Frame")
lingdongdao.ClipsDescendants = true
lingdongdao.Name = "Lingdongdao"
lingdongdao.AnchorPoint = Vector2.new(0.5,0.5)
lingdongdao.Size = UDim2.new(0,43,0,43)
lingdongdao.Position = UDim2.new(0.5,0,0,-22)
lingdongdao.BorderSizePixel = 0
lingdongdao.BackgroundColor3 = Color3.fromRGB(0,0,0)
lingdongdao.BackgroundTransparency = 0.5
lingdongdao.Parent = Gui
local yuanrun = Instance.new("UICorner")
yuanrun.CornerRadius = UDim.new(1,0)
yuanrun.Parent = lingdongdao

local Menu = Instance.new("ImageButton")
Menu.Position = UDim2.new(0,20,0,21.5)
Menu.AnchorPoint = Vector2.new(0.5,0.5)
Menu.Name = "Menu"
Menu.Size = UDim2.new(0,40,1,0)
Menu.BackgroundTransparency = 1
Menu.Image = "rbxassetid://105466965551651"
local As = Instance.new("UIAspectRatioConstraint")
As.Parent = Menu
local UIs = Instance.new("UIStroke")
UIs.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIs.Transparency = 0.6
UIs.Thickness = 0
UIs.Color = Color3.new(1,1,1)
UIs.Parent = Menu
local yuanrun = Instance.new("UICorner")
yuanrun.CornerRadius = UDim.new(1,0)
yuanrun.Parent = Menu
Menu.Parent = lingdongdao

task.wait(2)
ts:Create(lingdongdao,TweenInfo.new(0.5,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Position = UDim2.new(0.5,0,0,33)}):Play()

--Fps--
local Fps = Instance.new("TextLabel")
Fps.Name = "Fps"
Fps.Text = "FPS:-1"
Fps.TextColor3 = Color3.new(1, 0, 0)
Fps.AnchorPoint = Vector2.new(0,0.5)
--帧率
local RunService = game:GetService("RunService")

-- 帧率统计配置
local frameCount = 0
local fps = 0
local lastTime = os.clock()
local sampleInterval = 0.5 -- 采样间隔(秒)

local function advancedFPSMonitor()
	frameCount = frameCount + 1

	local currentTime = os.clock()
	local elapsedTime = currentTime - lastTime

	if elapsedTime >= sampleInterval then
		fps = frameCount / elapsedTime


		-- 输出详细的帧率统计
		Fps.Text = (string.format("FPS:%.0f", fps))
		if fps > 30 then
			Fps.TextColor3 = Color3.new(0, 1, 0) -- 绿色
		elseif fps < 30 and fps > 20 then
			Fps.TextColor3 = Color3.new(1, 1, 0) -- 黄色
		elseif fps < 20 and fps > 10 then
			Fps.TextColor3 = Color3.new(1, 0.607843, 0.235294) -- 红色 then
		else
			Fps.TextColor3 = Color3.new(1, 0, 0) 
		end
		frameCount = 0
		lastTime = currentTime
	end
end

-- 启动高级FPS监控
RunService.RenderStepped:Connect(advancedFPSMonitor)

Fps.Size = UDim2.new(0,155,1,0)
Fps.Position = UDim2.new(0,10,0.5,0)
Fps.BackgroundTransparency = 1
Fps.TextScaled = true
Fps.TextXAlignment = Enum.TextXAlignment.Left
Fps.Parent = lingdongdao

ts:Create(Fps,TweenInfo.new(0.3),{Position = UDim2.new(0,Menu.Size.X.Offset+10,0.5,0)}):Play()
ts:Create(lingdongdao,TweenInfo.new(0.5),{Size = UDim2.new(0,Menu.Size.X.Offset+10+Fps.TextBounds.X+10,0,43)}):Play()

---生命值---


local Health = Instance.new("TextLabel")
Health.Size = UDim2.new(0,220,1,0)
Health.TextXAlignment = Enum.TextXAlignment.Left
Health.Text = "!等待角色生成!"
Health.TextColor3 = Color3.new(1,0,0)
Health.Position = UDim2.new(0,Fps.TextBounds.X,0,0,45)
Health.BackgroundTransparency = 1
Health.TextScaled = true

local Healthtiao = Instance.new("Frame")
Healthtiao.Name = "Healthtiao"
Healthtiao.BorderSizePixel = 0
Healthtiao.Size = UDim2.new(0,0,0.12,0)
local yuanrun = Instance.new("UICorner")
yuanrun.Parent = Healthtiao
yuanrun.CornerRadius = UDim.new(1,0)

Healthtiao.Position = UDim2.new(0,0,0.9,2)
Healthtiao.Parent = Health

local timee = TweenInfo.new(0.5)

local player = game.Players.LocalPlayer
local Gui1 = Healthtiao
local textLabel = Health

local lastHealth = nil
-- 刷新血条显示（带文本丝滑动画）
local function refreshHealthBar(humanoid)
	local currentHealth = humanoid.Health
	local maxHealth = humanoid.MaxHealth

	-- 血条宽度动画
	local zzz = {
		Size = UDim2.new(currentHealth / maxHealth/1.1, 0, 0.12, 0),
		BackgroundColor3 = Color3.new(maxHealth/maxHealth-currentHealth/maxHealth,currentHealth/maxHealth,0)
	}
	ts:Create(Gui1, timee, zzz):Play()ts:Create(textLabel,timee,{TextColor3 = Color3.new(maxHealth/maxHealth-currentHealth/maxHealth,currentHealth/maxHealth,0)}):Play()

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
		textLabel.Text = string.format("生命值:%.0f%%",value/maxHealth*100)
	end

	numberValue:GetPropertyChangedSignal("Value"):Connect(updateText)
	tween.Completed:Connect(function()
		numberValue:Destroy()
		textLabel.Text = string.format("生命值:%.0f%%",currentHealth/maxHealth*100)
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


Health.Parent = lingdongdao


local Server_Player_math = Instance.new("TextLabel")
Server_Player_math.Size = UDim2.new(0,500,1,0)
Server_Player_math.Position = UDim2.new(0,Menu.Size.X.Offset+10+Fps.TextBounds.X+15+Health.TextBounds.X+15,0,-2)
Server_Player_math.TextXAlignment = Enum.TextXAlignment.Left
Server_Player_math.Parent = lingdongdao
Server_Player_math.BackgroundTransparency = 1
Server_Player_math.TextScaled = true
Server_Player_math.TextColor3 = Color3.new(1,1,1)
ts:Create(Health,TweenInfo.new(0.5),{Position = UDim2.new(0,Menu.Size.X.Offset+10+Fps.TextBounds.X+10+10,0,-2)}):Play()
ts:Create(lingdongdao,TweenInfo.new(0.5),{Size = UDim2.new(0,Menu.Size.X.Offset+10+Fps.TextBounds.X+20+Health.TextBounds.X+20,0,43)}):Play()
local Server_Player_jindutiao = Instance.new("Frame")
Server_Player_jindutiao.BorderSizePixel = 0
Server_Player_jindutiao.BackgroundColor3 = Color3.new(0.5,0.5,0.5)
Server_Player_jindutiao.Parent = Server_Player_math
Server_Player_jindutiao.Position = UDim2.new(0,0,-0.12,46)
local yuanrun = Instance.new("UICorner")
yuanrun.CornerRadius = UDim.new(1,0)
yuanrun.Parent = Server_Player_jindutiao
Server_Player_jindutiao.ClipsDescendants = true

local Server_Player_jingdutiao_nei = Instance.new("Frame")
Server_Player_jingdutiao_nei.BorderSizePixel = 0
Server_Player_jingdutiao_nei.BackgroundColor3 = Color3.new(1,1,1)
Server_Player_jingdutiao_nei.Size = UDim2.new(0,0,1,0)
Server_Player_jingdutiao_nei.Parent = Server_Player_jindutiao
local yuanrun = Instance.new("UICorner")
yuanrun.CornerRadius = UDim.new(1,0)
yuanrun.Parent = Server_Player_jingdutiao_nei
Server_Player_math.Text = "服务器玩家: "..#game.Players:GetChildren().."/"..game.Players.MaxPlayers
Server_Player_jindutiao.Size = UDim2.new(0,Server_Player_math.TextBounds.X,0.12,0)
ts:Create(Server_Player_jingdutiao_nei,TweenInfo.new(0.3),{Size = UDim2.new(#game.Players:GetChildren()/game.Players.MaxPlayers,0,1,0)}):Play()
game.Players.ChildAdded:Connect(function()
	Server_Player_math.Text = "服务器玩家: "..#game.Players:GetChildren().."/"..game.Players.MaxPlayers
	ts:Create(Server_Player_jindutiao,TweenInfo.new(0.3),{Size = UDim2.new(0,Server_Player_math.TextBounds.X,0.12,0)}):Play()
	ts:Create(Server_Player_jingdutiao_nei,TweenInfo.new(0.3),{Size = UDim2.new(#game.Players:GetChildren()/game.Players.MaxPlayers,0,1,0)}):Play()
end)
game.Players.ChildRemoved:Connect(function()
	Server_Player_math.Text = "服务器玩家: "..#game.Players:GetChildren().."/"..game.Players.MaxPlayers
	ts:Create(Server_Player_jindutiao,TweenInfo.new(0.3),{Size = UDim2.new(0,Server_Player_math.TextBounds.X,0.12,0)}):Play()
	ts:Create(Server_Player_jingdutiao_nei,TweenInfo.new(0.3),{Size = UDim2.new(#game.Players:GetChildren()/game.Players.MaxPlayers,0,1,0)}):Play()
end)

--Main--
local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Size = UDim2.new(0.6,0,0.6,0)
Main.AnchorPoint = Vector2.new(0.5,0.5)
Main.Position = UDim2.new(0.5,0,0.5,0)
Main.BorderSizePixel = 0
Main.BackgroundColor3 = Color3.new(0.105882, 0.105882, 0.105882)
local Main_yuanrun = Instance.new("UICorner")
Main_yuanrun.CornerRadius = UDim.new(0.07,0)
Main_yuanrun.Parent = Main
Main.Parent = Gui


--轮廓--
local Main_Zhu = Instance.new("Frame")
Main_Zhu.AnchorPoint = Vector2.new(0,0.5)
Main_Zhu.Size = UDim2.new(0,Main.AbsoluteSize.X*0.7,0,Main.AbsoluteSize.Y*0.98)
Main_Zhu.BorderSizePixel = 0
local yuanrun = Instance.new("UICorner")
yuanrun.CornerRadius = UDim.new(0.07,0)
yuanrun.Parent = Main_Zhu
Main_Zhu.Position = UDim2.new(0,Main.AbsoluteSize.X-Main_Zhu.AbsoluteSize.X,0.5,0)
Main_Zhu.BackgroundColor3 = Color3.new(0.129412, 0.129412, 0.129412)
Main_Zhu.Parent = Main
local Main_Zhu_X = Main_Zhu.Position.X.Offset
local	 Main_Zhu_Y = ((Main.AbsoluteSize.Y-Main_Zhu.AbsoluteSize.Y)/2)
Main_Zhu.Size = UDim2.new(0,Main.AbsoluteSize.X-Main_Zhu_X-Main_Zhu_Y,0,Main.AbsoluteSize.Y*0.98)
Main.Changed:Connect(function(Name)
	if Name == "Size" then
		Main_Zhu.Size = UDim2.new(0,Main.AbsoluteSize.X-Main_Zhu_X-Main_Zhu_Y,0,Main.AbsoluteSize.Y*0.98)
	end
end)
Main.Size = UDim2.new(0.7,0,0.7,0)
local Main_X = Main.AbsolutePosition.X
Main.AnchorPoint = Vector2.new(0,0.5)
Main.Position = UDim2.new(0,Main_X,0.5,0)

local Main_gongneng = Instance.new("Frame")
local yuanrun = Instance.new("UICorner")
yuanrun.CornerRadius = UDim.new(1,0)
yuanrun.Parent = Main_gongneng
Main_gongneng.Position = UDim2.new(0.02,0,0.03,0)
Main_gongneng.Size = UDim2.new(0.04,0,0.05,0)
Main_gongneng.BackgroundColor3 = Color3.new(0.223529, 0.223529, 0.223529)
Main_gongneng.Parent = Main
local Main_gongneng_SizeX = Main_gongneng.AbsoluteSize.X
local Main_gongneng_SizeY = Main_gongneng.AbsoluteSize.Y
local Main_gongneng_X = Main_gongneng.AbsolutePosition.X - Main.AbsolutePosition.X
local Main_gongneng_Y = Main_gongneng.AbsolutePosition.Y - Main.AbsolutePosition.Y
Main_gongneng.Position = UDim2.new(0,Main_gongneng_X,0,Main_gongneng_Y) 
Main_gongneng.Size = UDim2.new(0,Main_gongneng_SizeX,0,Main_gongneng_SizeY)

local Main_button_guanbi = Instance.new("ImageButton")
Main_button_guanbi.Image = "rbxassetid://102326100327209"
Main_button_guanbi.Size = UDim2.new(1,0,1,0)
local UIss = Instance.new("UIStroke")
UIss.Thickness = 0
UIss.Color = Color3.new(1,1,1)
UIss.Parent = Main_button_guanbi
local yuanrun = Instance.new("UICorner")
yuanrun.CornerRadius = UDim.new(1,0)
yuanrun.Parent = Main_button_guanbi
local As = Instance.new("UIAspectRatioConstraint")
As.Parent = Main_button_guanbi
Main_button_guanbi.BackgroundColor3 = Color3.new(0.27451, 0.27451, 0.27451)
Main_button_guanbi.Parent = Main_gongneng

local Main_button_fangdasuoxiao = Instance.new("ImageButton")
Main_button_fangdasuoxiao.Image = "rbxassetid://126612755125842"
Main_button_fangdasuoxiao.Size = UDim2.new(1,0,1,0)
local UIsss = Instance.new("UIStroke")
UIsss.Thickness = 0
UIsss.Color	 = Color3.new(1,1,1)
UIsss.Parent = Main_button_fangdasuoxiao
local yuanrun = Instance.new("UICorner")
yuanrun.CornerRadius = UDim.new(1,0)
yuanrun.Parent = Main_button_fangdasuoxiao
local As = Instance.new("UIAspectRatioConstraint")
As.Parent = Main_button_fangdasuoxiao
Main_button_fangdasuoxiao.BackgroundColor3 = Color3.new(0.27451, 0.27451, 0.27451)
Main_button_fangdasuoxiao.Parent = Main_gongneng

Main_button_guanbi.MouseEnter:Connect(function()
	ts:Create(UIss,TweenInfo.new(0.3),{Thickness = 1}):Play()
end)
Main_button_guanbi.MouseLeave:Connect(function()
	ts:Create(UIss,TweenInfo.new(0.3),{Thickness = 0}):Play()
end)

Main_button_fangdasuoxiao.MouseEnter:Connect(function()
	ts:Create(UIsss,TweenInfo.new(0.3),{Thickness = 1}):Play()
end)
Main_button_fangdasuoxiao.MouseLeave:Connect(function()
	ts:Create(UIsss,TweenInfo.new(0.3),{Thickness = 0}):Play()
end)

ts:Create(Main_button_fangdasuoxiao,TweenInfo.new(0.3),{Position = UDim2.new(0,Main_button_guanbi.AbsoluteSize.X+10,0,0)}):Play()
ts:Create(Main_gongneng,TweenInfo.new(0.3),{Size = UDim2.new(0,Main_button_guanbi.AbsoluteSize.X + 10 +Main_button_fangdasuoxiao.AbsoluteSize.X,0,Main_gongneng_SizeY)}):Play()

Main_button_guanbi.Changed:Connect(function(Name)
	if Name == "GuiState" then
		ts:Create(Main_button_fangdasuoxiao,TweenInfo.new(0.3),{Position = UDim2.new(0,Main_button_guanbi.AbsoluteSize.X+10,0,0)}):Play()
		ts:Create(Main_gongneng,TweenInfo.new(0.3),{Size = UDim2.new(0,Main_button_guanbi.AbsoluteSize.X + 10 +Main_button_fangdasuoxiao.AbsoluteSize.X,0,Main_gongneng_SizeY)}):Play()
	end
end)

Main_button_fangdasuoxiao.Changed:Connect(function(Name)
	if Name == "GuiState" then
		ts:Create(Main_button_fangdasuoxiao,TweenInfo.new(0.3),{Position = UDim2.new(0,Main_button_guanbi.AbsoluteSize.X+10,0,0)}):Play()
		ts:Create(Main_gongneng,TweenInfo.new(0.3),{Size = UDim2.new(0,Main_button_guanbi.AbsoluteSize.X + 10 +Main_button_fangdasuoxiao.AbsoluteSize.X,0,Main_gongneng_SizeY)}):Play()
	end
end)

Main_button_guanbi.MouseButton1Click:Connect(function()
	button_guanbi_nengque = false
	Open = false
	Main.AnchorPoint = Vector2.new(0.5,0.5)
	Main.Position = UDim2.new(0.5,0,0.5,0)
	ts:Create(Main,TweenInfo.new(0.5),{Size = UDim2.new(0,Main.AbsoluteSize.X-100,0,Main.AbsoluteSize.Y-100)}):Play()
	Main_gongneng.Visible = false
	ts:Create(Main,TweenInfo.new(0.5),{Transparency = 1}):Play()ts:Create(Main_Zhu,TweenInfo.new(0.5),{Transparency = 1}):Play()
	task.wait(0.5)
	Main.Visible = false
	button_guanbi_nengque = true
end)

Main.Visible = false
Main.AnchorPoint = Vector2.new(0.5,0.5)
Main.Position = UDim2.new(0.5,0,0.5,0)
ts:Create(Main,TweenInfo.new(0),{Size = UDim2.new(0,Main.AbsoluteSize.X-100,0,Main.AbsoluteSize.Y-100)}):Play()
Main_gongneng.Visible = false
ts:Create(Main,TweenInfo.new(0),{Transparency = 1}):Play()ts:Create(Main_Zhu,TweenInfo.new(0.5),{Transparency = 1}):Play()




Main_button_fangdasuoxiao.MouseButton1Click:Connect(function()
	if fangda == false then
		fangda = true
		Main_button_fangdasuoxiao.Image = "rbxassetid://139209941706973"
		Main.Position = UDim2.new(0.5,0,0.5,0)
		Main.AnchorPoint = Vector2.new(0.5,0.5)
		ts:Create(Main,TweenInfo.new(0.5),{Size = UDim2.new(1,0,1,0)}):Play()ts:Create(Main_yuanrun,TweenInfo.new(0.5),{CornerRadius = UDim.new(0,0)}):Play()
	elseif fangda == true then
		fangda = false
		Main_button_fangdasuoxiao.Image = "rbxassetid://126612755125842"
		Main.Position = UDim2.new(0,Main_X,0.5,0)
		Main.AnchorPoint = Vector2.new(0,0.5)
		ts:Create(Main,TweenInfo.new(0.5),{Size = UDim2.new(0.6,0,0.6,0)}):Play()ts:Create(Main_yuanrun,TweenInfo.new(0.5),{CornerRadius = UDim.new(0.07,0)}):Play()
		task.wait(0.5)
		Main.Position = UDim2.new(0,Main_X,0.5,0)
		Main.AnchorPoint = Vector2.new(0,0.5)
	end
end)





























--Meun按钮
Menu.MouseEnter:Connect(function()
	ts:Create(UIs,TweenInfo.new(0.5),{Thickness = 1}):Play()
end)
Menu.MouseLeave:Connect(function()
	ts:Create(UIs,TweenInfo.new(0.5),{Thickness = 0}):Play()
end)
Menu.MouseButton1Click:Connect(function()
	local Open_donghua = ts:Create(Menu,TweenInfo.new(2,Enum.EasingStyle.Back,Enum.EasingDirection.InOut),{Rotation = 360})
	Open_donghua:Play()	
	Open_donghua.Completed:Connect(function()
		Menu.Rotation = 0
	end)
    if button_guanbi_nengque then
	if Open == false  and fangda == false then
		Open = true
		Main.Visible = true
		Main.AnchorPoint = Vector2.new(0,0.5)
		Main.Position = UDim2.new(0,Main_X,0.5,0)
		ts:Create(Main,TweenInfo.new(0.5),{Size = UDim2.new(0,Main.AbsoluteSize.X+100,0,Main.AbsoluteSize.Y+100)}):Play()
		Main_gongneng.Visible = true
		ts:Create(Main,TweenInfo.new(0.5),{Transparency = 0}):Play()ts:Create(Main_Zhu,TweenInfo.new(0.5),{Transparency = 0}):Play()
		task.wait(0.5)
		end
		if Open == false and fangda == true then
			Open = true
			Main.Visible = true
			Main.AnchorPoint = Vector2.new(0.5,0.5)
			Main.Position = UDim2.new(0.5,0,0.5,0)
			ts:Create(Main,TweenInfo.new(0.5),{Size = UDim2.new(0,Main.AbsoluteSize.X+100,0,Main.AbsoluteSize.Y+100)}):Play()
			Main_gongneng.Visible = true
			ts:Create(Main,TweenInfo.new(0.5),{Transparency = 0}):Play()ts:Create(Main_Zhu,TweenInfo.new(0.5),{Transparency = 0}):Play()
			task.wait(0.5)
		end
	end
end)














Fps.Changed:Connect(function(a)
	if a == "Text" then
		ts:Create(Health,TweenInfo.new(0.5),{Position = UDim2.new(0,Menu.Size.X.Offset+10+Fps.TextBounds.X+10+5,0,-2)}):Play()
		ts:Create(lingdongdao,TweenInfo.new(0.5),{Size = UDim2.new(0,Menu.Size.X.Offset+10+Fps.TextBounds.X+15+Health.TextBounds.X+20+Server_Player_math.TextBounds.X+10,0,43)}):Play()
	end
end)
Health.Changed:Connect(function(a)
	if a == "Text" then
		ts:Create(Server_Player_math,TweenInfo.new(0.5),{Position = UDim2.new(0,Menu.Size.X.Offset+10+Fps.TextBounds.X+15+Health.TextBounds.X+15,0,-2)}):Play()
		ts:Create(lingdongdao,TweenInfo.new(0.5),{Size = UDim2.new(0,Menu.Size.X.Offset+10+Fps.TextBounds.X+15+Health.TextBounds.X+20+Server_Player_math.TextBounds.X+10,0,43)}):Play()
	end
end)
Server_Player_math.Changed:Connect(function(a)
	if a == "Text" then
		ts:Create(lingdongdao,TweenInfo.new(0.5),{Size = UDim2.new(0,Menu.Size.X.Offset+10+Fps.TextBounds.X+15+Health.TextBounds.X+20+Server_Player_math.TextBounds.X+10,0,43)}):Play()
	end
end)

