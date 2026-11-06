print("Horizon LC V2 converted by megumi-scripts")
local lplr = game:GetService("Players").LocalPlayer
local USERNAME = lplr and lplr.Name or script.Name
local Player = lplr
local CEvent = {FireServer = function() end}
local AssetObjects = game:GetObjects("rbxassetid://83019346970428")
local AssetRoot = AssetObjects and AssetObjects[1]
if AssetRoot then AssetRoot.Parent = workspace end
task.wait(0.1)

local function HasVisualParts(candidate)
    if not candidate then return false end
    for _, name in ipairs({"Head", "Torso", "Right Arm", "Left Arm", "Right Leg", "Left Leg", "Effects"}) do
        if not candidate:FindFirstChild(name) then return false end
    end
    return true
end


local function FindHLCV2Assets(root)
    if not root then return nil end
    if HasVisualParts(root) then return root end
    for _, item in ipairs(root:GetDescendants()) do
        if HasVisualParts(item) then
            return item
        end
    end
    return nil
end

local mainModule = workspace:FindFirstChild("MainModule")
local Saved = FindHLCV2Assets(mainModule)
if not Saved then Saved = FindHLCV2Assets(AssetRoot) end

if not Saved then
    warn("Horizon LC: visual asset container not found. Expected direct children: Head, Torso, Right Arm, Left Arm, Right Leg, Left Leg, Effects.")
    if AssetRoot then
        warn("Horizon LC: loaded asset root is " .. AssetRoot:GetFullName() .. " (" .. AssetRoot.ClassName .. ")")
        for _, child in ipairs(AssetRoot:GetChildren()) do
            warn("Horizon LC asset root child: " .. child.Name .. " [" .. child.ClassName .. "]")
        end
    end
    return
end

function Get(Class)
	return game:GetService(Class)
end

function RandomMath()
	return tostring(math.random(0,1000000000))..tostring(math.random(0,1000000000))
end

function SN(f,...)
	if type(f) ~= "function" then return end

	local args = {...}

	task.spawn(function()
		for i = 1,80 do
			task.wait()
		end

		pcall(f,table.unpack(args))
	end)
end

function Stall(Function,...)
	if type(Function) ~= "function" then return end

	local args = {...}

	pcall(function()
		task.desynchronize()
		task.synchronize()
		Function(table.unpack(args))
	end)
end

local defer = function(f,...)
	if type(f) ~= "function" then return end

	local args = {...}

	task.defer(function()
		pcall(f,table.unpack(args))
	end)
end

local lplr2 = lplr

local MAX = 2048

local function CloneSaved(name)
    local obj = Saved and Saved:FindFirstChild(name)
    if not obj then
        warn("Horizon LC: missing local visual asset " .. tostring(name))
        return nil
    end
    local clone = obj:Clone()
    clone.Name = RandomMath()
    clone.Parent = Get("Workspace")
    return clone
end

local Head = CloneSaved("Head")
local Torso = CloneSaved("Torso")
local RightArm = CloneSaved("Right Arm")
local LeftArm = CloneSaved("Left Arm")
local RightLeg = CloneSaved("Right Leg")
local LeftLeg = CloneSaved("Left Leg")
local LeftEye = CloneSaved("LeftEye")
local RightEye = CloneSaved("RightEye")
local Hat = CloneSaved("Hat")
local Hair = CloneSaved("Hair")
local Scarf = CloneSaved("Scarf")
local HeadOutline = CloneSaved("HO")
local TorsoOutline = CloneSaved("TO")
local LeftArmOutline = CloneSaved("LAO")
local RightArmOutline = CloneSaved("RAO")
local LeftLegOutline = CloneSaved("LLO")
local RightLegOutline = CloneSaved("RLO")
local HairOutline = CloneSaved("HO2")
local HatOutline = CloneSaved("HO3")
local GunBase = CloneSaved("GunBase")
local GunAdditions = CloneSaved("GunAdditions")
local NeonParts = CloneSaved("NeonParts")
local GunBaseOutline = CloneSaved("GO")
local Effects = CloneSaved("Effects")

local Holder =  Instance.new("SkateboardPlatform",game)
Holder.CastShadow = false
Holder.Color = Color3.fromRGB(0,0,0)
Holder.Material = "Fabric"
Holder.Name = RandomMath()
Holder.Archivable = false
Holder.Locked = true
Holder.Size = Vector3.new(0,0,0)
Holder.CanCollide = false
Holder.CanQuery = false
Holder.CanTouch = false
Holder.CollisionGroup = "None"
Holder.Anchored = true

local Shield = Instance.new("Part")
Shield.Material = Enum.Material.ForceField
Shield.Transparency = 1
Shield.Archivable = false
Shield.Locked = true
Shield.Name = RandomMath()
Shield.Parent = Effects
Shield.Size = Vector3.new(32, 128, 64)
Shield.CanCollide = false
Shield.CanTouch = false
Shield.CanQuery = false
Shield.Anchored = true
Shield.Massless = true
Shield.Shape = "Ball"

local Character = {
	Head,
	Torso,
	RightArm,
	LeftArm,
	RightLeg,
	LeftLeg,
	LeftEye,
	RightEye,
	Hair,
	Hat,
	Scarf,
	GunBase,
	GunAdditions,
	NeonParts,
	HeadOutline,
	TorsoOutline,
	LeftArmOutline,
	RightArmOutline,
	LeftLegOutline,
	RightLegOutline,
	HairOutline,
	HatOutline,
	GunBaseOutline,
	Holder
}

local MainColor = Color3.fromRGB(0, 0, 0)
local MainCam = Get("Workspace"):FindFirstChildOfClass("Camera")
local CurCam = Get("Workspace").CurrentCamera

local Fixing = false
local StillFixing = false


local LMouse = lplr:GetMouse()

local Mouse = {}

local KeyDown =  Instance.new("BindableEvent",nil)
local KeyUp =  Instance.new("BindableEvent",nil)
local MouseButton1Down =  Instance.new("BindableEvent",nil)
local MouseButton1Up =  Instance.new("BindableEvent",nil)
Mouse.KeyDown = KeyDown.Event
Mouse.KeyUp = KeyUp.Event
Mouse.Button1Down = MouseButton1Down.Event
Mouse.Button1Up = MouseButton1Up.Event

local UserInputService = game:GetService("UserInputService")


local KeyCodeToLegacy = {
    One = "1", Two = "2", Three = "3", Four = "4", Five = "5",
    Six = "6", Seven = "7", Eight = "8", Nine = "9", Zero = "0",
    Space = " ", Period = ".", Comma = ",", Semicolon = ";",
    Quote = "'", Minus = "-", Equals = "=", LeftBracket = "[",
    RightBracket = "]", Slash = "/", BackSlash = "\\",
    Backquote = "`",
}

local HeldKeys = {}
local function LegacyKey(input)
    local name = input.KeyCode.Name
    return KeyCodeToLegacy[name] or (name:match("^[A-Z]$") and name:lower()) or nil
end

local function RefreshKeyHold()
    KeyHold = next(HeldKeys) ~= nil
end

UserInputService.InputBegan:Connect(function(input, processed)
    if UserInputService:GetFocusedTextBox() then return end

    if input.UserInputType == Enum.UserInputType.Keyboard then
        local key = LegacyKey(input)
        if key then
            HeldKeys[key] = true
            RefreshKeyHold()
            KeyDown:Fire(key)
        end
    elseif input.UserInputType == Enum.UserInputType.MouseButton1 then
        MouseButton1Down:Fire()
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Keyboard then
        local key = LegacyKey(input)
        if key then
            HeldKeys[key] = nil
            RefreshKeyHold()
            KeyUp:Fire(key)
        end
    elseif input.UserInputType == Enum.UserInputType.MouseButton1 then
        MouseButton1Up:Fire()
    end
end)

task.spawn(function()
    while script.Parent do
        Get("RunService").RenderStepped:Wait()
        local ok, hit, target = pcall(function()
            return LMouse.Hit, LMouse.Target
        end)
        if ok then
            Mouse.Hit = hit
            Mouse.Target = target
        end
    end
end)

ArtificialHB =  Instance.new("BindableEvent",nil)
ArtificialHB.Name = "ArtificialHB2"
frame = 1/60
tf = 0
allowframeloss = false
tossremainder = false
lastframe = tick()
ArtificialHB:Fire()
Get("RunService").Heartbeat:Connect(function(s, p)
	tf = tf + s
	if tf >= frame then
		if allowframeloss then
			ArtificialHB:Fire()
			lastframe = tick()
		else
			for i = 1, math.floor(tf / frame) do
				ArtificialHB:Fire()
			end
			lastframe = tick()
		end
		if tossremainder then
			tf = 0
		else
			tf = tf - frame * math.floor(tf / frame)
		end
	end
end)

function BaseWait(NUMBER)
	if NUMBER == 0 or NUMBER == nil then
		ArtificialHB.Event:wait()
	else
		for i = 1, NUMBER do
			ArtificialHB.Event:wait()
		end
	end
end
swait = BaseWait
Swait = BaseWait
ArtificialHB.Event:Connect(function()
	if Swait ~= BaseWait then
		Swait = BaseWait
	end
	if swait ~= BaseWait then
		swait = BaseWait
	end
end)

function EWait(num)
	local num = num or 0
	local t = os.clock()
	repeat
		game:GetService("RunService").RenderStepped:Wait()
	until os.clock() - t >= num
end
function nthread(f)
	coroutine.wrap(f)()
end

--|| Camera & Movement ||--

local Welds = {HumanoidRootPart = {CFrame = CFrame.new(0, 0, 0)}}
local Mover = {
	CFrame = CFrame.new(0, 55, 0),
	PotentialCFrame = CFrame.new(0, 55, 0),
	KILL = false,
	HipHeight = 0,
	WalkSpeed = 8,
	Walking = false,
	Flying = false,
	Attack = false,
	Floor = nil,
	Jump = false,
	Fall = false,
	UseShield = false,
	Mode = "1st",
	MainSound = "rbxassetid://1842713324",
	PlaybackSpeed = .85,
	SpamRefit = false,
	KillType = "Void",
	Holstered = false,
	Sitting = false,
	UsingEffects = false,
	Texts = 0
}
local doe = 0


do
	local c = lplr and lplr.Character
	local r = c and c:FindFirstChild("HumanoidRootPart")
	if r then
		Mover.CFrame = r.CFrame
		Mover.PotentialCFrame = r.CFrame
	end
end

local CLASSES = {"WorldModel","Actor","Model"}

if lplr.Name == USERNAME then
	pcall(function()
		ClassCam =  Instance.new(CLASSES[math.random(1, #CLASSES)])
		ClassCam.Archivable = false
		ClassCam.Name = RandomMath()
		ClassCam.WorldPivot = ClassCam.WorldPivot:Lerp(Mover.CFrame, 1)
	end)
end

if lplr.Name == USERNAME then
    local camera = Get("Workspace").CurrentCamera
    local character = lplr.Character
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    camera.CameraType = Enum.CameraType.Custom
    if humanoid then
        camera.CameraSubject = humanoid
    end
end

--|| Music & Variables ||--

local TPos =  Instance.new("NumberValue",nil)
TPos.Archivable = false
TPos.Name = "TPOS"
TPos.Value = 0

local Sick =  Instance.new("Sound",Holder)
Sick.Archivable = false
Sick.Volume = 3
Sick.SoundId = Mover.MainSound
Sick.PlaybackSpeed = Mover.PlaybackSpeed
Sick.Playing = true
Sick.Name = RandomMath()
Sick.Looped = true
Sick.RollOffMaxDistance = 10000
Sick.RollOffMinDistance = 10
Sick.RollOffMode = "Inverse"
Sick.PlayOnRemove = false
Sick.TimePosition = TPos.Value

local Anim = "Idle"
local Sine = 0
local INF1 = 9999e9999
local NoneTable = {None = false}
local KeyHold = false
local Run = false
local CamDir = Vector3.new(0,0,0)
local RC0 = CFrame.new() * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(180))
local NC0 = CFrame.new(0,1,0) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(180))
local RSCP = CFrame.new(-.5,0,0) * CFrame.Angles(math.rad(0),math.rad(90),math.rad(0))
local LSCP = CFrame.new(.5,0,0) * CFrame.Angles(math.rad(0),math.rad(-90),math.rad(0))

Neck = {C0 = CFrame.new(0, 1, 0) * CFrame.Angles(math.rad(-90),math.rad(-180),math.rad(0)),C1 = CFrame.new(0, -0.5, 0) * CFrame.Angles(math.rad(90),math.rad(-180),math.rad(0))}
RootJoint = {C0 = CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(-90),math.rad(-180),math.rad(0)),C1 = CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(90),math.rad(-180),math.rad(0))}
RightShoulder = {C0 = CFrame.new(1, 0.5, 0) * CFrame.Angles(math.rad(0),math.rad(90),math.rad(0)),C1 = CFrame.new(-0.5, 0.5, 0) * CFrame.Angles(math.rad(0),math.rad(90),math.rad(0))}
LeftShoulder = {C0 = CFrame.new(-1, 0.5, 0) * CFrame.Angles(math.rad(0),math.rad(-90),math.rad(0)),C1 = CFrame.new(0.5, 0.5, 0) * CFrame.Angles(math.rad(0),math.rad(-90),math.rad(0))}
RightHip = {C0 = CFrame.new(1, -1, 0) * CFrame.Angles(math.rad(0),math.rad(90),math.rad(0)),C1 = CFrame.new(0.5, 1, 0) * CFrame.Angles(math.rad(0),math.rad(90),math.rad(0))}
LeftHip = {C0 = CFrame.new(-1, -1, 0) * CFrame.Angles(math.rad(0),math.rad(-90),math.rad(0)),C1 = CFrame.new(-0.5, 1, 0) * CFrame.Angles(math.rad(0),math.rad(-90),math.rad(0))}
LeftEyeJoint = {C0 = CFrame.new(-0.124, 0.15, -.38)*CFrame.Angles(0, math.rad(17.998), 0),C1 = CFrame.new()}
RightEyeJoint = {C0 = CFrame.new(0.124, 0.15, -.38)*CFrame.Angles(0, math.rad(-17.998), 0),C1 = CFrame.new()}
HairJoint = {C0 = CFrame.new(0,.45,-.0275)*CFrame.Angles(math.rad(0),math.rad(0),0),C1 = CFrame.new()}
HatJoint = {C0 = CFrame.new(0,.925,0),C1 = CFrame.new()}
ScarfJoint = {C0 = CFrame.new(0,.05,.15),C1 = CFrame.new()}
OutlineJoint = {C0 = CFrame.new(),C1 = CFrame.new()}
OutlineJoint2 = {C0 = CFrame.new(0.16, 0.025, 0.025),C1 = CFrame.new()}
OutlineJoint3 = {C0 = CFrame.new(0, -.001, 0),C1 = CFrame.new()}
BaseJoint = {C0 = CFrame.new(0, -2.328, -1.21),C1 = CFrame.new()}
AdditionsJoint = {C0 = CFrame.new(.002, .505, -1.203),C1 = CFrame.new()}
NeonsJoint = {C0 = CFrame.new(0.005, -1.26, -1.514),C1 = CFrame.new()}
GunJoint = {C0 = CFrame.new(0.05, -1, -0.15)*CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)),C1 = CFrame.new()}
GunJointBack = {C0 = CFrame.new(0, 0, 1.5) * CFrame.Angles(math.rad(0), math.rad(0),math.rad(0)), C1 = CFrame.new()}
GunHoleJoint = {C0 = CFrame.new(3.342, -1.538, -0.001),C1 = CFrame.new()}
GunHole2Joint = {C0 = CFrame.new(0, -8, -2),C1 = CFrame.new()}
HolderJoint = {C0 = CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),C1 = CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))}

function UpdateWeld(Weld,Part1,Part0)
    if not Weld or not Part1 or not Part0 then return end

    local localCharacter = lplr and lplr.Character
    local localHumanoid = localCharacter and localCharacter:FindFirstChildOfClass("Humanoid")
    if localHumanoid and localHumanoid.Health <= 0 then
        local gunWelds = {
            [GunJoint] = true,
            [GunJointBack] = true,
            [BaseJoint] = true,
            [AdditionsJoint] = true,
            [NeonsJoint] = true,
            [GunHoleJoint] = true,
            [GunHole2Joint] = true,
            [OutlineJoint3] = true,
        }
        if not gunWelds[Weld] then return end
    end

	if Weld == Neck and not Mover.Attack then
		Part1.CFrame = Part1.CFrame:Lerp(
			Part0.CFrame *
			(Weld.C0 *
			CFrame.Angles(0,0,-math.asin(CamDir.X)) *
			CFrame.Angles(-math.asin(CamDir.Y),0,0) *
			Weld.C1:Inverse()),1
		)
	else
		Part1.CFrame = Part1.CFrame:Lerp(
			Part0.CFrame * (Weld.C0 * Weld.C1:Inverse()),1
		)
	end
end

function Clerp(A,B,C)
	return A:Lerp(B,C < 1 and math.clamp(C*1,0,1) or 1)
end

function UpdateJoints()
	coroutine.resume(coroutine.create(function()
		UpdateWeld(RootJoint,Torso,Welds.HumanoidRootPart)
		UpdateWeld(Neck,Head,Torso)
		UpdateWeld(RightShoulder,RightArm,Torso)
		UpdateWeld(LeftShoulder,LeftArm,Torso)
		UpdateWeld(RightHip,RightLeg,Torso)
		UpdateWeld(LeftHip,LeftLeg,Torso)
		UpdateWeld(LeftEyeJoint,LeftEye,Head)
		UpdateWeld(RightEyeJoint,RightEye,Head)
		UpdateWeld(HairJoint,Hair,Head)
		UpdateWeld(HatJoint,Hat,Head)
		UpdateWeld(ScarfJoint,Scarf,Torso)
		UpdateWeld(OutlineJoint3, GunBaseOutline, GunBase)
		UpdateWeld(OutlineJoint,HeadOutline,Head)
		UpdateWeld(OutlineJoint,TorsoOutline,Torso)
		UpdateWeld(OutlineJoint,LeftArmOutline,LeftArm)
		UpdateWeld(OutlineJoint,RightArmOutline,RightArm)
		UpdateWeld(OutlineJoint,LeftLegOutline,LeftLeg)
		UpdateWeld(OutlineJoint,RightLegOutline,RightLeg)
		UpdateWeld(OutlineJoint2,HairOutline,Hair)
		UpdateWeld(OutlineJoint,HatOutline,Hat)
		if not Mover.Holstered then
			UpdateWeld(GunJoint, Joint, RightArm)
		else
			UpdateWeld(GunJointBack, Joint, Torso)
		end
		UpdateWeld(BaseJoint, GunBase, Joint)
		UpdateWeld(AdditionsJoint, GunAdditions, Joint)
		UpdateWeld(NeonsJoint, NeonParts, Joint)
		UpdateWeld(GunHoleJoint, Hole, Joint)
		UpdateWeld(GunHole2Joint, Holetwo, Joint)
		UpdateWeld(HolderJoint,Holder,Welds.HumanoidRootPart)
	end))
end

--|| Remote ||--

local Keys = {W = false,A = false,S = false,D = false,Q = false,E = false}
if lplr.Name == USERNAME then
	Mouse.KeyDown:Connect(function(Key_)
		local Key_ = string.upper(Key_)
		if Keys[Key_] ~= nil then
			Keys[Key_] = true
		else
			if Key_ == "F" then
				Mover.Flying = false
			end
		end
		CEvent:FireServer("Key",{Key = Key_,Down = true})
	end)
	Mouse.KeyUp:Connect(function(Key_)
		local Key_ = string.upper(Key_)
		if Keys[Key_] ~= nil then
			Keys[Key_] = false
		end
		CEvent:FireServer("Key",{Key = Key_,Down = false})
	end)
else
	Mover.Value =  Instance.new("CFrameValue",nil)
end

function RemYes(Event_)
	local EventConnection = Event_.OnClientEvent:Connect(function(Req,Val,_1,_2,_3,_4,_5)
		if Req == "Keys" then
			if Val.request == "KeyDown" then
				KeyDown:Fire(Val.Key)
			end
			if Val.request == "KeyUp" then
				KeyUp:Fire(Val.Key)
			end
			if Val.request == "MouseButton1Down" then
				MouseButton1Down:Fire()
			end
			if Val.request == "MouseButton1Up" then
				MouseButton1Up:Fire()
			end
		end
		if Req == "SetValues" then
			Mover.PotentialCFrame,Mover.Walking,Mover.Falling = Val.Mover.CFrame,Val.Mover.Walking,Val.Mover.Falling
			CamDir = Val.Mover.Head
			if lplr.Name ~= USERNAME then
				Mover.Attack = Val.Mover.Attack
				Mover.Fall = Val.Mover.Fall
				Mover.Jump = Val.Mover.Jump
				Mover.UseShield = Val.Mover.UseShield
				Mover.Mode = Val.Mover.Mode
				Mover.MainSound = Val.Mover.MainSound
				Mover.SpamRefit = Val.Mover.SpamRefit
				Mover.KillType = Val.Mover.KillType
				Mover.Holstered = Val.Mover.Holstered
				Mover.PlaybackSpeed = Val.Mover.PlaybackSpeed
				Mover.Sitting = Val.Mover.Sitting
				Mover.UsingEffects = Val.Mover.UsingEffects
			end
		end
		if Req == "Key" then
			if Keys[Val.Key] ~= nil and lplr.Name ~= USERNAME then
				Keys[Val.Key] = Val.Down
			end
		end
		if Req == "Mouse" then
			Mouse.Target = Val.Target
			Mouse.Hit = Val.Pos
		end
		if Req == "Void" then
			CEvent:FireServer("Void",Val)
		end
	end)
end



--|| Anti Property ||--

function SetPerms()
    pcall(function()
        if Effects and Effects.Parent then
            Effects.Archivable = true
        end
        if TPos and TPos.Parent then
            TPos.Name = "TPOS"
        end
        if Sick and Sick.Parent then
            Sick.Volume = 3
            Sick.SoundId = Mover.MainSound
            Sick.PlaybackSpeed = Mover.PlaybackSpeed
            Sick.Looped = true
            Sick.PlayOnRemove = false
            if not Sick.IsPlaying then Sick:Play() end
        end
    end)
end

UpdateWeld(RootJoint,Torso,Welds.HumanoidRootPart)
UpdateWeld(Neck,Head,Torso)
UpdateWeld(RightShoulder,RightArm,Torso)
UpdateWeld(LeftShoulder,LeftArm,Torso)
UpdateWeld(RightHip,RightLeg,Torso)
UpdateWeld(LeftHip,LeftLeg,Torso)
UpdateWeld(LeftEyeJoint,LeftEye,Head)
UpdateWeld(RightEyeJoint,RightEye,Head)
UpdateWeld(HairJoint,Hair,Head)
UpdateWeld(HatJoint,Hat,Head)
UpdateWeld(ScarfJoint,Scarf,Torso)
UpdateWeld(OutlineJoint,HeadOutline,Head)
UpdateWeld(OutlineJoint,TorsoOutline,Torso)
UpdateWeld(OutlineJoint,LeftArmOutline,LeftArm)
UpdateWeld(OutlineJoint,RightArmOutline,RightArm)
UpdateWeld(OutlineJoint,LeftLegOutline,LeftLeg)
UpdateWeld(OutlineJoint,RightLegOutline,RightLeg)
UpdateWeld(OutlineJoint2,HairOutline,Hair)
UpdateWeld(OutlineJoint,HatOutline,Hat)
if not Mover.Holstered then
	UpdateWeld(GunJoint, Joint, RightArm)
else
	UpdateWeld(GunJointBack, Joint, Torso)
end
UpdateWeld(BaseJoint, GunBase, Joint)
UpdateWeld(AdditionsJoint, GunAdditions, Joint)
UpdateWeld(NeonsJoint, NeonParts, Joint)
UpdateWeld(GunHoleJoint, Hole, Joint)
UpdateWeld(GunHole2Joint, Holetwo, Joint)
UpdateWeld(OutlineJoint3, GunBaseOutline, GunBase)
UpdateWeld(HolderJoint,Holder,Welds.HumanoidRootPart)

--|| Fixers ||--

function Fixer1()
	Fixing = true
	pcall(function()
		for i,v in ipairs(Character) do
			if v:IsA("BasePart") and not (v == Holder) then
				v:Destroy()
			end
		end
		ClassCam:Destroy()
		UpdateJoints()
		pcall(function()
			for i,v in ipairs(Character) do
				if v:IsA("BasePart") and v:FindFirstChildOfClass("PointLight") then
					local Light = v:FindFirstChildOfClass("PointLight")
					Light.Color = MainColor
				end
			end
			NeonParts.Color = MainColor
			HeadOutline.Color = MainColor
			TorsoOutline.Color = MainColor
			LeftArmOutline.Color = MainColor
			RightArmOutline.Color = MainColor
			LeftLegOutline.Color = MainColor
			RightLegOutline.Color = MainColor
			HairOutline.Color = MainColor
			HatOutline.Color = MainColor
			GunBaseOutline.Color = MainColor
			Scarf.Color = Color3.new(Sick.PlaybackLoudness/500,Sick.PlaybackLoudness/500,Sick.PlaybackLoudness/500)
			UpdateJoints()
		end)
	end)
	pcall(function()
		Torso = Saved["Torso"]:Clone()
		Torso.Name = RandomMath()
		UpdateWeld(RootJoint,Torso,Welds.HumanoidRootPart)
		Torso.Parent = Get("Workspace")
		
		Head = Saved["Head"]:Clone()
		Head.Name = RandomMath()
		UpdateWeld(Neck,Head,Torso)
		Head.Parent = Get("Workspace")

		RightArm = Saved["Right Arm"]:Clone()
		RightArm.Name = RandomMath()
		UpdateWeld(RightShoulder,RightArm,Torso)
		RightArm.Parent = Get("Workspace")

		LeftArm = Saved["Left Arm"]:Clone()
		LeftArm.Name = RandomMath()
		UpdateWeld(LeftShoulder,LeftArm,Torso)
		LeftArm.Parent = Get("Workspace")

		RightLeg = Saved["Right Leg"]:Clone()
		RightLeg.Name = RandomMath()
		UpdateWeld(RightHip,RightLeg,Torso)
		RightLeg.Parent = Get("Workspace")

		LeftLeg = Saved["Left Leg"]:Clone()
		LeftLeg.Name = RandomMath()
		UpdateWeld(LeftHip,LeftLeg,Torso)
		LeftLeg.Parent = Get("Workspace")
		
		LeftEye = Saved["LeftEye"]:Clone()
		LeftEye.Name = RandomMath()
		UpdateWeld(LeftEyeJoint,LeftEye,Head)
		LeftEye.Parent = Get("Workspace")

		RightEye = Saved["RightEye"]:Clone()
		RightEye.Name = RandomMath()
		UpdateWeld(RightEyeJoint,RightEye,Head)
		RightEye.Parent = Get("Workspace")
		
		Hat = Saved["Hat"]:Clone()
		Hat.Name = RandomMath()
		UpdateWeld(HatJoint,Hat,Head)
		Hat.Parent = Get("Workspace")
		
		Hair = Saved["Hair"]:Clone()
		Hair.Name = RandomMath()
		UpdateWeld(HairJoint,Hair,Head)
		Hair.Parent = Get("Workspace")
		
		Scarf = Saved["Scarf"]:Clone()
		Scarf.Name = RandomMath()
		UpdateWeld(ScarfJoint,Scarf,Torso)
		Scarf.Parent = Get("Workspace")
		
		HeadOutline = Saved["HO"]:Clone()
		HeadOutline.Name = RandomMath()
		UpdateWeld(OutlineJoint,HeadOutline,Head)
		HeadOutline.Parent = Get("Workspace")

		TorsoOutline = Saved["TO"]:Clone()
		TorsoOutline.Name = RandomMath()
		UpdateWeld(OutlineJoint,TorsoOutline,Torso)
		TorsoOutline.Parent = Get("Workspace")

		LeftArmOutline = Saved["LAO"]:Clone()
		LeftArmOutline.Name = RandomMath()
		UpdateWeld(OutlineJoint,LeftArmOutline,LeftArm)
		LeftArmOutline.Parent = Get("Workspace")

		RightArmOutline = Saved["RAO"]:Clone()
		RightArmOutline.Name = RandomMath()
		UpdateWeld(OutlineJoint,RightArmOutline,RightArm)
		RightArmOutline.Parent = Get("Workspace")

		LeftLegOutline = Saved["LLO"]:Clone()
		LeftLegOutline.Name = RandomMath()
		UpdateWeld(OutlineJoint,LeftLegOutline,LeftLeg)
		LeftLegOutline.Parent = Get("Workspace")

		RightLegOutline = Saved["RLO"]:Clone()
		RightLegOutline.Name = RandomMath()
		UpdateWeld(OutlineJoint,RightLegOutline,RightLeg)
		RightLegOutline.Parent = Get("Workspace")

		HairOutline = Saved["HO2"]:Clone()
		HairOutline.Name = RandomMath()
		UpdateWeld(OutlineJoint2,HairOutline,Hair)
		HairOutline.Parent = Get("Workspace")

		HatOutline = Saved["HO3"]:Clone()
		HatOutline.Name = RandomMath()
		UpdateWeld(OutlineJoint,HatOutline,Hat)
		HatOutline.Parent = Get("Workspace")
		
		GunBase = Saved["GunBase"]:Clone()
		GunBase.Name = RandomMath()
		if not Mover.Holstered then
			UpdateWeld(GunJoint, Joint, RightArm)
		else
			UpdateWeld(GunJointBack, Joint, Torso)
		end
		UpdateWeld(BaseJoint, GunBase, Joint)
		GunBase.Parent = Get("Workspace")
		
		GunAdditions = Saved["GunAdditions"]:Clone()
		GunAdditions.Name = RandomMath()
		UpdateWeld(AdditionsJoint, GunAdditions, Joint)
		GunAdditions.Parent = Get("Workspace")

		NeonParts = Saved["NeonParts"]:Clone()
		NeonParts.Name = RandomMath()
		UpdateWeld(NeonsJoint, NeonParts, Joint)
		NeonParts.Parent = Get("Workspace")
		
		GunBaseOutline = Saved["GO"]:Clone()
		GunBaseOutline.Name = RandomMath()
		UpdateWeld(OutlineJoint, GunBaseOutline, GunBase)
		GunBaseOutline.Parent = Get("Workspace")
		UpdateJoints()
	end)
	if lplr.Name == USERNAME then
		pcall(function()
			ClassCam =  Instance.new(CLASSES[math.random(1, #CLASSES)])
			ClassCam.Archivable = false
			ClassCam.Name = RandomMath()
			ClassCam.WorldPivot = Mover.CFrame
		end)
	end
	if lplr.Name == USERNAME then
		Get("Workspace").CurrentCamera.CameraSubject = (lplr.Character and lplr.Character:FindFirstChildOfClass("Humanoid")) or ClassCam
		Get("Workspace").CurrentCamera.CameraType = "Custom"
		Get("Workspace").CurrentCamera.HeadLocked = true
		Get("Workspace").CurrentCamera.HeadScale = 1
		Get("Workspace").CurrentCamera.Archivable = false
		task.spawn(function()
			task.wait()
			Get("Workspace").CurrentCamera.CameraSubject = (lplr.Character and lplr.Character:FindFirstChildOfClass("Humanoid")) or ClassCam
			Get("Workspace").CurrentCamera.CameraType = "Custom"
			Get("Workspace").CurrentCamera.HeadLocked = true
			Get("Workspace").CurrentCamera.HeadScale = 1
			Get("Workspace").CurrentCamera.Archivable = false
		end)
	end
	Character = {
		Torso,
		Head,
		RightArm,
		LeftArm,
		RightLeg,
		LeftLeg,
		LeftEye,
		RightEye,
		Hair,
		Hat,
		Scarf,
		GunBase,
		GunAdditions,
		NeonParts,
		HeadOutline,
		TorsoOutline,
		LeftArmOutline,
		RightArmOutline,
		LeftLegOutline,
		RightLegOutline,
		HairOutline,
		HatOutline,
		GunBaseOutline,
		Holder
	}
	UpdateJoints()
	pcall(function()
		for i,v in ipairs(Character) do
			if v:IsA("BasePart") and v:FindFirstChildOfClass("PointLight") then
				local Light = v:FindFirstChildOfClass("PointLight")
				Light.Color = MainColor
			end
		end
		NeonParts.Color = MainColor
		HeadOutline.Color = MainColor
		TorsoOutline.Color = MainColor
		LeftArmOutline.Color = MainColor
		RightArmOutline.Color = MainColor
		LeftLegOutline.Color = MainColor
		RightLegOutline.Color = MainColor
		HairOutline.Color = MainColor
		HatOutline.Color = MainColor
		GunBaseOutline.Color = MainColor
		Scarf.Color = Color3.new(Sick.PlaybackLoudness/1000,Sick.PlaybackLoudness/1000,Sick.PlaybackLoudness/1000)
		Stall(function()
			defer(function()
				coroutine.resume(coroutine.create(function()
					for i,v in ipairs(Character) do 
						if v:IsA("BasePart") and (v == Torso or v == Head or v == LeftArm or v == RightArm or v == LeftLeg or v == RightLeg or v == GunBase or v == GunAdditions or v == NeonParts) then
						if v.Parent ~= game:GetService("Workspace") then
								defer(function()
									pcall(function()
										v:Destroy()
										UpdateJoints()
									end)
									SN(Fixer1)
								end)
							end
							v:GetPropertyChangedSignal("CFrame"):Connect(function()
								wait(.2)
								if (v.Position - Mover.CFrame.Position).Magnitude >= 115 + v.Size.Magnitude then
									Stall(function()
										defer(function()
											pcall(function()
												for i,v in ipairs(Character) do
													if v:IsA("BasePart") and v ~= Holder and v ~= Hole and v ~= Holetwo then
														coroutine.resume(coroutine.create(function()
															v:Destroy()
														end))
													end
												end
												UpdateJoints()
											end)
											SN(Fixer1)
										end)
									end)
								end
							end)
						end
					end
					if Mover.SpamRefit then
						coroutine.resume(coroutine.create(function()
							for i,v in ipairs(Character) do
								if v:IsA("BasePart") then
									UpdateJoints()
									if not v or v.Parent ~= game:GetService("Workspace") or (v.Position - Mover.CFrame.Position).Magnitude >= 115 then
										pcall(function()
											v:Destroy()
											UpdateJoints()
										end)
										SN(Fixer1)
										UpdateJoints()
									end
								end
							end
						end))
					end
					--[[if not Head or Head.Parent ~= game:GetService("Workspace") or (Head.Position - Mover.CFrame.Position).Magnitude >= 115 then
						pcall(function()
							Head:Destroy()
							UpdateJoints()
						end)
						SN(Fixer1)
					end
					if not Torso or Torso.Parent ~= game:GetService("Workspace") or (Torso.Position - Mover.CFrame.Position).Magnitude >= 115 then
						pcall(function()
							Torso:Destroy()
							UpdateJoints()
						end)
						SN(Fixer1)
					end
					if not LeftArm or LeftArm.Parent ~= game:GetService("Workspace") or (LeftArm.Position - Mover.CFrame.Position).Magnitude >= 115 then
						pcall(function()
							LeftArm:Destroy()
							UpdateJoints()
						end)
						SN(Fixer1)
					end
					if not RightArm or RightArm.Parent ~= game:GetService("Workspace") or (RightArm.Position - Mover.CFrame.Position).Magnitude >= 115 then
						pcall(function()
							RightArm:Destroy()
							UpdateJoints()
						end)
						SN(Fixer1)
					end
					if not LeftLeg or LeftLeg.Parent ~= game:GetService("Workspace") or (LeftLeg.Position - Mover.CFrame.Position).Magnitude >= 115 then
						pcall(function()
							LeftLeg:Destroy()
							UpdateJoints()
						end)
						SN(Fixer1)
					end
					if not RightLeg or RightLeg.Parent ~= game:GetService("Workspace") or (RightLeg.Position - Mover.CFrame.Position).Magnitude >= 115 then
						pcall(function()
							RightLeg:Destroy()
							UpdateJoints()
						end)
						SN(Fixer1)
					end
					if not Hair or Hair.Parent ~= game:GetService("Workspace") or (Hair.Position - Mover.CFrame.Position).Magnitude >= 115 then
						pcall(function()
							Hair:Destroy()
							UpdateJoints()
						end)
						SN(Fixer1)
					end
					if not Hat or Hat.Parent ~= game:GetService("Workspace") or (Hat.Position - Mover.CFrame.Position).Magnitude >= 115 then
						pcall(function()
							Hat:Destroy()
							UpdateJoints()
						end)
						SN(Fixer1)
					end
					if not Scarf or Scarf.Parent ~= game:GetService("Workspace") or (Scarf.Position - Mover.CFrame.Position).Magnitude >= 115 then
						pcall(function()
							Scarf:Destroy()
							UpdateJoints()
						end)
						SN(Fixer1)
					end
					if not GunBase or GunBase.Parent ~= game:GetService("Workspace") then
						pcall(function()
							GunBase:Destroy()
							UpdateJoints()
						end)
						SN(Fixer1)
					end
					if not GunAdditions or GunAdditions.Parent ~= game:GetService("Workspace") then
						pcall(function()
							GunAdditions:Destroy()
							UpdateJoints()
						end)
						SN(Fixer1)
					end
					if not NeonParts or NeonParts.Parent ~= game:GetService("Workspace") then
						pcall(function()
							NeonParts:Destroy()
							UpdateJoints()
						end)
						SN(Fixer1)
					end
					if not LeftEye or LeftEye.Parent ~= game:GetService("Workspace") or (LeftEye.Position - Mover.CFrame.Position).Magnitude >= 115 then
						pcall(function()
							LeftEye:Destroy()
							UpdateJoints()
						end)
						SN(Fixer1)
					end
					if not RightEye or RightEye.Parent ~= game:GetService("Workspace") or (RightEye.Position - Mover.CFrame.Position).Magnitude >= 115 then
						pcall(function()
							RightEye:Destroy()
							UpdateJoints()
						end)
						SN(Fixer1)
					end--]]
					for i,v in ipairs(Character) do
						if v:IsA("BasePart") and v:IsDescendantOf(game:GetService("Workspace")) and v ~= Holder then
							pcall(function()
								v.Name = "Baseplate"
								UpdateJoints()
							end)
						end
					end
				end))
			end)
		end)
	end)
	Fixing = false
end

function ShieldFixer()
	pcall(function()
		Shield:Destroy()
	end)
	Shield = Instance.new("Part")
	Shield.Material = Enum.Material.ForceField
	Shield.Transparency = 1
	Shield.Archivable = false
	Shield.Locked = true
	Shield.Name = RandomMath()
	Shield.Size = Vector3.new(32, 128, 64)
	Shield.CanCollide = false
	Shield.CanTouch = false
	Shield.CanQuery = false
	Shield.Anchored = true
	Shield.Massless = true
	Shield.Shape = "Ball"
	Shield.Parent = Effects
end


function Fixer2()
	StillFixing = true
	pcall(function()
		TPos:Destroy()
		Sick:Destroy()
		Holder:Destroy()
		Effects:Destroy()
	end)
	pcall(function()
		Holder =  Instance.new("SkateboardPlatform",game)
		Holder.CastShadow = false
		Holder.Color = Color3.fromRGB(0,0,0)
		Holder.Material = "Fabric"
		Holder.Name = RandomMath()
		Holder.Archivable = false
		Holder.Locked = true
		Holder.Size = Vector3.new(0,0,0)
		Holder.CanCollide = false
		Holder.CanQuery = false
		Holder.CanTouch = false
		Holder.CollisionGroup = "None"
		Holder.Anchored = true

		TPos =  Instance.new("NumberValue",nil)
		TPos.Archivable = false
		TPos.Name = "TPOS"
		TPos.Value = Sick.TimePosition

		Sick =  Instance.new("Sound",Holder)
		Sick.Archivable = false
		Sick.Volume = 3
		Sick.SoundId = Mover.MainSound
		Sick.PlaybackSpeed = Mover.PlaybackSpeed
		Sick.Playing = true
		Sick.Name = RandomMath()
		Sick.Looped = true
		Sick.RollOffMaxDistance = 10000
		Sick.RollOffMinDistance = 10
		Sick.RollOffMode = "Inverse"
		Sick.PlayOnRemove = false
		Sick.TimePosition = TPos.Value

		Effects = Saved["Effects"]:Clone()
		Effects.Name = RandomMath()
		Effects.Parent = Get("Workspace")
	end)
	StillFixing = false
end

Get("Workspace").DescendantRemoving:Connect(function(v)
	if not StillFixing then
		game:GetService("RunService").PreRender:Wait()
		if v == Effects then
			Fixer2()
		end
	end
end)

game.DescendantRemoving:Connect(function(v)
	if not Fixing then
		task.wait()
		if v == Holder or v == Sick then
			Fixer2()
		elseif v == (Head or Torso or RightArm or LeftArm or RightLeg or LeftLeg or LeftEye or RightEye or Hair or Scarf or Hat or GunBase or GunAdditions or NeonParts or GunBaseOutline or HeadOutline or TorsoOutline or RightArmOutline or LeftArmOutline or LeftLegOutline or RightLegOutline or HairOutline or HatOutline) then
			Stall(function()
				defer(function()
					SN(Fixer1)
					UpdateJoints()
				end)
			end)
		end
	end
end)

function Fixer3()
	Fixing = true
	if lplr.Name == USERNAME then
		pcall(function()
			Get("Workspace").CurrentCamera.CameraType = Enum.CameraType.Custom
			Get("Workspace").CurrentCamera.CameraSubject = (lplr.Character and lplr.Character:FindFirstChildOfClass("Humanoid")) or ClassCam
			Get("Workspace").CurrentCamera.CameraType = "Custom"
			Get("Workspace").CurrentCamera.HeadLocked = true
			Get("Workspace").CurrentCamera.HeadScale = 1
			Get("Workspace").CurrentCamera.Archivable = false
		end)
	end
	Fixing = false
end

if lplr.Name == USERNAME then
	local gui =  Instance.new("ScreenGui",Player:FindFirstChildOfClass("PlayerGui"))
	gui.Name = RandomMath()
	local fixcharbutton =  Instance.new("TextButton",gui)
	fixcharbutton.TextScaled = true
	fixcharbutton.Font = "Arial"
	fixcharbutton.Name = RandomMath()
	fixcharbutton.BorderSizePixel = 0
	fixcharbutton.BackgroundTransparency = .5
	fixcharbutton.TextStrokeColor3 = Color3.new(1*Sick.PlaybackLoudness/1000,1*Sick.PlaybackLoudness/1000,1*Sick.PlaybackLoudness/1000)
	fixcharbutton.TextStrokeTransparency = 0
	fixcharbutton.BackgroundColor3 = Color3.new(0, 0, 0)
	fixcharbutton.Text = "Refit"
	fixcharbutton.Size = UDim2.new(.25,0,0,36)
	fixcharbutton.AnchorPoint = Vector2.new(1,1)
	fixcharbutton.Position = UDim2.new(.62,0,0,0)
	fixcharbutton.MouseButton1Click:Connect(function()
		if not Fixing then
			Fixer2()
			Fixer1()
		end
	end)
	local fixinggui = false
	function fixgui()
		fixinggui = true
		pcall(function()
			gui:Destroy()
		end)
		pcall(function()
			gui =  Instance.new("ScreenGui",Player:FindFirstChildOfClass("PlayerGui"))
			gui.Name = RandomMath()
			fixcharbutton =  Instance.new("TextButton",gui)
			fixcharbutton.TextScaled = true
			fixcharbutton.Font = "Arial"
			fixcharbutton.Name = RandomMath()
			fixcharbutton.BorderSizePixel = 0
			fixcharbutton.BackgroundTransparency = .5
			fixcharbutton.TextStrokeColor3 = Color3.new(1*Sick.PlaybackLoudness/1000,1*Sick.PlaybackLoudness/1000,1*Sick.PlaybackLoudness/1000)
			fixcharbutton.TextStrokeTransparency = 0
			fixcharbutton.BackgroundColor3 = Color3.new(0, 0, 0)
			fixcharbutton.Text = "Refit"
			fixcharbutton.Size = UDim2.new(.25,0,0,36)
			fixcharbutton.AnchorPoint = Vector2.new(1,1)
			fixcharbutton.Position = UDim2.new(.62,0,0,0)
		end)
		fixcharbutton.MouseButton1Click:Connect(function()
			if not Fixing then
				Fixer2()
				Fixer1()
			end
		end)
		fixinggui = false
	end
	Player:FindFirstChildOfClass("PlayerGui").DescendantRemoving:Connect(function(v)
		if not fixinggui then
			task.wait()
			if v == gui or fixcharbutton then
				fixgui()
			end
		end
	end)
	task.spawn(function()
		while true do
			task.wait()
			fixcharbutton.TextColor3 = Color3.new(1*Sick.PlaybackLoudness/1000,1*Sick.PlaybackLoudness/1000,1*Sick.PlaybackLoudness/1000)
			fixcharbutton.TextStrokeColor3 = Color3.new(0, 0, 0)
		end
	end)
end

function chatfunc(text)
	local chat = coroutine.wrap(function()
		local oldthing = game:GetService("Workspace"):FindFirstChild("HLCBillboard")
		if oldthing then
			oldthing:Destroy()
		end
		local naeeym2 = Instance.new("BillboardGui",game:GetService("Workspace"))
		naeeym2.Size = UDim2.new(0,9999,2,0)
		naeeym2.StudsOffset = Vector3.new(0,7.5,0)
		naeeym2.Adornee = Head
		naeeym2.Name = "HLCBillboard"
		local tecks2 = Instance.new("TextLabel",naeeym2)
		tecks2.BackgroundTransparency = 1
		tecks2.BorderSizePixel = 0
		tecks2.Text = ""
		tecks2.Font = "Code"
		tecks2.TextScaled = true
		tecks2.TextStrokeTransparency = 0
		coroutine.resume(coroutine.create(function()
			while tecks2:IsDescendantOf(game) do
				tecks2.TextColor3 = MainColor
				naeeym2.Adornee = Head
				swait()
			end
		end))
		tecks2.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
		tecks2.Size = UDim2.new(1,0,1,0)
		coroutine.resume(coroutine.create(function()
			while naeeym2 ~= nil do
				swait()
				tecks2.Position = UDim2.new(0,math.random(-3, 3),0,3*math.sin(Sine / 24) + math.random(-3, 3))
				tecks2.Rotation = math.random(-3, 3)
			end
		end))
		for i = 1,string.len(text) do
			CreateSound(9116154737,Holder,10,.7)
			wait(.025)
			tecks2.Text = string.sub(text,1,i)
		end
		wait(2.4)
		for i = 1,50 do
			swait()
			tecks2.Position = tecks2.Position - UDim2.new(0,math.random(-3,3),0,math.random(-3,3))
			tecks2.Rotation = tecks2.Rotation + math.random(-2,2)
			tecks2.TextStrokeTransparency = i/50
			tecks2.TextTransparency = tecks2.TextStrokeTransparency
		end
		naeeym2:Destroy()
	end)
	chat()
end
function OnChatted(Msg)
	chatfunc(Msg)
end
if Player then
	Player.Chatted:Connect(OnChatted)
end

local Text = {
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"H0rizon LC",
	"Horizon 1C",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horiz0n LC",
	"Horizon LC",
	"Horizon LC",
	"Hor1zon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon L(",
	"Horizon LC",
	"H0riz0n LC",
	"Horizon LC",
	"Horizon LC",
	"Horiz0n 1C",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"H0rizon 1C",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC"
}
local TextDown = {
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"D0wnTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTon3 | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownT0ne | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"D0wnT0ne | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"Dow_Tone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"D0wnTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"Dow__one | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HL(",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTon3 | H1C",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"[ownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
	"DownTone | HLC",
}
local TextEndless = {
	"Never-Ending | HLC",
	"Never-Ending | HLC",
	"Never-Ending | HLC",
	"Never-Ending | HLC",
	"Never-Ending | HLC",
	"Never-Ending | HLC",
	"Never-Ending | HLC",
	"N3ver-Ending | HLC",
	"Never-Ending | HLC",
	"Never-Ending | HLC",
	"Never-Ending | HLC",
	"Never-Ending | HLC",
	"Never-Ending | HLC",
	"Never-Ending | HLC",
	"Nev3r-Ending | HLC",
	"Never-Ending | HLC",
	"Never-Ending | HLC",
	"Never-Ending | HLC",
	"Never-Ending | HLC",
	"Ne-er-Ending | HLC",
	"Never-Ending | HLC",
	"Never-Ending | HLC",
	"Never-Ending | HLC",
	"Never-Ending | HLC",
	"Never-Ending | HLC",
	"Never-Ending | HLC",
	"Never-Ending | HLC",
	"Never-Ending | HLC",
	"Never-Ending | HLC",
	"Never-Ending | HLC",
	"Nev3r-End1ng | HLC",
	"Never-Ending | HLC",
	"Never-Ending | HLC",
	"Never-Ending | HLC",
	"Never-Ending | HLC",
	"Never-Ending | HLC",
	"Never-Ending | HLC",
	"Never-Ending | HLC",
	"Never-Ending | HLC",
	"Never-Ending | HLC",
	"Never-Ending | HLC",
	"Never-Ending | HLC",
	"Never-Ending | HLC",
	"Never-Ending | HLC",
	"Never-Ending | HLC",
	"Never-Ending | HLC",
	"N3v3r-3nd1ng | HLC",
	"Never-Ending | HLC",
	"Never-Ending | HLC",
	"Never-Ending | HLC",
	"Never-Ending | HLC",
	"Never-Ending | HLC",
	"Never-Ending | HLC",
	"Never-Ending | HLC",
	"Never-Ending | HLC",
	"Never-Ending | HLC",
	"Never-Ending | HLC",
	"Never-Ending | HLC",
	"Never-Ending | HLC",
	"Never-Ending | HLC",
	"Never-Ending | HLC",
	"Never-Ending | HLC",
	"Never-Ending | HLC",
	"Ne__r-End__g | HLC",
	"Never-Ending | HLC",
	"Never-Ending | HLC",
	"Never-Ending | HL(",
	"Never-Ending | HLC",
	"Never-Ending | HLC",
	"Never-Ending | HLC",
	"Never-Ending | HLC",
	"Never-Ending | H1C",
	"Never-Ending | HLC",
	"Never-Ending | HLC",
	"Never-Ending | HLC",
	"Never-Ending | HLC",
	"Never-Ending | HLC",
	"Never-Ending | HLC",
	"Never-Ending | HLC",
	"N3ver-Ending | HL(",
	"Never-Ending | HLC",
	"Never-Ending | HLC",
	"Never-Ending | HLC",
	"Never-Ending | HLC",
	"Nev3r-E___ng | HLC",
	"Never-Ending | HLC",
	"Never-Ending | HLC",
	"Never-Ending | HLC",
	"Never-Ending | HLC",
	"Never-Ending | HLC",
}
local TextMadness = {
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"M4dness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madn3$s | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | H1(",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"M4dness | HL(",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"M4dn3ss | H1C",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madn3$$ | H1(",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"M4dn3$$ | H!(",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"!!!ness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madn3ss | HLC",
	"Madness | HLC",
	"Ma__ess | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madn3ss | HLC",
	"Madness | HLC",
	"Madness | H1(",
	"M4dness | H!C",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
	"Madness | HLC",
}
local TextInstanity = {
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"H?????? ??",
	"H0rizon LC",
	"Horizon 1C",
	"IT.",
	"Horizon LC",
	"Horizon LC",
	"-O----- --",
	"Horizon LC",
	"Horiz0n LC",
	"N1ghtmare",
	"Horizon LC",
	"Horizon LC",
	"Hor1zon LC",
	"Horizon LC",
	"Hum4n?",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"F41THL3SS",
	"Horizon L(",
	"Horizon LC",
	"H0riz0n LC",
	"ERROR?!",
	"_______ LC",
	"Horizon LC",
	"Horizon LC",
	"M0nster(?)",
	"Horiz0n 1C",
	"Horizon LC",
	"Horizon LC",
	"Unkn0wn.",
	"Horizon LC",
	"Horizon LC",
	"H0rizon 1C",
	"CReAtuRE",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Ent1ty"
}
local TextErr0r = {
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"-H0rizon L-C",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"- Horiz0n LC-",
	"Horizon LC",
	"Horizon LC",
	"H-0rizon L-C",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"H0riz0n LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"0000000 LC",
	"1111111 LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"00rizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Hori10n LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon 1C",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"1010101 LC",
	"Horizon LC",
	"0101010 LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"0101010 LC",
	"1011011 LC",
	"1010110 LC",
	"0011100 LC",
	"1101111 LC",
	"0100101 LC",
	"1110100 LC",
	"1010101 LC",
	"------- LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",	
	"Horizon LC",
	"0110101 LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
	"Horizon LC",
}
local TextGlitch = {
	"Gl1tch | HLC",
	"Gl1tch | HLC",
	"$$$$$$ | HLC",
	"Gl1tch | HLC",
	"Gl1tch | HLC",
	"Gl1tch | HLC",
	"Gl1tch | HLC",
	"Gl1tch | HLC",
	"Gl1tch | HLC",
	"Gl1tch | HLC",
	"Gl1tch | HLC",
	"215tch | HLC",
	"Gl1tch | HLC",
	"Gl1tch | HLC",
	"Gl1tch | HLC",
	"Gl1tch | HLC",
	"Gl1tch | HLC",
	"Gl1tch | HLC",
	"Gl1tch | HLC",
	"Gl1tch | HLC",
	"Gl1tch | HLC",
	"Gl1tch | HL(",
	"Gl1tch | HLC",
	"Gl1tch | HLC",
	"Gl1tch | HLC",
	"Gl1tch | HLC",
	"Gl1tch | HLC",
	"Gl1tch | HLC",
	"Gl1tch | H!C",
	"Gl1tch | HLC",
	"Gl1tch | HLC",
	"Gl1tch | HLC",
	"G---ch | HLC",
	"Gl1tch | HLC",
	"Gl1tch | HLC",
	"Gl1tch | HLC",
	"Gl1tch | HLC",
	"Gl1tch | HLC",
	"Gl1tch | HLC",
	"Gl1tch | HLC",
	"Gl1tch | HLC",
	"Gl1tch | HLC",
	"Gl1tch | HLC",
	"Gl1tch | HLC",
	"Gl1tch | HLC",
	"Gl1tch | HLC",
	"Gl1tch | HLC",
	"Gl1tch | HLC",
	"Gl1tch | HLC",
	"G_____ | HLC",
	"Gl1tch | HLC",
	"Gl1tch | HLC",
	"Gl1tch | HLC",
	"Gl1tch | HLC",
	"Gl1tch | HLC",
	"Gl1tch | HLC",
	"Gl1tch | HLC",
	"Gl1tch | HLC",
	"Gl1tch | HLC",
	"Gl1tch | HLC",
	"Gl1tch | HLC",
	"Gl1tch | HLC",
	"Gl1tch | HLC",
	"Gl1tch | HLC",
	"Gl1tch | HLC",
	"Gl1tch | HLC",
	"Gl1tch | HLC",
	"Gl%%ch | %%%",
	"Gl1tch | HLC",
	"Gl1tch | HLC",
	"Gl1tch | HLC",
	"Gl1tch | HLC",
	"Gl1tch | HLC",
	"Gl1tch | HLC",
	"--1-th | --_",
	"Gl1tch | HLC",
	"Gl1tch | HLC",
	"Gl1tch | HLC",
	"Gl1tch | HLC",
	"Gl1tch | HLC",
	"Gl1tch | HLC",
}
local TextSKID = {
	"SKIDizen",
	"skIDizen",
	"SKIDIZen",
	"SKidIzen",
	"SKIDIZEN"
}
local TextBerg = {
	"berg"
}
local TextMute = {
	"Mute 7",
	"Mute 7",
	"Mute 7",
	"Mute 7",
	"Mute 7",
	"Mute 7",
	"Mute 7",
	"Mute 7",
	"Mut7 7",
	"Mute 7",
	"Mute 7",
	"Mute 7",
	"Mute 7",
	"Mute 7",
	"Mute 7",
	"Mute 7",
	"M77e 7",
	"Mute 7",
	"Mute 7",
	"Mute 7",
	"Mute 7",
	"Mute 7",
	"Mute 7",
	"M7te 7",
	"Mute 7",
	"Mute 7",
	"7ute 7",
	"Mute 7",
	"7777 7",
	"Mute 7",
	"Mute 7",
}

local FONTS = {
	Enum.Font.SourceSans,
	Enum.Font.SourceSans,
	Enum.Font.SourceSans,
	Enum.Font.SourceSans,
	Enum.Font.SourceSans,
	Enum.Font.SourceSans,
	Enum.Font.SourceSans,
	Enum.Font.SourceSans,
	Enum.Font.Antique,
	Enum.Font.SourceSans,
	Enum.Font.SourceSans,
	Enum.Font.SourceSans,
	Enum.Font.Arcade,
	Enum.Font.Arial,
	Enum.Font.SourceSans,
	Enum.Font.SourceSans,
	Enum.Font.SourceSans,
	Enum.Font.SourceSans,
	Enum.Font.ArialBold,
	Enum.Font.Bodoni,
	Enum.Font.SourceSans,
	Enum.Font.Cartoon,
	Enum.Font.Code,
	Enum.Font.SourceSans,
	Enum.Font.SourceSans,
	Enum.Font.SourceSans,
	Enum.Font.SourceSans,
	Enum.Font.SourceSans,
	Enum.Font.Fantasy,
	Enum.Font.Garamond,
	Enum.Font.SourceSans,
	Enum.Font.SourceSans,
	Enum.Font.SourceSans,
	Enum.Font.SourceSans,
	Enum.Font.SourceSans,
	Enum.Font.Highway,
	Enum.Font.SourceSans,
	Enum.Font.Legacy,
	Enum.Font.SourceSans,
	Enum.Font.SourceSans,
	Enum.Font.SourceSans,
	Enum.Font.SciFi,
	Enum.Font.SourceSans,
	Enum.Font.SourceSans,
	Enum.Font.SourceSansBold,
	Enum.Font.SourceSansItalic,
	Enum.Font.SourceSansLight,
	Enum.Font.SourceSans,
	Enum.Font.SourceSansSemibold,
	Enum.Font.SourceSans,
	Enum.Font.SourceSans,
	Enum.Font.Gotham,
	Enum.Font.SourceSans,
	Enum.Font.SourceSans,
	Enum.Font.GothamBlack,
	Enum.Font.SourceSans,
	Enum.Font.GothamBold,
	Enum.Font.AmaticSC,
	Enum.Font.SourceSans,
	Enum.Font.SourceSans,
	Enum.Font.SourceSans,
	Enum.Font.Bangers,
	Enum.Font.Creepster,
	Enum.Font.SourceSans,
	Enum.Font.SourceSans,
	Enum.Font.DenkOne,
	Enum.Font.Fondamento,
	Enum.Font.SourceSans,
	Enum.Font.SourceSans,
	Enum.Font.SourceSans,
	Enum.Font.SourceSans,
	Enum.Font.SourceSans,
	Enum.Font.FredokaOne,
	Enum.Font.SourceSans,
	Enum.Font.SourceSans,
	Enum.Font.SourceSans,
	Enum.Font.SourceSans,
	Enum.Font.SourceSans,
	Enum.Font.GrenzeGotisch,
	Enum.Font.IndieFlower,
	Enum.Font.SourceSans,
	Enum.Font.SourceSans,
	Enum.Font.SourceSans,
	Enum.Font.SourceSans,
	Enum.Font.SourceSans,
	Enum.Font.JosefinSans,
	Enum.Font.Jura,
	Enum.Font.SourceSans,
	Enum.Font.SourceSans,
	Enum.Font.SourceSans,
	Enum.Font.Kalam,
	Enum.Font.SourceSans,
	Enum.Font.SourceSans,
	Enum.Font.SourceSans,
	Enum.Font.SourceSans,
	Enum.Font.LuckiestGuy,
	Enum.Font.Merriweather,
	Enum.Font.SourceSans,
	Enum.Font.Michroma,
	Enum.Font.Nunito,
	Enum.Font.SourceSans,
	Enum.Font.SourceSans,
	Enum.Font.SourceSans,
	Enum.Font.Oswald,
	Enum.Font.SourceSans,
	Enum.Font.PatrickHand,
	Enum.Font.SourceSans,
	Enum.Font.PermanentMarker,
	Enum.Font.Roboto,
	Enum.Font.SourceSans,
	Enum.Font.SourceSans,
	Enum.Font.RobotoCondensed,
	Enum.Font.SourceSans,
	Enum.Font.SourceSans,
	Enum.Font.RobotoMono,
	Enum.Font.Sarpanch,
	Enum.Font.SpecialElite,
	Enum.Font.TitilliumWeb,
	Enum.Font.SourceSans,
	Enum.Font.Ubuntu,
	Enum.Font.SourceSans,
}

local WEIGHT = {
	Enum.FontWeight.Light,
	Enum.FontWeight.Light,
	Enum.FontWeight.Bold,
	Enum.FontWeight.Light,
	Enum.FontWeight.Thin,
	Enum.FontWeight.Light,
	Enum.FontWeight.Light,
	Enum.FontWeight.Heavy,
	Enum.FontWeight.Light,
	Enum.FontWeight.Medium,
	Enum.FontWeight.Light,
	Enum.FontWeight.Light,
	Enum.FontWeight.Regular,
	Enum.FontWeight.Light,
	Enum.FontWeight.Light,
	Enum.FontWeight.SemiBold,
	Enum.FontWeight.ExtraBold,
	Enum.FontWeight.Light,
	Enum.FontWeight.Light,
	Enum.FontWeight.ExtraLight
}

local STYLE = {
	Enum.FontStyle.Italic,
	Enum.FontStyle.Normal,
	Enum.FontStyle.Italic,
	Enum.FontStyle.Italic,
	Enum.FontStyle.Normal,
	Enum.FontStyle.Italic,
	Enum.FontStyle.Normal,
	Enum.FontStyle.Normal
}

local Billboard = Instance.new("BillboardGui",Effects)
Billboard.Size = UDim2.new(0,9999,2,0)
Billboard.StudsOffset = Vector3.new(0,4.5,0)
Billboard.Adornee = Head
Billboard.Name = RandomMath()
local Billboardtext = Instance.new("TextLabel",Billboard)
Billboardtext.BackgroundTransparency = 1
Billboardtext.BorderSizePixel = 0
Billboardtext.Text = "Horizon LC"
Billboardtext.TextScaled = true
Billboardtext.TextStrokeTransparency = 0
Billboardtext.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
Billboardtext.Size = UDim2.new(1,0,1,0)
function RefitName()
	pcall(function()
		Billboard:Destroy()
	end)
	Billboard = Instance.new("BillboardGui",Effects)
	Billboard.Size = UDim2.new(0,9999,2,0)
	Billboard.StudsOffset = Vector3.new(0,4.5,0)
	Billboard.Adornee = Head
	Billboard.Name = RandomMath()
	Billboardtext = Instance.new("TextLabel",Billboard)
	Billboardtext.BackgroundTransparency = 1
	Billboardtext.BorderSizePixel = 0
	Billboardtext.Text = "Horizon LC"
	Billboardtext.TextScaled = true
	Billboardtext.TextStrokeTransparency = 0
	Billboardtext.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
	Billboardtext.Size = UDim2.new(1,0,1,0)
end

--|| Anti GUIs ||--

local blockedguis = {"HDAdminGUIs","Uhoh","vbucks","sup","AllahGui","SnakeVenomSS","polishtoilet","nooties","IY_GUI","IY_JumpScare","Dex","BugGui","E","AntiImmortalityLordDistributable","SayMessage","Send","vbucks","sup","AllahGui","SnakeVenomSS","polishtoilet","nooties","IY_GUI","IY_JumpScare","Dex","BugGui","E","MainModule","KCoreUI","STRATO","SSynapseX","Dreaming","Hack","ModuleScript","HiddenScript","Info","UTG","Utg","utg","AMTG","Ultimate Trolling Gui","Ultra Undertale UTG","utgpocool","Family","Private","Steve's Utg V.2","ChatHax","_ZVN","Scrambled","USG","TheBossHub","т9","hexplicitmadecrossmod","Scripting","QuantomUI","AdminBar","CleanGui","CustomAdmin","QuantomUI","killtimeGUI","MakerModelLua's TaskBar","DEV GUI","MenU","LOL SS","Menu","kien4424 gui","CMGui","Dex_Explorer","AccessUI","ScriptExecuter","GUI","RickRollHolder","Force Chat","GetBarrel","idiot","tyrone","Anti","RainingAntiBan","ShutUpNoob","TrollGUI"}
function CheckGui(v) 
	if v:IsA("ScreenGui") then
		for i = 1,#blockedguis do
			if v.Name == blockedguis[i] then
				v.Enabled = false
				Get("Debris"):AddItem(v,0)
			end
		end	
	end
end

for i,v in ipairs(lplr:FindFirstChildOfClass("PlayerGui"):GetDescendants()) do
	CheckGui(v)
end

lplr:FindFirstChildOfClass("PlayerGui").ChildAdded:Connect(function(v)
	CheckGui(v)
end)

--|| Functions ||--

function Turn(position)
	Mover.CFrame = Mover.CFrame:Lerp(CFrame.new(Mover.CFrame.p,Vector3.new(position.X,Mover.CFrame.Position.Y,position.Z)) * CFrame.new(0, 0, 0), .6)
end

function MakeForm(PART,TYPE)
	if TYPE == "Cyl" then
		local MSH =  Instance.new("CylinderMesh",PART)
	elseif TYPE == "Ball" then
		local MSH =  Instance.new("SpecialMesh",PART)
		MSH.MeshType = "Sphere"
	elseif TYPE == "Wedge" then
		local MSH =  Instance.new("SpecialMesh",PART)
		MSH.MeshType = "Wedge"
	end
end

function Raycast(POSITION, DIRECTION, RANGE, IGNOREDECENDANTS)
	return Get("Workspace"):FindPartOnRay(Ray.new(POSITION, DIRECTION.Unit * RANGE), IGNOREDECENDANTS)
end

function CastProperRay(StartPos, EndPos, Distance, Ignore)
	local DIRECTION = CFrame.new(StartPos,EndPos).LookVector
	return Raycast(StartPos, DIRECTION, Distance, Ignore)
end

function CreateMesh(MESH,PARENT,MESHTYPE,MESHID,TEXTUREID,SCALE,OFFSET)
	local NEWMESH =  Instance.new(MESH)
	if MESH == "SpecialMesh" then
		NEWMESH.MeshType = MESHTYPE
		if MESHID ~= "nil" and MESHID ~= "" then
			NEWMESH.MeshId = "rbxassetid://"..MESHID
		end
		if TEXTUREID ~= "nil" and TEXTUREID ~= "" then
			NEWMESH.TextureId = "rbxassetid://"..TEXTUREID
		end
	end
	NEWMESH.Offset = OFFSET or Vector3.new(0,0,0)
	NEWMESH.Scale = SCALE
	NEWMESH.Parent = PARENT
	return NEWMESH
end

function CreatePart(FORMFACTOR,PARENT,MATERIAL,REFLECTANCE,TRANSPARENCY,COLOR,NAME,SIZE,ANCHOR)
	local NEWPART =  Instance.new("Part")
	NEWPART.CastShadow = false
	NEWPART.Massless = true
	NEWPART.formFactor = FORMFACTOR
	NEWPART.Reflectance = REFLECTANCE
	NEWPART.Transparency = TRANSPARENCY
	NEWPART.CanCollide = false
	NEWPART.Locked = true
	NEWPART.Anchored = true
	if ANCHOR == false then
		NEWPART.Anchored = false
	end
	NEWPART.Color = COLOR
	NEWPART.Name = RandomMath()
	NEWPART.Size = SIZE
	NEWPART.Position = Torso.Position
	NEWPART.Material = MATERIAL
	NEWPART:BreakJoints()
	NEWPART.Parent = PARENT
	return NEWPART
end

local S =  Instance.new("Sound")
function CreateSound(ID,PARENT,VOLUME,PITCH,DOESLOOP)
	local NEWSOUND = nil
	task.spawn(function()
		NEWSOUND = S:Clone()
		NEWSOUND.Parent = PARENT
		NEWSOUND.Volume = VOLUME
		NEWSOUND.Pitch = PITCH
		NEWSOUND.SoundId = "rbxassetid://"..ID
		NEWSOUND:play()
		if DOESLOOP == true then
			NEWSOUND.Looped = true
		else
			task.spawn(function()
				pcall(function()
					repeat task.wait() until NEWSOUND.Playing == false
					NEWSOUND:Destroy()
				end)
			end)
		end
	end)
	return NEWSOUND
end

function Effect(Table)
	local TYPE = (Table.EffectType or "Sphere")
	local SIZE = (Table.Size or Vector3.new(1,1,1))
	local ENDSIZE = (Table.Size2 or Vector3.new(0,0,0))
	local TRANSPARENCY = (Table.Transparency or 0)
	local ENDTRANSPARENCY = (Table.Transparency2 or 1)
	local CFRAME = (Table.CFrame or Mover.CFrame)
	local MOVEDIRECTION = (Table.MoveToPos or nil)
	local ROTATION1 = (Table.RotationX or 0)
	local ROTATION2 = (Table.RotationY or 0)
	local ROTATION3 = (Table.RotationZ or 0)
	local MATERIAL = (Table.Material or "Neon")
	local COLOR = (Table.Color)
	local hOK,sOK,vOK = Color3.fromRGB(COLOR)
	local TIME = (Table.Time or 45)
	local SOUNDID = (Table.SoundID or nil)
	local SOUNDPITCH = (Table.SoundPitch or nil)
	local SOUNDVOLUME = (Table.SoundVolume or nil)
	local USEBOOMERANGMATH = (Table.UseBoomerangMath or false)
	local BOOMERANG = (Table.Boomerang or 0)
	local SIZEBOOMERANG = (Table.SizeBoomerang or 0)
	task.spawn(function()
		local PLAYSSOUND = false
		local SOUND = nil
		local EFFECT = CreatePart(3,Effects,MATERIAL,0,TRANSPARENCY,MainColor,RandomMath(),Vector3.new(1,1,1),true)
		if SOUNDID ~= nil and SOUNDPITCH ~= nil and SOUNDVOLUME ~= nil then
			PLAYSSOUND = true
			SOUND = CreateSound(SOUNDID,EFFECT,SOUNDVOLUME,SOUNDPITCH,false)
		end
		EFFECT.Color = MainColor
		local MSH = nil
		if TYPE == "Sphere" then
			MSH = CreateMesh("SpecialMesh",EFFECT,"Sphere","","",SIZE,Vector3.new(0,0,0))
		elseif TYPE == "Block" or TYPE == "Box" then
			MSH =  Instance.new("BlockMesh",EFFECT)
			MSH.Scale = SIZE
		elseif TYPE == "Part" then
			MSH = CreateMesh("SpecialMesh", EFFECT, "Brick", "", "", SIZE, Vector3.new(0,0,0))
		elseif TYPE == "Wave" then
			MSH = CreateMesh("SpecialMesh",EFFECT,"FileMesh","20329976","",SIZE,Vector3.new(0,0,-SIZE.X/8))
		elseif TYPE == "Ring" then
			MSH = CreateMesh("SpecialMesh",EFFECT,"FileMesh","559831844","",Vector3.new(SIZE.X,SIZE.X,0.1),Vector3.new(0,0,0))
		elseif TYPE == "Slash" then
			MSH = CreateMesh("SpecialMesh",EFFECT,"FileMesh","662586858","",Vector3.new(SIZE.X/10,0,SIZE.X/10),Vector3.new(0,0,0))
		elseif TYPE == "Round Slash" then
			MSH = CreateMesh("SpecialMesh",EFFECT,"FileMesh","662585058","",Vector3.new(SIZE.X/10,0,SIZE.X/10),Vector3.new(0,0,0))
		elseif TYPE == "Swirl" then
			MSH = CreateMesh("SpecialMesh",EFFECT,"FileMesh","168892432","",SIZE,Vector3.new(0,0,0))
		elseif TYPE == "Skull" then
			MSH = CreateMesh("SpecialMesh",EFFECT,"FileMesh","4770583","",SIZE,Vector3.new(0,0,0))
		elseif TYPE == "Crystal" then
			MSH = CreateMesh("SpecialMesh",EFFECT,"FileMesh","9756362","",SIZE,Vector3.new(0,0,0))
		end
		if MSH ~= nil then
			local BOOMR1 = 1+BOOMERANG/50
			local BOOMR2 = 1+SIZEBOOMERANG/50
			local MOVESPEED = nil
			if MOVEDIRECTION ~= nil then
				if USEBOOMERANGMATH == true then
					MOVESPEED = ((CFRAME.p - MOVEDIRECTION).Magnitude/TIME)*BOOMR1
				else
					MOVESPEED = ((CFRAME.p - MOVEDIRECTION).Magnitude/TIME)
				end
			end
			local GROWTH = nil
			if USEBOOMERANGMATH == true then
				GROWTH = (SIZE - ENDSIZE)*(BOOMR2+1)
			else
				GROWTH = (SIZE - ENDSIZE)
			end
			local TRANS = TRANSPARENCY - ENDTRANSPARENCY
			if TYPE == "Block" then
				EFFECT.CFrame = CFRAME*CFrame.Angles(math.rad(math.random(0,360)),math.rad(math.random(0,360)),math.rad(math.random(0,360)))
			else
				EFFECT.CFrame = CFRAME
			end
			if USEBOOMERANGMATH == true then
				for LOOP = 1,TIME+1 do
					task.wait()
					MSH.Scale = MSH.Scale - (Vector3.new((GROWTH.X)*((1 - (LOOP/TIME)*BOOMR2)),(GROWTH.Y)*((1 - (LOOP/TIME)*BOOMR2)),(GROWTH.Z)*((1 - (LOOP/TIME)*BOOMR2)))*BOOMR2)/TIME
					if TYPE == "Wave" then
						MSH.Offset = Vector3.new(0,0,-MSH.Scale.Z/8)
					end
					EFFECT.Transparency = EFFECT.Transparency - TRANS/TIME
					if TYPE == "Block" then
						EFFECT.CFrame = CFRAME*CFrame.Angles(math.rad(math.random(0,360)),math.rad(math.random(0,360)),math.rad(math.random(0,360)))
					else
						EFFECT.CFrame = EFFECT.CFrame*CFrame.Angles(math.rad(ROTATION1),math.rad(ROTATION2),math.rad(ROTATION3))
					end
					if MOVEDIRECTION ~= nil then
						local ORI = EFFECT.Orientation
						EFFECT.CFrame = CFrame.new(EFFECT.Position,MOVEDIRECTION)*CFrame.new(0,0,-(MOVESPEED)*((1 - (LOOP/TIME)*BOOMR1)))
						EFFECT.Orientation = ORI
					end
				end
			else
				for LOOP = 1,TIME+1 do
					task.wait()
					MSH.Scale = MSH.Scale - GROWTH/TIME
					if TYPE == "Wave" then
						MSH.Offset = Vector3.new(0,0,-MSH.Scale.Z/8)
					end
					EFFECT.Transparency = EFFECT.Transparency - TRANS/TIME
					if TYPE == "Block" then
						EFFECT.CFrame = CFRAME*CFrame.Angles(math.rad(math.random(0,360)),math.rad(math.random(0,360)),math.rad(math.random(0,360)))
					else
						EFFECT.CFrame = EFFECT.CFrame*CFrame.Angles(math.rad(ROTATION1),math.rad(ROTATION2),math.rad(ROTATION3))
					end
					if MOVEDIRECTION ~= nil then
						local ORI = EFFECT.Orientation
						EFFECT.CFrame = CFrame.new(EFFECT.Position,MOVEDIRECTION)*CFrame.new(0,0,-MOVESPEED)
						EFFECT.Orientation = ORI
					end
				end
			end
			EFFECT.Transparency = 1
			if PLAYSSOUND == false then
				EFFECT:Destroy()
			else
				repeat task.wait() until EFFECT:FindFirstChildOfClass("Sound") == nil
				EFFECT:Destroy()
			end
		else
			if PLAYSSOUND == false then
				EFFECT:Destroy()
			else
				repeat task.wait() until EFFECT:FindFirstChildOfClass("Sound") == nil
				EFFECT:Destroy()
			end
		end
	end)
end

function Lightning(Part0,Part1,Timess,Offset,Color,Timer,sSize,eSize,Trans,Boomer,sBoomer,Trans2)
	local magz = (Part0 - Part1).Magnitude
	local Times = math.floor(math.clamp(magz/10,1,20))
	local curpos = Part0
	local trz = {
		-Offset,
		Offset
	}
	for i = 1,Times do
		local li = Instance.new("SkateboardPlatform",Effects)
		li.Name = RandomMath()
		li.TopSurface = 0
		li.Material = "Neon"
		li.BottomSurface = 0
		li.Anchored = true
		li.Locked = true
		li.Transparency = 0
		li.Color = Color
		li.formFactor = "Custom"
		li.CanCollide = false
		li.Size = Vector3.new(.1,.1,magz/Times)
		local Offzet = Vector3.new(trz[math.random(1,2)],trz[math.random(1,2)],trz[math.random(1,2)])
		local trolpos = CFrame.new(curpos,Part1) * CFrame.new(0,0,magz/Times).Position + Offzet
		if Times == i then
			local magz2 = (curpos - Part1).Magnitude
			li.Size = Vector3.new(.1,.1,magz2)
			li.CFrame = CFrame.new(curpos,Part1) * CFrame.new(0,0,-magz2/2)
		else
			li.CFrame = CFrame.new(curpos,trolpos) * CFrame.new(0,0,magz/Times/2)
		end
		curpos = li.CFrame * CFrame.new(0,0,magz/Times/2).Position
		li:Destroy()
		Effect({Time = Timer,EffectType = "Box",Size = Vector3.new(sSize,sSize,li.Size.Z),Size2 = Vector3.new(eSize,eSize,li.Size.Z),Transparency = Trans,Transparency2 = Trans2 or 1,CFrame = li.CFrame,MoveToPos = nil,RotationX = nil,RotationY = nil,RotationZ = nil,Material = "Neon",Color = MainColor,SoundID = nil,SoundPitch = nil,SoundVolume = nil,UseBoomerangMath = Boomer,Boomerang = 0,SizeBoomerang = sBoomer})
		swait()
	end 
end

function GetRoot(MODEL, ROOT)
	if ROOT == true then
		return MODEL:FindFirstChild("HumanoidRootPart") or MODEL:FindFirstChild("Torso") or MODEL:FindFirstChild("UpperTorso")
	else
		return MODEL:FindFirstChild("Torso") or MODEL:FindFirstChild("UpperTorso")
	end
end


--|| Effects ||--

function SideEffect(ITEM)
	local c = ITEM
	task.spawn(function()
		if c:IsA("BasePart") and not (c == Head or c == Torso or c == RightArm or c == LeftArm or c == RightLeg or c == LeftLeg or c == Holder or c:IsDescendantOf(Effects)) then
			pcall(function()
				c.Archivable = true
				local c2 = c:Clone()
				c.Archivable = false
				c2.Parent = Effects
				c2.Name = RandomMath()
				if c2.ClassName == "MeshPart" then
					c2.TextureID = ""
				end
				if c2.ClassName == "UnionOperation" then
					c2.UsePartColor = true
				end
				for i,v in ipairs(c2:GetDescendants()) do
					if v:IsA("Decal") or v:IsA("Texture") then
						v.Transparency = 1
					end
				end
				for i,v in ipairs(c2:GetDescendants()) do
					if v:IsA("SpecialMesh") then
						v.TextureId = ""
					end
				end
				c2.Size = c.Size
				c2.CFrame = c.CFrame
				c2.Material = "Neon"
				c2.Color = MainColor
				CreateSound(3264923,c2,2,math.random(8,15)/10,false)
				c2.CanCollide = false
				c2.CanTouch = false
				c2.CanQuery = false
				c2.Anchored = true
				c2.Locked = true
				c2.CastShadow = false
				Get("TweenService"):Create(c2,TweenInfo.new(1.5,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{Transparency = 1,Color = MainColor,Size = Vector3.new(0 * c.Size,0 * c.Size,0 * c.Size),CFrame = c.CFrame * CFrame.new(math.random(-10, 10) + math.random(-20, 20),5,math.random(-10, 10) - math.random(-20, 20)) * CFrame.Angles(math.rad(0 + math.random(-60,60) * 20 + math.cos(Sine / 12)),math.rad(0 + math.random(-60,60) * 10 + math.sin(Sine / 12)),math.rad(0 + math.random(-60,60) * 20 - math.cos(Sine / 12)))}):Play()
				Get("Debris"):AddItem(c2,3)
			end)
		end
	end)
end

function AbsorbEff(ITEM, Time, EndCF)
	local c = ITEM
	task.spawn(function()
		if c:IsA("BasePart") and not (c == Head or c == Torso or c == RightArm or c == LeftArm or c == RightLeg or c == LeftLeg or c == Holder or c:IsDescendantOf(Effects)) then
			pcall(function()
				c.Archivable = true
				local c2 = c:Clone()
				c.Archivable = false
				c2.Parent = Effects
				c2.Name = RandomMath()
				if c2.ClassName == "MeshPart" then
					c2.TextureID = ""
				end
				if c2.ClassName == "UnionOperation" then
					c2.UsePartColor = true
				end
				for i,v in ipairs(c2:GetDescendants()) do
					if v:IsA("Decal") or v:IsA("Texture") then
						v.Transparency = 1
					end
				end
				for i,v in ipairs(c2:GetDescendants()) do
					if v:IsA("SpecialMesh") then
						v.TextureId = ""
					end
				end
				c2.Size = c.Size
				c2.CFrame = c.CFrame
				c2.Material = "Neon"
				c2.Color = MainColor
				CreateSound(3264923,c2,2,math.random(8,15)/10,false)
				c2.CanCollide = false
				c2.CanTouch = false
				c2.CanQuery = false
				c2.Anchored = true
				c2.Locked = true
				c2.CastShadow = false
				Get("TweenService"):Create(c2,TweenInfo.new(Time,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{CFrame = EndCF * CFrame.Angles(math.rad(0 + math.random(-160,160) * 20 + math.cos(Sine / 12)),math.rad(0 + math.random(-160,160) * 10 + math.sin(Sine / 12)),math.rad(0 + math.random(-160,160) * 20 - math.cos(Sine / 12))),Transparency = 1,Color = MainColor,Size = Vector3.new(0 * c.Size,0 * c.Size,0 * c.Size)}):Play()
				Get("Debris"):AddItem(c2,Time)
			end)
		end
	end)
end

--|| Damage ||--

function BaseplateDetector()
	for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
		if v:IsA("BasePart") and not v:FindFirstChildOfClass("SpecialMesh") and v:IsA("Part") and (v.Size.X >= 500 and v.Size.X <= 513*4) and (v.Size.Y >= 18 and v.Size.Y <= 22*4) and (v.Size.Z >= 500 and v.Size.Z <= 514*4) and not v:IsA("MeshPart") and not v:IsA("UnionOperation") then
			return v
		end
	end
end

function Kill(OBJECT)
	local v = OBJECT
	local Baseplate = BaseplateDetector()
	task.spawn(function()
		if v:IsA("BasePart") and v:IsDescendantOf(game) and not (v == Baseplate or v == Head or v == Torso or v == RightArm or v == LeftArm or v == RightLeg or v == LeftLeg or v == Holder or v:IsDescendantOf(Effects)) then
			if v then
				SideEffect(v)
			end
			Mover.KILL = true
			-- Void, Nil, Transparency, Transparency2, Size, Derender, Mesh Degradation
			if Mover.KillType == "Void" then
				v:GetPropertyChangedSignal("CFrame"):Connect(function()
					if v.CFrame ~= CFrame.new(0,1e9,0) then
						v.CFrame = CFrame.new(0,1e9,0)
					elseif not (v.CFrame ~= CFrame.new(0,1e9,0)) then
						v.CFrame = CFrame.new(0,1e9,0)
					else
						v.CFrame = CFrame.new(0,1e9,0)
					end
				end)
				v.CFrame = CFrame.new(0,1e9,0)
				CEvent:FireServer("Void",v)
			elseif Mover.KillType == "Nil" then
				v.Parent = nil
				v:Destroy()
				CEvent:FireServer("Nil",v)
			elseif Mover.KillType == "Transparency" then
				v.Transparency = 1
				v:GetPropertyChangedSignal("Transparency"):Connect(function()
					v.Transparency = 1
				end)
				CEvent:FireServer("Transparency",v)
			elseif Mover.KillType == "Transparency2" then
				v.LocalTransparencyModifier = 1
				v:GetPropertyChangedSignal("LocalTransparencyModifier"):Connect(function()
					v.LocalTransparencyModifier = 1
				end)
				CEvent:FireServer("Transparency2",v)
			elseif Mover.KillType == "Size" then
				v.Size = Vector3.new(0, 0, 0)
				v:GetPropertyChangedSignal("Size"):Connect(function()
					v.Size = Vector3.new(0, 0, 0)
				end)
				CEvent:FireServer("Size",v)
			elseif Mover.KillType == "Derender" then
				local vpf = Instance.new("ViewportFrame")
				vpf.Name = RandomMath()
				vpf.Parent = game:GetService("Workspace")
				v.Parent = vpf
				v:GetPropertyChangedSignal("Parent"):Connect(function()
					if v:IsDescendantOf(game) then
						v.Parent = vpf
					end
				end)
				CEvent:FireServer("Derender",v)
			elseif Mover.KillType == "Mesh Degradation" then
				if v:IsA("MeshPart") then
					v:ApplyMesh(Saved.MeshKiller)
					v:GetPropertyChangedSignal("MeshId"):Connect(function()
						v:ApplyMesh(Saved.MeshKiller)
					end)
				elseif v:IsA("BasePart") and not v:IsA("MeshPart") then
					local MeshKiller2 = Instance.new("SpecialMesh")
					MeshKiller2.MeshId = "rbxassetid://1500643712"
					MeshKiller2.Scale = Vector3.new(0, 0, 0)
					MeshKiller2.Parent = v
				end
				CEvent:FireServer("MeshDeg",v)
			end
			v:BreakJoints()
		end
	end)
end

function KickPlr(Player)
	if Player:IsA("Player") then
		CEvent:FireServer("PlrRemoval", Player)
	end
end

function KickAoE(POS,RANGE)
	for i,v in pairs(Get("Workspace"):GetDescendants()) do
		if v:IsA("Model") and v.PrimaryPart and (v.PrimaryPart.Position - POS).Magnitude <= RANGE then
			for i,b in pairs(game:GetService("Players"):GetPlayers()) do
				if b.Character == v then
					KickPlr(b)
				end
			end
		end
	end
end

function ApplyAoE(POSITION,RANGE)
	local Baseplate = BaseplateDetector()
	for INDEX, ITEM in pairs(game:GetDescendants()) do
		if ITEM:IsA("BasePart") and ITEM:IsDescendantOf(game) and not (ITEM == Baseplate or ITEM == Head or ITEM == Torso or ITEM == RightArm or ITEM == LeftArm or ITEM == RightLeg or ITEM == LeftLeg or ITEM == LeftEye or ITEM == RightEye or ITEM == Hair or ITEM == Scarf or ITEM == Hat or ITEM == GunBase or ITEM == GunAdditions or ITEM == NeonParts or ITEM == GunBaseOutline or ITEM == HeadOutline or ITEM == TorsoOutline or ITEM == RightArmOutline or ITEM == LeftArmOutline or ITEM == LeftLegOutline or ITEM == RightArmOutline or ITEM == LeftLegOutline or ITEM == RightLegOutline or ITEM == HairOutline or ITEM == HatOutline or ITEM == Holder or ITEM:IsDescendantOf(Effects)) then
			if ITEM then
				if (ITEM.Position - POSITION).Magnitude <= RANGE then
					Kill(ITEM)
					--CEvent:FireServer("Void",ITEM)
				end
			end
		end
	end
end

function AbsorbAoE(POSITION, RANGE, TIME, POSITION2)
	local Baseplate = BaseplateDetector()
	for INDEX, ITEM in ipairs(game:GetDescendants()) do
		if ITEM:IsA("BasePart") and ITEM:IsDescendantOf(game) and not (ITEM == Baseplate or ITEM == Head or ITEM == Torso or ITEM == RightArm or ITEM == LeftArm or ITEM == RightLeg or ITEM == LeftLeg or ITEM == LeftEye or ITEM == RightEye or ITEM == Hair or ITEM == Scarf or ITEM == Hat or ITEM == GunBase or ITEM == GunAdditions or ITEM == NeonParts or ITEM == GunBaseOutline or ITEM == HeadOutline or ITEM == TorsoOutline or ITEM == RightArmOutline or ITEM == LeftArmOutline or ITEM == LeftLegOutline or ITEM == RightArmOutline or ITEM == LeftLegOutline or ITEM == RightLegOutline or ITEM == HairOutline or ITEM == HatOutline or ITEM == Holder or ITEM:IsDescendantOf(Effects)) then
			if ITEM then
				if (ITEM.Position - POSITION).Magnitude <= RANGE then
					ITEM:BreakJoints()
					AbsorbEff(ITEM, TIME, CFrame.new(POSITION2))
					coroutine.resume(coroutine.create(function()
						wait(.1)
						pcall(function()
							ITEM.CFrame = CFrame.new(-99e99, -99e99, -99e99)
						end)
						--CEvent:FireServer("Void",ITEM)
					end))
				end
			end
		end
	end
end

game.DescendantAdded:Connect(function(BASE)
	if BASE:IsA("Instance") and BASE:IsDescendantOf(game) and not (BASE == Shield or BASE == Head or BASE == Torso or BASE == RightArm or BASE == LeftArm or BASE == RightLeg or BASE == LeftLeg or BASE == LeftEye or BASE == RightEye or BASE == Hair or BASE == Scarf or BASE == Hat or BASE == GunBase or BASE == GunAdditions or BASE == NeonParts or BASE == GunBaseOutline or BASE == HeadOutline or BASE == TorsoOutline or BASE == RightArmOutline or BASE == LeftArmOutline or BASE == LeftLegOutline or BASE == RightArmOutline or BASE == LeftLegOutline or BASE == RightLegOutline or BASE == HairOutline or BASE == HatOutline or BASE == Holder or BASE:IsDescendantOf(Effects)) then
		if Mover.KILL == true then
			if BASE:IsA("BasePart") or BASE:IsA("BoxHandleAdornment") then
				BASE:GetPropertyChangedSignal("CFrame"):Connect(function()
					if BASE.CFrame ~= CFrame.new(0,1e9,0) then
						BASE.CFrame = CFrame.new(0,1e9,0)
					end
				end)
				if BASE:IsA("BasePart") then
					BASE:BreakJoints()
				end
				BASE.CFrame = CFrame.new(0,1e9,0)
				--CEvent:FireServer("Void",BASE)
			else
				BASE:Destroy()
			end
		end
	end
end)

--|| Attacks ||--

function Sprint()
	Run = true
	Mover.WalkSpeed = 50
	Mouse.KeyUp:Connect(function(Keyk)
		KeyHold = false
		Keyk = Keyk:upper()
		if Keyk == ";" then
			Run = false
			Mover.WalkSpeed = 8
		end
	end)
end

function ShakeCam(Length,Intensity)
	coroutine.resume(coroutine.create(function()
		local intensity = 1*Intensity
		local rotM = 0.01*Intensity
		for i = 0, Length, 0.1 do
			game:GetService("RunService").RenderStepped:Wait()
			intensity = intensity - 0.05*Intensity/Length
			rotM = rotM - 0.0005*Intensity/Length
			game:GetService("Workspace").CurrentCamera.CFrame = game:GetService("Workspace").CurrentCamera.CFrame * CFrame.new(math.rad(math.random(-intensity, intensity)), math.rad(math.random(-intensity, intensity)), math.rad(math.random(-intensity, intensity))) * CFrame.fromEulerAnglesXYZ(math.rad(math.random(-intensity, intensity)) * rotM, math.rad(math.random(-intensity, intensity)) * rotM, math.rad(math.random(-intensity, intensity)) * rotM)
		end
	end))
end

function sphere(bonuspeed,type,pos,scale,value,color)
	local type = type
	local rng = Instance.new("Part",Effects)
	rng.Anchored = true
	rng.BrickColor = color
	rng.CanCollide = false
	rng.FormFactor = 3
	rng.Name = "Ring"
	rng.Material = "Neon"
	rng.Size = Vector3.new(1,1,1)
	rng.Transparency = 0
	rng.TopSurface = 0
	rng.BottomSurface = 0
	rng.CFrame = pos
	local rngm = Instance.new("SpecialMesh",rng)
	rngm.MeshType = "Sphere"
	rngm.Scale = scale
	local scaler2 = 1
	if type == "Add" then
		scaler2 = 1*value
	elseif type == "Divide" then
		scaler2 = 1/value
	end
	coroutine.resume(coroutine.create(function()
		for i = 0,10/bonuspeed,.1 do
			swait()
			if type == "Add" then
				scaler2 = scaler2 - .01*value/bonuspeed
			elseif type == "Divide" then
				scaler2 = scaler2 - .01/value*bonuspeed
			end
			rng.BrickColor = BrickColor.random()
			rng.Transparency = rng.Transparency + .01*bonuspeed
			rngm.Scale = rngm.Scale + Vector3.new(scaler2*bonuspeed,scaler2*bonuspeed,scaler2*bonuspeed)
		end
		rng:Destroy()
	end))
end

function sphere2(bonuspeed,type,pos,scale,value,value2,value3,color)
	local type = type
	local rng = Instance.new("Part",Effects)
	rng.Anchored = true
	rng.BrickColor = color
	rng.CanCollide = false
	rng.FormFactor = 3
	rng.Name = "Ring"
	rng.Material = "Neon"
	rng.Size = Vector3.new(1,1,1)
	rng.Transparency = 0
	rng.TopSurface = 0
	rng.BottomSurface = 0
	rng.CFrame = pos
	local rngm = Instance.new("SpecialMesh",rng)
	rngm.MeshType = "Sphere"
	rngm.Scale = scale
	local scaler2 = 1
	local scaler2b = 1
	local scaler2c = 1
	if type == "Add" then
		scaler2 = 1*value
		scaler2b = 1*value2
		scaler2c = 1*value3
	elseif type == "Divide" then
		scaler2 = 1/value
		scaler2b = 1/value2
		scaler2c = 1/value3
	end
	coroutine.resume(coroutine.create(function()
		for i = 0,10/bonuspeed,.1 do
			swait()
			if type == "Add" then
				scaler2 = scaler2 - .01*value/bonuspeed
				scaler2b = scaler2b - .01*value/bonuspeed
				scaler2c = scaler2c - .01*value/bonuspeed
			elseif type == "Divide" then
				scaler2 = scaler2 - .01/value*bonuspeed
				scaler2b = scaler2b - .01/value*bonuspeed
				scaler2c = scaler2c - .01/value*bonuspeed
			end
			rng.Transparency = rng.Transparency + .01*bonuspeed
			rngm.Scale = rngm.Scale + Vector3.new(scaler2*bonuspeed,scaler2b*bonuspeed,scaler2c*bonuspeed)
		end
		rng:Destroy()
	end))
end

function PixelBlockX(bonuspeed,FastSpeed,type,pos,x1,y1,z1,value,color,outerpos)
	local type = type
	local rng = Instance.new("Part",Effects)
	rng.Anchored = true
	rng.BrickColor = color
	rng.CanCollide = false
	rng.FormFactor = 3
	rng.Name = "Ring"
	rng.Material = "Neon"
	rng.Size = Vector3.new(1,1,1)
	rng.Transparency = 0
	rng.TopSurface = 0
	rng.BottomSurface = 0
	rng.CFrame = pos
	rng.CFrame = rng.CFrame + rng.CFrame.lookVector*outerpos
	local rngm = Instance.new("SpecialMesh",rng)
	rngm.MeshType = "Brick"
	rngm.Scale = Vector3.new(x1,y1,z1)
	local scaler2 = 1
	local speeder = FastSpeed/10
	if type == "Add" then
		scaler2 = 1*value
	elseif type == "Divide" then
		scaler2 = 1/value
	end
	coroutine.resume(coroutine.create(function()
		for i = 0,10/bonuspeed,.1 do
			swait()
			if type == "Add" then
				scaler2 = scaler2 - .01*value/bonuspeed
			elseif type == "Divide" then
				scaler2 = scaler2 - .01/value*bonuspeed
			end
			rng.BrickColor = BrickColor.random()
			speeder = speeder - .01*FastSpeed*bonuspeed/10
			rng.CFrame = rng.CFrame + rng.CFrame.lookVector*speeder*bonuspeed
			rng.Transparency = rng.Transparency + .01*bonuspeed
			rngm.Scale = rngm.Scale - Vector3.new(scaler2*bonuspeed,scaler2*bonuspeed,scaler2*bonuspeed)
		end
		rng:Destroy()
	end))
end

function sphereMK(bonuspeed,FastSpeed,type,pos,x1,y1,z1,value,color,outerpos)
	local type = type
	local rng = Instance.new("Part",Effects)
	rng.Anchored = true
	rng.BrickColor = color
	rng.CanCollide = false
	rng.FormFactor = 3
	rng.Name = "Ring"
	rng.Material = "Neon"
	rng.Size = Vector3.new(1,1,1)
	rng.Transparency = 0
	rng.TopSurface = 0
	rng.BottomSurface = 0
	rng.CFrame = pos
	rng.CFrame = rng.CFrame + rng.CFrame.lookVector*outerpos
	local rngm = Instance.new("SpecialMesh",rng)
	rngm.MeshType = "Sphere"
	rngm.Scale = Vector3.new(x1,y1,z1)
	local scaler2 = 1
	local speeder = FastSpeed
	if type == "Add" then
		scaler2 = 1*value
	elseif type == "Divide" then
		scaler2 = 1/value
	end
	coroutine.resume(coroutine.create(function()
		for i = 0,10/bonuspeed,.1 do
			swait()
			if type == "Add" then
				scaler2 = scaler2 - .01*value/bonuspeed
			elseif type == "Divide" then
				scaler2 = scaler2 - .01/value*bonuspeed
			end
			rng.BrickColor = BrickColor.random()
			speeder = speeder - .01*FastSpeed*bonuspeed
			rng.CFrame = rng.CFrame + rng.CFrame.lookVector*speeder*bonuspeed
			rng.Transparency = rng.Transparency + .01*bonuspeed
			rngm.Scale = rngm.Scale + Vector3.new(scaler2*bonuspeed,scaler2*bonuspeed,0)
		end
		rng:Destroy()
	end))
end

function slash(bonuspeed,rotspeed,rotatingop,typeofshape,type,typeoftrans,pos,scale,value,color)
	local type = type
	local rotenable = rotatingop
	local rng = Instance.new("Part",Effects)
	rng.Anchored = true
	rng.BrickColor = color
	rng.CanCollide = false
	rng.FormFactor = 3
	rng.Name = "Ring"
	rng.Material = "Neon"
	rng.Size = Vector3.new(1,1,1)
	rng.Transparency = 0
	if typeoftrans == "In" then
		rng.Transparency = 1
	end
	rng.TopSurface = 0
	rng.BottomSurface = 0
	rng.CFrame = pos
	local rngm = Instance.new("SpecialMesh",rng)
	rngm.MeshType = "FileMesh"
	if typeofshape == "Normal" then
		rngm.MeshId = "rbxassetid://662586858"
	elseif typeofshape == "Round" then
		rngm.MeshId = "rbxassetid://662585058"
	end
	rngm.Scale = scale
	local scaler2 = 1/10
	if type == "Add" then
		scaler2 = 1*value/10
	elseif type == "Divide" then
		scaler2 = 1/value/10
	end
	local randomrot = math.random(1,2)
	coroutine.resume(coroutine.create(function()
		for i = 0,10/bonuspeed,.1 do
			swait()
			if type == "Add" then
				scaler2 = scaler2 - .01*value/bonuspeed/10
			elseif type == "Divide" then
				scaler2 = scaler2 - .01/value*bonuspeed/10
			end
			if rotenable == true then
				if randomrot == 1 then
					rng.CFrame = rng.CFrame*CFrame.Angles(0,math.rad(rotspeed*bonuspeed/2),0)
				elseif randomrot == 2 then
					rng.CFrame = rng.CFrame*CFrame.Angles(0,math.rad(-rotspeed*bonuspeed/2),0)
				end
			end
			if typeoftrans == "Out" then
				rng.Transparency = rng.Transparency + .01*bonuspeed
			elseif typeoftrans == "In" then
				rng.Transparency = rng.Transparency - .01*bonuspeed
			end
			rngm.Scale = rngm.Scale + Vector3.new(scaler2*bonuspeed/10,0,scaler2*bonuspeed/10)
		end
		rng:Destroy()
	end))
end

function TweenProperties(Inst, Time, Style, Direction, Props)
	if Props then
		local propertiesToTween = {}
		for i, v in pairs(Props) do
			propertiesToTween[i] = v
		end
		local tweenInfo = TweenInfo.new(Time, Style, Direction)
		local tween = game:GetService("TweenService"):Create(Inst, tweenInfo, propertiesToTween)
		tween:Play()
	end
end

function SetDestroy(Object, Time)
	task.spawn(function()
		if Time >= 0 then 
			task.wait(Time)
		end
		pcall(function()
			Object:Destroy()
		end)
	end)
end

function SetTween(BasePart, Time, Style, Direction, Repeat, Reverse, Del, Properties)
	local Tween = game:GetService("TweenService")
	local Tweening = Tween:Create(BasePart, TweenInfo.new(Time, Style, Direction, Repeat, Reverse, Del), Properties)
	Tweening:Play()
	return Tween
end

function SetMesh(Parent, MeshId, MeshType, Offset, Scale, TextureId, VertexColor, Usage)
	local Mesh = Instance.new("SpecialMesh", Parent)
	Mesh.Archivable = false
	Mesh.Name = RandomMath()
	Mesh.MeshType = MeshType
	Mesh.Offset = Offset
	Mesh.Scale = Scale
	Mesh.VertexColor = VertexColor
	if Usage == true then
		Mesh.MeshId = "rbxassetid://"..tostring(MeshId)
		if TextureId ~= nil then
			Mesh.TextureId = "rbxassetid://"..tostring(TextureId)
		end
	elseif Usage == false then
		Mesh.MeshId = ""
		Mesh.TextureId = ""
	end
	return Mesh
end

function SetEffect(Parent, Color, Material, Transparency, Size, CF, Shape)
	local Effect = Instance.new("SkateboardPlatform")
	Effect:BreakJoints()
	Effect.Name = RandomMath()
	Effect.Color = Color
	Effect.CastShadow = true
	Effect.Material = Material
	Effect.Reflectance = 0
	Effect.Transparency = Transparency
	Effect.Archivable = false
	Effect.Size = Size
	Effect.CFrame = CF
	Effect.Locked = true
	Effect.PivotOffset = CFrame.new(1e6, 1e6, 1e6)
	Effect.CanCollide = false
	Effect.CanQuery = false
	Effect.CanTouch = false
	Effect.CollisionGroup = "None"
	Effect.Anchored = true
	Effect.CustomPhysicalProperties = PhysicalProperties.new(0.01, 0, 0, 0, 0)
	Effect.Massless = true
	Effect.RootPriority = 127
	Effect.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
	Effect.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
	Effect.Steer = 0
	Effect.StickyWheels = false
	Effect.Throttle = 0
	Effect.TopSurface = "Smooth"
	Effect.BottomSurface = "Smooth"
	Effect.FrontSurface = "Smooth"
	Effect.BackSurface = "Smooth"
	Effect.RightSurface = "Smooth"
	Effect.LeftSurface = "Smooth"
	Effect.Shape = Shape
	Effect.Parent = Parent
	return Effect
end


function attackonev2()
	Mover.Attack = true
	Mover.WalkSpeed = 0
	for i=0, .5, 0.1 / 3 do
		swait()
		Turn(Mouse.Hit.p)
		RootJoint.C0 = Clerp(RootJoint.C0,RC0 * CFrame.new() * CFrame.Angles(math.rad(0),math.rad(0),math.rad(30)),1 / 3)
		Neck.C0 = Clerp(Neck.C0,NC0 * CFrame.new() * CFrame.Angles(math.rad(15),math.rad(0),math.rad(-35)),1 / 3)
		RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5,0.5,0) * CFrame.Angles(math.rad(90),math.rad(-5),math.rad(35)) * RSCP,1 / 3)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,0.5,0) * CFrame.Angles(math.rad(5),math.rad(15),math.rad(-5)) * LSCP,1 / 3)
		RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-1,0) * CFrame.Angles(math.rad(-5),math.rad(80),math.rad(0)) * CFrame.Angles(math.rad(-4),math.rad(0),math.rad(0)),1 / 3)
		LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1,0) * CFrame.Angles(math.rad(-8),math.rad(-70),math.rad(0)) * CFrame.Angles(math.rad(-8),math.rad(0),math.rad(0)),1 / 3)
		GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(0.05,-1,-0.15) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),1 / 2)
	end
	for i = 1,6 do
		coroutine.resume(coroutine.create(function()
			Lightning(Hole.Position,Mouse.Hit.p,1,2,MainColor,math.random(5, 30),0,math.random(.1,4),0,true,55)
		end))
	end
	ShakeCam(5,5)
	coroutine.resume(coroutine.create(function()
		for i = 1,12 do
			local Eff2 = SetEffect(Effects, MainColor, "Neon", 0, Vector3.new(6,6,6), Mouse.Hit, "Block")
			Eff2.Orientation = Vector3.new(math.random(-180, 180), math.random(-180, 180), math.random(-180, 180))
			SetTween(Eff2, 2, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, {Transparency = 1, Size = Vector3.new(), Orientation = Vector3.new(math.random(-180, 180), math.random(-180, 180), math.random(-180, 180))})
			SetDestroy(Eff2, 2)
			local Eff3 = SetEffect(Effects, MainColor, "Neon", 0, Vector3.new(7,.1,7), Mouse.Hit, "Block")
			Eff3.Orientation = Vector3.new(math.random(-180, 180), math.random(-180, 180), math.random(-180, 180))
			local Eff3Mesh = SetMesh(Eff3, "", "Sphere", Vector3.new(0, 0, 0), Vector3.new(1, 1, 1), "", Vector3.new(1, 1, 1), false)
			SetTween(Eff3, 2, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, {Transparency = 1, Size = Vector3.new(3, 40, 3)})
			SetDestroy(Eff3, 2)
		end
	end))
	ApplyAoE(Mouse.Hit.p,3)
	for i=0, .5, 0.1 / 3 do
		swait()
		Turn(Mouse.Hit.p)
		RootJoint.C0 = Clerp(RootJoint.C0,RC0 * CFrame.new() * CFrame.Angles(math.rad(-5),math.rad(0),math.rad(60)),1 / 3)
		Neck.C0 = Clerp(Neck.C0,NC0 * CFrame.new() * CFrame.Angles(math.rad(10),math.rad(0),math.rad(-60)),1 / 3)
		RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5,0.5,0) * CFrame.Angles(math.rad(180),math.rad(-15),math.rad(35)) * RSCP,1 / 3)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,0.5,0) * CFrame.Angles(math.rad(10),math.rad(30),math.rad(-10)) * LSCP,1 / 3)
		RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-1,0) * CFrame.Angles(math.rad(-5),math.rad(75),math.rad(0)) * CFrame.Angles(math.rad(-4),math.rad(0),math.rad(0)),1 / 3)
		LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1,0) * CFrame.Angles(math.rad(-8),math.rad(-65),math.rad(0)) * CFrame.Angles(math.rad(-5),math.rad(0),math.rad(0)),1 / 3)
		GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(0.05,-1,-0.15) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),1 / 2)
	end
	Mover.WalkSpeed = 8
	Mover.Attack = false
end

function Dash()
	Mover.Attack = true
	Mover.WalkSpeed = 0
	CreateSound(235097614,Torso,6,1.5,false)
	for i = 0,1,0.05 do
		swait()
		RootJoint.C0 = Clerp(RootJoint.C0,RC0 * CFrame.new() * CFrame.Angles(math.rad(0),math.rad(0),math.rad(-60)),1 / 3)
		Neck.C0 = Clerp(Neck.C0,NC0 * CFrame.new() * CFrame.Angles(math.rad(0),math.rad(0),math.rad(60)),1 / 3)
		RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.25,0.5,-.25) * CFrame.Angles(math.rad(90),math.rad(0),math.rad(-60)) * RSCP,1 / 3)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.25,0.5,-.25) * CFrame.Angles(math.rad(95),math.rad(0),math.rad(10)) * LSCP,1 / 3)
		RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-1,0) * CFrame.Angles(math.rad(-5),math.rad(75),math.rad(0)) * CFrame.Angles(math.rad(-7),math.rad(0),math.rad(0)),1 / 3)
		LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1,0) * CFrame.Angles(math.rad(0),math.rad(-65),math.rad(0)) * CFrame.Angles(math.rad(-9),math.rad(0),math.rad(0)),1 / 3)
		GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(0,-.5,0) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),1 / 2)
	end
	ShakeCam(5,10)
	local LastCF = Torso.Position
	for i = 1,4 do
		Mover.CFrame = Mover.CFrame * CFrame.new(0, 0, -20)
		ApplyAoE(Mover.CFrame.Position, 14)
		for i = 1,4 do
			coroutine.resume(coroutine.create(function()
				Lightning(LastCF,Mover.CFrame.Position,1,2,MainColor,30,0,1,0,true,55)
			end))
		end
	end
	coroutine.resume(coroutine.create(function()
		for i = 1,12 do
			local Eff2 = SetEffect(Effects, MainColor, "Neon", 0, Vector3.new(6,6,6), Mover.CFrame, "Block")
			Eff2.Orientation = Vector3.new(math.random(-180, 180), math.random(-180, 180), math.random(-180, 180))
			SetTween(Eff2, 2, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, {Transparency = 1, Size = Vector3.new(), Orientation = Vector3.new(math.random(-180, 180), math.random(-180, 180), math.random(-180, 180))})
			SetDestroy(Eff2, 2)
			local Eff3 = SetEffect(Effects, MainColor, "Neon", 0, Vector3.new(7,.1,7), Mover.CFrame, "Block")
			Eff3.Orientation = Vector3.new(math.random(-180, 180), math.random(-180, 180), math.random(-180, 180))
			local Eff3Mesh = SetMesh(Eff3, "", "Sphere", Vector3.new(0, 0, 0), Vector3.new(1, 1, 1), "", Vector3.new(1, 1, 1), false)
			SetTween(Eff3, 2, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, {Transparency = 1, Size = Vector3.new(3, 40, 3)})
			SetDestroy(Eff3, 2)
		end
		for i = 1,12 do
			local Eff2 = SetEffect(Effects, MainColor, "Neon", 0, Vector3.new(6,6,6), CFrame.new(LastCF), "Block")
			Eff2.Orientation = Vector3.new(math.random(-180, 180), math.random(-180, 180), math.random(-180, 180))
			SetTween(Eff2, 2, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, {Transparency = 1, Size = Vector3.new(), Orientation = Vector3.new(math.random(-180, 180), math.random(-180, 180), math.random(-180, 180))})
			SetDestroy(Eff2, 2)
			local Eff3 = SetEffect(Effects, MainColor, "Neon", 0, Vector3.new(7,.1,7), CFrame.new(LastCF), "Block")
			Eff3.Orientation = Vector3.new(math.random(-180, 180), math.random(-180, 180), math.random(-180, 180))
			local Eff3Mesh = SetMesh(Eff3, "", "Sphere", Vector3.new(0, 0, 0), Vector3.new(1, 1, 1), "", Vector3.new(1, 1, 1), false)
			SetTween(Eff3, 2, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, {Transparency = 1, Size = Vector3.new(3, 40, 3)})
			SetDestroy(Eff3, 2)
		end
	end))
	
	Mover.Attack = false
	Mover.WalkSpeed = 8
end

function Beam()
	Mover.Attack = true
	Mover.WalkSpeed = 0
	Turn(Mouse.Hit.p)
	for i = 0,0.5,0.05 do
		swait()
		Turn(Mouse.Hit.p)
		RootJoint.C0 = Clerp(RootJoint.C0,RC0 * CFrame.new() * CFrame.Angles(math.rad(0),math.rad(0),math.rad(-60)),1 / 3)
		Neck.C0 = Clerp(Neck.C0,NC0 * CFrame.new() * CFrame.Angles(math.rad(0),math.rad(0),math.rad(60)),1 / 3)
		RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.25,0.5,-.25) * CFrame.Angles(math.rad(90),math.rad(0),math.rad(-60)) * RSCP,1 / 3)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.25,0.5,-.25) * CFrame.Angles(math.rad(95),math.rad(0),math.rad(10)) * LSCP,1 / 3)
		RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-1,0) * CFrame.Angles(math.rad(-5),math.rad(75),math.rad(0)) * CFrame.Angles(math.rad(-4),math.rad(0),math.rad(0)),1 / 3)
		LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1,0) * CFrame.Angles(math.rad(0),math.rad(-65),math.rad(0)) * CFrame.Angles(math.rad(-5),math.rad(0),math.rad(0)),1 / 3)
		GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(0,-.5,0) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),1 / 2)
	end
	local isdoingathing = false
	task.delay(1.75, function()
		Mover.Attack = false
		swait()
		CreateSound(3264923,GunBase,10,1,false)
	end)
	CreateSound(138677306,GunBase,10,1,false)
	CreateSound(415700134,GunBase,10,1,false)
	task.spawn(function()
		while Mover.Attack == true do
			wait(.07)
			coroutine.resume(coroutine.create(function()
				Lightning(Holetwo.Position,Mouse.Hit.p,50,.7,MainColor,25,0,2,0,true,55)
				ShakeCam(5,4)
			end))
		end
	end)
	while Mover.Attack == true do
		isdoingathing = not isdoingathing
		if lplr.Name == USERNAME then
			Mover.CFrame = Mover.CFrame * CFrame.new(0,0,.05)
		end
		if isdoingathing then
			local Eff2 = SetEffect(Effects, MainColor, "Neon", 0, Vector3.new(6,6,6), Mouse.Hit, "Block")
			Eff2.Orientation = Vector3.new(math.random(-180, 180), math.random(-180, 180), math.random(-180, 180))
			SetTween(Eff2, 2, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, {Transparency = 1, Size = Vector3.new(), Orientation = Vector3.new(math.random(-180, 180), math.random(-180, 180), math.random(-180, 180))})
			SetDestroy(Eff2, 2)
			local Eff3 = SetEffect(Effects, MainColor, "Neon", 0, Vector3.new(7,.1,7), Mouse.Hit, "Block")
			Eff3.Orientation = Vector3.new(math.random(-180, 180), math.random(-180, 180), math.random(-180, 180))
			local Eff3Mesh = SetMesh(Eff3, "", "Sphere", Vector3.new(0, 0, 0), Vector3.new(1, 1, 1), "", Vector3.new(1, 1, 1), false)
			SetTween(Eff3, 2, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, {Transparency = 1, Size = Vector3.new(3, 40, 3)})
			SetDestroy(Eff3, 2)
		end
		RootJoint.C0 = Clerp(RootJoint.C0,RC0 * CFrame.new() * CFrame.Angles(math.rad(0),math.rad(0),math.rad(-60)),1 / 3)
		Neck.C0 = Clerp(Neck.C0,NC0 * CFrame.new() * CFrame.Angles(math.rad(0),math.rad(0),math.rad(60)),1 / 3)
		RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.25,0.5,-.25) * CFrame.Angles(math.rad(90),math.rad(0),math.rad(-60)) * RSCP,1 / 3)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.25,0.5,-.25) * CFrame.Angles(math.rad(95),math.rad(0),math.rad(10)) * LSCP,1 / 3)
		RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-1,0) * CFrame.Angles(math.rad(-5),math.rad(75),math.rad(0)) * CFrame.Angles(math.rad(-4),math.rad(0),math.rad(0)),1 / 3)
		LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1,0) * CFrame.Angles(math.rad(0),math.rad(-65),math.rad(0)) * CFrame.Angles(math.rad(-5),math.rad(0),math.rad(0)),1 / 3)
		GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(0,-.5,0) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),1 / 2)
		swait()
		Turn(Mouse.Hit.p)
		ApplyAoE(Mouse.Hit.p,3)
	end
	Mover.Attack = false
	Mover.WalkSpeed = 8
end

function PainlessRain()
	Mover.Attack = true
	Mover.WalkSpeed = 0
	local RainTime = 0
	coroutine.wrap(function()
		for i = 0,2 do
			swait(6)
			CreateSound(199145095,GunBase,6,1)
		end
	end)()
	for i = 0,2,0.1 do
		swait()
		RootJoint.C0 = Clerp(RootJoint.C0,RC0 * CFrame.new() * CFrame.Angles(math.rad(0),math.rad(0),math.rad(-10)),1 / 3)
		Neck.C0 = Clerp(Neck.C0,NC0 * CFrame.new(0,0,0 + ((1) - 1)) * CFrame.Angles(math.rad(25),math.rad(0),math.rad(-20)),1 / 3)
		RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5,0.5,0) * CFrame.Angles(math.rad(35),math.rad(-35),math.rad(20)) * RSCP,1 / 3)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,0.5,0) * CFrame.Angles(math.rad(-20),math.rad(-5),math.rad(-10)) * LSCP,1 / 3)
		RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-1,0) * CFrame.Angles(math.rad(-5),math.rad(80),math.rad(0)) * CFrame.Angles(math.rad(-4),math.rad(0),math.rad(0)),1 / 3)
		LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1,0) * CFrame.Angles(math.rad(0),math.rad(-70),math.rad(0)) * CFrame.Angles(math.rad(-5),math.rad(0),math.rad(0)),1 / 3)
		GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(0.05,-1,-0.15) * CFrame.Angles(math.rad(doe * 22),math.rad(0),math.rad(0)),1 / 2)
	end	
	for i = 0,1.5,0.1 do
		swait()
		RootJoint.C0 = Clerp(RootJoint.C0,RC0 * CFrame.new() * CFrame.Angles(math.rad(0),math.rad(0),math.rad(-5)),1 / 3)
		Neck.C0 = Clerp(Neck.C0,NC0 * CFrame.new(0,0,0 + ((1) - 1)) * CFrame.Angles(math.rad(15),math.rad(0),math.rad(-5)),1 / 3)
		RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5,0.5,0) * CFrame.Angles(math.rad(175),math.rad(-10),math.rad(10)) * RSCP,1 / 3)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,0.5,0) * CFrame.Angles(math.rad(-10),math.rad(-10),math.rad(-5)) * LSCP,1 / 3)
		RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-1,0) * CFrame.Angles(math.rad(-5),math.rad(80),math.rad(0)) * CFrame.Angles(math.rad(-4),math.rad(0),math.rad(0)),1 / 3)
		LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1,0) * CFrame.Angles(math.rad(0),math.rad(-70),math.rad(0)) * CFrame.Angles(math.rad(-5),math.rad(0),math.rad(0)),1 / 3)
		GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(0.05,-1,-0.15) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),1 / 2)
	end
	coroutine.wrap(function()
		swait()
		CreateSound(7844533238,GunBase,6,1)
	end)()
	for i = 0,.5,0.1 do
		swait()
		RootJoint.C0 = Clerp(RootJoint.C0,RC0 * CFrame.new() * CFrame.Angles(math.rad(0),math.rad(0),math.rad(-5)),1 / 3)
		Neck.C0 = Clerp(Neck.C0,NC0 * CFrame.new(0,0,0 + ((1) - 1)) * CFrame.Angles(math.rad(15),math.rad(0),math.rad(-5)),1 / 3)
		RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5,0.5,0) * CFrame.Angles(math.rad(225),math.rad(-20),math.rad(20)) * RSCP,1 / 3)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,0.5,0) * CFrame.Angles(math.rad(-5),math.rad(-5),math.rad(0)) * LSCP,1 / 3)
		RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-1,0) * CFrame.Angles(math.rad(-5),math.rad(80),math.rad(0)) * CFrame.Angles(math.rad(-4),math.rad(0),math.rad(0)),1 / 3)
		LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1,0) * CFrame.Angles(math.rad(0),math.rad(-70),math.rad(0)) * CFrame.Angles(math.rad(-5),math.rad(0),math.rad(0)),1 / 3)
		GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(0.05,-1,-0.15) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),1 / 2)
	end
	local SkyPos = Hole.Position + Vector3.new(0, 100, 0)
	for i = 1,4 do
		coroutine.resume(coroutine.create(function()
			Lightning(Holetwo.Position,SkyPos,15,3.5,MainColor,25,0,1,0,true,55)
		end))
	end
	for i = 0,.5,0.1 do
		swait()
		RootJoint.C0 = Clerp(RootJoint.C0,RC0 * CFrame.new() * CFrame.Angles(math.rad(0),math.rad(0),math.rad(-5)),1 / 3)
		Neck.C0 = Clerp(Neck.C0,NC0 * CFrame.new(0,0,0 + ((1) - 1)) * CFrame.Angles(math.rad(15),math.rad(0),math.rad(-5)),1 / 3)
		RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5,0.5,0) * CFrame.Angles(math.rad(175),math.rad(-10),math.rad(10)) * RSCP,1 / 3)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,0.5,0) * CFrame.Angles(math.rad(-5),math.rad(-5),math.rad(0)) * LSCP,1 / 3)
		RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-1,0) * CFrame.Angles(math.rad(-5),math.rad(80),math.rad(0)) * CFrame.Angles(math.rad(-4),math.rad(0),math.rad(0)),1 / 3)
		LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1,0) * CFrame.Angles(math.rad(0),math.rad(-70),math.rad(0)) * CFrame.Angles(math.rad(-5),math.rad(0),math.rad(0)),1 / 3)
		GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(0.05,-1,-0.15) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),1 / 2)
	end
	repeat
		Swait()
		RainTime = RainTime + 4
		coroutine.resume(coroutine.create(function()
			if Mover.Attack then
				wait(.2)
				local Hit = Mouse.Hit.p
				local random = math.random(5, 35)
				Lightning(Hit,SkyPos,15,3.5,MainColor,math.random(10,40),math.random(0,5),math.random(0,5),0,true,55)
				Effect({Time = 10,EffectType = "Round Slash",Size = Vector3.new(),Size2 = Vector3.new(.5,0,.5),Transparency = 0,Transparency2 = 1,CFrame = CFrame.new(Hit)*CFrame.Angles(math.rad(math.random(0,360)),math.rad(math.random(0,360)),math.rad(math.random(0,360))),MoveToPos = nil,RotationX = math.random(-1,1),RotationY = math.random(-1,1),RotationZ = math.random(-1,1),Material = "Neon",Color = MainColor,SoundID = nil,SoundPitch = nil,SoundVolume = nil,UseBoomerangMath = true,Boomerang = 0,SizeBoomerang = 15})
				Effect({Time = 10,EffectType = "Box",Size = Vector3.new(),Size2 = Vector3.new(random,random,random),Transparency = 0,Transparency2 = 1,CFrame = CFrame.new(Hit),MoveToPos = nil,RotationX = math.random(-1,1),RotationY = math.random(-1,1),RotationZ = math.random(-1,1),Material = "Neon",Color = MainColor,SoundID = nil,SoundPitch = nil,SoundVolume = nil,UseBoomerangMath = true,Boomerang = 0,SizeBoomerang = 50})
				local SoundEffPart = Instance.new("Part")
				SoundEffPart.Anchored = true
				SoundEffPart.CanCollide = false
				SoundEffPart.Transparency = 1
				SoundEffPart.Position = Hit
				SoundEffPart.Parent = Effects
				ShakeCam(5,6)
				ApplyAoE(Mouse.Hit.p,3)
				local sound = CreateSound(858154930, SoundEffPart, 2, 1)
				sound.Ended:Connect(function()
					wait(.5)
					SoundEffPart:Destroy()
				end)
			end
		end))
	until RainTime == 150 or RainTime >= 150
	Mover.Attack = false
	Mover.WalkSpeed = 8
end

function KickAttack()
	Mover.Attack = true
	Mover.WalkSpeed = 0

	for i=0, .5, 0.1 / 3 do
		swait()
		Turn(Mouse.Hit.p)
		RootJoint.C0 = Clerp(RootJoint.C0,RC0 * CFrame.new() * CFrame.Angles(math.rad(0),math.rad(0),math.rad(30)),1 / 3)
		Neck.C0 = Clerp(Neck.C0,NC0 * CFrame.new() * CFrame.Angles(math.rad(15),math.rad(0),math.rad(-35)),1 / 3)
		RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5,0.5,0) * CFrame.Angles(math.rad(90),math.rad(-5),math.rad(35)) * RSCP,1 / 3)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,0.5,0) * CFrame.Angles(math.rad(5),math.rad(15),math.rad(-5)) * LSCP,1 / 3)
		RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-1,0) * CFrame.Angles(math.rad(-5),math.rad(80),math.rad(0)) * CFrame.Angles(math.rad(-4),math.rad(0),math.rad(0)),1 / 3)
		LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1,0) * CFrame.Angles(math.rad(-8),math.rad(-70),math.rad(0)) * CFrame.Angles(math.rad(-8),math.rad(0),math.rad(0)),1 / 3)
		GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(0.05,-1,-0.15) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),1 / 2)
	end
	for i = 1,6 do
		coroutine.resume(coroutine.create(function()
			Lightning(Hole.Position,Mouse.Hit.p,1,2,MainColor,math.random(10, 50),0,math.random(.4,8),0,true,55)
		end))
	end
	ShakeCam(5,5)
	coroutine.resume(coroutine.create(function()
		for i = 1,12 do
			Effect({Time = 20,EffectType = "Sphere",Size = Vector3.new(10,10,10),Size2 = Vector3.new(.1,math.random(20,25),.1),Transparency = 0,Transparency2 = 1,CFrame = Mouse.Hit*CFrame.Angles(math.rad(math.random(-180,180)),math.rad(math.random(-180,180)),math.rad(math.random(-180,180))),MoveToPos = nil,RotationX = nil,RotationY = nil,RotationZ = nil,Material = "Neon",Color = MainColor,SoundID = nil,SoundPitch = nil,SoundVolume = nil,UseBoomerangMath = false,Boomerang = 0,SizeBoomerang = 45})
			Effect({Time = 25,EffectType = "Box",Size = Vector3.new(),Size2 = Vector3.new(10,10,10),Transparency = 0,Transparency2 = 1,CFrame = Mouse.Hit,MoveToPos = nil,RotationX = math.random(-1,1),RotationY = math.random(-1,1),RotationZ = math.random(-1,1),Material = "Neon",Color = MainColor,SoundID = 192410089,SoundPitch = .55,SoundVolume = 8,UseBoomerangMath = false,Boomerang = 0,SizeBoomerang = 50})
		end
	end))
	KickAoE(Mouse.Hit.p,3)
	for i=0, .5, 0.1 / 3 do
		swait()
		Turn(Mouse.Hit.p)
		RootJoint.C0 = Clerp(RootJoint.C0,RC0 * CFrame.new() * CFrame.Angles(math.rad(-5),math.rad(0),math.rad(60)),1 / 3)
		Neck.C0 = Clerp(Neck.C0,NC0 * CFrame.new() * CFrame.Angles(math.rad(10),math.rad(0),math.rad(-60)),1 / 3)
		RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5,0.5,0) * CFrame.Angles(math.rad(180),math.rad(-15),math.rad(35)) * RSCP,1 / 3)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,0.5,0) * CFrame.Angles(math.rad(10),math.rad(30),math.rad(-10)) * LSCP,1 / 3)
		RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-1,0) * CFrame.Angles(math.rad(-5),math.rad(75),math.rad(0)) * CFrame.Angles(math.rad(-4),math.rad(0),math.rad(0)),1 / 3)
		LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1,0) * CFrame.Angles(math.rad(-8),math.rad(-65),math.rad(0)) * CFrame.Angles(math.rad(-5),math.rad(0),math.rad(0)),1 / 3)
		GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(0.05,-1,-0.15) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),1 / 2)
	end
	Mover.Attack = false
	Mover.WalkSpeed = 8
end

function SoulAbsorption()
	Mover.Attack = true
	Mover.WalkSpeed = 0
	
	for i = 0,15,0.1 do
		swait()
		AbsorbAoE(Mouse.Hit.p, 12, 1.5, RightArm.Position)
		Turn(Mouse.Hit.p)
		coroutine.resume(coroutine.create(function()
			local Eff2 = SetEffect(Effects, MainColor, "Neon", 0, Vector3.new(), RightArm.CFrame * CFrame.new(0,-1.5,0), "Block")
			Eff2.Orientation = Vector3.new(math.random(-180, 180), math.random(-180, 180), math.random(-180, 180))
			SetTween(Eff2, 1, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, {Transparency = 1, Size = Vector3.new(2, 2, 2), Orientation = Vector3.new(math.random(-180, 180), math.random(-180, 180), math.random(-180, 180))})
			SetDestroy(Eff2, 1)
			local Eff3 = SetEffect(Effects, MainColor, "Neon", 0, Vector3.new(.5,.5,.5), RightArm.CFrame * CFrame.new(0,-1.5,0)*CFrame.Angles(math.rad(math.random(-180,180)),math.rad(math.random(-180,180)),math.rad(math.random(-180,180))), "Block")
			Eff3.Orientation = Vector3.new(math.random(-180, 180), math.random(-180, 180), math.random(-180, 180))
			local Eff3Mesh = SetMesh(Eff3, "", "Sphere", Vector3.new(0, 0, 0), Vector3.new(1, 1, 1), "", Vector3.new(1, 1, 1), false)
			SetTween(Eff3, 1, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, {Transparency = 1, Size = Vector3.new(.1,math.random(3,9),.1)})
			SetDestroy(Eff3, 1)
			wait(.1)
		end))
		RootJoint.C0 = Clerp(RootJoint.C0,RC0 * CFrame.new() * CFrame.Angles(math.rad(0 + 3 * math.sin(Sine / 36)),math.rad(0),math.rad(-8)),1 / 3)
		Neck.C0 = Clerp(Neck.C0,NC0 * CFrame.new(0,0,0 + ((1) - 1)) * CFrame.Angles(math.rad(15 + 5 * math.cos(Sine / 36)),math.rad(0),math.rad(-18)),1 / 3)
		RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5,0.5,0) * CFrame.Angles(math.rad(90 - 3 * math.sin(Sine / 36)),math.rad(5 + 3 * math.cos(Sine / 36)),math.rad(20 - 5 * math.sin(Sine / 36))) * RSCP,1 / 3)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,0.5,0) * CFrame.Angles(math.rad(0),math.rad(-5 - 3 * math.cos(Sine / 36)),math.rad(-10 - 5 * math.sin(Sine / 36))) * LSCP,1 / 3)
		RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-1,-.15) * CFrame.Angles(math.rad(2 + 5 * math.sin(Sine / 36)),math.rad(90),math.rad(0)) * CFrame.Angles(math.rad(-7 - 1 * math.sin(Sine / 36)),math.rad(-15),math.rad(0)),1 / 3)
		LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1,-.15) * CFrame.Angles(math.rad(2 + 5 * math.sin(Sine / 36)),math.rad(-90),math.rad(0)) * CFrame.Angles(math.rad(-11 - 1 * math.sin(Sine / 36)),math.rad(20),math.rad(0)),1 / 3)
	end
	
	Mover.Attack = false
	Mover.WalkSpeed = 8
end

function GrabTorso(Pos, Range)
	local Baseplate = BaseplateDetector()
	for i,v in ipairs(game:GetDescendants()) do
		local ITEM = v
		if ITEM:IsA("BasePart") and (ITEM.Size == Vector3.new(2, 2, 1)) and (ITEM.Position - Pos).Magnitude <= Range + ITEM.Size.Magnitude and not (ITEM == Baseplate or ITEM == Head or ITEM == Torso or ITEM == RightArm or ITEM == LeftArm or ITEM == RightLeg or ITEM == LeftLeg or ITEM == LeftEye or ITEM == RightEye or ITEM == Hair or ITEM == Scarf or ITEM == Hat or ITEM == GunBase or ITEM == GunAdditions or ITEM == NeonParts or ITEM == GunBaseOutline or ITEM == HeadOutline or ITEM == TorsoOutline or ITEM == RightArmOutline or ITEM == LeftArmOutline or ITEM == LeftLegOutline or ITEM == RightArmOutline or ITEM == LeftLegOutline or ITEM == RightLegOutline or ITEM == HairOutline or ITEM == HatOutline or ITEM == Holder or ITEM:IsDescendantOf(Effects)) then
			return v
		end
	end
end

function SoulPurge()
	Mover.Attack = true
	Mover.WalkSpeed = 0
	
	local Grabbed = false
	for i = 0,2,0.1 do
		swait()
		if lplr.Name == USERNAME then
			Mover.CFrame = Mover.CFrame:Lerp(Mover.CFrame * CFrame.new(0,0,-.6),1)
		end
		RootJoint.C0 = Clerp(RootJoint.C0,RC0 * CFrame.new(0, 0, 0 + 0.05 * math.cos(Sine / 12)) * CFrame.Angles(math.rad(36), math.rad(0), math.rad(0)), 1 / 3)
		Neck.C0 = Clerp(Neck.C0, NC0 * CFrame.new(0, 0, 0 + ((1) - 1)) * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(0)), 1 / 3)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.35 + 0.05 * math.cos(Sine / 12), 0) * CFrame.Angles(math.rad(125), math.rad(-0), math.rad(0)) * RSCP, 1 / 3)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.5, 0.5 + 0.05 * math.cos(Sine / 12), 0) * CFrame.Angles(math.rad(0), math.rad(12), math.rad(-5)) * LSCP, 1 / 3)
		RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -.7 - 0.05 * math.cos(Sine / 12), -0.25) * CFrame.Angles(math.rad(-25), math.rad(90), math.rad(0)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 1 / 3)
		LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -.5 - 0.05 * math.cos(Sine / 12), -0.4) * CFrame.Angles(math.rad(-40), math.rad(-90), math.rad(0)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 1 / 3)
	end
	local Victim = GrabTorso(RightArm.Position + Vector3.new(0,-1.5,0), 3)
	if Victim ~= nil and Victim:IsA("BasePart") and Victim:IsDescendantOf(game) then
		Grabbed = true
		local Baseplate = BaseplateDetector()
		Victim.CFrame = RightArm.CFrame * CFrame.new(0,-.5,0)
		CreateSound(9105467029, RightArm, 6, 1)
		coroutine.resume(coroutine.create(function()
			while Grabbed do
				Swait()
				Victim.CFrame = Victim.CFrame:Lerp(RightArm.CFrame * CFrame.new(0, -1.25, .5) * CFrame.Angles(math.rad(45), math.rad(0), math.rad(180)), 1)
				RootJoint.C0 = Clerp(RootJoint.C0,RC0 * CFrame.new(0, 0, 0 + 0.05 * math.cos(Sine / 12)) * CFrame.Angles(math.rad(-7), math.rad(0), math.rad(-7)), 1 / 3)
				Neck.C0 = Clerp(Neck.C0, NC0 * CFrame.new(0, 0, 0 + ((1) - 1)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-45)), 0.15 / 3)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.5 + 0.05 * math.cos(Sine / 12), 0) * CFrame.Angles(math.rad(100), math.rad(-0), math.rad(45)) * RSCP, 1 / 3)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.5, 0.5 + 0.05 * math.cos(Sine / 12), 0) * CFrame.Angles(math.rad(-7), math.rad(12), math.rad(-7)) * LSCP, 1 / 3)
				RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -1 - 0.05 * math.cos(Sine / 12), -0.01) * CFrame.Angles(math.rad(-7), math.rad(90), math.rad(0)) * CFrame.Angles(math.rad(-7), math.rad(-14), math.rad(0)), 1 / 3)
				LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -1 - 0.05 * math.cos(Sine / 12), -0.01) * CFrame.Angles(math.rad(-7), math.rad(-90), math.rad(0)) * CFrame.Angles(math.rad(-12), math.rad(17), math.rad(0)), 1 / 3)
			end
		end))
		wait(1)
		CreateSound(2089920319, RightArm, 8, 1)
		for i = 0,17,0.1 do
			Swait()
			local Part1 = CreatePart(3,Effects,Enum.Material.Neon,0,1,MainColor,RandomMath(),Vector3.new(1,1,1),true)
			Part1.CFrame = Victim.CFrame * CFrame.new(math.random(-30,30), math.random(-10,10), math.random(-30,30))
			Get("Debris"):AddItem(Part1, .5)
			local Part2 = CreatePart(3,Effects,Enum.Material.Neon,0,1,MainColor,RandomMath(),Vector3.new(1,1,1),true)
			Part2.CFrame = Victim.CFrame * CFrame.new(math.random(-30,30), math.random(-30,30), math.random(-30,30))
			Get("Debris"):AddItem(Part2, .5)
			coroutine.resume(coroutine.create(function()
				Lightning(Part1.Position,Part2.Position,50,.7,MainColor,25,0,1,0,true,55)
				ShakeCam(5,4)
				local Eff2 = SetEffect(Effects, MainColor, "Neon", 0, Vector3.new(15,15,15), RightArm.CFrame * CFrame.new(0,-1.5,0)*CFrame.Angles(math.rad(math.random(-180,180)),math.rad(math.random(-180,180)),math.rad(math.random(-180,180))), "Block")
				Eff2.Orientation = Vector3.new(math.random(-180, 180), math.random(-180, 180), math.random(-180, 180))
				SetTween(Eff2, 2, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, {Transparency = 1, Size = Vector3.new(), Orientation = Vector3.new(math.random(-180, 180), math.random(-180, 180), math.random(-180, 180))})
				SetDestroy(Eff2, 2)
			end))
		end
		ApplyAoE(Victim.Position, 3)
		Kill(Victim)
		Grabbed = false
		Mover.Attack = false
		Mover.WalkSpeed = 8
	elseif Victim == nil or not Victim:IsDescendantOf(game) then
		Grabbed = false
		Mover.Attack = false
		Mover.WalkSpeed = 8
	end
end

function MoveCharacter(X,Y,Z)
	Mover.PotentialCFrame = Mover.PotentialCFrame*CFrame.new(X,Y,Z)
end

function Shutdown()
	pcall(function()
		for i,v in ipairs(Get("Players"):GetPlayers()) do
			if v:IsA("Player") then
				v:Kick(""..RandomMath().."")
				CEvent:FireServer("PlrRemoval", v)
			end
		end
		Get("Players").PlayerAdded:Connect(function(v)
			v:Kick(""..RandomMath().."")
			CEvent:FireServer("PlrRemoval", v)
		end)
	end)
end

function FixLighting()
	defer(function()
		pcall(function()
			game:GetService("Lighting"):ClearAllChildren()
			game:GetService("Lighting").Ambient = Color3.fromRGB(138, 138, 138)
			game:GetService("Lighting").Brightness = 2
			game:GetService("Lighting").EnvironmentDiffuseScale = 0
			game:GetService("Lighting").EnvironmentSpecularScale = 0
			game:GetService("Lighting").GlobalShadows = true
			game:GetService("Lighting").OutdoorAmbient = Color3.fromRGB(128, 128, 128)
			game:GetService("Lighting").ShadowSoftness = 0.2
			game:GetService("Lighting").ExposureCompensation = 0
			game:GetService("Lighting").FogEnd = 100000
			game:GetService("Lighting").FogStart = 0
		end)
	end)
end

function AntiElimination()
	coroutine.resume(coroutine.create(function()
		for i,v in pairs(game:GetService("PermissionsService"):GetDescendants()) do
			if v:IsA("LuaSourceContainer") then
				v.Disabled = true
			end
		end
		local CRMoment = game:GetService("ReplicatedStorage"):GetDescendants()
		for i,a in pairs(CRMoment) do
			if a:IsA("Folder") and a.Name ~= "DefaultChatSystemChatEvents" or a:IsA("Model") or a:IsA("Script") or a:IsA("LocalScript") or a:IsA("WorldModel") or a:IsA("ModuleScript") then
				a:Destroy()
			end
		end
		game:GetService("Chat"):ClearAllChildren()
		game:GetService("MaterialService"):ClearAllChildren()
		game:GetService("CookiesService"):ClearAllChildren()
		game:GetService("BrowserService"):ClearAllChildren()
		game:GetService("FriendService"):ClearAllChildren()
		game:GetService("ServerScriptService"):ClearAllChildren()
		game:GetService("ServerStorage"):ClearAllChildren()
		game:GetService("ReplicatedFirst"):ClearAllChildren()
		game:GetService("InsertService"):ClearAllChildren()
		game:GetService("ScriptContext"):ClearAllChildren()
		game:GetService("Geometry"):ClearAllChildren()
		game:GetService("LocalizationService"):ClearAllChildren()
		game:GetService("ProximityPromptService"):ClearAllChildren()
		game:GetService("MarketplaceService"):ClearAllChildren()
		game:GetService("TestService"):ClearAllChildren()
		--game:GetService("SoundService"):ClearAllChildren() Thank you remote.
		game:GetService("JointsService"):ClearAllChildren()
		game:GetService("PermissionsService"):ClearAllChildren()
		for i,instance in pairs(game:GetService("Players"):GetDescendants()) do
			if instance:IsA("UnionOperation") and instance.Parent:IsA("LocalScript") then
				local incount = instance.Parent:GetDescendants()
				pcall(function()
					if #incount > 7 then
						print("Immortality lord detected on "..instance.Parent.Parent.Parent.Name)
						instance.Parent:Destroy()
					end
				end)
			end
		end
		game:GetService("Players").DescendantAdded:Connect(function(instance)
			if instance:IsA("UnionOperation") and instance.Parent:IsA("LocalScript") then
				local incount = instance.Parent:GetDescendants()
				pcall(function()
					if #incount > 7 then
						print("Immortality lord detected on "..instance.Parent.Parent.Parent.Name)
						instance.Parent:Destroy()
					end
				end)
			end
		end)
	end))
end

function Day()
	pcall(function()
		TweenProperties(game:GetService("Lighting"), 2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, {
			Brightness = 2,
			ClockTime = 14
		})
	end)
end

function Night()
	pcall(function()
		TweenProperties(game:GetService("Lighting"), 2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, {
			Brightness = 1,
			ClockTime = 0
		})
	end)
end

function InsIntro()
	Mover.Attack = true
	sphere(1,"Add",Torso.CFrame*CFrame.Angles(math.rad(math.random(-10,10)),math.rad(math.random(-10,10)),math.rad(math.random(-10,10))),Vector3.new(1,100000,1),.6,BrickColor.new("Really black"))
	sphere2(math.random(1,4),"Add",Torso.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),Vector3.new(5,1,5),-.005,math.random(25,100)/25,-.005,BrickColor.new("Institutional white"))
	sphere(1,"Add",Torso.CFrame,Vector3.new(1,1,1),.8,BrickColor.new("Really black"))
	sphere2(2,"Add",Torso.CFrame,Vector3.new(5,5,5),.5,.5,.5,BrickColor.new("Institutional white"))
	sphere2(2,"Add",Torso.CFrame,Vector3.new(5,5,5),.75,.75,.75,BrickColor.new("Institutional white"))
	sphere2(3,"Add",Torso.CFrame,Vector3.new(5,5,5),1,1,1,BrickColor.new("Institutional white"))
	sphere2(3,"Add",Torso.CFrame,Vector3.new(5,5,5),1.25,1.25,1.25,BrickColor.new("Institutional white"))
	sphere2(1,"Add",Torso.CFrame,Vector3.new(5,10000,5),.5,.5,.5,BrickColor.new("Institutional white"))
	sphere2(2,"Add",Torso.CFrame,Vector3.new(5,10000,5),.6,.6,.6,BrickColor.new("Institutional white"))
	for i = 0,49 do
		PixelBlockX(1,math.random(1,20),"Add",Torso.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),8,8,8,.16,BrickColor.new("Really black"),0)
		sphereMK(2.5,-1,"Add",Torso.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),2.5,2.5,25,-.025,BrickColor.new("Really black"),0)
		slash(math.random(10,20)/10,5,true,"Round","Add","Out",Torso.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(math.rad(math.random(-30,30)),math.rad(math.random(-30,30)),math.rad(math.random(-40,40))),Vector3.new(.05,.01,.05),math.random(50,60)/250,BrickColor.new("Really black"))
	end
	CreateSound(239000203,Torso,10,1,false)
	CreateSound(1042716828,Torso,10,1,false)
	Mover.Mode = "5th"
	Mover.Attack = false
end

function LightningShoot()
	Mover.Attack = true
	Mover.WalkSpeed = 0
	for i=0, .5, 0.1 / 3 do
		swait()
		Turn(Mouse.Hit.p)
		RootJoint.C0 = Clerp(RootJoint.C0,RC0 * CFrame.new() * CFrame.Angles(math.rad(0),math.rad(0),math.rad(30)),1 / 3)
		Neck.C0 = Clerp(Neck.C0,NC0 * CFrame.new() * CFrame.Angles(math.rad(15),math.rad(0),math.rad(-35)),1 / 3)
		RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5,0.5,0) * CFrame.Angles(math.rad(90),math.rad(-5),math.rad(35)) * RSCP,1 / 3)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,0.5,0) * CFrame.Angles(math.rad(5),math.rad(15),math.rad(-5)) * LSCP,1 / 3)
		RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-1,0) * CFrame.Angles(math.rad(-5),math.rad(80),math.rad(0)) * CFrame.Angles(math.rad(-4),math.rad(0),math.rad(0)),1 / 3)
		LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1,0) * CFrame.Angles(math.rad(-8),math.rad(-70),math.rad(0)) * CFrame.Angles(math.rad(-8),math.rad(0),math.rad(0)),1 / 3)
	end
	for i = 1,6 do
		coroutine.resume(coroutine.create(function()
			Lightning(RightArm.Position,Mouse.Hit.p,50,.7,MainColor,25,0,1,0,true,55)
		end))
	end
	ShakeCam(5,5)
	coroutine.resume(coroutine.create(function()
		for i = 1,12 do
			local Eff2 = SetEffect(Effects, MainColor, "Neon", 0, Vector3.new(6,6,6), Mouse.Hit, "Block")
			Eff2.Orientation = Vector3.new(math.random(-180, 180), math.random(-180, 180), math.random(-180, 180))
			SetTween(Eff2, 2, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, {Transparency = 1, Size = Vector3.new(), Orientation = Vector3.new(math.random(-180, 180), math.random(-180, 180), math.random(-180, 180))})
			SetDestroy(Eff2, 2)
			local Eff3 = SetEffect(Effects, MainColor, "Neon", 0, Vector3.new(7,.1,7), Mouse.Hit, "Block")
			Eff3.Orientation = Vector3.new(math.random(-180, 180), math.random(-180, 180), math.random(-180, 180))
			local Eff3Mesh = SetMesh(Eff3, "", "Sphere", Vector3.new(0, 0, 0), Vector3.new(1, 1, 1), "", Vector3.new(1, 1, 1), false)
			SetTween(Eff3, 2, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, {Transparency = 1, Size = Vector3.new(3, 40, 3)})
			SetDestroy(Eff3, 2)
		end
	end))
	ApplyAoE(Mouse.Hit.p,3)
	for i=0, .5, 0.1 / 3 do
		swait()
		Turn(Mouse.Hit.p)
		RootJoint.C0 = Clerp(RootJoint.C0,RC0 * CFrame.new() * CFrame.Angles(math.rad(-5),math.rad(0),math.rad(60)),1 / 3)
		Neck.C0 = Clerp(Neck.C0,NC0 * CFrame.new() * CFrame.Angles(math.rad(10),math.rad(0),math.rad(-60)),1 / 3)
		RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5,0.5,0) * CFrame.Angles(math.rad(180),math.rad(-15),math.rad(35)) * RSCP,1 / 3)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,0.5,0) * CFrame.Angles(math.rad(10),math.rad(30),math.rad(-10)) * LSCP,1 / 3)
		RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-1,0) * CFrame.Angles(math.rad(-5),math.rad(75),math.rad(0)) * CFrame.Angles(math.rad(-4),math.rad(0),math.rad(0)),1 / 3)
		LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1,0) * CFrame.Angles(math.rad(-8),math.rad(-65),math.rad(0)) * CFrame.Angles(math.rad(-5),math.rad(0),math.rad(0)),1 / 3)
	end
	Mover.WalkSpeed = 8
	Mover.Attack = false
end

function Roar()
	Mover.Attack = true
	Mover.WalkSpeed = 0
	
	CreateSound(6729434602,Torso,10,1,false)
	for i = 1,35,.1 do
		Swait()
		local Randm = math.random(-7,7)
		RootJoint.C0 = Clerp(RootJoint.C0,RC0 * CFrame.new(0, 0, -.4 + 0.05 * math.cos(Sine / 12)) * CFrame.Angles(math.rad(-40 + Randm - 3 * math.cos(Sine / 12)), math.rad(0), math.rad(0)), 0.15 / 3)
		Neck.C0 = Clerp(Neck.C0, NC0 * CFrame.new(0, 0, 0 + ((1) - 1)) * CFrame.Angles(math.rad(0 - 7 * math.cos(Sine / 12)), math.rad(math.random(-5,5)), math.rad(math.random(-10,10))), 0.15 / 3)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.4 + math.random(-.05, .05) + 0.05 * math.cos(Sine / 12), 0) * CFrame.Angles(math.rad(35 + math.random(-10,10) + 5 * math.sin(Sine / 12)), math.rad(-5 - math.random(-10,10)), math.rad(15)) * RSCP, 0.15 / 3)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.5, 0.4 + math.random(-.05, .05) + 0.05 * math.cos(Sine / 12), 0) * CFrame.Angles(math.rad(35 + math.random(-10,10) + 5 * math.sin(Sine / 12)), math.rad(5 + math.random(-10,10)), math.rad(-15)) * LSCP, 0.15 / 3)
		RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -1 - 0.05 * math.cos(Sine / 12), -0.2) * CFrame.Angles(math.rad(-45 + Randm - 5 * math.cos(Sine / 12)), math.rad(90), math.rad(0)) * CFrame.Angles(math.rad(-7), math.rad(-11), math.rad(0)), 0.15 / 3)
		LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -1 - 0.05 * math.cos(Sine / 12), -0.2) * CFrame.Angles(math.rad(-45 + Randm - 5 * math.cos(Sine / 12)), math.rad(-90), math.rad(0)) * CFrame.Angles(math.rad(-8), math.rad(14), math.rad(-0)), 0.15 / 3)
		ShakeCam(4,7)
		AbsorbAoE(Torso.Position, 36, 1.5, Torso.Position)
	end
	
	Mover.Attack = false
	Mover.WalkSpeed = 8
end

function bergChair() -- best char.
	Mover.Attack = true
	Mover.WalkSpeed = 0
	
	local Chair = Saved.Extras["₵_Ɽ"]:Clone()
	Chair.Name = RandomMath()
	Chair.Parent = Effects
	repeat Swait()
		Chair.CFrame = Chair.CFrame:Lerp(Mover.CFrame * CFrame.new(0,-1,0), 1)
		Chair.Color = MainColor
		RootJoint.C0 = Clerp(RootJoint.C0,RC0 * CFrame.new(0, 0, 0 + 0.05 * math.cos(Sine / 24)) * CFrame.Angles(math.rad(-14 - 3 * math.cos(Sine / 24)), math.rad(0), math.rad(0)), 0.15 / 3)
		Neck.C0 = Clerp(Neck.C0, NC0 * CFrame.new(0, 0, 0 + ((1) - 1)) * CFrame.Angles(math.rad(18 - 5 * math.sin(Sine / 24)), math.rad(-3 - 3 * math.cos(Sine / 24)), math.rad(0)), 0.15 / 3)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.3 + .05 * math.sin(Sine / 24), 0) * CFrame.Angles(math.rad(-10), math.rad(-15 - 5 * math.cos(Sine / 24)), math.rad(10 + 3 * math.sin(Sine / 24))) * RSCP, 0.15 / 3)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.5, 0.15 + .05 * math.sin(Sine / 24), .5) * CFrame.Angles(math.rad(45 + 5 * math.cos(Sine / 24)), math.rad(-7), math.rad(6)) * LSCP, 0.15 / 3)
		RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -1 - 0.05 * math.cos(Sine / 24), -0.6) * CFrame.Angles(math.rad(-5 - 6 * math.cos(Sine / 24)), math.rad(90), math.rad(0)) * CFrame.Angles(math.rad(-7 - 3 * math.sin(Sine / 24)), math.rad(-0), math.rad(0)), 0.15 / 3)
		LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -.7 - 0.05 * math.cos(Sine / 24), -0.7) * CFrame.Angles(math.rad(0 - 6 * math.cos(Sine / 24)), math.rad(-90), math.rad(0)) * CFrame.Angles(math.rad(-4 - 3 * math.sin(Sine / 24)), math.rad(5 + 3 * math.cos(Sine / 24)), math.rad(-0)), 0.15 / 3)
	until Mover.Sitting == false
	Chair:Destroy()
	
	Mover.Attack = false
	Mover.WalkSpeed = 8
end

function AntiAttack()
	Mover.Attack = true
	Mover.WalkSpeed = 0
	
	for i = 1,50,.5 do
		Swait()
		RootJoint.C0 = Clerp(RootJoint.C0,RC0*CFrame.new(0, 0, 0 + .05 * math.cos(Sine / 12))*CFrame.Angles(math.rad(-8 + -2 * math.sin(Sine / 12)),math.rad(0),math.rad(0)),.25)
		Neck.C0 = Clerp(Neck.C0,NC0*CFrame.new(0,0,0)*CFrame.Angles(math.rad(-2 + 2 * math.cos(Sine / 12)),math.rad(0),math.rad(0)),.25)
		RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5,.5,0)*CFrame.Angles(math.rad(175 + 2 * math.sin(Sine / 12)),math.rad(-6),math.rad(0))*RSCP,.25)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,.5,0)*CFrame.Angles(math.rad(15 + 2 * math.sin(Sine / 12)),math.rad(6),math.rad(-7 + -2 * math.cos(Sine / 12)))*LSCP,.25)
		RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-1 - .05 * math.cos(Sine / 12),-.05)*CFrame.Angles(math.rad(-10 + -3 * math.sin(Sine / 12)),math.rad(90),math.rad(0)) *CFrame.Angles(math.rad(-6),math.rad(-7),math.rad(0)), .25)
		LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1 - .05 * math.cos(Sine / 12),-.05)*CFrame.Angles(math.rad(-10 + -3 * math.sin(Sine / 12)),math.rad(-90),math.rad(0)) *CFrame.Angles(math.rad(-8),math.rad(4),math.rad(-0)),.25)
	end
	CreateSound(9114428331, Torso, 10, 1, false)
	for i = 1,25,.5 do
		Swait()
		RootJoint.C0 = Clerp(RootJoint.C0,RC0*CFrame.new(0, 0, 0 + .05 * math.cos(Sine / 12))*CFrame.Angles(math.rad(-10 + -2 * math.sin(Sine / 12)),math.rad(0),math.rad(0)),.25)
		Neck.C0 = Clerp(Neck.C0,NC0*CFrame.new(0,0,0)*CFrame.Angles(math.rad(-2 + 2 * math.cos(Sine / 12)),math.rad(0),math.rad(0)),.25)
		RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5,.5,0)*CFrame.Angles(math.rad(145 + 2 * math.sin(Sine / 12)),math.rad(-6),math.rad(0))*RSCP,.25)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,.5,0)*CFrame.Angles(math.rad(12 + 2 * math.sin(Sine / 12)),math.rad(6),math.rad(-7 + -2 * math.cos(Sine / 12)))*LSCP,.25)
		RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-1 - .05 * math.cos(Sine / 12),-.05)*CFrame.Angles(math.rad(-12 + -3 * math.sin(Sine / 12)),math.rad(90),math.rad(0)) *CFrame.Angles(math.rad(-6),math.rad(-7),math.rad(0)), .25)
		LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1 - .05 * math.cos(Sine / 12),-.05)*CFrame.Angles(math.rad(-12 + -3 * math.sin(Sine / 12)),math.rad(-90),math.rad(0)) *CFrame.Angles(math.rad(-8),math.rad(4),math.rad(-0)),.25)
	end
	wait(.5)
	coroutine.resume(coroutine.create(function()
		AntiElimination()
	end))
	
	Mover.Attack = false
	Mover.WalkSpeed = 8
end

--[[ Anim Template]] --
--[[
for i = 1,5,.1 do
	Swait()
	RootJoint.C0 = Clerp(RootJoint.C0,RC0 * CFrame.new(0, 0, 0 + 0.05 * math.cos(Sine / 12)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.15 / 3)
	Neck.C0 = Clerp(Neck.C0, NC0 * CFrame.new(0, 0, 0 + ((1) - 1)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.15 / 3)
	RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.5 + 0.05 * math.cos(Sine / 12), 0) * CFrame.Angles(math.rad(0), math.rad(-0), math.rad(0)) * RSCP, 0.15 / 3)
	LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.5, 0.5 + 0.05 * math.cos(Sine / 12), 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-0)) * LSCP, 0.15 / 3)
	RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -1 - 0.05 * math.cos(Sine / 12), -0.01) * CFrame.Angles(math.rad(0), math.rad(90), math.rad(0)) * CFrame.Angles(math.rad(-0), math.rad(-0), math.rad(0)), 0.15 / 3)
	LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -1 - 0.05 * math.cos(Sine / 12), -0.01) * CFrame.Angles(math.rad(0), math.rad(-90), math.rad(0)) * CFrame.Angles(math.rad(-0), math.rad(0), math.rad(-0)), 0.15 / 3)
end
--]]

--|| Keys ||--

Mouse.Button1Down:Connect(function(Button1Down)
	if Mover.Attack == false and not Mover.Holstered then
		attackonev2()
	end
end)
Mouse.KeyDown:Connect(function(KeyDown)
	KeyHold = true
	KeyDown = KeyDown:lower()
	
	if KeyDown == "1" and Mover.Attack == false and Mover.Mode ~= "1st" then
		Mover.Mode = "1st"
	end
	
	if KeyDown == "2" and Mover.Attack == false and Mover.Mode ~= "2nd" then
		Mover.Mode = "2nd"
	end
	
	if KeyDown == "3" and Mover.Attack == false and Mover.Mode ~= "3rd" then
		Mover.Mode = "3rd"
	end
	
	if KeyDown == "4" and Mover.Attack == false and Mover.Mode ~= "4th" then
		Mover.Mode = "4th"
	end
	
	if KeyDown == "5" and Mover.Attack == false and Mover.Mode ~= "5th" then
		InsIntro()
	end
	
	if KeyDown == "6" and Mover.Attack == false and Mover.Mode ~= "6th" then
		Mover.Mode = "6th"
	end
	
	if KeyDown == "7" and Mover.Attack == false and Mover.Mode ~= "7th" then
		Mover.Mode = "7th"
	end
	
	if KeyDown == "8" and Mover.Attack == false and Mover.Mode ~= "8th" then
		Mover.Mode = "8th"
	end
	
	if KeyDown == "9" and Mover.Attack == false and Mover.Mode ~= "9th" then
		Mover.Mode = "9th"
	end
	
	if KeyDown == "m" and Mover.Attack == false and Mover.Mode ~= "M7" and Mover.Mode == "9th" then
		Mover.Mode = "M7"
	end
	
	if KeyDown == "0" and Mover.Attack == false and Mover.Mode ~= "10th" then
		Mover.Mode = "10th"
	end
	
	if KeyDown == "z" and Mover.Attack == false and not Mover.Holstered then
		Dash()
	end
	
	if KeyDown == "x" and Mover.Attack == false and not Mover.Holstered then
		Beam()
	end
	
	if KeyDown == "c" and Mover.Attack == false and not Mover.Holstered then
		PainlessRain()
	end
	
	if KeyDown == "v" and Mover.Attack == false and not Mover.Holstered then
		KickAttack()
	end
	
	if KeyDown == "z" and Mover.Attack == false and Mover.Holstered then
		SoulAbsorption()
	end
	
	if KeyDown == "x" and Mover.Attack == false and Mover.Holstered then
		SoulPurge()
	end
	
	if KeyDown == "c" and Mover.Attack == false and Mover.Holstered then
		 LightningShoot()
	end
	
	if KeyDown == "v" and Mover.Attack == false and Mover.Holstered then
		Roar()
	end
	
	if KeyDown == "b" and Mover.Attack == false and Mover.Holstered then
		AntiAttack()
	end
	
	if KeyDown == "r" and Mover.Mode == "9th" then
		Mover.Sitting = not Mover.Sitting
		bergChair()
	end
	
	if KeyDown == "g" and Mover.Attack == false then
		if not Mover.Holstered then
			Mover.Holstered = true
		else
			Mover.Holstered = false
		end
		if Mover.Holstered then
			chatfunc("[Setting]: ".."Gun Holstered")
		else
			chatfunc("[Setting]: ".."Gun Unholstered")
		end
	end
	
	if KeyDown == "h" and Mover.Attack == false then
		if Mover.KillType ~= "Nil" and Mover.KillType == "Void" then
			Mover.KillType = "Nil"
		elseif Mover.KillType ~= "Transparency" and Mover.KillType == "Nil" then
			Mover.KillType = "Transparency"
		elseif Mover.KillType ~= "Transparency2" and Mover.KillType == "Transparency" then
			Mover.KillType = "Transparency2"
		elseif Mover.KillType ~= "Size" and Mover.KillType == "Transparency2" then
			Mover.KillType = "Size"
		elseif Mover.KillType ~= "Derender" and Mover.KillType == "Size" then
			Mover.KillType = "Derender"
		elseif Mover.KillType ~= "Mesh Degradation" and Mover.KillType == "Derender" then
			Mover.KillType = "Mesh Degradation"
		else
			Mover.KillType = "Void"
		end
		chatfunc("[Setting]: ".."KillType is "..Mover.KillType)
	end
	
	if KeyDown == "j" and Mover.Attack == false then
		if Mover.UseShield ~= true then
			chatfunc("[Setting]: ".."Shield set to true")
			Mover.UseShield = true
		else
			chatfunc("[Setting]: ".."Shield set to false")
			Mover.UseShield = false
		end
	end
	
	if KeyDown == "k" and Mover.Attack == false then
		Effects:ClearAllChildren()
		chatfunc("[Setting]: ".."Cleared Effects")
	end
	
	if KeyDown == "l" then
		FixLighting()
	end
	
	if KeyDown == "." and Mover.Attack == false then
		if Mover.SpamRefit ~= true then
			chatfunc("[Setting]: ".."Laggier AD set to true")
			wait(4)
			Mover.SpamRefit = true
		else
			Mover.SpamRefit = false
			chatfunc("[Setting]: ".."Laggier AD set to false")
		end
	end
	
	if KeyDown == "t" and Mover.Attack == false then
		Mover.KILL = false
		chatfunc("[Setting]: ".."Cleared Instance Killtable")
	end
	
	if KeyDown == "y" then
		Mover.UsingEffects = not Mover.UsingEffects
		if Mover.UsingEffects then
			chatfunc("[Setting]: ".."Effects set to true")
		else
			chatfunc("[Setting]: ".."Effects set to false")
		end
	end
	
	if KeyDown == "p" and Mover.Attack == false then
		Shutdown()
	end
	
	if KeyDown == "[" and Mover.Attack == false then
		Mover.CFrame = CFrame.new(0,55,0)
	end
	
	if KeyDown == "]" and Mover.Attack == false then
		Fixer2()
		Fixer1()
	end
	
	if KeyDown == "-" then
		Night()
		chatfunc("/time set night")
	end
	
	if KeyDown == "=" then
		Day()
		chatfunc("/time set day")
	end
	
	if KeyDown == ";" and Mover.Attack == false then
		Sprint()
	end
	
	if KeyDown == "'" and Mover.Attack == false then
		Fixer3()
	end
	
	if KeyDown == " " then
		if not Mover.Jump and not Mover.Fall then
			Mover.Jump = true
		end
	end
end)
Mouse.KeyUp:Connect(function(KeyUp)
    -- Held-key tracking is maintained by the input adapter above.
end)

local RayProperties = RaycastParams.new()
RayProperties.FilterType = Enum.RaycastFilterType.Exclude
RayProperties.BruteForceAllSlow = false
RayProperties.RespectCanCollide = false
RayProperties.IgnoreWater = true
RayProperties.CollisionGroup = "Default"
RayProperties.FilterDescendantsInstances = {Effects}
local Timing = {Throttle = 1,Start = tick(),LastFrame = tick(),LastPlaying = tick()}

--|| Loops ||--

task.spawn(function()
	while true do
		wait(.4)
		SetPerms()
	end
end)

coroutine.wrap(function()
	while 1 do
		swait()
		if doe <= 360 then
			doe = doe + 2
		else
			doe = 0
		end
	end
end)()

game:GetService("RunService").PreRender:Connect(function()
	if Mover.SpamRefit == false then
		coroutine.resume(coroutine.create(function()
			if not Torso or Torso.Parent ~= game:GetService("Workspace") or (Torso.Position - Mover.CFrame.Position).Magnitude >= 115 then
				pcall(function()
					Torso:Destroy()
					UpdateJoints()
				end)
				SN(Fixer1)
			end
			if not Head or Head.Parent ~= game:GetService("Workspace") or (Head.Position - Mover.CFrame.Position).Magnitude >= 115 then
				pcall(function()
					Head:Destroy()
					UpdateJoints()
				end)
				SN(Fixer1)
			end
			if not LeftArm or LeftArm.Parent ~= game:GetService("Workspace") or (LeftArm.Position - Mover.CFrame.Position).Magnitude >= 115 then
				pcall(function()
					LeftArm:Destroy()
					UpdateJoints()
				end)
				SN(Fixer1)
			end
			if not RightArm or RightArm.Parent ~= game:GetService("Workspace") or (RightArm.Position - Mover.CFrame.Position).Magnitude >= 115 then
				pcall(function()
					RightArm:Destroy()
					UpdateJoints()
				end)
				SN(Fixer1)
			end
			if not LeftLeg or LeftLeg.Parent ~= game:GetService("Workspace") or (LeftLeg.Position - Mover.CFrame.Position).Magnitude >= 115 then
				pcall(function()
					LeftLeg:Destroy()
					UpdateJoints()
				end)
				SN(Fixer1)
			end
			if not RightLeg or RightLeg.Parent ~= game:GetService("Workspace") or (RightLeg.Position - Mover.CFrame.Position).Magnitude >= 115 then
				pcall(function()
					RightLeg:Destroy()
					UpdateJoints()
				end)
				SN(Fixer1)
			end
			if not Hair or Hair.Parent ~= game:GetService("Workspace") or (Hair.Position - Mover.CFrame.Position).Magnitude >= 115 then
				pcall(function()
					Hair:Destroy()
					UpdateJoints()
				end)
				SN(Fixer1)
			end
			if not Hat or Hat.Parent ~= game:GetService("Workspace") or (Hat.Position - Mover.CFrame.Position).Magnitude >= 115 then
				pcall(function()
					Hat:Destroy()
					UpdateJoints()
				end)
				SN(Fixer1)
			end
			for i,v in ipairs(Character) do
				if v:IsA("BasePart") and v:IsDescendantOf(game:GetService("Workspace")) and v ~= Holder then
					pcall(function()
						v.Name = "Baseplate"
					end)
				end
			end
		end))
	else
		coroutine.resume(coroutine.create(function()
			for i,v in ipairs(Character) do
				if v:IsA("BasePart") then
					UpdateJoints()
					if math.abs(v.CFrame.Position.X) >= 10000 or math.abs(v.CFrame.Position.Y) >= 10000 or math.abs(v.CFrame.Position.Z) >= 10000 or math.abs(v.CFrame.Position.X) <= -10000 or math.abs(v.CFrame.Position.Y) <= -10000 or math.abs(v.CFrame.Position.Z) <= -10000 then
						pcall(function()
							v:Destroy()
							UpdateJoints()
						end)
						SN(Fixer1)
						UpdateJoints()
					end
					if v.LocalTransparencyModifier ~= 0 then
						SN(Fixer1)
						UpdateJoints()
						v.LocalTransparencyModifier = 0
					end
					if not v or v.Parent ~= game:GetService("Workspace") or (v.Position - Mover.CFrame.Position).Magnitude >= 115 then
						pcall(function()
							v:Destroy()
							UpdateJoints()
						end)
						SN(Fixer1)
						UpdateJoints()
					end
					v:Destroy()
				end
			end
		end))
	end
	UpdateJoints()
	if Effects and (not Shield or not Shield:IsDescendantOf(Effects)) and Effects:IsDescendantOf(game:GetService("Workspace")) then
		pcall(function()
			Shield:Destroy()
		end)
		ShieldFixer()
	elseif Effects and (not Shield or not Shield:IsDescendantOf(Effects)) and not Effects:IsDescendantOf(game:GetService("Workspace")) then
		pcall(function()
			Shield:Destroy()
		end)
		ShieldFixer()
		Fixer2()
	end
end)

local MoveDirection = Vector3.new()

task.spawn(function()
	while true do
		task.wait()
		coroutine.resume(coroutine.create(function()
			task.spawn(function()
				wait()
				if Mover.UseShield == true then
					Shield.Transparency = 0
					ApplyAoE(Shield.Position, Shield.Size.Z * .25)
				else
					Shield.Transparency = 1
				end
			end)
		end))
		if not Billboard or Billboard.Parent ~= Effects then
			pcall(function()
				Billboard:Destroy()
			end)
			RefitName()
		end
		if not Billboardtext or Billboardtext.Parent ~= Billboard then
			pcall(function()
				Billboardtext:Destroy()
			end)
			RefitName()
		end
		if Billboard ~= nil then
			Billboard.Adornee = Head
		end
		if Billboardtext ~= nil then
			pcall(function()
				Billboardtext.Position = UDim2.new(0,10*math.cos(Sine / 24) + 7 * math.sin(Sine / 24),0,5*math.sin(Sine / 24) + 5 * math.cos(Sine / 12)) 
				Billboardtext.Rotation = 15 * math.sin(Sine / 24)
				Billboardtext.TextColor3 = MainColor
				if Mover.Mode == "1st" then
					Billboardtext.Text = Text[math.random(1, #Text)]
				elseif Mover.Mode == "2nd" then
					Billboardtext.Text = TextDown[math.random(1, #TextDown)]
				elseif Mover.Mode == "3rd" then
					Billboardtext.Text = TextEndless[math.random(1, #TextEndless)]
				elseif Mover.Mode == "4th" then
					Billboardtext.Text = TextMadness[math.random(1, #TextMadness)]
				elseif Mover.Mode == "5th" then
					Billboardtext.Text = TextInstanity[math.random(1, #TextInstanity)]
					Billboardtext.FontFace.Style = STYLE[math.random(1, #STYLE)]
					Billboardtext.FontFace.Weight = WEIGHT[math.random(1, #WEIGHT)]
					Billboardtext.Font = FONTS[math.random(1, #FONTS)]
				elseif Mover.Mode == "6th" then
					Billboardtext.Text = TextErr0r[math.random(1, #TextErr0r)]
				elseif Mover.Mode == "7th" then
					Billboardtext.Text = TextGlitch[math.random(1, #TextGlitch)]
				elseif Mover.Mode == "8th" then
					Billboardtext.Text = TextSKID[math.random(1, #TextSKID)]
				elseif Mover.Mode == "9th" then
					Billboardtext.Text = TextBerg[math.random(1, #TextBerg)]
				elseif Mover.Mode == "M7" then
					Billboardtext.Text = TextMute[math.random(1, #TextMute)]
				elseif Mover.Mode == "10th" then
					Billboardtext.Text = Text[math.random(1, #Text)]
				else
				end
			end)
		end
		if Mover.Mode == "1st" then
			MainColor = Color3.fromHSV((tick() % 15/15),1,1)
			Mover.MainSound = "rbxassetid://1842713324"
			Mover.PlaybackSpeed = .9
			if not Mover.Attack then
				if Mover.Flying then
					Mover.WalkSpeed = 80
				else
					Mover.WalkSpeed = 8
				end
			end
		elseif Mover.Mode == "2nd" then
			MainColor = Color3.fromRGB(math.clamp(Sick.PlaybackLoudness-150,0,255),math.clamp(Sick.PlaybackLoudness-150,0,102),math.clamp(Sick.PlaybackLoudness-150,0,204))
			Mover.MainSound = "rbxassetid://9043781108"
			Mover.PlaybackSpeed = 1
			if not Mover.Attack then
				Mover.WalkSpeed = 8
			end
		elseif Mover.Mode == "3rd" then
			MainColor = Color3.new(math.floor(Sick.PlaybackLoudness / 300), 0, 0)
			Mover.MainSound = "rbxassetid://1840039123"
			Mover.PlaybackSpeed = 1
			if not Mover.Attack then
				Mover.WalkSpeed = 8
			end
		elseif Mover.Mode == "4th" then
			MainColor = Color3.new(math.floor(Sick.PlaybackLoudness/300), math.floor(Sick.PlaybackLoudness/300), math.floor(Sick.PlaybackLoudness/300))
			Mover.MainSound = "rbxassetid://9039292658"
			Mover.PlaybackSpeed = 1
			if not Mover.Attack then
				Mover.WalkSpeed = 8
			end
		elseif Mover.Mode == "5th" then
			MainColor = Color3.fromRGB(math.random(0, 255)*Sick.PlaybackLoudness/255, math.random(0, 255)*Sick.PlaybackLoudness/255, math.random(0, 255)*Sick.PlaybackLoudness/255)
			Mover.MainSound = "rbxassetid://1841924145"
			Mover.PlaybackSpeed = .9
			if not Mover.Attack then
				Mover.WalkSpeed = 40
			end
		elseif Mover.Mode == "6th" then
			MainColor = Color3.new(0, math.floor(Sick.PlaybackLoudness / 300), 0)
			Mover.MainSound = "rbxassetid://1836021107"
			Mover.PlaybackSpeed = 1
			if not Mover.Attack then
				Mover.WalkSpeed = 25
			end
		elseif Mover.Mode == "7th" then
			MainColor = Color3.new(Sick.PlaybackLoudness/500, 0, Sick.PlaybackLoudness/500)
			Mover.MainSound = "rbxassetid://1838075861"
			Mover.PlaybackSpeed = 1
			if not Mover.Attack then
				Mover.WalkSpeed = 25
			end
		elseif Mover.Mode == "8th" then
			MainColor = Color3.new(Sick.PlaybackLoudness/500, 0, Sick.PlaybackLoudness/500)
			Mover.MainSound = "rbxassetid://1837694918"
			Mover.PlaybackSpeed = 1
			if not Mover.Attack then
				Mover.WalkSpeed = 500
			end
		elseif Mover.Mode == "9th" then
			MainColor = Color3.new(0, 0, math.floor(Sick.PlaybackLoudness / 140))
			Mover.MainSound = "rbxassetid://1840038982"
			Mover.PlaybackSpeed = .8
			if Mover.UsingEffects == true then
				local Eff1 = SetEffect(Effects, MainColor, "Neon", 0, Vector3.new(.7, Sick.PlaybackLoudness / 16, .7), Mover.CFrame * CFrame.new(9*math.sin(Sine / 20), -2.5, 9 * math.cos(Sine / 20)), "Block")
				local Eff1Mesh = SetMesh(Eff1, "", "Sphere", Vector3.new(0, 0, 0), Vector3.new(1, 1, 1), "", Vector3.new(1, 1, 1), false)
				SetTween(Eff1, 6, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, {Transparency = 1, Size = Vector3.new(0, 0, 0), Orientation = Vector3.new(math.random(-180, 180), math.random(-180, 180), math.random(-180, 180))})
				SetDestroy(Eff1, 6)
				local Eff2 = SetEffect(Effects, MainColor, "Neon", 0, Vector3.new(2,2,2), Mover.CFrame * CFrame.new(9*math.sin(Sine / 20), -2.5, 9 * math.cos(Sine / 20)), "Block")
				Eff2.Orientation = Vector3.new(math.random(-180, 180), math.random(-180, 180), math.random(-180, 180))
				SetTween(Eff2, 6, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, {Transparency = 1, Size = Vector3.new(), Orientation = Vector3.new(math.random(-180, 180), math.random(-180, 180), math.random(-180, 180))})
				SetDestroy(Eff2, 6)
				local Eff3 = SetEffect(Effects, MainColor, "Neon", 0, Vector3.new(3,.1,3), Mover.CFrame * CFrame.new(9*math.sin(Sine / 20), -2.5, 9 * math.cos(Sine / 20)), "Block")
				local Eff3Mesh = SetMesh(Eff3, "", "Sphere", Vector3.new(0, 0, 0), Vector3.new(1, 1, 1), "", Vector3.new(1, 1, 1), false)
				SetTween(Eff3, 6, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, {Transparency = 1, Size = Vector3.new()})
				SetDestroy(Eff3, 6)
				local Eff4 = SetEffect(Effects, MainColor, "Neon", 0, Vector3.new(.3,.3,.3), Eff2.CFrame * CFrame.new(math.random(-3,3), math.random(-.1,.1), math.random(-3,3)), "Block")
				local Eff4Mesh = SetMesh(Eff4, "", "Sphere", Vector3.new(0, 0, 0), Vector3.new(1, 1, 1), "", Vector3.new(1, 1, 1), false)
				SetTween(Eff4, 6, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, {Transparency = 1, Size = Vector3.new(), CFrame = Eff4.CFrame * CFrame.new(math.random(-1,1), math.random(-.1,.1), math.random(-1,1)), Orientation = Vector3.new(math.random(-180, 180), math.random(-180, 180), math.random(-180, 180))})
				SetDestroy(Eff4, 6)
			end
			if not Mover.Attack then
				Mover.WalkSpeed = 20
			end
		elseif Mover.Mode == "M7" then
			MainColor = Color3.new(math.floor(math.random(0, 255)),0,0)
			Mover.MainSound = "rbxassetid://1837015572"
			Mover.PlaybackSpeed = 1
			if not Mover.Attack then
				Mover.WalkSpeed = 20
			end
		elseif Mover.Mode == "10th" then
			MainColor = Color3.new(Sick.PlaybackLoudness/500,Sick.PlaybackLoudness/500,0)
			Mover.MainSound = "rbxassetid://5410086149"
			Mover.PlaybackSpeed = .85
			if not Mover.Attack then
				Mover.WalkSpeed = 20
			end
		end
		if Run == true then
			Mover.WalkSpeed = 60
		end
	end
end)

task.spawn(function()
	while true do
		Swait()
		if Sick.SoundId ~= Mover.MainSound then
			pcall(function()
				Sick.SoundId = Mover.MainSound
			end)
		end
		if Sick.Playing ~= true then
			pcall(function()
				Sick:Play()
			end)
		end
		pcall(function()
			if ClassCam.WorldPivot ~= Mover.CFrame then
				ClassCam.WorldPivot = ClassCam.WorldPivot:Lerp(Mover.CFrame, 1)
			elseif not (ClassCam.WorldPivot ~= Mover.CFrame) then
				ClassCam.WorldPivot = ClassCam.WorldPivot:Lerp(Mover.CFrame, 1)
			else
				ClassCam.WorldPivot = ClassCam.WorldPivot:Lerp(Mover.CFrame, 1)
			end
		end)
		RayProperties.FilterType = Enum.RaycastFilterType.Exclude
		RayProperties.BruteForceAllSlow = false
		RayProperties.RespectCanCollide = false
		RayProperties.IgnoreWater = true
		RayProperties.CollisionGroup = "Default"
		RayProperties.FilterDescendantsInstances = {Effects}
		Sine = Sine + 1
		pcall(function()
			for i,v in ipairs(Character) do
				if v:IsA("BasePart") and v:FindFirstChildOfClass("PointLight") then
					local Light = v:FindFirstChildOfClass("PointLight")
					Light.Color = MainColor
				end
			end
			NeonParts.Color = MainColor
			HeadOutline.Color = MainColor
			TorsoOutline.Color = MainColor
			LeftArmOutline.Color = MainColor
			RightArmOutline.Color = MainColor
			LeftLegOutline.Color = MainColor
			RightLegOutline.Color = MainColor
			HairOutline.Color = MainColor
			HatOutline.Color = MainColor
			GunBaseOutline.Color = MainColor
			Scarf.Color = Color3.new(Sick.PlaybackLoudness/500,Sick.PlaybackLoudness/500,Sick.PlaybackLoudness/500)
		end)
		if Effects then
            for _, effectPart in ipairs(Effects:GetChildren()) do
                if effectPart:IsA("BasePart") and effectPart ~= Shield and not Mover.Sitting then
                    effectPart.Material = Enum.Material.Neon
                    effectPart.Color = MainColor
                    effectPart.CanCollide = false
                    effectPart.CanTouch = false
                    effectPart.CanQuery = false
                end
            end
        end
		if lplr.Name == USERNAME then
            -- REAL PLAYER MOVEMENT MODE
            -- The real HumanoidRootPart controls both position and rotation.
            -- The camera is deliberately NOT used for model rotation.
            local realCharacter = lplr.Character
            local realHumanoid = realCharacter and realCharacter:FindFirstChildOfClass("Humanoid")
            local realRoot = realCharacter and realCharacter:FindFirstChild("HumanoidRootPart")
            local camera = Get("Workspace").CurrentCamera

            if realCharacter then
                -- Hide the actual Roblox avatar locally. The custom model becomes the visible avatar.
                for _, obj in ipairs(realCharacter:GetDescendants()) do
                    if obj:IsA("BasePart") then
                        obj.LocalTransparencyModifier = 1
                    elseif obj:IsA("Decal") or obj:IsA("Texture") then
                        obj.Transparency = 1
                    elseif obj:IsA("ParticleEmitter") or obj:IsA("Trail") then
                        obj.Enabled = false
                    end
                end
            end

            if realRoot then
                -- Exact player transform. No camera LookVector and no virtual movement.
                Mover.CFrame = realRoot.CFrame
                Mover.PotentialCFrame = realRoot.CFrame
                Welds.HumanoidRootPart.CFrame = realRoot.CFrame

                if realHumanoid then
                    local moveDir = realHumanoid.MoveDirection
                    local velocity = realRoot.AssemblyLinearVelocity
                    local horizontalSpeed = Vector3.new(velocity.X, 0, velocity.Z).Magnitude
                    local state = realHumanoid:GetState()

                    Mover.Walking = moveDir.Magnitude > 0.05 or horizontalSpeed > 1
                    Mover.Flying = false
                    Mover.WalkSpeed = realHumanoid.WalkSpeed
                    MoveDirection = moveDir.Magnitude > 0.05 and moveDir.Unit or Vector3.new()
                    Mover.Jump = state == Enum.HumanoidStateType.Jumping
                    Mover.Falling = state == Enum.HumanoidStateType.Freefall
                    Mover.Fall = Mover.Falling

                    -- Keep the normal Roblox camera attached to the real Humanoid.
                    if camera and camera.CameraSubject ~= realHumanoid then
                        camera.CameraSubject = realHumanoid
                    end
                end

                if ClassCam then
                    ClassCam.WorldPivot = realRoot.CFrame
                end
            end

            -- Absolutely no camera-based rotation here.
            Mover.Flying = false
            if realRoot then
                Mover.CFrame = realRoot.CFrame
                Mover.PotentialCFrame = realRoot.CFrame
            end
		else
			Get("TweenService"):Create(Mover.Value,TweenInfo.new(1/20,Enum.EasingStyle.Linear),{Value = Mover.PotentialCFrame}):Play()
			Mover.CFrame = Mover.Value.Value
		end
		Welds.HumanoidRootPart.CFrame = Mover.CFrame
		Shield.CFrame = Welds.HumanoidRootPart.CFrame * CFrame.Angles(math.rad(Sine / 12), math.rad(Sine / 10), math.rad(Sine / 12))
		Timing.Throttle = (tick()-Timing.LastFrame)/(1/60)
		Timing.LastFrame = tick()
		coroutine.resume(coroutine.create(function()
			UpdateWeld(RootJoint,Torso,Welds.HumanoidRootPart)
			UpdateWeld(Neck,Head,Torso)
			UpdateWeld(RightShoulder,RightArm,Torso)
			UpdateWeld(LeftShoulder,LeftArm,Torso)
			UpdateWeld(RightHip,RightLeg,Torso)
			UpdateWeld(LeftHip,LeftLeg,Torso)
			UpdateWeld(LeftEyeJoint,LeftEye,Head)
			UpdateWeld(RightEyeJoint,RightEye,Head)
			UpdateWeld(HairJoint,Hair,Head)
			UpdateWeld(HatJoint,Hat,Head)
			if not Mover.Holstered then
				coroutine.wrap(function()
					UpdateWeld(OutlineJoint3, GunBaseOutline, GunBase)
					UpdateWeld(GunJoint, Joint, RightArm)
					UpdateWeld(OutlineJoint3, GunBaseOutline, GunBase)
				end)()
			else
				coroutine.wrap(function()
					UpdateWeld(OutlineJoint3, GunBaseOutline, GunBase)
					UpdateWeld(GunJointBack, Joint, Torso)
					UpdateWeld(OutlineJoint3, GunBaseOutline, GunBase)
				end)()
			end
			UpdateWeld(BaseJoint, GunBase, Joint)
			UpdateWeld(AdditionsJoint, GunAdditions, Joint)
			UpdateWeld(NeonsJoint, NeonParts, Joint)
			UpdateWeld(GunHoleJoint, Hole, Joint)
			UpdateWeld(GunHole2Joint, Holetwo, Joint)
			UpdateWeld(ScarfJoint,Scarf,Torso)
			UpdateWeld(OutlineJoint,HeadOutline,Head)
			UpdateWeld(OutlineJoint,TorsoOutline,Torso)
			UpdateWeld(OutlineJoint,LeftArmOutline,LeftArm)
			UpdateWeld(OutlineJoint,RightArmOutline,RightArm)
			UpdateWeld(OutlineJoint,LeftLegOutline,LeftLeg)
			UpdateWeld(OutlineJoint,RightLegOutline,RightLeg)
			UpdateWeld(OutlineJoint2,HairOutline,Hair)
			UpdateWeld(OutlineJoint,HatOutline,Hat)
		end))
		UpdateWeld(HolderJoint,Holder,Welds.HumanoidRootPart)
		local Look = CFrame.new(Mover.CFrame.Position,Mover.CFrame.Position+Vector3.new(Mover.CFrame.LookVector.X,0,Mover.CFrame.LookVector.Z))
		local ForwardMovement,SidewaysMovement = (MoveDirection*Look.LookVector).X+(MoveDirection*Look.LookVector).Z,(MoveDirection*Look.RightVector).X+(MoveDirection*Look.RightVector).Z
		if Mover.Attack == false then
			OutlineJoint.C0 = Clerp(OutlineJoint.C0, CFrame.new(), 3)
			OutlineJoint2.C0 = Clerp(OutlineJoint2.C0, CFrame.new(0.16, 0.025, 0.025), 3)
			if Mover.Walking == false and Mover.Jump == false and Mover.Fall == false then
				Anim = "Idle"
				if Mover.Attack == false then
					if Mover.Mode == "1st" then
						if Mover.Flying then
							RootJoint.C0 = Clerp(RootJoint.C0,RC0 * CFrame.new(-.5 * math.sin(Sine / 18), 0, 1.5 + 0.5 * math.cos(Sine / 18)) * CFrame.Angles(math.rad(-3 - 5 * math.sin(Sine / 18)), math.rad(6 * math.cos(Sine / 18)), math.rad(0)), 0.15)
							Neck.C0 = Clerp(Neck.C0, NC0 * CFrame.new(0, 0, 0 + ((1) - 1)) * CFrame.Angles(math.rad(14), math.rad(-16 + 5 * math.cos(Sine / 18)), math.rad(0)), 0.15)
							LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.5, 0.35 + 0.1 * math.cos(Sine / 18), 0) * CFrame.Angles(math.rad(0), math.rad(12 + 5 * math.cos(Sine / 18)), math.rad(-6 - 5 * math.sin(Sine / 18))) * LSCP, 0.15)
							RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -.4 - 0.05 * math.cos(Sine / 18), -0.6) * CFrame.Angles(math.rad(-36 + 5 * math.sin(Sine / 18)), math.rad(90), math.rad(0)) * CFrame.Angles(math.rad(-8 * math.cos(Sine / 18)), math.rad(-8), math.rad(0)), 0.15)
							LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -.8 - 0.05 * math.cos(Sine / 18), -0.3) * CFrame.Angles(math.rad(-24 + 5 * math.sin(Sine / 18)), math.rad(-90), math.rad(0)) * CFrame.Angles(math.rad(8 * math.cos(Sine / 18)), math.rad(8), math.rad(-0)), 0.15)
							if not Mover.Holstered then
								RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.3 + 0.1 * math.cos(Sine / 18), 0) * CFrame.Angles(math.rad(175 - 5 * math.cos(Sine / 18)), math.rad(-6), math.rad(7 + 3 * math.sin(Sine / 18))) * RSCP, 0.15)
								GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(0,-.5,0) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),1 / 2)
							else
								RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.35 + 0.1 * math.cos(Sine / 18), 0) * CFrame.Angles(math.rad(0), math.rad(-12 - 5 * math.cos(Sine / 18)), math.rad(6 + 5 * math.sin(Sine / 18))) * RSCP, 0.15)
								GunJointBack.C0 = Clerp(GunJointBack.C0,CFrame.new(0,-1,1) * CFrame.Angles(math.rad(90),math.rad(15),math.rad(90)),1 / 2)
							end
						else	
							local NUMBER = 30
							local RATIO = NUMBER * 2
							if not Mover.Holstered then
								RightShoulder.C0 = RightShoulder.C0:Lerp(CFrame.new(1.5, 0.15 - 0.07 * math.sin(Sine / NUMBER), -0.2) * CFrame.Angles(math.rad(175), math.rad(-20), math.rad(6 + 2 * math.cos(Sine / NUMBER))) * RSCP, 0.07)
							else
								RightShoulder.C0 = RightShoulder.C0:Lerp(CFrame.new(1.5, 0.15 + 0.1 * math.cos(Sine / NUMBER), -0.2) * CFrame.Angles(math.rad(10 + 3 * math.sin(Sine / NUMBER)), math.rad(12 + 5 * math.sin(Sine / NUMBER)), math.rad(-4 - 2 * math.cos(Sine / NUMBER))) * RSCP, 0.15)
							end
							RootJoint.C0 = RootJoint.C0:Lerp(RC0 * CFrame.new(0.2 * math.sin(Sine / RATIO), 0, 0 + 0.1 * math.cos(Sine / NUMBER)) * CFrame.Angles(math.rad(4), math.rad(-2.7 + 5 * math.sin(Sine / RATIO)), math.rad(-20)), 0.07)
							Neck.C0 = Neck.C0:Lerp(NC0 * CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(16 + 3 * math.cos(Sine / 25)), math.rad(7 * math.cos(Sine / NUMBER)), math.rad(18 - 6 * math.sin(Sine / NUMBER))), 0.07)
							LeftShoulder.C0 = LeftShoulder.C0:Lerp(CFrame.new(-1.5, 0.15 + 0.1 * math.cos(Sine / NUMBER), -0.2) * CFrame.Angles(math.rad(10 + 3 * math.sin(Sine / NUMBER)), math.rad(12 + 5 * math.sin(Sine / NUMBER)), math.rad(-4 - 2 * math.cos(Sine / NUMBER))) * LSCP, 0.07)
							RightHip.C0 = RightHip.C0:Lerp(CFrame.new(1 + 0.1 * math.sin(Sine / RATIO), -1.04 - 0.1 * math.cos(Sine / NUMBER) - 0.05 * math.sin(Sine / RATIO) - 0, 0.1) * CFrame.Angles(math.rad(-7), math.rad(-36), math.rad(6 - 5 * math.sin(Sine / RATIO))) * CFrame.Angles(math.rad(0), math.rad(90), math.rad(0)), 0.07)
							LeftHip.C0 = LeftHip.C0:Lerp(CFrame.new(-1 + 0.1 * math.sin(Sine / RATIO), -1.04 - 0.1 * math.cos(Sine / NUMBER) + 0.05 * math.sin(Sine / RATIO) - 0, -0.15) * CFrame.Angles(math.rad(7), math.rad(24), math.rad(-6 - 5 * math.sin(Sine / RATIO))) * CFrame.Angles(math.rad(0), math.rad(-90), math.rad(0)), 0.07)

							if Mover.Holstered == false then
								GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(0,-.5,0) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),1 / 2)
							elseif Mover.Holstered == true then							
								GunJointBack.C0 = Clerp(GunJointBack.C0,CFrame.new(0,-1,1) * CFrame.Angles(math.rad(90),math.rad(15),math.rad(90)),1 / 2)
							end
						end
					elseif Mover.Mode == "2nd" then
						RootJoint.C0 = Clerp(RootJoint.C0,RC0 * CFrame.new(0, 0, 0 + 0.05 * math.cos(Sine / 12)) * CFrame.Angles(math.rad(5) + math.rad(0 + 3.5 * math.sin(Sine / 12)), math.rad(0), math.rad(0)), 0.15 / 3)
						Neck.C0 = Clerp(Neck.C0, NC0 * CFrame.new(0, 0, 0 + ((1) - 1)) * CFrame.Angles(math.rad(-5) + math.rad(0 + -3 * math.cos(Sine / 12)) + math.rad(0 + 5 * math.sin(Sine / 12)), math.rad(0), math.rad(0)), 0.15 / 3)
						RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.5 + 0.05 * math.cos(Sine / 12), 0) * CFrame.Angles(math.rad(3) + math.rad(0 + 5 * math.sin(Sine / 12)), math.rad(-12) + math.rad(0 + -5 * math.cos(Sine / 12)), math.rad(7) + math.rad(0 + 5 * math.cos(Sine / 12))) * RSCP, 0.15 / 3)
						LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.5, 0.5 + 0.05 * math.cos(Sine / 12), 0) * CFrame.Angles(math.rad(3) + math.rad(0 + 5 * math.sin(Sine / 12)), math.rad(0), math.rad(-7) + math.rad(0 + -5 * math.cos(Sine / 12))) * LSCP, 0.15 / 3)
						RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -1 - 0.05 * math.cos(Sine / 12), -0.1) * CFrame.Angles(math.rad(7) + math.rad(-6 + 5 * math.sin(Sine / 12)), math.rad(90), math.rad(0)) * CFrame.Angles(math.rad(-3), math.rad(-12), math.rad(0)), 0.15 / 3)
						LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -1 - 0.05 * math.cos(Sine / 12), -0.15) * CFrame.Angles(math.rad(7) + math.rad(-6 + 5 * math.sin(Sine / 12)), math.rad(-90), math.rad(0)) * CFrame.Angles(math.rad(-5.45), math.rad(15), math.rad(0)), 0.15 / 3)
						if Mover.Holstered == false then
							GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(0,-.5,0) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0)),1 / 2)
						else
							GunJointBack.C0 = Clerp(GunJointBack.C0,CFrame.new(0,-1,1) * CFrame.Angles(math.rad(90),math.rad(15),math.rad(90)),1 / 2)
						end
					elseif Mover.Mode == "3rd" then
						RootJoint.C0 = Clerp(RootJoint.C0,RC0 * CFrame.new(0, 0, 0 + 0.05 * math.cos(Sine / 12)) * CFrame.Angles(math.rad(7 - 3 * math.sin(Sine / 12)), math.rad(0), math.rad(-15)), 0.15 / 3)
						Neck.C0 = Clerp(Neck.C0, NC0 * CFrame.new(0, 0, 0 + ((1) - 1)) * CFrame.Angles(math.rad(3 + 5 * math.cos(Sine / 12)), math.rad(0), math.rad(-5)), 0.15 / 3)
						RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.5 + 0.05 * math.sin(Sine / 12), 0) * CFrame.Angles(math.rad(15 + 3 * math.cos(Sine / 12)), math.rad(-0), math.rad(45 + 3 * math.sin(Sine / 12))) * RSCP, 0.15 / 3)
						LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.2, 0.3 + 0.05 * math.sin(Sine / 12), -.7) * CFrame.Angles(math.rad(0), math.rad(7 + 3 * math.sin(Sine / 12)), math.rad(-3 - 3 * math.sin(Sine / 12))) * LSCP, 0.15 / 3)
						RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -1 - 0.05 * math.cos(Sine / 12), -0.2) * CFrame.Angles(math.rad(0 - 5 * math.sin(Sine / 12)), math.rad(90), math.rad(0)) * CFrame.Angles(math.rad(-11 - 3 * math.sin(Sine / 12)), math.rad(-21), math.rad(0)), 0.15 / 3)
						LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -1 - 0.05 * math.cos(Sine / 12), -0.23) * CFrame.Angles(math.rad(0 - 5 * math.sin(Sine / 12)), math.rad(-90), math.rad(0)) * CFrame.Angles(math.rad(-14 - 3 * math.sin(Sine / 12)), math.rad(25), math.rad(-0)), 0.15 / 3)
						if Mover.Holstered == false then
							GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(0,-.5,0) * CFrame.Angles(math.rad(180),math.rad(0),math.rad(0)),1 / 2)
						else
							GunJointBack.C0 = Clerp(GunJointBack.C0,CFrame.new(0,-1,1) * CFrame.Angles(math.rad(90),math.rad(15),math.rad(90)),1 / 2)
						end
					elseif Mover.Mode == "4th" then
						RootJoint.C0 = Clerp(RootJoint.C0,RC0 * CFrame.new(0, 0, 0 + 0.05 * math.cos(Sine / 24)) * CFrame.Angles(math.rad(7 + 3 * math.cos(Sine / 24)), math.rad(0), math.rad(0)), 0.15 / 3)
						Neck.C0 = Clerp(Neck.C0, NC0 * CFrame.new(0, 0, 0 + ((1) - 1)) * CFrame.Angles(math.rad(30 + 5 * math.sin(Sine / 24)), math.rad(0), math.rad(0)), 0.15 / 3)
						if not Mover.Holstered then
							RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.35 + 0.05 * math.cos(Sine / 24), 0) * CFrame.Angles(math.rad(-85 + -3 * math.sin(Sine / 24)), math.rad(-3), math.rad(7)) * RSCP, 0.15 / 3)
						else
							RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.3 + 0.1 * math.cos(Sine / 24), 0) * CFrame.Angles(math.rad(0), math.rad(-3 + -3 * math.cos(Sine / 24)), math.rad(7 + 3 * math.sin(Sine / 24))) * RSCP, 0.15 / 3)
						end
						LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.2, 0.5 + 0.05 * math.cos(Sine / 24), -1) * CFrame.Angles(math.rad(170 + 5 * math.cos(Sine / 24)), math.rad(7 + 3 * math.cos(Sine / 24)), math.rad(37)) * LSCP, 0.15 / 3)
						RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -1 - 0.05 * math.cos(Sine / 24), -0.25) * CFrame.Angles(math.rad(5 + 4 * math.cos(Sine / 24)), math.rad(90), math.rad(0)) * CFrame.Angles(math.rad(-4), math.rad(-7), math.rad(0)), 0.15 / 3)
						LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -1 - 0.05 * math.cos(Sine / 24), -0.25) * CFrame.Angles(math.rad(5 + 4 * math.cos(Sine / 24)), math.rad(-90), math.rad(0)) * CFrame.Angles(math.rad(-7), math.rad(12), math.rad(0)), 0.15 / 3)
						if Mover.Holstered == false then
							GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(0,-.5,0) * CFrame.Angles(math.rad(5 - 3 * math.cos(Sine / 24)),math.rad(0),math.rad(0)), 0.15 / 3)
						else
							GunJointBack.C0 = Clerp(GunJointBack.C0,CFrame.new(0,-1,1) * CFrame.Angles(math.rad(90),math.rad(15),math.rad(90)),1 / 2)
						end
					elseif Mover.Mode == "5th" then
						RootJoint.C0 = Clerp(RootJoint.C0,RC0 * CFrame.new(0, 0, -1.25 + 0.05 * math.cos(Sine / 12)) * CFrame.Angles(math.rad(25), math.rad(0 + 5 * math.cos(Sine / 12)), math.rad(-10 + 3 * math.sin(Sine / 12))), 0.15 / 3)
						Neck.C0 = Clerp(Neck.C0, NC0 * CFrame.new(0, 0, 0 + ((1) - 1)) * CFrame.Angles(math.rad(45 - 15 * math.cos(Sine / 12)), math.rad(0), math.rad(5 + 7 * math.sin(Sine / 12))), 0.15 / 3)
						if not Mover.Holstered then
							RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.3 + 0.05 * math.cos(Sine / 12), -0) * CFrame.Angles(math.rad(-80), math.rad(-15 + -5 * math.cos(Sine / 12)), math.rad(14 + 3 * math.sin(Sine / 12))) * RSCP, 0.15 / 3)
						else
							RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.2 + 0.1 * math.cos(Sine / 12), -.2) * CFrame.Angles(math.rad(15 + 3 * math.cos(Sine / 12)), math.rad(-7), math.rad(7 - 5 * math.sin(Sine / 12))) * RSCP, 0.15 / 3)
						end
						LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.2, .2 + 0.05 * math.cos(Sine / 12), -.8) * CFrame.Angles(math.rad(160 + 15 * math.cos(Sine / 12)), math.rad(-30), math.rad(50)) * LSCP, 0.15 / 3)
						RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -1 - 0.05 * math.cos(Sine / 12), -0.01) * CFrame.Angles(math.rad(-45), math.rad(90), math.rad(0)) * CFrame.Angles(math.rad(-0 + 5 * math.cos(Sine / 12)), math.rad(-12 - 5 * math.sin(Sine / 12)), math.rad(0)), 0.15 / 3)
						LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -.4 - 0.05 * math.cos(Sine / 12), -0.6) * CFrame.Angles(math.rad(-30), math.rad(-90), math.rad(0)) * CFrame.Angles(math.rad(-0 - 5 * math.cos(Sine / 12)), math.rad(12 + 3 * math.sin(Sine / 12)), math.rad(-0)), 0.15 / 3)
						if Mover.Holstered == false then
							GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(0,-.5,0) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),1 / 2)
						else
							GunJointBack.C0 = Clerp(GunJointBack.C0,CFrame.new(0,-1,1) * CFrame.Angles(math.rad(90),math.rad(15),math.rad(90)),1 / 2)
						end
						if math.random(1,math.floor((15/Timing.Throttle)+.5)) == 1 then
							Neck.C0 = Clerp(Neck.C0,NC0*CFrame.Angles(math.rad(20+math.random(-20,20)),math.rad((10*math.sin(Sine/1))+math.random(-20,20)),math.rad(math.random(-20,20))),3)
						end
					elseif Mover.Mode == "6th" then
						RootJoint.C0 = Clerp(RootJoint.C0,RC0 * CFrame.new(0, 0, 3 + 0.2 * math.cos(Sine / 24)) * CFrame.Angles(math.rad(0), math.rad(-7 * math.sin(Sine / 24)), math.rad(0)) * CFrame.Angles(0, math.rad(7 * -math.sin(Sine / 24)),0), 0.15 / 3)
						Neck.C0 = Clerp(Neck.C0, NC0 * CFrame.new(0, 0, 0 + ((1) - 1)) * CFrame.Angles(math.rad(0), math.rad(14 * math.cos(Sine / 24)), math.rad(0)), 0.15 / 3)
						LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.5, 0.5 + 0.1 * math.sin(Sine / 24), 0) * CFrame.Angles(math.rad(0), math.rad(12 + 7 * math.cos(Sine / 24)), math.rad(-7 - 7 * math.sin(Sine / 24))) * LSCP, 0.15 / 3)
						RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -1, -0.01) * CFrame.Angles(math.rad(0), math.rad(90), math.rad(0)) * CFrame.Angles(math.rad(-14 * math.cos(Sine / 24)), math.rad(-7), math.rad(0)), 0.15 / 3)
						LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -1, -0.01) * CFrame.Angles(math.rad(0), math.rad(-90), math.rad(0)) * CFrame.Angles(math.rad(-14 * -math.cos(Sine / 24)), math.rad(11), math.rad(-0)), 0.15 / 3)
						if Mover.Holstered == false then
							GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(0,-.5,0) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),1 / 2)
							RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.5 + 0.1 * math.sin(Sine / 24), 0) * CFrame.Angles(math.rad(175), math.rad(-5 - 7 * math.cos(Sine / 24)), math.rad(7 + 7 * math.sin(Sine / 24))) * RSCP, 0.15 / 3)
						elseif Mover.Holstered == true then							
							GunJointBack.C0 = Clerp(GunJointBack.C0,CFrame.new(0,-1,1) * CFrame.Angles(math.rad(90),math.rad(15),math.rad(90)),1 / 2)
							RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.5 + 0.1 * math.sin(Sine / 24), 0) * CFrame.Angles(math.rad(0), math.rad(-12 - 7 * math.cos(Sine / 24)), math.rad(7 - 7 * math.sin(Sine / 24))) * RSCP, 0.15 / 3)
						end
					elseif Mover.Mode == "7th" then
						local Rndm = math.random(-28, 28) * math.cos(Sine / 12)
						local Rndm2 = math.random(-.05, .05)
						local randomStop = math.random(0,50)
						if randomStop <= 47 then
							RootJoint.C0 = Clerp(RootJoint.C0,RC0 * CFrame.new(0, 0, 0 + 0.05 * math.cos(Sine / 12)) * CFrame.Angles(math.rad(-5 - Rndm - 5 * math.sin(Sine / 12)), math.rad(0), math.rad(0)), 0.15 / 3)
							Neck.C0 = Clerp(Neck.C0, NC0 * CFrame.new(0, 0, 0 + ((1) - 1)) * CFrame.Angles(math.rad(15 + 3 * math.sin(Sine / 12)), math.rad(Rndm*math.cos(Sine / math.random(1,12))), math.rad(Rndm*math.sin(Sine / math.random(1,12)))), 0.15 / 3)
							RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.5 + Rndm2 + 0.1 * math.sin(Sine / 12), 0) * CFrame.Angles(math.rad(175 - Rndm + 5 * math.sin(Sine / 12)), math.rad(-0 - Rndm), math.rad(0 + Rndm)) * RSCP, 0.15 / 3)
							LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-.8, 0.4 + Rndm2 + 0.1 * math.sin(Sine / 12), .8) * CFrame.Angles(math.rad(0 - Rndm), math.rad(0 + Rndm + 5 * math.cos(Sine / 12)), math.rad(75 + Rndm + 3 * math.sin(Sine / 12))) * LSCP, 0.15 / 3)
							RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -1 - 0.05 * math.cos(Sine / 12), -0.01) * CFrame.Angles(math.rad(-7 - Rndm - 7 * math.sin(Sine / 12)), math.rad(90), math.rad(0)) * CFrame.Angles(math.rad(-7), math.rad(-7), math.rad(0)), 0.15 / 3)
							LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -1 - 0.05 * math.cos(Sine / 12), -0.01) * CFrame.Angles(math.rad(-7 - Rndm - 7 * math.sin(Sine / 12)), math.rad(-90), math.rad(0)) * CFrame.Angles(math.rad(-9), math.rad(9), math.rad(-0)), 0.15 / 3)
						else
							RootJoint.C0 = Clerp(RootJoint.C0,RC0 * CFrame.new(0, 0, 0 + 0.05 * math.cos(Sine / 12)) * CFrame.Angles(math.rad(-5 - Rndm - 5 * math.sin(Sine / 12) + math.random(-50,50)), math.rad(0), math.rad(0)), 0.15 / 3)
							Neck.C0 = Clerp(Neck.C0, NC0 * CFrame.new(0, 0, 0 + ((1) - 1)) * CFrame.Angles(math.rad(15 + 3 * math.sin(Sine / 12)), math.rad(Rndm*math.cos(Sine / math.random(1,12))), math.rad(Rndm*math.sin(Sine / math.random(1,12)))), 0.15 / 3)
							RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.4, 0.5 + Rndm2 + 0.1 * math.sin(Sine / 12), 0) * CFrame.Angles(math.rad(175 + math.random(-50,50)), math.rad(-0 + math.random(-50,50)), math.rad(0 + math.random(-50,50))) * RSCP, 0.15 / 3)
							LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-.8, 0.4 + Rndm2 + 0.1 * math.sin(Sine / 12), .8) * CFrame.Angles(math.rad(0 + math.random(-50,50)), math.rad(0 + Rndm + 5 * math.cos(Sine / 12)), math.rad(75 + math.random(-50,50))) * LSCP, 0.15 / 3)
							RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -1 - 0.05 * math.cos(Sine / 12), -0.01) * CFrame.Angles(math.rad(-7 - Rndm - 7 * math.sin(Sine / 12) + math.random(-50,50)), math.rad(90), math.rad(0)) * CFrame.Angles(math.rad(-7), math.rad(-7), math.rad(0)), 0.15 / 3)
							LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -1 - 0.05 * math.cos(Sine / 12), -0.01) * CFrame.Angles(math.rad(-7 - Rndm - 7 * math.sin(Sine / 12) + math.random(-50,50)), math.rad(-90), math.rad(0)) * CFrame.Angles(math.rad(-9), math.rad(9), math.rad(-0)), 0.15 / 3)
							Swait(math.random(10,20))
							for i = 1,3 do
								local Rndm = math.random(-150, 150) * math.cos(Sine / 12)
								RootJoint.C0 = Clerp(RootJoint.C0,RC0 * CFrame.new(0, 0, 0 + 0.05 * math.cos(Sine / 12)) * CFrame.Angles(math.rad(-5 - Rndm - 5 * math.sin(Sine / 12) + math.random(-50,50)), math.rad(0), math.rad(0)), 0.15 / 3)
								Neck.C0 = Clerp(Neck.C0, NC0 * CFrame.new(0, 0, 0 + ((1) - 1)) * CFrame.Angles(math.rad(math.random(-150,150) + 3 * math.sin(Sine / 12)), math.rad(math.random(-150,150)*math.cos(Sine / math.random(1,12))), math.rad(math.random(-150,150)*math.sin(Sine / math.random(1,12)))), 0.15 / 3)
								RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.4, 0.5 + Rndm2 + 0.1 * math.sin(Sine / 12), 0) * CFrame.Angles(math.rad(175 + math.random(-50,50)), math.rad(-0 + math.random(-50,50)), math.rad(0 + math.random(-50,50))) * RSCP, 0.15 / 3)
								LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-.8, 0.4 + Rndm2 + 0.1 * math.sin(Sine / 12), .8) * CFrame.Angles(math.rad(0 + math.random(-50,50)), math.rad(0 + Rndm + 5 * math.cos(Sine / 12)), math.rad(75 + math.random(-50,50))) * LSCP, 0.15 / 3)
								RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -1 - 0.05 * math.cos(Sine / 12), -0.01) * CFrame.Angles(math.rad(-7 - Rndm - 7 * math.sin(Sine / 12) + math.random(-50,50)), math.rad(90), math.rad(0)) * CFrame.Angles(math.rad(-7), math.rad(-7), math.rad(0)), 0.15 / 3)
								LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -1 - 0.05 * math.cos(Sine / 12), -0.01) * CFrame.Angles(math.rad(-7 - Rndm - 7 * math.sin(Sine / 12) + math.random(-50,50)), math.rad(-90), math.rad(0)) * CFrame.Angles(math.rad(-9), math.rad(9), math.rad(-0)), 0.15 / 3)
							end
						end
					elseif Mover.Mode == "8th" then
						RootJoint.C0 = Clerp(RootJoint.C0,RC0 * CFrame.new(0, 0, 0 + 0.15 * math.sin(Sine / 8)) * CFrame.Angles(math.rad(0 + 15 * math.sin(Sine / 8)), math.rad(math.random(-300,300)*math.cos(Sine / 2)), math.rad(math.random(-300,300)*math.sin(Sine / 2))), 0.15 / 3)
						Neck.C0 = Clerp(Neck.C0, NC0 * CFrame.new(0, 0, 0 + ((1) - 1)) * CFrame.Angles(math.rad(15 * math.sin(Sine / 8)), math.rad(0), math.rad(0)), 0.15 / 3)
						RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.5 + 0.1 * math.sin(Sine / 10), 0) * CFrame.Angles(math.rad(160 + 10 * math.sin(Sine / 8)), math.rad(-0 - 5 * math.cos(Sine / 8)), math.rad(70 + 30 * math.cos(Sine / 8))) * RSCP, 0.15 / 3)
						LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.5, 0.5 + 0.1 * math.sin(Sine / 10), 0) * CFrame.Angles(math.rad(160 + 10 * math.sin(Sine / 8)), math.rad(0 + 5 * math.cos(Sine / 8)), math.rad(-70 - 30 * math.cos(Sine / 8))) * LSCP, 0.15 / 3)
						RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -1 - 0.15 * math.sin(Sine / 8), -0.3) * CFrame.Angles(math.rad(-5 + 30 * math.sin(Sine / 8)), math.rad(90), math.rad(0)) * CFrame.Angles(math.rad(-7), math.rad(-4), math.rad(0)), 0.15 / 3)
						LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -1 - 0.15 * math.sin(Sine / 8), -0.3) * CFrame.Angles(math.rad(-5 + 30 * math.sin(Sine / 8)), math.rad(-90), math.rad(0)) * CFrame.Angles(math.rad(-8), math.rad(8), math.rad(-0)), 0.15 / 3)
					elseif Mover.Mode == "9th" then
						RootJoint.C0 = Clerp(RootJoint.C0,RC0 * CFrame.new(0, 0, 0 + 0.05 * math.cos(Sine / 16)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-20 + 1 * math.sin(Sine / 16))), 0.15 / 3)
						Neck.C0 = Clerp(Neck.C0, NC0 * CFrame.new(0, 0, 0 + ((1) - 1)) * CFrame.Angles(math.rad(0 + 3 * math.sin(Sine / 16)), math.rad(-3 * math.cos(Sine / 16)), math.rad(35)), 0.15 / 3)
						LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.5, 0.5 + 0.075 * math.cos(Sine / 16), 0) * CFrame.Angles(math.rad(0), math.rad(7 + 5 * math.sin(Sine / 16)), math.rad(-5 - 3* math.sin(Sine / 16))) * LSCP, 0.15 / 3)
						RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -1 - 0.05 * math.cos(Sine / 16), -0.2) * CFrame.Angles(math.rad(-15), math.rad(90), math.rad(0)) * CFrame.Angles(math.rad(-10), math.rad(-30 - 1 * math.sin(Sine / 16)), math.rad(0)), 0.15 / 3)
						LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -1 - 0.05 * math.cos(Sine / 16), -0.3) * CFrame.Angles(math.rad(0), math.rad(-90), math.rad(0)) * CFrame.Angles(math.rad(-7), math.rad(20 + 1 * math.sin(Sine / 16)), math.rad(-0)), 0.15 / 3)
						if Mover.Holstered == false then
							GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(0,-.5,0) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0)),1 / 2)
							RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.45 + 0.05 * math.cos(Sine / 16), .35) * CFrame.Angles(math.rad(-7), math.rad(-60 - 3 * math.sin(Sine / 16)), math.rad(7 + 3 * math.sin(Sine / 16))) * RSCP, 0.15 / 3)
						else
							GunJointBack.C0 = Clerp(GunJointBack.C0,CFrame.new(0,-1,1) * CFrame.Angles(math.rad(90),math.rad(15),math.rad(90)),1 / 2)
							RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.5 + 0.05 * math.cos(Sine / 16), 0) * CFrame.Angles(math.rad(0), math.rad(-7 - 5 * math.sin(Sine / 16)), math.rad(7 + 3 * math.sin(Sine / 16))) * RSCP, 0.15 / 3)
						end
					elseif Mover.Mode == "M7" then
						if math.random(1,180) == 1 then
							Neck.C0=Clerp(Neck.C0,NC0*CFrame.Angles(math.rad(22 + math.random(-2,2)),math.rad(math.random(-2,2)),math.rad(22 + math.random(-2,2))),1)
						end
						RootJoint.C0 = Clerp(RootJoint.C0,RC0 * CFrame.new(0, 0, 0 + 0.05 * math.cos(Sine / 12)) * CFrame.Angles(math.rad(-10 + 7 * math.sin(Sine / 12)), math.rad(0), math.rad(0)), 0.15 / 3)
						Neck.C0 = Clerp(Neck.C0, NC0 * CFrame.new(0, 0, 0 + ((1) - 1) - 0.05 * math.cos(Sine / 12)) * CFrame.Angles(math.rad(15 + 3 * math.sin(Sine / 12)), math.rad(0), math.rad(0)), 0.15 / 3)
						RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.2 + 0.05 * math.cos(Sine / 12), 0.15) * CFrame.Angles(math.rad(-30 + 3 * math.sin(Sine / 12)), math.rad(0 + 3 * math.cos(Sine / 12)), math.rad(7 + 5 * math.cos(Sine / 12))) * RSCP, 0.15 / 3)
						LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.2, 0.2 + 0.05 * math.cos(Sine / 12), 0.3) * CFrame.Angles(math.rad(-30 + -3 * math.sin(Sine / 12)), math.rad(0 + -5 * math.cos(Sine / 12)), math.rad(40 + 5 * math.cos(Sine / 12))) * LSCP, 0.15 / 3)
						RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -1 - 0.05 * math.cos(Sine / 12), -0.01) * CFrame.Angles(math.rad(0 + -10 * -math.sin(Sine / 12)), math.rad(90), math.rad(0)) * CFrame.Angles(math.rad(-2.5), math.rad(-10), math.rad(-10)), 0.15 / 3)
						LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -1 - 0.05 * math.cos(Sine / 12), -0.01) * CFrame.Angles(math.rad(0 + -10 * -math.sin(Sine / 12)), math.rad(-90), math.rad(0)) * CFrame.Angles(math.rad(-2.5), math.rad(10), math.rad(10)), 0.15 / 3)
						GunJoint.C0 = Clerp(GunJoint.C0, CFrame.new(0, -.6, 0) * CFrame.Angles(math.rad(-90 + 5 * math.cos(Sine / 12)),math.rad(0),math.rad(0)), .15 / 3)
					elseif Mover.Mode == "10th" then
						--
						RootJoint.C0 = Clerp(RootJoint.C0,RC0 * CFrame.new(0, 0, 0 + 0.05 * math.cos(Sine / 12)) * CFrame.Angles(math.rad(7 + 5 * math.cos(Sine / 12)), math.rad(0), math.rad(-15)), 0.15 / 2)
						Neck.C0 = Clerp(Neck.C0, NC0 * CFrame.new(0, 0, 0 + ((1) - 1)) * CFrame.Angles(math.rad(12), math.rad(0), math.rad(5 * math.sin(Sine / 12))), 0.15 / 2)
						LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.5, -0.1 - 0.05+Sick.PlaybackLoudness/500, 0) * CFrame.Angles(math.rad(40+Sick.PlaybackLoudness/5), math.rad(0), math.rad(-20)) * LSCP, 0.15 / 2)
						RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -1 - 0.05 * math.cos(Sine / 12), -0.3) * CFrame.Angles(math.rad(-3 + 7 * math.cos(Sine / 12)), math.rad(90), math.rad(0)) * CFrame.Angles(math.rad(-7), math.rad(-17), math.rad(0)), 0.15 / 2)
						LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -1 - 0.05 * math.cos(Sine / 12), -0.3) * CFrame.Angles(math.rad(-3 + 7 * math.cos(Sine / 12)), math.rad(-90), math.rad(0)) * CFrame.Angles(math.rad(-11), math.rad(19), math.rad(-0)), 0.15 / 2)
						if Mover.Holstered == false then
							RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.35 + 0.05 * math.cos(Sine / 12), 0) * CFrame.Angles(math.rad(175 + 5 * math.cos(Sine / 12)), math.rad(-15 - 3 * math.sin(Sine / 12)), math.rad(5 + 5 * math.cos(Sine / 12))) * RSCP, 0.15 / 2)
							GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(0,-.5,0) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),1 / 2)
						elseif Mover.Holstered == true then							
							RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, -0.1 - 0.05+Sick.PlaybackLoudness/500, 0) * CFrame.Angles(math.rad(40+Sick.PlaybackLoudness/5), math.rad(-0), math.rad(20)) * RSCP, 0.15 / 2)
							GunJointBack.C0 = Clerp(GunJointBack.C0,CFrame.new(0,-1,1) * CFrame.Angles(math.rad(90),math.rad(15),math.rad(90)),1 / 2)
						end					
					end
				end
			elseif Mover.Walking == true and Mover.Jump == false and Mover.Fall == false then
				Anim = "Walk"
				if Mover.Attack == false then
					if Run == false then
						if Mover.Mode == "1st" or Mover.Mode == "10th" then
							if Mover.Flying then
								RootJoint.C0 = Clerp(RootJoint.C0,RC0 * CFrame.new(0, 0, 2 + 0.05 * math.cos(Sine / 12)) * CFrame.Angles(math.rad(125 * ForwardMovement/5 - 5 * math.sin(Sine / 12)), math.rad(-SidewaysMovement*25), math.rad(0)), 0.15 / 3)
								Neck.C0 = Clerp(Neck.C0, NC0 * CFrame.new(0, 0, 0 + ((1) - 1)) * CFrame.Angles(math.rad(-25)* ForwardMovement/5, math.rad(SidewaysMovement*25), math.rad(0)), 0.15 / 3)
								LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.5, 0.5 + 0.05 * math.cos(Sine / 12), 0) * CFrame.Angles(math.rad(-80 * ForwardMovement/7 - 5 * math.sin(Sine / 12)), math.rad(0), math.rad(-SidewaysMovement*10)) * LSCP, 0.15 / 3)
								RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -1 - 0.05 * math.cos(Sine / 12), -0.2) * CFrame.Angles(math.rad(-15 *ForwardMovement - 5 * math.cos(Sine / 12)), math.rad(90), math.rad(0)) * CFrame.Angles(math.rad(SidewaysMovement*10), math.rad(-0), math.rad(0)), 0.15 / 3)
								LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -.5 - 0.05 * math.cos(Sine / 12), -0.6) * CFrame.Angles(math.rad(-25 *ForwardMovement - 10 * math.cos(Sine / 12)), math.rad(-90), math.rad(0)) * CFrame.Angles(math.rad(-SidewaysMovement*10), math.rad(0), math.rad(-0)), 0.15 / 3)
								if not Mover.Holstered then
									RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.3 + 0.05 * math.cos(Sine / 12), 0) * CFrame.Angles(math.rad(-175 + ForwardMovement/7 - 5 * math.sin(Sine / 12)), math.rad(-0), math.rad(SidewaysMovement*10)) * RSCP, 0.15 / 3)
									GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(0,-.5,0) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),1 / 2)
								else
									GunJointBack.C0 = Clerp(GunJointBack.C0,CFrame.new(0,-1,1) * CFrame.Angles(math.rad(90),math.rad(15),math.rad(90)),1 / 2)
									RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.5 + 0.05 * math.cos(Sine / 12), 0) * CFrame.Angles(math.rad(-80 * ForwardMovement/7 - 5 * math.sin(Sine / 12)), math.rad(0), math.rad(-SidewaysMovement*10)) * RSCP, 0.15 / 3)
								end
							else
								RootJoint.C0 = Clerp(RootJoint.C0,RC0 * CFrame.new(0, 0, 0 + 0.05 * math.cos(Sine / 12)) * CFrame.Angles(math.rad(5 + 7 * math.sin(Sine / 12))*ForwardMovement, math.rad(-SidewaysMovement*10), math.rad(0)) * CFrame.Angles(0, math.rad(-3 * math.cos(Sine / 12)), 0), 0.15 / 3)
								Neck.C0 = Clerp(Neck.C0, NC0 * CFrame.new(0, 0, 0 + ((1) - 1)) * CFrame.Angles(math.rad(0), math.rad(3 * math.sin(Sine / 12)), math.rad(0)), 0.15 / 3)
								if Mover.Mode ~= "10th" then
									LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.5, 0.4 + 0.05 * math.sin(Sine / 12), -.2 + .1 * math.cos(Sine / 12)) * CFrame.Angles(math.rad(0 - 30 * math.sin(Sine / 12)), math.rad(-0 - 5 * math.sin(Sine / 12)), math.rad(1 + 2 * math.cos(Sine / 12))) * LSCP, 0.15)
								else
									LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.5, -0.1 - 0.05+Sick.PlaybackLoudness/500, 0) * CFrame.Angles(math.rad(40+Sick.PlaybackLoudness/5), math.rad(0), math.rad(-20)) * LSCP, 0.15 / 2)
								end
								RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -.8 - .2 * SidewaysMovement * math.cos(Sine / 12), -0.3 + .3 * ForwardMovement * math.sin(Sine / 12)) * CFrame.Angles(math.rad(0), math.rad(90), math.rad(-45 * math.sin(Sine / 12))) * CFrame.Angles(math.rad(-0 - 3 * SidewaysMovement * 5 * math.sin(Sine / 12)), math.rad(0 - 5 * math.sin(Sine / 12)), math.rad(0)), 0.15)
								LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -.8 + .2 * SidewaysMovement * math.cos(Sine / 12), -0.3 - .3 * ForwardMovement * math.sin(Sine / 12)) * CFrame.Angles(math.rad(0), math.rad(-90), math.rad(-45 * math.sin(Sine / 12))) * CFrame.Angles(math.rad(-0 - 3 * SidewaysMovement * 5 * math.sin(Sine / 12)), math.rad(0 + 5 * math.sin(Sine / 12)), math.rad(0)), 0.15)
								if not Mover.Holstered then
									GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(0,-.5,0) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),1 / 2)
									RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.25 + 0.05 * math.cos(Sine / 12), 0) * CFrame.Angles(math.rad(175 - 3 * math.sin(Sine / 12)), math.rad(5 - 5 * math.cos(Sine / 12)), math.rad(12)) * RSCP, 0.15 / 3)
								else
									GunJointBack.C0 = Clerp(GunJointBack.C0,CFrame.new(0,-1,1) * CFrame.Angles(math.rad(90),math.rad(15),math.rad(90)),1 / 2)
									RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.4 - 0.05 * math.sin(Sine / 12), -.2 - .1 * math.cos(Sine / 12)) * CFrame.Angles(math.rad(0 + 30 * math.sin(Sine / 12)), math.rad(0 + 5 * math.sin(Sine / 12)), math.rad(-1 - 2 * math.cos(Sine / 12))) * RSCP, 0.15)
								end
							end
						elseif Mover.Mode == "2nd" then
							RootJoint.C0 = Clerp(RootJoint.C0,RC0 * CFrame.new(0, 0, 0 + 0.05 * math.cos(Sine / 12)) * CFrame.Angles(math.rad(5 + 7 * math.cos(Sine / 12))*ForwardMovement, math.rad(-SidewaysMovement*10), math.rad(0)), 0.15 / 3)
							Neck.C0 = Clerp(Neck.C0, NC0 * CFrame.new(0, 0, 0 + ((1) - 1)) * CFrame.Angles(math.rad(0), math.rad(3 * math.sin(Sine / 12)), math.rad(0)), 0.15 / 3)
							LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.5, 0.5 + 0.05 * math.cos(Sine / 12), 0 + .1 * math.cos(Sine / 12)) * CFrame.Angles(math.rad(0 - 30 * math.sin(Sine / 12)), math.rad(0), math.rad(0)) * LSCP, 0.15)
							RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -.8 - .2 * math.cos(Sine / 12), -0.3 + .3 * math.sin(Sine / 12)) * CFrame.Angles(math.rad(0), math.rad(90), math.rad(-45 * math.sin(Sine / 12))) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.15)
							LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -.8 + .2 * math.cos(Sine / 12), -0.3 - .3 * math.sin(Sine / 12)) * CFrame.Angles(math.rad(0), math.rad(-90), math.rad(-45 * math.sin(Sine / 12))) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.15)
							if not Mover.Holstered then
								GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(0,-.5,0) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0)),1 / 2)
								RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.5 + 0.05 * math.cos(Sine / 12), 0) * CFrame.Angles(math.rad(-15) + math.rad(0 + 5 * math.sin(Sine / 12)), math.rad(-35 + -5 * math.cos(Sine / 12)), math.rad(0)) * RSCP, 0.15 / 3)
							else
								GunJointBack.C0 = Clerp(GunJointBack.C0,CFrame.new(0,-1,1) * CFrame.Angles(math.rad(90),math.rad(15),math.rad(90)),1 / 2)
								RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.5 + 0.05 * math.cos(Sine / 12), 0 - .1 * math.cos(Sine / 12)) * CFrame.Angles(math.rad(0 + 30 * math.sin(Sine / 12)), math.rad(0), math.rad(0)) * RSCP, 0.15)
							end
						elseif Mover.Mode == "3rd" then
							RootJoint.C0 = Clerp(RootJoint.C0,RC0 * CFrame.new(0, 0, 0 + 0.05 * math.cos(Sine / 12)) * CFrame.Angles(math.rad(5 + 7 * math.cos(Sine / 12))*ForwardMovement, math.rad(-SidewaysMovement*10), math.rad(0)), 0.15 / 3)
							Neck.C0 = Clerp(Neck.C0, NC0 * CFrame.new(0, 0, 0 + ((1) - 1)) * CFrame.Angles(math.rad(0), math.rad(3 * math.sin(Sine / 12)), math.rad(0)), 0.15 / 3)
							LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.5, 0.5 + 0.05 * math.cos(Sine / 12), 0 + .1 * math.cos(Sine / 12)) * CFrame.Angles(math.rad(0 - 30 * math.sin(Sine / 12)), math.rad(0), math.rad(0)) * LSCP, 0.15)
							RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -.8 - .2 * math.cos(Sine / 12), -0.3 + .3 * math.sin(Sine / 12)) * CFrame.Angles(math.rad(0), math.rad(90), math.rad(-45 * math.sin(Sine / 12))) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.15)
							LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -.8 + .2 * math.cos(Sine / 12), -0.3 - .3 * math.sin(Sine / 12)) * CFrame.Angles(math.rad(0), math.rad(-90), math.rad(-45 * math.sin(Sine / 12))) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.15)
							if not Mover.Holstered then
								GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(0,-.5,0) * CFrame.Angles(math.rad(180),math.rad(0),math.rad(0)),1 / 2)
								RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.5 + 0.05 * math.cos(Sine / 12), 0) * CFrame.Angles(math.rad(25), math.rad(-0), math.rad(45)) * RSCP, 0.15 / 3)
							else
								GunJointBack.C0 = Clerp(GunJointBack.C0,CFrame.new(0,-1,1) * CFrame.Angles(math.rad(90),math.rad(15),math.rad(90)),1 / 2)
								RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.5 + 0.05 * math.cos(Sine / 12), 0 - .1 * math.cos(Sine / 12)) * CFrame.Angles(math.rad(0 + 30 * math.sin(Sine / 12)), math.rad(0), math.rad(0)) * RSCP, 0.15)
							end
						elseif Mover.Mode == "4th" then
							RootJoint.C0 = Clerp(RootJoint.C0,RC0 * CFrame.new(0, 0, 0 + 0.05 * math.cos(Sine / 12)) * CFrame.Angles(math.rad(0 + 7 * math.sin(Sine / 12))*ForwardMovement, math.rad(-SidewaysMovement*10), math.rad(-SidewaysMovement*10)), 0.15 / 3)
							Neck.C0 = Clerp(Neck.C0, NC0 * CFrame.new(0, 0, 0 + ((1) - 1)) * CFrame.Angles(math.rad(14 + 5 * math.cos(Sine / 12)), math.rad(3 * math.sin(Sine / 12)), math.rad(-SidewaysMovement*10)), 0.15 / 3)
							if not Mover.Holstered then
								GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(0,-.5,0) * CFrame.Angles(math.rad(5 - 3 * math.cos(Sine / 12)),math.rad(0),math.rad(0)), 0.15 / 3)
								RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.35 + 0.05 * math.cos(Sine / 12), 0) * CFrame.Angles(math.rad(-90 + -3 * math.sin(Sine / 12)), math.rad(-3), math.rad(7)) * RSCP, 0.15 / 3)
							else
								GunJointBack.C0 = Clerp(GunJointBack.C0,CFrame.new(0,-1,1) * CFrame.Angles(math.rad(90),math.rad(15),math.rad(90)),1 / 2)
								RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.5 + 0.05 * math.cos(Sine / 12), 0) * CFrame.Angles(math.rad(0 + 45 * math.sin(Sine / 12)) + math.rad(0 - 35 * math.cos(Sine / 12)), math.rad(0 - 15 * math.cos(Sine / 12)) + math.rad(0 + 15 * math.sin(Sine / 12)), math.rad(8)) * RSCP, 0.15 / 3)
							end
							LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.2, 0.5 + 0.05 * math.cos(Sine / 12), -1) * CFrame.Angles(math.rad(170 + 5 * math.cos(Sine / 12)), math.rad(7 + 3 * math.cos(Sine / 12)), math.rad(37)) * LSCP, 0.15 / 3)
							RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -.9 - 0.35 * math.cos(Sine / 12), -0.35 - .3 * math.cos(Sine / 12)) * CFrame.new(0, 0, 0 + .15 * math.sin(Sine / 12)) * CFrame.Angles(math.rad(-35 * math.sin(Sine / 12)), math.rad(90), math.rad(0)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0 - 45 * math.cos(Sine / 12))), 0.15 / 3)
							LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -.9 + 0.35 * math.cos(Sine / 12), -0.35 + .3 * math.cos(Sine / 12)) * CFrame.new(0, 0, 0 + -.15 * math.sin(Sine / 12)) * CFrame.Angles(math.rad(35 * math.sin(Sine / 12)), math.rad(-90), math.rad(0)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0 - 45 * math.cos(Sine / 12))), 0.15 / 3)
						elseif Mover.Mode == "5th" then
							RootJoint.C0 = Clerp(RootJoint.C0,RC0 * CFrame.new(.7 * math.sin(Sine / 36), 0, 1 + 0.5 * math.cos(Sine / 36)) * CFrame.Angles(math.rad(70), math.rad(-SidewaysMovement*10), math.rad(-5 * math.cos(Sine / 36))), 0.15 / 3)
							Neck.C0 = Clerp(Neck.C0, NC0 * CFrame.new(0, 0, 0 + ((1) - 1)) * CFrame.Angles(math.rad(-36 - 3 * math.cos(Sine / 36)), math.rad(3 * math.sin(Sine / 36)), math.rad(0)), 0.15 / 3)
							RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.5 + 0.05 * math.cos(Sine / 12), 0) * CFrame.Angles(math.rad(-20), math.rad(-5 - 5 * math.cos(Sine / 36)), math.rad(7 + 3 * math.sin(Sine / 36))) * RSCP, 0.15 / 3)
							LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.5, 0.5 + 0.05 * math.cos(Sine / 12), 0) * CFrame.Angles(math.rad(-20), math.rad(5 + 3 * math.cos(Sine / 36)), math.rad(-7 - 5 * math.sin(Sine / 36))) * LSCP, 0.15 / 3)
							RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -.6, -0.5) * CFrame.Angles(math.rad(-20), math.rad(90), math.rad(0)) * CFrame.Angles(math.rad(-5 * math.cos(Sine / 36)), math.rad(-7 - 5 * math.cos(Sine / 36)), math.rad(0 + 5 * math.sin(Sine / 36))), 0.15 / 3)
							LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -1, -0.01) * CFrame.Angles(math.rad(-27), math.rad(-90), math.rad(0)) * CFrame.Angles(math.rad(-5 * -math.cos(Sine / 36)), math.rad(11 + 5 * math.cos(Sine / 36)), math.rad(-0 - 5 * math.sin(Sine / 36))), 0.15 / 3)
							if Mover.Holstered == false then
								GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(0,-.5,0) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),1 / 2)
							else
								GunJointBack.C0 = Clerp(GunJointBack.C0,CFrame.new(0,-1,1) * CFrame.Angles(math.rad(90),math.rad(15),math.rad(90)),1 / 2)
							end
						elseif Mover.Mode == "6th" then
							RootJoint.C0 = Clerp(RootJoint.C0,RC0 * CFrame.new(0, 0, 3 + 0.2 * math.cos(Sine / 24)) * CFrame.Angles(math.rad(60), math.rad(-7 * math.sin(Sine / 24)), math.rad(0)) * CFrame.Angles(0,math.rad(7 * -math.sin(Sine / 24)),0) * CFrame.Angles(0, math.rad(-SidewaysMovement*10),0), 0.15 / 3)
							Neck.C0 = Clerp(Neck.C0, NC0 * CFrame.new(0, 0, 0 + ((1) - 1)) * CFrame.Angles(math.rad(-30), math.rad(14 * math.cos(Sine / 24)), math.rad(0)), 0.15 / 3)
							LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.5, 0.5 + 0.1 * math.cos(Sine / 12), 0) * CFrame.Angles(math.rad(120 + 5 * math.sin(Sine / 24)), math.rad(7 + 5 * math.cos(Sine / 24)), math.rad(-7)) * LSCP, 0.15 / 3)
							RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -1, -0.01) * CFrame.Angles(math.rad(-20), math.rad(90), math.rad(0)) * CFrame.Angles(math.rad(-14 * math.cos(Sine / 24)), math.rad(-11 - 5 * math.cos(Sine / 24)), math.rad(0)), 0.15 / 3)
							LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -.6, -0.5) * CFrame.Angles(math.rad(-30), math.rad(-90), math.rad(0)) * CFrame.Angles(math.rad(14 * math.cos(Sine / 24)), math.rad(7 + 5 * math.cos(Sine / 24)), math.rad(-0)), 0.15 / 3)
							if Mover.Holstered == false then
								GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(0,-.5,0) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),1 / 2)
								RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.35 + 0.1 * math.cos(Sine / 12), 0) * CFrame.Angles(math.rad(175 - 5 * math.sin(Sine / 24)), math.rad(-11 - 5 * math.cos(Sine / 24)), math.rad(7)) * RSCP, 0.15 / 3)
							elseif Mover.Holstered == true then							
								GunJointBack.C0 = Clerp(GunJointBack.C0,CFrame.new(0,-1,1) * CFrame.Angles(math.rad(90),math.rad(15),math.rad(90)),1 / 2)
								RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.35 + 0.1 * math.cos(Sine / 12), 0) * CFrame.Angles(math.rad(120 + 5 * math.sin(Sine / 24)), math.rad(-7 - 5 * math.cos(Sine / 24)), math.rad(7)) * RSCP, 0.15 / 3)
							end
						elseif Mover.Mode == "7th" then
							RootJoint.C0 = Clerp(RootJoint.C0,RC0 * CFrame.new(0, 0, 0 + 0.05 * math.cos(Sine / 12)) * CFrame.Angles(math.rad(6 + 4 * math.cos(Sine / 10))*ForwardMovement, math.rad(3 * math.sin(Sine / 10)), math.rad(0)) * CFrame.Angles(0, math.rad(-SidewaysMovement*10),0), 0.15)
							Neck.C0 = Clerp(Neck.C0, NC0 * CFrame.new(0, 0, 0 + ((1) - 1)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.15 / 3)
							RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.5 + 0.05 * math.cos(Sine / 12), 0) * CFrame.Angles(math.rad(175), math.rad(-0), math.rad(0)) * RSCP, 0.15)
							LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.5, 0.5 + 0.05 * math.cos(Sine / 12), 0) * CFrame.Angles(math.rad(-30 * math.sin(Sine / 10)), math.rad(0), math.rad(-0)) * LSCP, 0.15)
							RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -.8 - .25 * math.cos(Sine / 10), -.35 + .3 * math.sin(Sine / 10)) * CFrame.Angles(math.rad(0), math.rad(90 - 5 * math.sin(Sine / 10)), math.rad(-30 * math.sin(Sine / 10))), .15)
							LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -.8 + .25 * math.cos(Sine / 10), -.35 - .3 * math.sin(Sine / 10)) * CFrame.Angles(math.rad(0), math.rad(-90 - 5 * math.sin(Sine / 10)), math.rad(-30 * math.sin(Sine / 10))), .15)
						elseif Mover.Mode == "8th" then
							RootJoint.C0 = Clerp(RootJoint.C0,RC0 * CFrame.new(0, 0, 0 + 0.15 * math.sin(Sine / 8)) * CFrame.Angles(math.rad(0 + 15 * math.sin(Sine / 8)), math.rad(math.random(-300,300)*math.cos(Sine / 2)), math.rad(math.random(-300,300)*math.sin(Sine / 2))), 0.15 / 3)
							Neck.C0 = Clerp(Neck.C0, NC0 * CFrame.new(0, 0, 0 + ((1) - 1)) * CFrame.Angles(math.rad(15 * math.sin(Sine / 8)), math.rad(0), math.rad(0)), 0.15 / 3)
							RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.5 + 0.1 * math.sin(Sine / 10), 0) * CFrame.Angles(math.rad(160 + 10 * math.sin(Sine / 8)), math.rad(-0 - 5 * math.cos(Sine / 8)), math.rad(70 + 30 * math.cos(Sine / 8))) * RSCP, 0.15 / 3)
							LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.5, 0.5 + 0.1 * math.sin(Sine / 10), 0) * CFrame.Angles(math.rad(160 + 10 * math.sin(Sine / 8)), math.rad(0 + 5 * math.cos(Sine / 8)), math.rad(-70 - 30 * math.cos(Sine / 8))) * LSCP, 0.15 / 3)
							RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -1 - 0.15 * math.sin(Sine / 8), -0.3) * CFrame.Angles(math.rad(-5 + 30 * math.sin(Sine / 8)), math.rad(90), math.rad(0)) * CFrame.Angles(math.rad(-7), math.rad(-4), math.rad(0)), 0.15 / 3)
							LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -1 - 0.15 * math.sin(Sine / 8), -0.3) * CFrame.Angles(math.rad(-5 + 30 * math.sin(Sine / 8)), math.rad(-90), math.rad(0)) * CFrame.Angles(math.rad(-8), math.rad(8), math.rad(-0)), 0.15 / 3)
						elseif Mover.Mode == "9th" then
							RootJoint.C0 = Clerp(RootJoint.C0, RC0 * CFrame.new(0, 0, -0.1 + 0.05 * math.cos(Sine / 10)) * CFrame.Angles(math.rad(15)*ForwardMovement, math.rad(3 * math.sin(Sine / 10)), math.rad(0 - 5 * math.cos(Sine / 10))) * CFrame.Angles(0, math.rad(-SidewaysMovement*10),0), 0.15)
							Neck.C0 = Clerp(Neck.C0, NC0 * CFrame.new(0, 0, 0 + ((1) - 1) - 0.05 * math.cos(Sine / 10)) * CFrame.Angles(math.rad(-5), math.rad(-3 * math.cos(Sine / 10)), math.rad(0)), 0.15 / 3)
							LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.5, 0.45 + 0.05 * math.cos(Sine / 10), 0 + .05 * math.cos(Sine / 10)) * CFrame.Angles(math.rad(-20 * math.sin(Sine / 10)), math.rad(0), math.rad(-5)) * LSCP, 0.15)
							RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -.8 - .25 * math.cos(Sine / 10), -.35 + .3 * math.sin(Sine / 10)) * CFrame.Angles(math.rad(0), math.rad(90 - 5 * math.sin(Sine / 10)), math.rad(-45 * math.sin(Sine / 10))), .15)
							LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -.8 + .25 * math.cos(Sine / 10), -.35 - .3 * math.sin(Sine / 10)) * CFrame.Angles(math.rad(0), math.rad(-90 - 5 * math.sin(Sine / 10)), math.rad(-45 * math.sin(Sine / 10))), .15)
							if Mover.Holstered == false then
								GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(0,-.5,0) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0)),1 / 2)
								RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.4 + 0.05 * math.cos(Sine / 10), 0.35) * CFrame.Angles(math.rad(-7 - 5 * math.sin(Sine / 10)), math.rad(-45 - 3 * math.cos(Sine / 10)), math.rad(9)) * RSCP, 0.15)
							else
								GunJointBack.C0 = Clerp(GunJointBack.C0,CFrame.new(0,-1,1) * CFrame.Angles(math.rad(90),math.rad(15),math.rad(90)),1 / 2)
								RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.45 + 0.05 * math.cos(Sine / 10), 0 - .05 * math.cos(Sine / 10)) * CFrame.Angles(math.rad(20 * math.sin(Sine / 10)), math.rad(-0), math.rad(5)) * RSCP, 0.15)
							end
						elseif Mover.Mode == "M7" then
							GunJoint.C0 = Clerp(GunJoint.C0, CFrame.new(0, -.6, 0) * CFrame.Angles(math.rad(-180),math.rad(0),math.rad(0)), .15 / 3)
							RootJoint.C0 = Clerp(RootJoint.C0, RC0 * CFrame.new(0, 0, -0.1 + 0.05 * math.cos(Sine / 22)) * CFrame.Angles(math.rad(15), math.rad(0), math.rad(0 - 5 * math.cos(Sine / 10))), 0.15)
							Neck.C0 = Clerp(Neck.C0, NC0 * CFrame.new(0, 0, 0 + ((1) - 1) - 0.05 * math.cos(Sine / 12)) * CFrame.Angles(math.rad(-5), math.rad(0), math.rad(0)), 0.15 / 3)
							LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.2, 0.4 + 0.05 * math.cos(Sine / 12), 0.3) * CFrame.Angles(math.rad(-30), math.rad(0), math.rad(50)) * LSCP, 0.15 / 3)
							RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -.8 - .25 * math.cos(Sine / 12), -.35 + .3 * math.sin(Sine / 12)) * CFrame.Angles(math.rad(0), math.rad(90 - 5 * math.sin(Sine / 12)), math.rad(-45 * math.sin(Sine / 12))), .25)
							LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -.8 + .25 * math.cos(Sine / 12), -.35 - .3 * math.sin(Sine / 12)) * CFrame.Angles(math.rad(0), math.rad(-90 - 5 * math.sin(Sine / 12)), math.rad(-45 * math.sin(Sine / 12))), .25)
							if Mover.Holstered == false then
								GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(0,-.5,0) * CFrame.Angles(math.rad(-70),math.rad(0),math.rad(0)),1 / 2)
								RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.4 + 0.05 * math.cos(Sine / 12), 0.15) * CFrame.Angles(math.rad(-30), math.rad(0), math.rad(7)) * RSCP, 0.15 / 3)
							else
								GunJointBack.C0 = Clerp(GunJointBack.C0,CFrame.new(0,-1,1) * CFrame.Angles(math.rad(90),math.rad(15),math.rad(90)),1 / 2)
								RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.4 + 0.05 * math.cos(Sine / 12), 0 - .05 * math.cos(Sine / 12)) * CFrame.Angles(math.rad(20 * math.sin(Sine / 12)), math.rad(-0), math.rad(5)) * RSCP, 0.15 / 3)
							end
						end
					else
						Anim = "Run"
						RootJoint.C0 = Clerp(RootJoint.C0,RC0 * CFrame.new(0, 0, 0 + 0.05 * math.cos(Sine / 6)) * CFrame.Angles(math.rad(15 + 7 * math.sin(Sine / 6))*ForwardMovement, math.rad(-SidewaysMovement*10), math.rad(0)), 0.15 / 3)
						Neck.C0 = Clerp(Neck.C0, NC0 * CFrame.new(0, 0, 0 + ((1) - 1)) * CFrame.Angles(math.rad(0 - 7 * math.cos(Sine / 6)), math.rad(0), math.rad(0)), 0.15 / 3)
						LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.5, 0.5 + 0.05 * math.cos(Sine / 6), 0 + .1 * math.cos(Sine / 6)) * CFrame.Angles(math.rad(0 - 70 * math.sin(Sine / 6)), math.rad(0), math.rad(0)) * LSCP, 0.15)
						RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -.8 - .2 * math.cos(Sine / 6), -0.3 + .3 * math.sin(Sine / 6)) * CFrame.Angles(math.rad(0), math.rad(90), math.rad(-80 * math.sin(Sine / 6))) * CFrame.Angles(math.rad(-0 - 3 * SidewaysMovement * 5 * math.sin(Sine / 6)), math.rad(0), math.rad(0)), 0.15)
						LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -.8 + .2 * math.cos(Sine / 6), -0.3 - .3 * math.sin(Sine / 6)) * CFrame.Angles(math.rad(0), math.rad(-90), math.rad(-80 * math.sin(Sine / 6))) * CFrame.Angles(math.rad(-0 - 3 * SidewaysMovement * 5 * math.sin(Sine / 6)), math.rad(0), math.rad(0)), 0.15)
						if not Mover.Holstered then
							GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(0,-.5,0) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),1 / 2)
							RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.5 + 0.05 * math.cos(Sine / 6), 0 - .1 * math.cos(Sine / 6)) * CFrame.Angles(math.rad(175 + 5 * math.sin(Sine / 6)), math.rad(0), math.rad(0)) * RSCP, 0.15)
						else
							GunJointBack.C0 = Clerp(GunJointBack.C0,CFrame.new(0,-1,1) * CFrame.Angles(math.rad(90),math.rad(15),math.rad(90)),1 / 2)
							RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.5 + 0.05 * math.cos(Sine / 6), 0 - .1 * math.cos(Sine / 6)) * CFrame.Angles(math.rad(0 + 70 * math.sin(Sine / 6)), math.rad(0), math.rad(0)) * RSCP, 0.15)
						end
					end
				end
			end
			if Mover.Jump == true then
				Anim = "Jump"
				if Mover.Attack == false then
					RootJoint.C0 = Clerp(RootJoint.C0,RC0 * CFrame.new(0,0,0 ) * CFrame.Angles(math.rad(-5),math.rad(0),math.rad(0)),1 / 3)
					Neck.C0 = Clerp(Neck.C0,NC0 * CFrame.new(0,0 ,0 + ((1) - 1)) * CFrame.Angles(math.rad(-25),math.rad(0),math.rad(10)),1 / 3)
					RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5,0.5,0) * CFrame.Angles(math.rad(-50),math.rad(0),math.rad(0 + 10 * math.cos(Sine / 12))) * RSCP,1 / 3)
					LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,0.5,0) * CFrame.Angles(math.rad(50),math.rad(0),math.rad(-25 - 10 * math.cos(Sine / 12))) * LSCP,1 / 3)
					RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-0.4,-0.6) * CFrame.Angles(math.rad(1),math.rad(90),math.rad(0)) * CFrame.Angles(math.rad(-1 * math.sin(Sine / 6)),math.rad(0),math.rad(0)),1 / 3)
					LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1,0) * CFrame.Angles(math.rad(0),math.rad(-85),math.rad(0)) * CFrame.Angles(math.rad(-1 * math.sin(Sine / 6)),math.rad(0),math.rad(0)),1 / 3)
					GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(0.05,-1,-0.15) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),1 / 2)
				end
			elseif Mover.Fall == true and Mover.Jump == false then
				Anim = "Fall"
				if Mover.Attack == false then
					RootJoint.C0 = Clerp(RootJoint.C0,RC0 * CFrame.new(0,0,0) * CFrame.Angles(math.rad(15),math.rad(0),math.rad(0)),1 / 3)
					Neck.C0 = Clerp(Neck.C0,NC0 * CFrame.new(0,0 ,0 + ((1) - 1)) * CFrame.Angles(math.rad(-15),math.rad(2.5),math.rad(5+5 * math.cos(Sine / 12))),1 / 3)
					RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5,0.5,0) * CFrame.Angles(math.rad(-90 - 4 * math.cos(Sine / 6)),math.rad(0),math.rad(0 + 10 * math.cos(Sine / 12))) * RSCP,1 / 3)
					LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,0.5,0) * CFrame.Angles(math.rad(35 - 4 * math.cos(Sine / 6)),math.rad(0),math.rad(-45 - 10 * math.cos(Sine / 12))) * LSCP,1 / 3)
					RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-0.3,-0.7) * CFrame.Angles(math.rad(-25 + 5 * math.sin(Sine / 12)),math.rad(90),math.rad(0)) * CFrame.Angles(math.rad(-1 * math.sin(Sine / 6)),math.rad(0),math.rad(0)),1 / 3)
					LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-0.8,-0.3) * CFrame.Angles(math.rad(-10),math.rad(-80),math.rad(0)) * CFrame.Angles(math.rad(-1 * math.sin(Sine / 6)),math.rad(0),math.rad(0)),1 / 3)
					GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(0.05,-1,-0.15) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),1 / 2)
				end
			end
		end
	end
end)
chatfunc("this was made by solidify")
--\\ End //--

--[[
-- CR Animation Template --
RootJoint.C0 = Clerp(RootJoint.C0,RC0 * CFrame.new(0, 0, 0 + 0.05 * math.cos(Sine / 12)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.15 / 3)
Neck.C0 = Clerp(Neck.C0, NC0 * CFrame.new(0, 0, 0 + ((1) - 1)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.15 / 3)
RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.5 + 0.05 * math.cos(Sine / 12), 0) * CFrame.Angles(math.rad(0), math.rad(-0), math.rad(0)) * RSCP, 0.15 / 3)
LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.5, 0.5 + 0.05 * math.cos(Sine / 12), 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-0)) * LSCP, 0.15 / 3)
RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -1 - 0.05 * math.cos(Sine / 12), -0.01) * CFrame.Angles(math.rad(0), math.rad(90), math.rad(0)) * CFrame.Angles(math.rad(-0), math.rad(-0), math.rad(0)), 0.15 / 3)
LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -1 - 0.05 * math.cos(Sine / 12), -0.01) * CFrame.Angles(math.rad(0), math.rad(-90), math.rad(0)) * CFrame.Angles(math.rad(-0), math.rad(0), math.rad(-0)), 0.15 / 3)
]]--