-- this was fixed and converted by Megumi Scripts
IT = Instance.new
CF = CFrame.new
VT = Vector3.new
RAD = math.rad
C3 = Color3.new
UD2 = UDim2.new
BRICKC = BrickColor.new
ANGLES = CFrame.Angles
EULER = CFrame.fromEulerAnglesXYZ
COS = math.cos
ACOS = math.acos
SIN = math.sin
ASIN = math.asin
ABS = math.abs
MRANDOM = math.random
FLOOR = math.floor
radian = math.rad
random = math.random
Vec3 = Vector3.new
Inst = Instance.new
cFrame = CFrame.new
Euler = CFrame.fromEulerAnglesXYZ
vt = Vector3.new
bc = BrickColor.new
br = BrickColor.random
it = Instance.new
cf = CFrame.new
angles = CFrame.Angles
Cf = CFrame.new
Cos = math.cos
Sin = math.sin
Abs = math.abs
Rad = math.rad
V3 = {N=Vector3.new,FNI=Vector3.FromNormalId,A=Vector3.FromAxis}
M = {C=math.cos,R=math.rad,S=math.sin,P=math.pi,RNG=math.random,MRS=math.randomseed,H=math.huge,RRNG = function(min,max,div) return math.rad(math.random(min,max)/(div or 1)) end}
R3 = {N=Region3.new}

local RunService = game:GetService("RunService")
local lplr = game:GetService("Players").LocalPlayer
local Player = lplr
local Mouse = lplr:GetMouse()

local function swait(n) for _ = 1, (n or 1) do RunService.Heartbeat:Wait() end end
local function RandomMath()
	return tostring(math.random(0,1000000000))..tostring(math.random(0,1000000000))
end

local MainColor = Color3.fromRGB(0, 0, 0)
Sine = 0
Running = true
KeyHold = false
local Effects
local GunJoint, GunJointBack
local attackonev2 = function() end
local AttackTarget
local AttackHit


local Mover = {
	Walking = false, Jump = false, Fall = false, Attack = false, Holstered = false,
	Mode = "1st", Flying = false, KillType = "Void", UseShield = false, SpamRefit = false,
	KILL = false, UsingEffects = true, Sitting = false, CFrame = CFrame.new(),
	MainSound = "rbxassetid://1842713324", PlaybackSpeed = .85,
}

local function GetHead()
	local c = lplr.Character
	return c and c:FindFirstChild("Head")
end


local Holder = Instance.new("Folder")
Holder.Name = RandomMath()
Holder.Parent = workspace

local Sick = Instance.new("Sound", Holder)
Sick.Volume = 3
Sick.SoundId = Mover.MainSound
Sick.PlaybackSpeed = Mover.PlaybackSpeed
Sick.Looped = true
Sick.Playing = true

local function CreateSound(ID, PARENT, VOLUME, PITCH)
	local s = Instance.new("Sound")
	s.SoundId = "rbxassetid://"..ID
	s.Volume = VOLUME
	s.PlaybackSpeed = PITCH
	s.Parent = PARENT
	s:Play()
	s.Ended:Connect(function() s:Destroy() end)
	task.delay(5, function() if s.Parent then s:Destroy() end end)
	return s
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
local TextM1 = {
	"HLCV1",
	"HLCV1",
	"HLCV1",
	"|-|LCV1",
	"H1CV1",
	"HLCV1",
	"HLCV1",
	"HLCV1",
	"HLCV|",
	"HLCV1",
	"HLCV1",
	"HLCVl",
	"HLCV1",
	"HLCV1",
	"HLCV1",
	"HLCV1",
	"HL(V1",
	"HLCV1",
	"HLCVI",
	"HLCV1",
	"HLCV1",
	"H1CVI",
	"HLCV1",
	"HLCV1",
	"HLCV1",
	"HLCV1",
	"H1(V1",
	"HLCV1",
	"HLCV1",
	"HLCV1"
}



local Billboard, Billboardtext
function RefitName()
	if Billboard then pcall(function() Billboard:Destroy() end) end
	Billboard = Instance.new("BillboardGui", Holder)
	Billboard.Size = UDim2.new(0,9999,2,0)
	Billboard.StudsOffset = Vector3.new(0,4.5,0)
	Billboard.Adornee = GetHead()
	Billboard.Name = RandomMath()
	Billboardtext = Instance.new("TextLabel", Billboard)
	Billboardtext.BackgroundTransparency = 1
	Billboardtext.BorderSizePixel = 0
	Billboardtext.Text = "Horizon LC"
	Billboardtext.TextScaled = true
	Billboardtext.TextStrokeTransparency = 0
	Billboardtext.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
	Billboardtext.Size = UDim2.new(1,0,1,0)
end
RefitName()

function Fixer1() RefitName() end
local function Fixer2() end
local function Fixer3() end


local gui, fixcharbutton
local replacingGui = false
local function MakeGui()
	replacingGui = true
	if gui then pcall(function() gui:Destroy() end) end
	replacingGui = false
	local this = Instance.new("ScreenGui")
	gui = this
	this.Name = RandomMath()
	this.ResetOnSpawn = false
	fixcharbutton = Instance.new("TextButton", this)
	fixcharbutton.TextScaled = true
	fixcharbutton.Font = "Arial"
	fixcharbutton.Name = RandomMath()
	fixcharbutton.BorderSizePixel = 0
	fixcharbutton.BackgroundTransparency = .5
	fixcharbutton.TextStrokeColor3 = Color3.new(0, 0, 0)
	fixcharbutton.TextStrokeTransparency = 0
	fixcharbutton.BackgroundColor3 = Color3.new(0, 0, 0)
	fixcharbutton.Text = "Refit"
	fixcharbutton.Size = UDim2.new(.25,0,0,36)
	fixcharbutton.AnchorPoint = Vector2.new(1,1)
	fixcharbutton.Position = UDim2.new(.62,0,0,0)
	fixcharbutton.MouseButton1Click:Connect(function() Fixer1() end)
	this.AncestryChanged:Connect(function()
		-- recreate only if something else removed it (not our own replacement)
		if this == gui and not this.Parent and not replacingGui then
			task.defer(MakeGui)
		end
	end)
	this.Parent = lplr:WaitForChild("PlayerGui")
end
MakeGui()
RunService.Heartbeat:Connect(function()
	if fixcharbutton and fixcharbutton.Parent then
		local l = math.clamp(Sick.PlaybackLoudness/1000, 0, 1)
		fixcharbutton.TextColor3 = Color3.new(l, l, l)
	end
end)


local Chat = {Current = nil}
function chatfunc(text)
	task.spawn(function()
		if Chat.Current then pcall(function() Chat.Current:Destroy() end) end
		local bb = Instance.new("BillboardGui", Holder)
		Chat.Current = bb
		bb.Size = UDim2.new(0,9999,2,0)
		bb.StudsOffset = Vector3.new(0,7.5,0)
		bb.Adornee = GetHead()
		bb.Name = "HLCBillboard"
		local lbl = Instance.new("TextLabel", bb)
		lbl.BackgroundTransparency = 1
		lbl.BorderSizePixel = 0
		lbl.Text = ""
		lbl.Font = "Code"
		lbl.TextScaled = true
		lbl.TextStrokeTransparency = 0
		lbl.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
		lbl.Size = UDim2.new(1,0,1,0)
		local conn
		conn = RunService.Heartbeat:Connect(function()
			if not bb.Parent then conn:Disconnect() return end
			lbl.TextColor3 = MainColor
			bb.Adornee = GetHead()
			lbl.Position = UDim2.new(0,math.random(-3,3),0,3*math.sin(Sine / 24) + math.random(-3,3))
			lbl.Rotation = math.random(-3,3)
		end)
		bb.Destroying:Connect(function() conn:Disconnect() end)
		for i = 1, #text do
			if not bb.Parent then return end
			CreateSound(9116154737, Holder, 10, .7)
			task.wait(.025)
			lbl.Text = string.sub(text,1,i)
		end
		task.wait(2.4)
		for i = 1,50 do
			if not bb.Parent then return end
			swait()
			lbl.Position = lbl.Position - UDim2.new(0,math.random(-3,3),0,math.random(-3,3))
			lbl.Rotation = lbl.Rotation + math.random(-2,2)
			lbl.TextStrokeTransparency = i/50
			lbl.TextTransparency = lbl.TextStrokeTransparency
		end
		conn:Disconnect()
		bb:Destroy()
		if Chat.Current == bb then Chat.Current = nil end
	end)
end
Player.Chatted:Connect(function(Msg) chatfunc(Msg) end)


local Moves = {}
for _, n in ipairs({"Dash","Beam","PainlessRain","KickAttack","SoulAbsorption","SoulPurge","LightningShoot","Roar","AntiAttack","bergChair","InsIntro","Shutdown","Day","Night","Sprint","FixLighting"}) do
	Moves[n] = function() end
end


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
		Moves.InsIntro()
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
	
	if KeyDown == "m" and Mover.Attack == false and Mover.Mode == "1st" then
		Mover.Mode = "M1"
	end
	
	if KeyDown == "0" and Mover.Attack == false and Mover.Mode ~= "10th" then
		Mover.Mode = "10th"
	end
	
	if KeyDown == "z" and Mover.Attack == false and not Mover.Holstered then
		Moves.Dash()
	end
	
	if KeyDown == "x" and Mover.Attack == false and not Mover.Holstered then
		Moves.Beam()
	end
	
	if KeyDown == "c" and Mover.Attack == false and not Mover.Holstered then
		Moves.PainlessRain()
	end
	
	if KeyDown == "v" and Mover.Attack == false and not Mover.Holstered then
		Moves.KickAttack()
	end
	
	if KeyDown == "z" and Mover.Attack == false and Mover.Holstered then
		Moves.SoulAbsorption()
	end
	
	if KeyDown == "x" and Mover.Attack == false and Mover.Holstered then
		Moves.SoulPurge()
	end
	
	if KeyDown == "c" and Mover.Attack == false and Mover.Holstered then
		 Moves.LightningShoot()
	end
	
	if KeyDown == "v" and Mover.Attack == false and Mover.Holstered then
		Moves.Roar()
	end
	
	if KeyDown == "b" and Mover.Attack == false and Mover.Holstered then
		Moves.AntiAttack()
	end
	
	if KeyDown == "r" and Mover.Mode == "9th" then
		Mover.Sitting = not Mover.Sitting
		Moves.bergChair()
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
		if Effects then Effects:ClearAllChildren() end
		chatfunc("[Setting]: ".."Cleared Effects")
	end
	
	if KeyDown == "l" then
		Moves.FixLighting()
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
		Moves.Shutdown()
	end
	
	if KeyDown == "[" and Mover.Attack == false then
		Mover.CFrame = CFrame.new(0,55,0)
	end
	
	if KeyDown == "]" and Mover.Attack == false then
		Fixer2()
		Fixer1()
	end
	
	if KeyDown == "-" then
		Moves.Night()
		chatfunc("/time set night")
	end
	
	if KeyDown == "=" then
		Moves.Day()
		chatfunc("/time set day")
	end
	
	if KeyDown == ";" and Mover.Attack == false then
		Moves.Sprint()
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


local PL = function() return Sick.PlaybackLoudness end
local MODES = {
	["M1"]   = {function() return Color3.fromHSV((tick() % 15/15),1,1) end, "rbxassetid://1842713324", .9},
	["1st"]  = {function() return Color3.fromHSV((tick() % 15/15),1,1) end, "rbxassetid://1842713324", .9},
	["2nd"]  = {function() return Color3.fromRGB(math.clamp(PL()-150,0,255),math.clamp(PL()-150,0,102),math.clamp(PL()-150,0,204)) end, "rbxassetid://9043781108", 1},
	["3rd"]  = {function() return Color3.new(math.floor(PL()/300),0,0) end, "rbxassetid://1840039123", 1},
	["4th"]  = {function() return Color3.new(math.floor(PL()/300),math.floor(PL()/300),math.floor(PL()/300)) end, "rbxassetid://9039292658", 1},
	["5th"]  = {function() return Color3.fromRGB(math.random(0,255)*PL()/255,math.random(0,255)*PL()/255,math.random(0,255)*PL()/255) end, "rbxassetid://1841924145", .9},
	["6th"]  = {function() return Color3.new(0,math.floor(PL()/300),0) end, "rbxassetid://1836021107", 1},
	["7th"]  = {function() return Color3.new(PL()/500,0,PL()/500) end, "rbxassetid://1838075861", 1},
	["8th"]  = {function() return Color3.new(PL()/500,0,PL()/500) end, "rbxassetid://1837694918", 1},
	["9th"]  = {function() return Color3.new(0,0,math.floor(PL()/140)) end, "rbxassetid://1840038982", .8},
	["M7"]   = {function() return Color3.new(math.floor(math.random(0,255)),0,0) end, "rbxassetid://1837015572", 1},
	["10th"] = {function() return Color3.new(PL()/500,PL()/500,0) end, "rbxassetid://5410086149", .85},
}
local TEXTSETS = {["M1"]=TextM1,["1st"]=Text,["2nd"]=TextDown,["3rd"]=TextEndless,["4th"]=TextMadness,["5th"]=TextInstanity,["6th"]=TextErr0r,["7th"]=TextGlitch,["8th"]=TextSKID,["9th"]=TextBerg,["M7"]=TextMute,["10th"]=Text}



local Gun = {}
Gun.Grip = {Pos = Vector3.new(0,0,0), Rot = Vector3.new(0,0,0)}
local function GripCF(g)
	g = g or Gun.Grip
	return CFrame.new(g.Pos) * CFrame.Angles(math.rad(g.Rot.X), math.rad(g.Rot.Y), math.rad(g.Rot.Z))
end
function Gun.GetAnchor(grip)
	local char = lplr.Character
	if not char then return nil end
	if Mover.Holstered then
		local torso = char:FindFirstChild("Torso")
		if torso then
			return torso.CFrame * (GunJointBack and GunJointBack.C0 or (CFrame.new(0,-1,1) * CFrame.Angles(math.rad(90),math.rad(15),math.rad(90)))) * GripCF(grip)
		end
	else
		local arm = char:FindFirstChild("Right Arm")
		if arm then
			if Mover.Mode == "M1" and not Mover.Attack and not Mover.Jump and not Mover.Fall then
				local m1
				if Mover.Walking then
					m1 = CFrame.new(0.05,-1,-0.15) * CFrame.Angles(math.rad(-93.75+7.25*math.cos(Sine/12)),0,0)
				else
					m1 = CFrame.new(.05,-1,-.15) * CFrame.Angles(math.rad(90),0,0)
				end
				if GunJoint then GunJoint.C0 = m1 end
				return arm.CFrame * m1 * GripCF(grip)
			end
			return arm.CFrame * (GunJoint and GunJoint.C0 or CFrame.new(0.05,-1,-0.15)) * GripCF(grip)
		end
	end
	return nil
end
function Gun.Muzzle()
	if Gun.Anchor then return (Gun.Anchor * CFrame.new(3.342, -1.538, -0.001)).Position end
	local c = lplr.Character
	local r = c and (c:FindFirstChild("Right Arm") or c:FindFirstChild("HumanoidRootPart"))
	return r and r.Position or Vector3.new()
end
task.spawn(function()
	local ok, objs = pcall(function() return game:GetObjects("rbxassetid://83019346970428") end)
	if not ok or not objs then warn("your wifi is straight bum just get another atp") return end
	Gun.Objs = objs
	local container
	for _, o in ipairs(objs) do
		local gb = o:FindFirstChild("GunBase", true)
		if gb then container = gb.Parent break end
	end
	if not container then warn("gun not found its prıb your wifi or smth dont blame the script") return end
	for _, child in ipairs(container:GetChildren()) do
		local sz = child:IsA("BasePart") and child.Size or (child:IsA("Model") and child:GetExtentsSize()) or nil
		print("Horizon LC gun piece:", child.Name, child.ClassName, sz and string.format("size %.2f x %.2f x %.2f", sz.X, sz.Y, sz.Z) or "")
	end
	local function prep(p)
		if p:IsA("BasePart") then
			p.Anchored = true p.CanCollide = false p.CanTouch = false p.CanQuery = false p.Massless = true p.Locked = true
		end
	end
	local function Make(name)
		local src = container:FindFirstChild(name)
		if not src then warn("Horizon LC: missing gun piece "..name) return nil end
		local c = src:Clone()
		for _, d in ipairs(c:GetDescendants()) do
			if d:IsA("LuaSourceContainer") then d:Destroy() end
		end
		prep(c)
		for _, d in ipairs(c:GetDescendants()) do prep(d) end
		c.Name = RandomMath()
		c.Parent = Holder
		local piece = {Root = c, Kids = {}}
		if c:IsA("BasePart") then
			for _, d in ipairs(c:GetDescendants()) do
				if d:IsA("BasePart") then
					table.insert(piece.Kids, {d, c.CFrame:ToObjectSpace(d.CFrame)})
				end
			end
		end
		return piece
	end
	local Base, Adds, Neon, Outl = Make("GunBase"), Make("GunAdditions"), Make("NeonParts"), Make("GO")
	Gun.Pieces = {Base, Adds, Neon, Outl}
	function Gun.SetVisible(v)
		for _, pc in ipairs(Gun.Pieces) do
			if pc then pc.Root.Parent = v and Holder or nil end
		end
	end
	local BaseJoint = CFrame.new(0, -2.328, -1.21)
	local AdditionsJoint = CFrame.new(.002, .505, -1.203)
	local NeonsJoint = CFrame.new(0.005, -1.26, -1.514)
	local OutlineJoint3 = CFrame.new(0, -.001, 0)
	local function Place(piece, cf)
		if not piece then return end
		local obj = piece.Root
		if obj:IsA("Model") then
			obj:PivotTo(cf)
		elseif obj:IsA("BasePart") then
			obj.CFrame = cf
			for _, k in ipairs(piece.Kids) do k[1].CFrame = cf * k[2] end
		end
	end
	local function Tint(piece, color)
		if not piece then return end
		local obj = piece.Root
		local function t(d)
			if d:IsA("BasePart") then d.Color = color elseif d:IsA("Light") then d.Color = color end
		end
		t(obj)
		for _, d in ipairs(obj:GetDescendants()) do t(d) end
	end
	function Gun.Tint()
		Tint(Neon, MainColor)
		Tint(Outl, MainColor)
	end
	RunService.RenderStepped:Connect(function()
		local anchor = Gun.GetAnchor()
		if not anchor then return end
		Gun.Anchor = anchor
		Place(Base, anchor * BaseJoint)
		Place(Adds, anchor * AdditionsJoint)
		Place(Neon, anchor * NeonsJoint)
		if Outl and Base then
			local r = Base.Root
			Place(Outl, (r:IsA("Model") and r:GetPivot() or r.CFrame) * OutlineJoint3)
		end
	end)
end)

local Glow, Outline
task.spawn(function()
	local frame = 0
	while Running do
		swait()
		frame = frame + 1
		Sine = (Sine + 1) % 36000
		local m = MODES[Mover.Mode]
		if m then
			MainColor = m[1]()
			Mover.MainSound = m[2]
			Mover.PlaybackSpeed = m[3]
		end
		if Sick.SoundId ~= Mover.MainSound then pcall(function() Sick.SoundId = Mover.MainSound end) end
		if Sick.PlaybackSpeed ~= Mover.PlaybackSpeed then Sick.PlaybackSpeed = Mover.PlaybackSpeed end
		if not Sick.IsPlaying then pcall(function() Sick:Play() end) end

		local char = lplr.Character
		local root = char and char:FindFirstChild("HumanoidRootPart")
		if root then
			if not Glow or Glow.Parent ~= root then
				if Glow then Glow:Destroy() end
				Glow = Instance.new("PointLight")
				Glow.Brightness = 3
				Glow.Range = 20
				Glow.Shadows = false
				Glow.Parent = root
			end
			if not Outline or Outline.Adornee ~= char then
				if Outline then Outline:Destroy() end
				Outline = Instance.new("Highlight")
				Outline.FillTransparency = 1
				Outline.OutlineTransparency = 0
				Outline.DepthMode = Enum.HighlightDepthMode.Occluded
				Outline.Adornee = char
				Outline.Parent = Holder
			end
			Glow.Color = MainColor
			Outline.OutlineColor = MainColor
			if Gun.Tint then Gun.Tint() end
		end

		if not Billboard or Billboard.Parent ~= Holder then RefitName() end
		Billboard.Adornee = GetHead()
		Billboardtext.Position = UDim2.new(0,10*math.cos(Sine / 24) + 7 * math.sin(Sine / 24),0,5*math.sin(Sine / 24) + 5 * math.cos(Sine / 12))
		Billboardtext.Rotation = 15 * math.sin(Sine / 24)
		Billboardtext.TextColor3 = MainColor
		-- text swap throttled: TextScaled re-lays-out a 9999px label, doing it every frame was a big lag source
		if frame % 3 == 0 then
			local set = TEXTSETS[Mover.Mode]
			if set then Billboardtext.Text = set[math.random(1, #set)] end
			if Mover.Mode == "5th" then
				Billboardtext.Font = FONTS[math.random(1, #FONTS)]
			end
		end
	end
end)


local TweenService = game:GetService("TweenService")
local Debris = game:GetService("Debris")
local UIS = game:GetService("UserInputService")

local function Lightning(a, b, color)
	local dir = b - a
	local dist = dir.Magnitude
	if dist < 1 then return end
	local segs = math.clamp(math.floor(dist / 8), 4, 16)
	local pts = {a}
	for i = 1, segs - 1 do
		local off = Vector3.new(math.random(-100,100), math.random(-100,100), math.random(-100,100)) / 100 * math.random(1,4)
		table.insert(pts, a + dir * (i / segs) + off)
	end
	table.insert(pts, b)
	local width = math.random(10, 25) / 10
	for i = 1, #pts - 1 do
		local p0, p1 = pts[i], pts[i + 1]
		local len = (p1 - p0).Magnitude
		if len > 0.01 then
			local part = Instance.new("Part")
			part.Anchored = true part.CanCollide = false part.CanTouch = false part.CanQuery = false part.Locked = true
			part.Material = Enum.Material.Neon
			part.Color = color
			part.Size = Vector3.new(width, width, len)
			part.CFrame = CFrame.new(p0, p1) * CFrame.new(0, 0, -len / 2)
			part.Parent = Holder
			TweenService:Create(part, TweenInfo.new(.4), {Transparency = 1, Size = Vector3.new(0, 0, len)}):Play()
			Debris:AddItem(part, .5)
		end
	end
end

local function RandRot()
	return CFrame.Angles(math.rad(math.random(-180,180)), math.rad(math.random(-180,180)), math.rad(math.random(-180,180)))
end

local function HitBurst(pos)
	local color = MainColor
	for i = 1, 12 do
		local blk = Instance.new("Part")
		blk.Anchored = true blk.CanCollide = false blk.CanTouch = false blk.CanQuery = false blk.Locked = true
		blk.Material = Enum.Material.Neon blk.Color = color blk.Size = Vector3.new(6,6,6)
		blk.CFrame = CFrame.new(pos) * RandRot()
		blk.Parent = Holder
		TweenService:Create(blk, TweenInfo.new(2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Transparency = 1, Size = Vector3.new(), CFrame = blk.CFrame * RandRot()}):Play()
		Debris:AddItem(blk, 2.1)
		local disc = Instance.new("Part")
		disc.Shape = Enum.PartType.Ball
		disc.Anchored = true disc.CanCollide = false disc.CanTouch = false disc.CanQuery = false disc.Locked = true
		disc.Material = Enum.Material.Neon disc.Color = color disc.Size = Vector3.new(7,.1,7)
		disc.CFrame = CFrame.new(pos) * RandRot()
		disc.Parent = Holder
		TweenService:Create(disc, TweenInfo.new(2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Transparency = 1, Size = Vector3.new(3,40,3)}):Play()
		Debris:AddItem(disc, 2.1)
	end
end

local function ShakeCam(mag, frames)
	task.spawn(function()
		local name = "HLCShake"..RandomMath()
		local n = frames * 4
		local i = n
		RunService:BindToRenderStep(name, Enum.RenderPriority.Camera.Value + 1, function()
			local cam = workspace.CurrentCamera
			if i <= 0 or not cam then RunService:UnbindFromRenderStep(name) return end
			local k = mag / 30 * (i / n) * 5
			cam.CFrame = cam.CFrame * CFrame.new(math.random(-100,100) / 100 * k, math.random(-100,100) / 100 * k, 0)
			i = i - 1
		end)
	end)
end

local function GetTarget(screenPos)
	local cam = workspace.CurrentCamera
	local ray = cam:ScreenPointToRay(screenPos.X, screenPos.Y)
	local params = RaycastParams.new()
	params.FilterType = Enum.RaycastFilterType.Exclude
	params.FilterDescendantsInstances = {lplr.Character, Holder}
	local res = workspace:Raycast(ray.Origin, ray.Direction * 1000, params)
	AttackHit = res and res.Instance or nil
	return res and res.Position or (ray.Origin + ray.Direction * 300)
end

local function Shoot(screenPos)
	if Mover.Attack or Mover.Holstered then return end
	AttackTarget = GetTarget(screenPos)
	attackonev2()
end

local function Aim()
	if UIS.MouseEnabled then return Mouse.Hit.Position end -- PC: cursor
	if AttackTarget then return AttackTarget end            -- mobile: last tap
	local root = lplr.Character and lplr.Character:FindFirstChild("HumanoidRootPart")
	return root and (root.CFrame * CFrame.new(0, 0, -60)).Position or Vector3.new()
end

-- light impact (2 parts) used by the repeated strikes
local function Impact(pos, size)
	size = size or 6
	local blk = Instance.new("Part")
	blk.Anchored = true blk.CanCollide = false blk.CanTouch = false blk.CanQuery = false blk.Locked = true
	blk.Material = Enum.Material.Neon blk.Color = MainColor blk.Size = Vector3.new(size, size, size)
	blk.CFrame = CFrame.new(pos) * RandRot()
	blk.Parent = Holder
	TweenService:Create(blk, TweenInfo.new(1, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Transparency = 1, Size = Vector3.new(), CFrame = blk.CFrame * RandRot()}):Play()
	Debris:AddItem(blk, 1.1)
	local ring = Instance.new("Part")
	ring.Shape = Enum.PartType.Ball
	ring.Anchored = true ring.CanCollide = false ring.CanTouch = false ring.CanQuery = false ring.Locked = true
	ring.Material = Enum.Material.Neon ring.Color = MainColor ring.Size = Vector3.new(size + 1, .1, size + 1)
	ring.CFrame = CFrame.new(pos)
	ring.Parent = Holder
	TweenService:Create(ring, TweenInfo.new(1, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Transparency = 1, Size = Vector3.new(3, size * 5, 3)}):Play()
	Debris:AddItem(ring, 1.1)
end

local function Spark(cf)
	local p = Instance.new("Part")
	p.Anchored = true p.CanCollide = false p.CanTouch = false p.CanQuery = false p.Locked = true
	p.Material = Enum.Material.Neon p.Color = MainColor p.Size = Vector3.new(.5, .5, .5)
	p.CFrame = cf * RandRot()
	p.Parent = Holder
	TweenService:Create(p, TweenInfo.new(1, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Transparency = 1, Size = Vector3.new(.1, math.random(3, 9), .1)}):Play()
	Debris:AddItem(p, 1.1)
end

function Moves.Day()
	pcall(function() TweenService:Create(game:GetService("Lighting"), TweenInfo.new(2, Enum.EasingStyle.Linear), {Brightness = 2, ClockTime = 14}):Play() end)
end
function Moves.Night()
	pcall(function() TweenService:Create(game:GetService("Lighting"), TweenInfo.new(2, Enum.EasingStyle.Linear), {Brightness = 1, ClockTime = 0}):Play() end)
end


local function ShotSounds(pos, hitInst)
	local root = lplr.Character and lplr.Character:FindFirstChild("HumanoidRootPart")
	CreateSound(821439273, root or Holder, 6, 0.5)
	local model = hitInst and hitInst:FindFirstAncestorOfClass("Model")
	local hum = model and model:FindFirstChildOfClass("Humanoid")
	if hum and model ~= lplr.Character then
		local at = Instance.new("Part")
		at.Anchored = true at.CanCollide = false at.CanTouch = false at.CanQuery = false at.Transparency = 1
		at.Size = Vector3.new(.2,.2,.2) at.CFrame = CFrame.new(pos)
		at.Parent = Holder
		CreateSound(642890855, at, 6, 0.7)
		Debris:AddItem(at, 6)
	end
end
local function AimHit()
	if UIS.MouseEnabled then
		local t = Mouse.Target
		if t and lplr.Character and t:IsDescendantOf(lplr.Character) then return nil end
		return t
	end
	return AttackHit
end

local touches = {}
UIS.InputBegan:Connect(function(input, processed)
	if processed then return end -- ignores taps on GUI buttons / thumbstick
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		Shoot(Vector2.new(input.Position.X, input.Position.Y))
	elseif input.UserInputType == Enum.UserInputType.Touch then
		touches[input] = {pos = Vector2.new(input.Position.X, input.Position.Y), t = tick()}
	end
end)
UIS.InputEnded:Connect(function(input)
	local t = touches[input]
	if not t then return end
	touches[input] = nil
	local pos = Vector2.new(input.Position.X, input.Position.Y)
	if (pos - t.pos).Magnitude < 20 and tick() - t.t < .4 then
		Shoot(pos)
	end
end)


task.spawn(function()
	local Players = game:GetService("Players")
	local player = Players.LocalPlayer
	local character = player.Character or player.CharacterAdded:Wait()
	local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	local torso = character:WaitForChild("Torso")
	local humanoid = character:WaitForChild("Humanoid")
	local mouse = player:GetMouse()

	
	local animate = character:FindFirstChild("Animate")
	if animate then
		animate.Disabled = true
	end
	local animator = humanoid:FindFirstChildOfClass("Animator")
	if animator then
		for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
			track:Stop(0)
		end
	end

	
	local RootJoint = humanoidRootPart:WaitForChild("RootJoint")
	local Neck = torso:WaitForChild("Neck")
	local RightShoulder = torso:WaitForChild("Right Shoulder")
	local LeftShoulder = torso:WaitForChild("Left Shoulder")
	local RightHip = torso:WaitForChild("Right Hip")
	local LeftHip = torso:WaitForChild("Left Hip")

	
	local Welds = {
		RootJoint = RootJoint,
		Neck = Neck,
		RightShoulder = RightShoulder,
		LeftShoulder = LeftShoulder,
		RightHip = RightHip,
		LeftHip = LeftHip,
		Defaults = {
			RootJoint = { C0 = CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(-90), math.rad(0), math.rad(180)) },
			Neck = { C0 = CFrame.new(0, 1, 0) * CFrame.Angles(math.rad(-90), math.rad(0), math.rad(180)) },
			RightShoulder = { C0 = CFrame.new(-0.5, 0, 0) * CFrame.Angles(math.rad(0), math.rad(90), math.rad(0)) },
			LeftShoulder = { C0 = CFrame.new(0.5, 0, 0) * CFrame.Angles(math.rad(0), math.rad(-90), math.rad(0)) },
			RightHip = { C0 = CFrame.new(1, -1, 0) * CFrame.Angles(math.rad(0), math.rad(90), math.rad(0)) },
			LeftHip = { C0 = CFrame.new(-1, -1, 0) * CFrame.Angles(math.rad(0), math.rad(-90), math.rad(0)) },
		}
	}

	local camera = workspace.CurrentCamera
	local head = character:WaitForChild("Head")
	camera.CameraSubject = head
	camera.CameraType = Enum.CameraType.Follow
	lplr.CharacterAdded:Connect(function(ch)
		local h = ch:WaitForChild("Head")
		camera.CameraSubject = h
		camera.CameraType = Enum.CameraType.Follow
	end)

	local RC0 = CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(-90), math.rad(0), math.rad(180))
	local NC0 = CFrame.new(0, 1, 0) * CFrame.Angles(math.rad(-90), math.rad(0), math.rad(180))
	local RSCP = CFrame.new(-0.5, 0, 0) * CFrame.Angles(math.rad(0), math.rad(90), math.rad(0))
	local LSCP = CFrame.new(0.5, 0, 0) * CFrame.Angles(math.rad(0), math.rad(-90), math.rad(0))
	local S = 1

	
	local OutlineJoint = torso:FindFirstChild("OutlineJoint") or Instance.new("Motor6D", torso)
	local OutlineJoint2 = torso:FindFirstChild("OutlineJoint2") or Instance.new("Motor6D", torso)
	GunJoint = torso:FindFirstChild("GunJoint") or Instance.new("Motor6D", torso)
	GunJointBack = torso:FindFirstChild("GunJointBack") or Instance.new("Motor6D", torso)
	Effects = character:FindFirstChild("Effects") or Instance.new("Folder", character)
	Effects.Name = "Effects"

	local function Clerp(a, b, t)
		if not a then return b end
		return a:Lerp(b, math.clamp(t, 0, 1))
	end

	local RightArm = character:WaitForChild("Right Arm")
	local function Ang(x, y, z) return CFrame.Angles(math.rad(x), math.rad(y), math.rad(z)) end
	local function P(a, root, neck, rs, ls, rh, lh, gun, ga)
		if root then RootJoint.C0 = Clerp(RootJoint.C0, root, a) end
		if neck then Neck.C0 = Clerp(Neck.C0, neck, a) end
		if rs then RightShoulder.C0 = Clerp(RightShoulder.C0, rs, a) end
		if ls then LeftShoulder.C0 = Clerp(LeftShoulder.C0, ls, a) end
		if rh then RightHip.C0 = Clerp(RightHip.C0, rh, a) end
		if lh then LeftHip.C0 = Clerp(LeftHip.C0, lh, a) end
		if gun then GunJoint.C0 = Clerp(GunJoint.C0, gun, ga or 0.5) end
	end
	local function Turn(position)
		local pos = humanoidRootPart.Position
		humanoidRootPart.CFrame = humanoidRootPart.CFrame:Lerp(CFrame.new(pos, Vector3.new(position.X, pos.Y, position.Z)), .6)
	end
	local function Run(fn)
		if Mover.Attack or humanoid.Health <= 0 then return end
		Mover.Attack = true
		local old = humanoid.WalkSpeed
		humanoid.WalkSpeed = 0
		local ok, err = pcall(fn)
		if not ok then warn("Horizon LC move error: "..tostring(err)) end
		humanoid.WalkSpeed = old
		Mover.Attack = false
	end
	local HIPS_A = {CFrame.new(1,-1,0) * Ang(-5,80,0) * Ang(-4,0,0), CFrame.new(-1,-1,0) * Ang(-8,-70,0) * Ang(-8,0,0)}
	local HIPS_B = {CFrame.new(1,-1,0) * Ang(-5,75,0) * Ang(-4,0,0), CFrame.new(-1,-1,0) * Ang(-8,-65,0) * Ang(-5,0,0)}
	local GUN_IDLE = CFrame.new(0.05,-1,-0.15)

	
	local function ShootPoses(target, fire, gun)
		for i = 0, .5, 0.1 / 3 do
			swait()
			Turn(target())
			P(1/3, RC0 * Ang(0,0,30), NC0 * Ang(15,0,-35), CFrame.new(1.5,0.5,0) * Ang(90,-5,35) * RSCP, CFrame.new(-1.5,0.5,0) * Ang(5,15,-5) * LSCP, HIPS_A[1], HIPS_A[2], gun and GUN_IDLE, .5)
		end
		fire()
		for i = 0, .5, 0.1 / 3 do
			swait()
			Turn(target())
			P(1/3, RC0 * Ang(-5,0,60), NC0 * Ang(10,0,-60), CFrame.new(1.5,0.5,0) * Ang(180,-15,35) * RSCP, CFrame.new(-1.5,0.5,0) * Ang(10,30,-10) * LSCP, HIPS_B[1], HIPS_B[2], gun and GUN_IDLE, .5)
		end
	end

	
	attackonev2 = function()
		Run(function()
			local target = AttackTarget or Aim()
			ShootPoses(function() return target end, function()
				local from = Gun.Muzzle()
				for i = 1, 6 do task.spawn(function() Lightning(from, target, MainColor) end) end
				ShakeCam(5, 5)
				task.spawn(function() HitBurst(target) end)
				ShotSounds(target, AttackHit)
			end, true)
		end)
	end

	Moves.KickAttack = function()
		Run(function()
			ShootPoses(Aim, function()
				local target = Aim()
				local from = Gun.Muzzle()
				for i = 1, 6 do task.spawn(function() Lightning(from, target, MainColor) end) end
				ShakeCam(5, 5)
				task.spawn(function() HitBurst(target) end)
				CreateSound(192410089, torso, 4, .55)
				ShotSounds(target, AimHit())
			end, true)
		end)
	end

	Moves.LightningShoot = function()
		Run(function()
			ShootPoses(Aim, function()
				local target = Aim()
				for i = 1, 6 do task.spawn(function() Lightning(RightArm.Position, target, MainColor) end) end
				ShakeCam(5, 5)
				task.spawn(function() HitBurst(target) end)
				ShotSounds(target, AimHit())
			end, false)
		end)
	end

	Moves.Dash = function()
		Run(function()
			CreateSound(235097614, torso, 6, 1.5)
			for i = 0, 1, 0.05 do
				swait()
				P(1/3, RC0 * Ang(0,0,-60), NC0 * Ang(0,0,60), CFrame.new(1.25,0.5,-.25) * Ang(90,0,-60) * RSCP, CFrame.new(-1.25,0.5,-.25) * Ang(95,0,10) * LSCP, CFrame.new(1,-1,0) * Ang(-5,75,0) * Ang(-7,0,0), CFrame.new(-1,-1,0) * Ang(0,-65,0) * Ang(-9,0,0), CFrame.new(0,-.5,0))
			end
			ShakeCam(5, 10)
			local start = torso.Position
			for step = 1, 4 do
				humanoidRootPart.CFrame = humanoidRootPart.CFrame * CFrame.new(0, 0, -20)
				local now = humanoidRootPart.Position
				for b = 1, 4 do task.spawn(function() Lightning(start, now, MainColor) end) end
			end
			Impact(humanoidRootPart.Position, 6)
			Impact(start, 6)
		end)
	end

	Moves.PainlessRain = function()
		Run(function()
			task.spawn(function() for i = 0, 2 do swait(6) CreateSound(199145095, torso, 6, 1) end end)
			for i = 0, 2, 0.1 do
				swait()
				P(1/3, RC0 * Ang(0,0,-10), NC0 * Ang(25,0,-20), CFrame.new(1.5,0.5,0) * Ang(35,-35,20) * RSCP, CFrame.new(-1.5,0.5,0) * Ang(-20,-5,-10) * LSCP, CFrame.new(1,-1,0) * Ang(-5,80,0) * Ang(-4,0,0), CFrame.new(-1,-1,0) * Ang(0,-70,0) * Ang(-5,0,0), GUN_IDLE * Ang(i * 220, 0, 0))
			end
			local function hold(rsAng, lsAng, n)
				for i = 0, n, 0.1 do
					swait()
					P(1/3, RC0 * Ang(0,0,-5), NC0 * Ang(15,0,-5), CFrame.new(1.5,0.5,0) * rsAng * RSCP, CFrame.new(-1.5,0.5,0) * lsAng * LSCP, CFrame.new(1,-1,0) * Ang(-5,80,0) * Ang(-4,0,0), CFrame.new(-1,-1,0) * Ang(0,-70,0) * Ang(-5,0,0), GUN_IDLE)
				end
			end
			hold(Ang(175,-10,10), Ang(-10,-10,-5), 1.5)
			task.spawn(function() swait() CreateSound(7844533238, torso, 6, 1) end)
			hold(Ang(225,-20,20), Ang(-5,-5,0), .5)
			local SkyPos = Gun.Muzzle() + Vector3.new(0, 100, 0)
			for i = 1, 4 do task.spawn(function() Lightning(Gun.Muzzle(), SkyPos, MainColor) end) end
			hold(Ang(175,-10,10), Ang(-5,-5,0), .5)
			local n = 0
			for RainTime = 4, 152, 4 do
				swait()
				n = n + 1
				local k = n
				task.spawn(function()
					task.wait(.2)
					local hit = Aim()
					Lightning(hit, SkyPos, MainColor)
					Impact(hit, math.random(5, 20))
					if k % 4 == 0 then
						ShakeCam(5, 6)
						CreateSound(858154930, torso, 2, 1)
					end
				end)
			end
			task.wait(.5)
		end)
	end

	Moves.SoulAbsorption = function()
		Run(function()
			for i = 0, 15, 0.1 do
				swait()
				Turn(Aim())
				if math.floor(i * 10) % 2 == 0 then Spark(RightArm.CFrame * CFrame.new(0, -1.5, 0)) end
				P(1/3, RC0 * Ang(0 + 3 * math.sin(Sine / 36), 0, -8), NC0 * Ang(15 + 5 * math.cos(Sine / 36), 0, -18), CFrame.new(1.5,0.5,0) * Ang(90 - 3 * math.sin(Sine / 36), 5 + 3 * math.cos(Sine / 36), 20 - 5 * math.sin(Sine / 36)) * RSCP, CFrame.new(-1.5,0.5,0) * Ang(0, -5 - 3 * math.cos(Sine / 36), -10 - 5 * math.sin(Sine / 36)) * LSCP, CFrame.new(1,-1,-.15) * Ang(2 + 5 * math.sin(Sine / 36), 90, 0) * Ang(-7 - 1 * math.sin(Sine / 36), -15, 0), CFrame.new(-1,-1,-.15) * Ang(2 + 5 * math.sin(Sine / 36), -90, 0) * Ang(-11 - 1 * math.sin(Sine / 36), 20, 0))
			end
		end)
	end

	
	Moves.SoulPurge = function()
		Run(function()
			for i = 0, 2, 0.1 do
				swait()
				humanoidRootPart.CFrame = humanoidRootPart.CFrame * CFrame.new(0, 0, -.6)
				P(1/3, RC0 * CFrame.new(0,0,0.05 * math.cos(Sine / 12)) * Ang(36,0,0), NC0 * Ang(-5,0,0), CFrame.new(1.5, 0.35 + 0.05 * math.cos(Sine / 12), 0) * Ang(125,0,0) * RSCP, CFrame.new(-1.5, 0.5 + 0.05 * math.cos(Sine / 12), 0) * Ang(0,12,-5) * LSCP, CFrame.new(1, -.7 - 0.05 * math.cos(Sine / 12), -0.25) * Ang(-25,90,0), CFrame.new(-1, -.5 - 0.05 * math.cos(Sine / 12), -0.4) * Ang(-40,-90,0))
			end
			CreateSound(9105467029, torso, 6, 1)
			task.wait(1)
			CreateSound(2089920319, torso, 8, 1)
			for i = 0, 17, 0.5 do
				swait()
				local center = (RightArm.CFrame * CFrame.new(0, -3, -2)).Position
				if math.floor(i * 2) % 3 == 0 then
					local a = center + Vector3.new(math.random(-15,15), math.random(-5,5), math.random(-15,15))
					local b = center + Vector3.new(math.random(-15,15), math.random(-15,15), math.random(-15,15))
					task.spawn(function() Lightning(a, b, MainColor) end)
					Spark(RightArm.CFrame * CFrame.new(0, -1.5, 0))
				end
				if math.floor(i * 2) % 8 == 0 then ShakeCam(5, 4) end
				P(1/3, RC0 * CFrame.new(0,0,0.05 * math.cos(Sine / 12)) * Ang(-7,0,-7), NC0 * Ang(0,0,-45), CFrame.new(1.5, 0.5 + 0.05 * math.cos(Sine / 12), 0) * Ang(100,0,45) * RSCP, CFrame.new(-1.5, 0.5 + 0.05 * math.cos(Sine / 12), 0) * Ang(-7,12,-7) * LSCP, CFrame.new(1, -1 - 0.05 * math.cos(Sine / 12), -0.01) * Ang(-7,90,0) * Ang(-7,-14,0), CFrame.new(-1, -1 - 0.05 * math.cos(Sine / 12), -0.01) * Ang(-7,-90,0) * Ang(-12,17,0))
			end
			HitBurst((RightArm.CFrame * CFrame.new(0, -3, -2)).Position)
		end)
	end

	Moves.Roar = function()
		Run(function()
			CreateSound(6729434602, torso, 10, 1)
			local n = 0
			for i = 1, 35, .1 do
				swait()
				n = n + 1
				local Randm = math.random(-7, 7)
				local r5 = math.random(-5, 5) / 100
				P(0.05, RC0 * CFrame.new(0, 0, -.4 + 0.05 * math.cos(Sine / 12)) * Ang(-40 + Randm - 3 * math.cos(Sine / 12), 0, 0), NC0 * Ang(0 - 7 * math.cos(Sine / 12), math.random(-5,5), math.random(-10,10)), CFrame.new(1.5, 0.4 + r5 + 0.05 * math.cos(Sine / 12), 0) * Ang(35 + math.random(-10,10) + 5 * math.sin(Sine / 12), -5 - math.random(-10,10), 15) * RSCP, CFrame.new(-1.5, 0.4 + r5 + 0.05 * math.cos(Sine / 12), 0) * Ang(35 + math.random(-10,10) + 5 * math.sin(Sine / 12), 5 + math.random(-10,10), -15) * LSCP, CFrame.new(1, -1 - 0.05 * math.cos(Sine / 12), -0.2) * Ang(-45 + Randm - 5 * math.cos(Sine / 12), 90, 0) * Ang(-7,-11,0), CFrame.new(-1, -1 - 0.05 * math.cos(Sine / 12), -0.2) * Ang(-45 + Randm - 5 * math.cos(Sine / 12), -90, 0) * Ang(-8,14,0))
				if n % 20 == 1 then ShakeCam(4, 7) end
			end
		end)
	end

	Moves.bergChair = function()
		Run(function()
			local Chair
			for _, o in ipairs(Gun.Objs or {}) do
				local f = o:FindFirstChild("₵_Ɽ", true)
				if f then Chair = f:Clone() break end
			end
			if not Chair then
				Chair = Instance.new("Part")
				Chair.Size = Vector3.new(3, .5, 3)
				Chair.Material = Enum.Material.Neon
			end
			for _, d in ipairs(Chair:GetDescendants()) do if d:IsA("LuaSourceContainer") then d:Destroy() end end
			local function prep(x) if x:IsA("BasePart") then x.Anchored = true x.CanCollide = false x.CanTouch = false x.CanQuery = false x.Locked = true end end
			prep(Chair) for _, d in ipairs(Chair:GetDescendants()) do prep(d) end
			Chair.Name = RandomMath()
			Chair.Parent = Holder
			repeat
				swait()
				local cf = humanoidRootPart.CFrame * CFrame.new(0, -1, 0)
				if Chair:IsA("Model") then Chair:PivotTo(cf) elseif Chair:IsA("BasePart") then Chair.CFrame = cf end
				if Chair:IsA("BasePart") then Chair.Color = MainColor end
				P(0.05, RC0 * CFrame.new(0, 0, 0.05 * math.cos(Sine / 24)) * Ang(-14 - 3 * math.cos(Sine / 24), 0, 0), NC0 * Ang(18 - 5 * math.sin(Sine / 24), -3 - 3 * math.cos(Sine / 24), 0), CFrame.new(1.5, 0.3 + .05 * math.sin(Sine / 24), 0) * Ang(-10, -15 - 5 * math.cos(Sine / 24), 10 + 3 * math.sin(Sine / 24)) * RSCP, CFrame.new(-1.5, 0.15 + .05 * math.sin(Sine / 24), .5) * Ang(45 + 5 * math.cos(Sine / 24), -7, 6) * LSCP, CFrame.new(1, -1 - 0.05 * math.cos(Sine / 24), -0.6) * Ang(-5 - 6 * math.cos(Sine / 24), 90, 0) * Ang(-7 - 3 * math.sin(Sine / 24), 0, 0), CFrame.new(-1, -.7 - 0.05 * math.cos(Sine / 24), -0.7) * Ang(0 - 6 * math.cos(Sine / 24), -90, 0) * Ang(-4 - 3 * math.sin(Sine / 24), 5 + 3 * math.cos(Sine / 24), 0))
			until Mover.Sitting == false
			Chair:Destroy()
		end)
	end

	
	Moves.AntiAttack = function()
		Run(function()
			for i = 1, 50, .5 do
				swait()
				P(.25, RC0 * CFrame.new(0, 0, 0 + .05 * math.cos(Sine / 12)) * Ang(-8 + -2 * math.sin(Sine / 12), 0, 0), NC0 * Ang(-2 + 2 * math.cos(Sine / 12), 0, 0), CFrame.new(1.5,.5,0) * Ang(175 + 2 * math.sin(Sine / 12), -6, 0) * RSCP, CFrame.new(-1.5,.5,0) * Ang(15 + 2 * math.sin(Sine / 12), 6, -7 + -2 * math.cos(Sine / 12)) * LSCP, CFrame.new(1, -1 - .05 * math.cos(Sine / 12), -.05) * Ang(-10 + -3 * math.sin(Sine / 12), 90, 0) * Ang(-6,-7,0), CFrame.new(-1, -1 - .05 * math.cos(Sine / 12), -.05) * Ang(-10 + -3 * math.sin(Sine / 12), -90, 0) * Ang(-8,4,0))
			end
			CreateSound(9114428331, torso, 10, 1)
			for i = 1, 25, .5 do
				swait()
				P(.25, RC0 * CFrame.new(0, 0, 0 + .05 * math.cos(Sine / 12)) * Ang(-10 + -2 * math.sin(Sine / 12), 0, 0), NC0 * Ang(-2 + 2 * math.cos(Sine / 12), 0, 0), CFrame.new(1.5,.5,0) * Ang(145 + 2 * math.sin(Sine / 12), -6, 0) * RSCP, CFrame.new(-1.5,.5,0) * Ang(12 + 2 * math.sin(Sine / 12), 6, -7 + -2 * math.cos(Sine / 12)) * LSCP, CFrame.new(1, -1 - .05 * math.cos(Sine / 12), -.05) * Ang(-12 + -3 * math.sin(Sine / 12), 90, 0) * Ang(-6,-7,0), CFrame.new(-1, -1 - .05 * math.cos(Sine / 12), -.05) * Ang(-12 + -3 * math.sin(Sine / 12), -90, 0) * Ang(-8,4,0))
			end
			task.wait(.5)
		end)
	end

	Moves.InsIntro = function()
		Run(function()
			CreateSound(239000203, torso, 10, 1)
			CreateSound(1042716828, torso, 10, 1)
			ShakeCam(8, 10)
			for k = 1, 8 do
				Impact(torso.Position + Vector3.new(math.random(-12,12), math.random(-4,8), math.random(-12,12)), math.random(6, 14))
				swait(3)
			end
			Mover.Mode = "5th"
		end)
	end

	
	Moves.Shutdown = function()
		Mover.Attack = true
		Running = false
		for name, def in pairs(Welds.Defaults) do
			if Welds[name] then Welds[name].C0 = def.C0 end
		end
		if animate then animate.Disabled = false end
		if gui then gui:Destroy() end
		humanoid.CameraOffset = Vector3.new()
		local cam = workspace.CurrentCamera
		cam.CameraSubject = humanoid
		cam.CameraType = Enum.CameraType.Custom
		Holder:Destroy()
	end


	local Timing = {Throttle = 1, Start = tick(), LastFrame = tick(), LastPlaying = tick()}

	task.spawn(function()
		while Running do
		
			local velocity = humanoidRootPart.Velocity
			local horizontalVelocity = Vector3.new(velocity.X, 0, velocity.Z)
			Mover.Walking = horizontalVelocity.Magnitude > 0.5
			Mover.Fall = velocity.Y < -2 and humanoid.FloorMaterial == Enum.Material.Air
			Mover.Jump = velocity.Y > 2 and humanoid.FloorMaterial == Enum.Material.Air
		
			local camera = workspace.CurrentCamera
			local lookVector = camera and camera.CFrame.LookVector or Vector3.new(0,0,-1)
			local rightVector = camera and camera.CFrame.RightVector or Vector3.new(1,0,0)
			local moveDirection = humanoid.MoveDirection
		
			local ForwardMovement = (moveDirection * lookVector).X + (moveDirection * lookVector).Z
			local SidewaysMovement = (moveDirection * rightVector).X + (moveDirection * rightVector).Z
			local Run = false

			if Mover.Attack == false then
				OutlineJoint.C0 = Clerp(OutlineJoint.C0, CFrame.new(), 3)
				OutlineJoint2.C0 = Clerp(OutlineJoint2.C0, CFrame.new(0.16, 0.025, 0.025), 3)

					
					if Mover.Mode == "M1" and not Mover.Jump and not Mover.Fall then
						if not Mover.Walking then
							RootJoint.C0 = Clerp(RootJoint.C0,RC0 * CFrame.new(0,0,0 + .1 * math.cos(Sine / 15) + .1 * math.sin(Sine / 15)) * CFrame.Angles(math.rad(0 + 2 * -math.cos(Sine / 15)),math.rad(0),math.rad(-5)) * CFrame.Angles(math.rad(0 + 2 * -math.sin(Sine / 15)),math.rad(0),math.rad(0)),.7/3)
							Neck.C0 = Clerp(Neck.C0,NC0 * CFrame.Angles(math.rad(-1.4 + 5 * math.cos(Sine / 35)),math.rad(-3.3 + 5 * math.sin(Sine / 35)),math.rad(11)),.7/3)
							RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5,.2 + .025 * math.cos(Sine / 15),0) * CFrame.Angles(math.rad(52.4 + 1.75 * math.cos(Sine / 15)),math.rad(3 + 1.75 * -math.sin(Sine / 15)),math.rad(17)) * RSCP,.7/3)
							LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,.5 + .025 * math.cos(Sine / 15),0) * CFrame.Angles(math.rad(2.77),math.rad(10.77 + -2 * -math.cos(Sine / 15)),math.rad(-12.97 + 2 * math.sin(Sine / 15))) * LSCP,.7/3)
							RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1.15,-1 - .1 * math.cos(Sine / 15) - .1 * math.sin(Sine / 15),-.2) * CFrame.Angles(math.rad(-10 + 3 * -math.cos(Sine / 15)),math.rad(-18),math.rad(7))  * CFrame.Angles(math.rad(0),math.rad(90),math.rad(0 + 3 * -math.sin(Sine / 15))),.7/3)
							LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1 - .1 * math.cos(Sine / 15) - .1 * math.sin(Sine / 15),-.45) * CFrame.Angles(math.rad(-3.98 + 3 * -math.cos(Sine / 15)),math.rad(7),math.rad(-2.4)) *  CFrame.Angles(math.rad(0),math.rad(-90),math.rad(0 + -3 * -math.sin(Sine / 15))),.7/3)
							if not Mover.Holstered then
								GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(.05,-1,-.15) * CFrame.Angles(math.rad(90),math.rad(0),math.rad(0)),1/2)
							else
								GunJointBack.C0 = Clerp(GunJointBack.C0,CFrame.new(0,-1,1) * CFrame.Angles(math.rad(90),math.rad(15),math.rad(90)),1/2)
							end
						else
							RootJoint.C0 = Clerp(RootJoint.C0,RC0 * CFrame.new(0,0,0 + 0.05 * math.sin(Sine / 12)) * CFrame.Angles(math.rad(20),math.rad(0 + 2.5 * math.sin(Sine / 12)),math.rad(0 - 2.5 * math.sin(Sine / 12))),.7 / 3)
							Neck.C0 = Clerp(Neck.C0,NC0 * CFrame.new() * CFrame.Angles(math.rad(-20 - 3 * math.cos(Sine / 12)),math.rad(0 - 2.5 * math.cos(Sine / 12)),math.rad(0 - 2.5 * math.cos(Sine / 12))),.7 / 3)
							RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5,0.5,0) * CFrame.Angles(math.rad(150),math.rad(0 - 2.5 * math.cos(Sine / 12)),math.rad(5 + 2.5 * math.cos(Sine / 12))) * RSCP,.7 / 3)
							LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,0.5,0 - 0.2 * math.sin(Sine / 12)) * CFrame.Angles(math.rad(20 - 45 * math.cos(Sine / 12)),math.rad(0 - 10 * math.sin(Sine / 12)),math.rad(0 + 2.5 * math.sin(Sine / 12))) * LSCP,.7 / 3)
							RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1 ,-1,0) * CFrame.Angles(math.rad(0),math.rad(85),math.rad(0)) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),.7 / 3)
							LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1,0) * CFrame.Angles(math.rad(0),math.rad(-85),math.rad(0)) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),.7 / 3)
							if not Mover.Holstered then
								GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(0.05,-1,-0.15) * CFrame.Angles(math.rad(-93.75+7.25*math.cos(Sine/12)),math.rad(0),math.rad(0)),1 / 2)
							else
								GunJointBack.C0 = Clerp(GunJointBack.C0,CFrame.new(0,-1,1) * CFrame.Angles(math.rad(90),math.rad(15),math.rad(90)),1/2)
							end
						end
					end
			
				if not Mover.Walking and not Mover.Jump and not Mover.Fall then
					if Mover.Mode == "1st" then
						if Mover.Flying then
							RootJoint.C0 = Clerp(RootJoint.C0, RC0 * CFrame.new(-.5 * math.sin(Sine / 18), 0, 1.5 + 0.5 * math.cos(Sine / 18)) * CFrame.Angles(math.rad(-3 - 5 * math.sin(Sine / 18)), math.rad(6 * math.cos(Sine / 18)), math.rad(0)), 0.15)
							Neck.C0 = Clerp(Neck.C0, NC0 * CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(14), math.rad(-16 + 5 * math.cos(Sine / 18)), math.rad(0)), 0.15)
							LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.5, 0.35 + 0.1 * math.cos(Sine / 18), 0) * CFrame.Angles(math.rad(0), math.rad(12 + 5 * math.cos(Sine / 18)), math.rad(-6 - 5 * math.sin(Sine / 18))) * LSCP, 0.15)
							RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -.4 - 0.05 * math.cos(Sine / 18), -0.6) * CFrame.Angles(math.rad(-36 + 5 * math.sin(Sine / 18)), math.rad(90), math.rad(0)) * CFrame.Angles(math.rad(-8 * math.cos(Sine / 18)), math.rad(-8), math.rad(0)), 0.15)
							LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -.8 - 0.05 * math.cos(Sine / 18), -0.3) * CFrame.Angles(math.rad(-24 + 5 * math.sin(Sine / 18)), math.rad(-90), math.rad(0)) * CFrame.Angles(math.rad(8 * math.cos(Sine / 18)), math.rad(8), math.rad(0)), 0.15)
							if not Mover.Holstered then
								RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.3 + 0.1 * math.cos(Sine / 18), 0) * CFrame.Angles(math.rad(175 - 5 * math.cos(Sine / 18)), math.rad(-6), math.rad(7 + 3 * math.sin(Sine / 18))) * RSCP, 0.15)
								GunJoint.C0 = Clerp(GunJoint.C0, CFrame.new(0,-.5,0) * CFrame.Angles(0,0,0), 0.5)
							else
								RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.35 + 0.1 * math.cos(Sine / 18), 0) * CFrame.Angles(0, math.rad(-12 - 5 * math.cos(Sine / 18)), math.rad(6 + 5 * math.sin(Sine / 18))) * RSCP, 0.15)
								GunJointBack.C0 = Clerp(GunJointBack.C0, CFrame.new(0,-1,1) * CFrame.Angles(math.rad(90),math.rad(15),math.rad(90)), 0.5)
							end
						else	
							local NUMBER = 30
							local RATIO = NUMBER * 2
							if not Mover.Holstered then
								RightShoulder.C0 = RightShoulder.C0:Lerp(CFrame.new(1.5, 0.15 - 0.07 * math.sin(Sine / NUMBER), -0.2) * CFrame.Angles(math.rad(175), math.rad(-20), math.rad(6 + 2 * math.cos(Sine / NUMBER))) * RSCP, 0.07)
							else
								RightShoulder.C0 = RightShoulder.C0:Lerp(CFrame.new(1.5, 0.15 + 0.1 * math.cos(Sine / NUMBER), -0.2) * CFrame.Angles(math.rad(10 + 3 * math.sin(Sine / NUMBER)), math.rad(12 + 5 * math.sin(Sine / NUMBER)), math.rad(-4 - 2 * math.cos(Sine / NUMBER))) * RSCP, 0.07)
							end
							RootJoint.C0 = RootJoint.C0:Lerp(RC0 * CFrame.new(0.2 * math.sin(Sine / RATIO), 0, 0.1 * math.cos(Sine / NUMBER)) * CFrame.Angles(math.rad(4), math.rad(-2.7 + 5 * math.sin(Sine / RATIO)), math.rad(-20)), 0.07)
							Neck.C0 = Neck.C0:Lerp(NC0 * CFrame.new(0,0,0) * CFrame.Angles(math.rad(16 + 3 * math.cos(Sine / 25)), math.rad(7 * math.cos(Sine / NUMBER)), math.rad(18 - 6 * math.sin(Sine / NUMBER))), 0.07)
							LeftShoulder.C0 = LeftShoulder.C0:Lerp(CFrame.new(-1.5, 0.15 + 0.1 * math.cos(Sine / NUMBER), -0.2) * CFrame.Angles(math.rad(10 + 3 * math.sin(Sine / NUMBER)), math.rad(12 + 5 * math.sin(Sine / NUMBER)), math.rad(-4 - 2 * math.cos(Sine / NUMBER))) * LSCP, 0.07)
							RightHip.C0 = RightHip.C0:Lerp(CFrame.new(1 + 0.1 * math.sin(Sine / RATIO), -1.04 - 0.1 * math.cos(Sine / NUMBER), 0.1) * CFrame.Angles(math.rad(-7), math.rad(-36), math.rad(6 - 5 * math.sin(Sine / RATIO))) * CFrame.Angles(0, math.rad(90), 0), 0.07)
							LeftHip.C0 = LeftHip.C0:Lerp(CFrame.new(-1 + 0.1 * math.sin(Sine / RATIO), -1.04 - 0.1 * math.cos(Sine / NUMBER), -0.15) * CFrame.Angles(math.rad(7), math.rad(24), math.rad(-6 - 5 * math.sin(Sine / RATIO))) * CFrame.Angles(0, math.rad(-90), 0), 0.07)

							if not Mover.Holstered then
								GunJoint.C0 = Clerp(GunJoint.C0, CFrame.new(0,-.5,0) * CFrame.Angles(0,0,0), 0.5)
							else
								GunJointBack.C0 = Clerp(GunJointBack.C0, CFrame.new(0,-1,1) * CFrame.Angles(math.rad(90),math.rad(15),math.rad(90)), 0.5)
							end
						end
					elseif Mover.Mode == "2nd" then
						RootJoint.C0 = Clerp(RootJoint.C0, RC0 * CFrame.new(0, 0, 0.05 * math.cos(Sine / 12)) * CFrame.Angles(math.rad(5 + 3.5 * math.sin(Sine / 12)), 0, 0), 0.05)
						Neck.C0 = Clerp(Neck.C0, NC0 * CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(-5 - 3 * math.cos(Sine / 12) + 5 * math.sin(Sine / 12)), 0, 0), 0.05)
						RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.5 + 0.05 * math.cos(Sine / 12), 0) * CFrame.Angles(math.rad(3 + 5 * math.sin(Sine / 12)), math.rad(-12 - 5 * math.cos(Sine / 12)), math.rad(7 + 5 * math.cos(Sine / 12))) * RSCP, 0.05)
						LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.5, 0.5 + 0.05 * math.cos(Sine / 12), 0) * CFrame.Angles(math.rad(3 + 5 * math.sin(Sine / 12)), 0, math.rad(-7 - 5 * math.cos(Sine / 12))) * LSCP, 0.05)
						RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -1 - 0.05 * math.cos(Sine / 12), -0.1) * CFrame.Angles(math.rad(1 + 5 * math.sin(Sine / 12)), math.rad(90), 0) * CFrame.Angles(math.rad(-3), math.rad(-12), 0), 0.05)
						LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -1 - 0.05 * math.cos(Sine / 12), -0.15) * CFrame.Angles(math.rad(1 + 5 * math.sin(Sine / 12)), math.rad(-90), 0) * CFrame.Angles(math.rad(-5.45), math.rad(15), 0), 0.05)
						if not Mover.Holstered then
							GunJoint.C0 = Clerp(GunJoint.C0, CFrame.new(0,-.5,0) * CFrame.Angles(math.rad(-90),0,0), 0.5)
						else
							GunJointBack.C0 = Clerp(GunJointBack.C0, CFrame.new(0,-1,1) * CFrame.Angles(math.rad(90),math.rad(15),math.rad(90)), 0.5)
						end
					elseif Mover.Mode == "3rd" then
						RootJoint.C0 = Clerp(RootJoint.C0, RC0 * CFrame.new(0, 0, 0.05 * math.cos(Sine / 12)) * CFrame.Angles(math.rad(7 - 3 * math.sin(Sine / 12)), 0, math.rad(-15)), 0.05)
						Neck.C0 = Clerp(Neck.C0, NC0 * CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(3 + 5 * math.cos(Sine / 12)), 0, math.rad(-5)), 0.05)
						RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.5 + 0.05 * math.sin(Sine / 12), 0) * CFrame.Angles(math.rad(15 + 3 * math.cos(Sine / 12)), 0, math.rad(45 + 3 * math.sin(Sine / 12))) * RSCP, 0.05)
						LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.2, 0.3 + 0.05 * math.sin(Sine / 12), -.7) * CFrame.Angles(0, math.rad(7 + 3 * math.sin(Sine / 12)), math.rad(-3 - 3 * math.sin(Sine / 12))) * LSCP, 0.05)
						RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -1 - 0.05 * math.cos(Sine / 12), -0.2) * CFrame.Angles(math.rad(-5 * math.sin(Sine / 12)), math.rad(90), 0) * CFrame.Angles(math.rad(-11 - 3 * math.sin(Sine / 12)), math.rad(-21), 0), 0.05)
						LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -1 - 0.05 * math.cos(Sine / 12), -0.23) * CFrame.Angles(math.rad(-5 * math.sin(Sine / 12)), math.rad(-90), 0) * CFrame.Angles(math.rad(-14 - 3 * math.sin(Sine / 12)), math.rad(25), 0), 0.05)
						if not Mover.Holstered then
							GunJoint.C0 = Clerp(GunJoint.C0, CFrame.new(0,-.5,0) * CFrame.Angles(math.rad(180),0,0), 0.5)
						else
							GunJointBack.C0 = Clerp(GunJointBack.C0, CFrame.new(0,-1,1) * CFrame.Angles(math.rad(90),math.rad(15),math.rad(90)), 0.5)
						end
					elseif Mover.Mode == "4th" then
						RootJoint.C0 = Clerp(RootJoint.C0, RC0 * CFrame.new(0, 0, 0.05 * math.cos(Sine / 24)) * CFrame.Angles(math.rad(7 + 3 * math.cos(Sine / 24)), 0, 0), 0.05)
						Neck.C0 = Clerp(Neck.C0, NC0 * CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(30 + 5 * math.sin(Sine / 24)), 0, 0), 0.05)
						if not Mover.Holstered then
							RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.35 + 0.05 * math.cos(Sine / 24), 0) * CFrame.Angles(math.rad(-85 - 3 * math.sin(Sine / 24)), math.rad(-3), math.rad(7)) * RSCP, 0.05)
						else
							RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.3 + 0.1 * math.cos(Sine / 24), 0) * CFrame.Angles(0, math.rad(-3 - 3 * math.cos(Sine / 24)), math.rad(7 + 3 * math.sin(Sine / 24))) * RSCP, 0.05)
						end
						LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.2, 0.5 + 0.05 * math.cos(Sine / 24), -1) * CFrame.Angles(math.rad(170 + 5 * math.cos(Sine / 24)), math.rad(7 + 3 * math.cos(Sine / 24)), math.rad(37)) * LSCP, 0.05)
						RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -1 - 0.05 * math.cos(Sine / 24), -0.25) * CFrame.Angles(math.rad(5 + 4 * math.cos(Sine / 24)), math.rad(90), 0) * CFrame.Angles(math.rad(-4), math.rad(-7), 0), 0.05)
						LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -1 - 0.05 * math.cos(Sine / 24), -0.25) * CFrame.Angles(math.rad(5 + 4 * math.cos(Sine / 24)), math.rad(-90), 0) * CFrame.Angles(math.rad(-7), math.rad(12), 0), 0.05)
						if not Mover.Holstered then
							GunJoint.C0 = Clerp(GunJoint.C0, CFrame.new(0,-.5,0) * CFrame.Angles(math.rad(5 - 3 * math.cos(Sine / 24)), 0, 0), 0.05)
						else
							GunJointBack.C0 = Clerp(GunJointBack.C0, CFrame.new(0,-1,1) * CFrame.Angles(math.rad(90),math.rad(15),math.rad(90)), 0.5)
						end
					elseif Mover.Mode == "5th" then
						RootJoint.C0 = Clerp(RootJoint.C0, RC0 * CFrame.new(0, 0, -1.25 + 0.05 * math.cos(Sine / 12)) * CFrame.Angles(math.rad(25), math.rad(5 * math.cos(Sine / 12)), math.rad(-10 + 3 * math.sin(Sine / 12))), 0.05)
						Neck.C0 = Clerp(Neck.C0, NC0 * CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(45 - 15 * math.cos(Sine / 12)), 0, math.rad(5 + 7 * math.sin(Sine / 12))), 0.05)
						if not Mover.Holstered then
							RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.3 + 0.05 * math.cos(Sine / 12), 0) * CFrame.Angles(math.rad(-80), math.rad(-15 - 5 * math.cos(Sine / 12)), math.rad(14 + 3 * math.sin(Sine / 12))) * RSCP, 0.05)
						else
							RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.2 + 0.1 * math.cos(Sine / 12), -.2) * CFrame.Angles(math.rad(15 + 3 * math.cos(Sine / 12)), math.rad(-7), math.rad(7 - 5 * math.sin(Sine / 12))) * RSCP, 0.05)
						end
						LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.2, .2 + 0.05 * math.cos(Sine / 12), -.8) * CFrame.Angles(math.rad(160 + 15 * math.cos(Sine / 12)), math.rad(-30), math.rad(50)) * LSCP, 0.05)
						RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -1 - 0.05 * math.cos(Sine / 12), -0.01) * CFrame.Angles(math.rad(-45), math.rad(90), 0) * CFrame.Angles(math.rad(5 * math.cos(Sine / 12)), math.rad(-12 - 5 * math.sin(Sine / 12)), 0), 0.05)
						LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -.4 - 0.05 * math.cos(Sine / 12), -0.6) * CFrame.Angles(math.rad(-30), math.rad(-90), 0) * CFrame.Angles(math.rad(-5 * math.cos(Sine / 12)), math.rad(12 + 3 * math.sin(Sine / 12)), 0), 0.05)
						if not Mover.Holstered then
							GunJoint.C0 = Clerp(GunJoint.C0, CFrame.new(0,-.5,0) * CFrame.Angles(0,0,0), 0.5)
						else
							GunJointBack.C0 = Clerp(GunJointBack.C0, CFrame.new(0,-1,1) * CFrame.Angles(math.rad(90),math.rad(15),math.rad(90)), 0.5)
						end
					elseif Mover.Mode == "6th" then
						RootJoint.C0 = Clerp(RootJoint.C0, RC0 * CFrame.new(0, 0, 3 + 0.2 * math.cos(Sine / 24)) * CFrame.Angles(0, math.rad(-7 * math.sin(Sine / 24)), 0), 0.05)
						Neck.C0 = Clerp(Neck.C0, NC0 * CFrame.new(0, 0, 0) * CFrame.Angles(0, math.rad(14 * math.cos(Sine / 24)), 0), 0.05)
						LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.5, 0.5 + 0.1 * math.sin(Sine / 24), 0) * CFrame.Angles(0, math.rad(12 + 7 * math.cos(Sine / 24)), math.rad(-7 - 7 * math.sin(Sine / 24))) * LSCP, 0.05)
						RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -1, -0.01) * CFrame.Angles(0, math.rad(90), 0) * CFrame.Angles(math.rad(-14 * math.cos(Sine / 24)), math.rad(-7), 0), 0.05)
						LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -1, -0.01) * CFrame.Angles(0, math.rad(-90), 0) * CFrame.Angles(math.rad(14 * math.cos(Sine / 24)), math.rad(11), 0), 0.05)
						if not Mover.Holstered then
							GunJoint.C0 = Clerp(GunJoint.C0, CFrame.new(0,-.5,0) * CFrame.Angles(0,0,0), 0.5)
							RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.5 + 0.1 * math.sin(Sine / 24), 0) * CFrame.Angles(math.rad(175), math.rad(-5 - 7 * math.cos(Sine / 24)), math.rad(7 + 7 * math.sin(Sine / 24))) * RSCP, 0.05)
						else
							GunJointBack.C0 = Clerp(GunJointBack.C0, CFrame.new(0,-1,1) * CFrame.Angles(math.rad(90),math.rad(15),math.rad(90)), 0.5)
							RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.5 + 0.1 * math.sin(Sine / 24), 0) * CFrame.Angles(0, math.rad(-12 - 7 * math.cos(Sine / 24)), math.rad(7 - 7 * math.sin(Sine / 24))) * RSCP, 0.05)
						end
					elseif Mover.Mode == "7th" then
						local Rndm = math.random(-28, 28) * math.cos(Sine / 12)
						local Rndm2 = 0.05
						RootJoint.C0 = Clerp(RootJoint.C0, RC0 * CFrame.new(0, 0, 0.05 * math.cos(Sine / 12)) * CFrame.Angles(math.rad(-5 - Rndm - 5 * math.sin(Sine / 12)), 0, 0), 0.05)
						Neck.C0 = Clerp(Neck.C0, NC0 * CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(15 + 3 * math.sin(Sine / 12)), math.rad(Rndm), math.rad(Rndm)), 0.05)
						RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.5 + Rndm2 + 0.1 * math.sin(Sine / 12), 0) * CFrame.Angles(math.rad(175 - Rndm + 5 * math.sin(Sine / 12)), math.rad(-Rndm), math.rad(Rndm)) * RSCP, 0.05)
						LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-.8, 0.4 + Rndm2 + 0.1 * math.sin(Sine / 12), .8) * CFrame.Angles(math.rad(-Rndm), math.rad(Rndm + 5 * math.cos(Sine / 12)), math.rad(75 + Rndm + 3 * math.sin(Sine / 12))) * LSCP, 0.05)
						RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -1 - 0.05 * math.cos(Sine / 12), -0.01) * CFrame.Angles(math.rad(-7 - Rndm - 7 * math.sin(Sine / 12)), math.rad(90), 0) * CFrame.Angles(math.rad(-7), math.rad(-7), 0), 0.05)
						LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -1 - 0.05 * math.cos(Sine / 12), -0.01) * CFrame.Angles(math.rad(-7 - Rndm - 7 * math.sin(Sine / 12)), math.rad(-90), 0) * CFrame.Angles(math.rad(-9), math.rad(9), 0), 0.05)
					elseif Mover.Mode == "8th" then
						RootJoint.C0 = Clerp(RootJoint.C0, RC0 * CFrame.new(0, 0, 0.15 * math.sin(Sine / 8)) * CFrame.Angles(math.rad(15 * math.sin(Sine / 8)), 0, 0), 0.05)
						Neck.C0 = Clerp(Neck.C0, NC0 * CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(15 * math.sin(Sine / 8)), 0, 0), 0.05)
						RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.5 + 0.1 * math.sin(Sine / 10), 0) * CFrame.Angles(math.rad(160 + 10 * math.sin(Sine / 8)), math.rad(-5 * math.cos(Sine / 8)), math.rad(70 + 30 * math.cos(Sine / 8))) * RSCP, 0.05)
						LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.5, 0.5 + 0.1 * math.sin(Sine / 10), 0) * CFrame.Angles(math.rad(160 + 10 * math.sin(Sine / 8)), math.rad(5 * math.cos(Sine / 8)), math.rad(-70 - 30 * math.cos(Sine / 8))) * LSCP, 0.05)
						RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -1 - 0.15 * math.sin(Sine / 8), -0.3) * CFrame.Angles(math.rad(-5 + 30 * math.sin(Sine / 8)), math.rad(90), 0) * CFrame.Angles(math.rad(-7), math.rad(-4), 0), 0.05)
						LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -1 - 0.15 * math.sin(Sine / 8), -0.3) * CFrame.Angles(math.rad(-5 + 30 * math.sin(Sine / 8)), math.rad(-90), 0) * CFrame.Angles(math.rad(-8), math.rad(8), 0), 0.05)
					elseif Mover.Mode == "9th" then
						RootJoint.C0 = Clerp(RootJoint.C0, RC0 * CFrame.new(0, 0, 0.05 * math.cos(Sine / 16)) * CFrame.Angles(0, 0, math.rad(-20 + math.sin(Sine / 16))), 0.05)
						Neck.C0 = Clerp(Neck.C0, NC0 * CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(3 * math.sin(Sine / 16)), math.rad(-3 * math.cos(Sine / 16)), math.rad(35)), 0.05)
						LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.5, 0.5 + 0.075 * math.cos(Sine / 16), 0) * CFrame.Angles(0, math.rad(7 + 5 * math.sin(Sine / 16)), math.rad(-5 - 3 * math.sin(Sine / 16))) * LSCP, 0.05)
						RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -1 - 0.05 * math.cos(Sine / 16), -0.2) * CFrame.Angles(math.rad(-15), math.rad(90), 0) * CFrame.Angles(math.rad(-10), math.rad(-30), 0), 0.05)
						LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -1 - 0.05 * math.cos(Sine / 16), -0.3) * CFrame.Angles(0, math.rad(-90), 0) * CFrame.Angles(math.rad(-7), math.rad(20), 0), 0.05)
						if not Mover.Holstered then
							GunJoint.C0 = Clerp(GunJoint.C0, CFrame.new(0,-.5,0) * CFrame.Angles(math.rad(-90),0,0), 0.5)
							RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.45 + 0.05 * math.cos(Sine / 16), .35) * CFrame.Angles(math.rad(-7), math.rad(-60 - 3 * math.sin(Sine / 16)), math.rad(7 + 3 * math.sin(Sine / 16))) * RSCP, 0.05)
						else
							GunJointBack.C0 = Clerp(GunJointBack.C0, CFrame.new(0,-1,1) * CFrame.Angles(math.rad(90),math.rad(15),math.rad(90)), 0.5)
							RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.5 + 0.05 * math.cos(Sine / 16), 0) * CFrame.Angles(0, math.rad(-7 - 5 * math.sin(Sine / 16)), math.rad(7 + 3 * math.sin(Sine / 16))) * RSCP, 0.05)
						end
					elseif Mover.Mode == "M7" then
						RootJoint.C0 = Clerp(RootJoint.C0, RC0 * CFrame.new(0, 0, 0.05 * math.cos(Sine / 12)) * CFrame.Angles(math.rad(-10 + 7 * math.sin(Sine / 12)), 0, 0), 0.05)
						Neck.C0 = Clerp(Neck.C0, NC0 * CFrame.new(0, 0, -0.05 * math.cos(Sine / 12)) * CFrame.Angles(math.rad(15 + 3 * math.sin(Sine / 12)), 0, 0), 0.05)
						RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.2 + 0.05 * math.cos(Sine / 12), 0.15) * CFrame.Angles(math.rad(-30 + 3 * math.sin(Sine / 12)), math.rad(3 * math.cos(Sine / 12)), math.rad(7 + 5 * math.cos(Sine / 12))) * RSCP, 0.05)
						LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.2, 0.2 + 0.05 * math.cos(Sine / 12), 0.3) * CFrame.Angles(math.rad(-30 - 3 * math.sin(Sine / 12)), math.rad(-5 * math.cos(Sine / 12)), math.rad(40 + 5 * math.cos(Sine / 12))) * LSCP, 0.05)
						RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -1 - 0.05 * math.cos(Sine / 12), -0.01) * CFrame.Angles(math.rad(10 * math.sin(Sine / 12)), math.rad(90), 0) * CFrame.Angles(math.rad(-2.5), math.rad(-10), math.rad(-10)), 0.05)
						LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -1 - 0.05 * math.cos(Sine / 12), -0.01) * CFrame.Angles(math.rad(10 * math.sin(Sine / 12)), math.rad(-90), 0) * CFrame.Angles(math.rad(-2.5), math.rad(10), math.rad(10)), 0.05)
						GunJoint.C0 = Clerp(GunJoint.C0, CFrame.new(0,-.6,0) * CFrame.Angles(math.rad(-90 + 5 * math.cos(Sine / 12)), 0, 0), 0.05)
					elseif Mover.Mode == "10th" then
						RootJoint.C0 = Clerp(RootJoint.C0, RC0 * CFrame.new(0, 0, 0.05 * math.cos(Sine / 12)) * CFrame.Angles(math.rad(7 + 5 * math.cos(Sine / 12)), 0, math.rad(-15)), 0.07)
						Neck.C0 = Clerp(Neck.C0, NC0 * CFrame.new(0,0,0) * CFrame.Angles(math.rad(12), 0, math.rad(5 * math.sin(Sine / 12))), 0.07)
						LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.5, -0.1, 0) * CFrame.Angles(math.rad(40), 0, math.rad(-20)) * LSCP, 0.07)
						RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -1 - 0.05 * math.cos(Sine / 12), -0.3) * CFrame.Angles(math.rad(-3 + 7 * math.cos(Sine / 12)), math.rad(90), 0) * CFrame.Angles(math.rad(-7), math.rad(-17), 0), 0.07)
						LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -1 - 0.05 * math.cos(Sine / 12), -0.3) * CFrame.Angles(math.rad(-3 + 7 * math.cos(Sine / 12)), math.rad(-90), 0) * CFrame.Angles(math.rad(-11), math.rad(19), 0), 0.07)
						if not Mover.Holstered then
							RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.35 + 0.05 * math.cos(Sine / 12), 0) * CFrame.Angles(math.rad(175 + 5 * math.cos(Sine / 12)), math.rad(-15 - 3 * math.sin(Sine / 12)), math.rad(5 + 5 * math.cos(Sine / 12))) * RSCP, 0.07)
							GunJoint.C0 = Clerp(GunJoint.C0, CFrame.new(0,-.5,0) * CFrame.Angles(0,0,0), 0.5)
						else
							RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, -0.1, 0) * CFrame.Angles(math.rad(40), 0, math.rad(20)) * RSCP, 0.07)
							GunJointBack.C0 = Clerp(GunJointBack.C0, CFrame.new(0,-1,1) * CFrame.Angles(math.rad(90),math.rad(15),math.rad(90)), 0.5)
						end					
					end
				elseif Mover.Walking == true and Mover.Jump == false and Mover.Fall == false then
					if Mover.Mode == "1st" or Mover.Mode == "10th" then
						if Mover.Flying then
							RootJoint.C0 = Clerp(RootJoint.C0, RC0 * CFrame.new(0, 0, 2 + 0.05 * math.cos(Sine / 12)) * CFrame.Angles(math.rad(125 * ForwardMovement/5 - 5 * math.sin(Sine / 12)), math.rad(-SidewaysMovement*25), 0), 0.05)
							Neck.C0 = Clerp(Neck.C0, NC0 * CFrame.new(0,0,0) * CFrame.Angles(math.rad(-25 * ForwardMovement/5), math.rad(SidewaysMovement*25), 0), 0.05)
							LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.5, 0.5 + 0.05 * math.cos(Sine / 12), 0) * CFrame.Angles(math.rad(-80 * ForwardMovement/7 - 5 * math.sin(Sine / 12)), 0, math.rad(-SidewaysMovement*10)) * LSCP, 0.05)
							RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -1 - 0.05 * math.cos(Sine / 12), -0.2) * CFrame.Angles(math.rad(-15 * ForwardMovement - 5 * math.cos(Sine / 12)), math.rad(90), 0) * CFrame.Angles(math.rad(SidewaysMovement*10), 0, 0), 0.05)
							LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -.5 - 0.05 * math.cos(Sine / 12), -0.6) * CFrame.Angles(math.rad(-25 * ForwardMovement - 10 * math.cos(Sine / 12)), math.rad(-90), 0) * CFrame.Angles(math.rad(-SidewaysMovement*10), 0, 0), 0.05)
							if not Mover.Holstered then
								RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.3 + 0.05 * math.cos(Sine / 12), 0) * CFrame.Angles(math.rad(-175 + ForwardMovement/7 - 5 * math.sin(Sine / 12)), 0, math.rad(SidewaysMovement*10)) * RSCP, 0.05)
								GunJoint.C0 = Clerp(GunJoint.C0, CFrame.new(0,-.5,0) * CFrame.Angles(0,0,0), 0.5)
							else
								GunJointBack.C0 = Clerp(GunJointBack.C0, CFrame.new(0,-1,1) * CFrame.Angles(math.rad(90),math.rad(15),math.rad(90)), 0.5)
								RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.5 + 0.05 * math.cos(Sine / 12), 0) * CFrame.Angles(math.rad(-80 * ForwardMovement/7 - 5 * math.sin(Sine / 12)), 0, math.rad(-SidewaysMovement*10)) * RSCP, 0.05)
							end
						else
							RootJoint.C0 = Clerp(RootJoint.C0, RC0 * CFrame.new(0, 0, 0.05 * math.cos(Sine / 12)) * CFrame.Angles(math.rad(5 + 7 * math.sin(Sine / 12)) * ForwardMovement, math.rad(-SidewaysMovement * 10), 0) * CFrame.Angles(0, math.rad(-3 * math.cos(Sine / 12)), 0), 0.05)
							Neck.C0 = Clerp(Neck.C0, NC0 * CFrame.new(0,0,0) * CFrame.Angles(0, math.rad(3 * math.sin(Sine / 12)), 0), 0.05)
							if Mover.Mode ~= "10th" then
								LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.5, 0.4 + 0.05 * math.sin(Sine / 12), -.2 + .1 * math.cos(Sine / 12)) * CFrame.Angles(math.rad(-30 * math.sin(Sine / 12)), math.rad(-5 * math.sin(Sine / 12)), math.rad(1 + 2 * math.cos(Sine / 12))) * LSCP, 0.07)
							else
								LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.5, -0.1, 0) * CFrame.Angles(math.rad(40), 0, math.rad(-20)) * LSCP, 0.07)
							end
							RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -.8 - .2 * SidewaysMovement * math.cos(Sine / 12), -0.3 + .3 * ForwardMovement * math.sin(Sine / 12)) * CFrame.Angles(0, math.rad(90), math.rad(-45 * math.sin(Sine / 12))) * CFrame.Angles(0, math.rad(-5 * math.sin(Sine / 12)), 0), 0.07)
							LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -.8 + .2 * SidewaysMovement * math.cos(Sine / 12), -0.3 - .3 * ForwardMovement * math.sin(Sine / 12)) * CFrame.Angles(0, math.rad(-90), math.rad(-45 * math.sin(Sine / 12))) * CFrame.Angles(0, math.rad(5 * math.sin(Sine / 12)), 0), 0.07)
							if not Mover.Holstered then
								GunJoint.C0 = Clerp(GunJoint.C0, CFrame.new(0,-.5,0) * CFrame.Angles(0,0,0), 0.5)
								RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.25 + 0.05 * math.cos(Sine / 12), 0) * CFrame.Angles(math.rad(175 - 3 * math.sin(Sine / 12)), math.rad(5 - 5 * math.cos(Sine / 12)), math.rad(12)) * RSCP, 0.05)
							else
								GunJointBack.C0 = Clerp(GunJointBack.C0, CFrame.new(0,-1,1) * CFrame.Angles(math.rad(90),math.rad(15),math.rad(90)), 0.5)
								RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.4 - 0.05 * math.sin(Sine / 12), -.2 - .1 * math.cos(Sine / 12)) * CFrame.Angles(math.rad(30 * math.sin(Sine / 12)), math.rad(5 * math.sin(Sine / 12)), math.rad(-1 - 2 * math.cos(Sine / 12))) * RSCP, 0.07)
							end
						end
					elseif Mover.Mode == "2nd" then
						RootJoint.C0 = Clerp(RootJoint.C0, RC0 * CFrame.new(0, 0, 0.05 * math.cos(Sine / 12)) * CFrame.Angles(math.rad(5 + 7 * math.cos(Sine / 12)) * ForwardMovement, math.rad(-SidewaysMovement * 10), 0), 0.05)
						Neck.C0 = Clerp(Neck.C0, NC0 * CFrame.new(0,0,0) * CFrame.Angles(0, math.rad(3 * math.sin(Sine / 12)), 0), 0.05)
						LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.5, 0.5 + 0.05 * math.cos(Sine / 12), 0.1 * math.cos(Sine / 12)) * CFrame.Angles(math.rad(-30 * math.sin(Sine / 12)), 0, 0) * LSCP, 0.07)
						RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -.8 - .2 * math.cos(Sine / 12), -0.3 + .3 * math.sin(Sine / 12)) * CFrame.Angles(0, math.rad(90), math.rad(-45 * math.sin(Sine / 12))) * CFrame.Angles(0,0,0), 0.07)
						LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -.8 + .2 * math.cos(Sine / 12), -0.3 - .3 * math.sin(Sine / 12)) * CFrame.Angles(0, math.rad(-90), math.rad(-45 * math.sin(Sine / 12))) * CFrame.Angles(0,0,0), 0.07)
						if not Mover.Holstered then
							GunJoint.C0 = Clerp(GunJoint.C0, CFrame.new(0,-.5,0) * CFrame.Angles(math.rad(-90),0,0), 0.5)
							RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.5 + 0.05 * math.cos(Sine / 12), 0) * CFrame.Angles(math.rad(-15 + 5 * math.sin(Sine / 12)), math.rad(-35 - 5 * math.cos(Sine / 12)), 0) * RSCP, 0.05)
						else
							GunJointBack.C0 = Clerp(GunJointBack.C0, CFrame.new(0,-1,1) * CFrame.Angles(math.rad(90),math.rad(15),math.rad(90)), 0.5)
							RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.5 + 0.05 * math.cos(Sine / 12), -0.1 * math.cos(Sine / 12)) * CFrame.Angles(math.rad(30 * math.sin(Sine / 12)), 0, 0) * RSCP, 0.07)
						end
					elseif Mover.Mode == "3rd" then
						RootJoint.C0 = Clerp(RootJoint.C0, RC0 * CFrame.new(0, 0, 0.05 * math.cos(Sine / 12)) * CFrame.Angles(math.rad(5 + 7 * math.cos(Sine / 12)) * ForwardMovement, math.rad(-SidewaysMovement * 10), 0), 0.05)
						Neck.C0 = Clerp(Neck.C0, NC0 * CFrame.new(0,0,0) * CFrame.Angles(0, math.rad(3 * math.sin(Sine / 12)), 0), 0.05)
						LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.5, 0.5 + 0.05 * math.cos(Sine / 12), 0.1 * math.cos(Sine / 12)) * CFrame.Angles(math.rad(-30 * math.sin(Sine / 12)), 0, 0) * LSCP, 0.07)
						RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -.8 - .2 * math.cos(Sine / 12), -0.3 + .3 * math.sin(Sine / 12)) * CFrame.Angles(0, math.rad(90), math.rad(-45 * math.sin(Sine / 12))) * CFrame.Angles(0,0,0), 0.07)
						LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -.8 + .2 * math.cos(Sine / 12), -0.3 - .3 * math.sin(Sine / 12)) * CFrame.Angles(0, math.rad(-90), math.rad(-45 * math.sin(Sine / 12))) * CFrame.Angles(0,0,0), 0.07)
						if not Mover.Holstered then
							GunJoint.C0 = Clerp(GunJoint.C0, CFrame.new(0,-.5,0) * CFrame.Angles(math.rad(180),0,0), 0.5)
							RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.5 + 0.05 * math.cos(Sine / 12), 0) * CFrame.Angles(math.rad(25), 0, math.rad(45)) * RSCP, 0.05)
						else
							GunJointBack.C0 = Clerp(GunJointBack.C0, CFrame.new(0,-1,1) * CFrame.Angles(math.rad(90),math.rad(15),math.rad(90)), 0.5)
							RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.5 + 0.05 * math.cos(Sine / 12), -0.1 * math.cos(Sine / 12)) * CFrame.Angles(math.rad(30 * math.sin(Sine / 12)), 0, 0) * RSCP, 0.07)
						end
					elseif Mover.Mode == "4th" then
						RootJoint.C0 = Clerp(RootJoint.C0, RC0 * CFrame.new(0, 0, 0.05 * math.cos(Sine / 12)) * CFrame.Angles(math.rad(7 * math.sin(Sine / 12)) * ForwardMovement, math.rad(-SidewaysMovement * 10), math.rad(-SidewaysMovement * 10)), 0.05)
						Neck.C0 = Clerp(Neck.C0, NC0 * CFrame.new(0,0,0) * CFrame.Angles(math.rad(14 + 5 * math.cos(Sine / 12)), math.rad(3 * math.sin(Sine / 12)), math.rad(-SidewaysMovement * 10)), 0.05)
						if not Mover.Holstered then
							GunJoint.C0 = Clerp(GunJoint.C0, CFrame.new(0,-.5,0) * CFrame.Angles(math.rad(5 - 3 * math.cos(Sine / 12)), 0, 0), 0.05)
							RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.35 + 0.05 * math.cos(Sine / 12), 0) * CFrame.Angles(math.rad(-90 - 3 * math.sin(Sine / 12)), math.rad(-3), math.rad(7)) * RSCP, 0.05)
						else
							GunJointBack.C0 = Clerp(GunJointBack.C0, CFrame.new(0,-1,1) * CFrame.Angles(math.rad(90),math.rad(15),math.rad(90)), 0.5)
							RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.5 + 0.05 * math.cos(Sine / 12), 0) * CFrame.Angles(math.rad(45 * math.sin(Sine / 12) - 35 * math.cos(Sine / 12)), math.rad(-15 * math.cos(Sine / 12) + 15 * math.sin(Sine / 12)), math.rad(8)) * RSCP, 0.05)
						end
						LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.2, 0.5 + 0.05 * math.cos(Sine / 12), -1) * CFrame.Angles(math.rad(170 + 5 * math.cos(Sine / 12)), math.rad(7 + 3 * math.cos(Sine / 12)), math.rad(37)) * LSCP, 0.05)
						RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -.9 - 0.35 * math.cos(Sine / 12), -0.35 - .3 * math.cos(Sine / 12)) * CFrame.new(0, 0, 0.15 * math.sin(Sine / 12)) * CFrame.Angles(math.rad(-35 * math.sin(Sine / 12)), math.rad(90), 0) * CFrame.Angles(0, 0, math.rad(-45 * math.cos(Sine / 12))), 0.05)
						LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -.9 + 0.35 * math.cos(Sine / 12), -0.35 + .3 * math.cos(Sine / 12)) * CFrame.new(0, 0, -0.15 * math.sin(Sine / 12)) * CFrame.Angles(math.rad(35 * math.sin(Sine / 12)), math.rad(-90), 0) * CFrame.Angles(0, 0, math.rad(-45 * math.cos(Sine / 12))), 0.05)
					elseif Mover.Mode == "5th" then
						RootJoint.C0 = Clerp(RootJoint.C0, RC0 * CFrame.new(.7 * math.sin(Sine / 36), 0, 1 + 0.5 * math.cos(Sine / 36)) * CFrame.Angles(math.rad(70), math.rad(-SidewaysMovement * 10), math.rad(-5 * math.cos(Sine / 36))), 0.05)
						Neck.C0 = Clerp(Neck.C0, NC0 * CFrame.new(0,0,0) * CFrame.Angles(math.rad(-36 - 3 * math.cos(Sine / 36)), math.rad(3 * math.sin(Sine / 36)), 0), 0.05)
						RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.5 + 0.05 * math.cos(Sine / 12), 0) * CFrame.Angles(math.rad(-20), math.rad(-5 - 5 * math.cos(Sine / 36)), math.rad(7 + 3 * math.sin(Sine / 36))) * RSCP, 0.05)
						LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.5, 0.5 + 0.05 * math.cos(Sine / 12), 0) * CFrame.Angles(math.rad(-20), math.rad(5 + 3 * math.cos(Sine / 36)), math.rad(-7 - 5 * math.sin(Sine / 36))) * LSCP, 0.05)
						RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -.6, -0.5) * CFrame.Angles(math.rad(-20), math.rad(90), 0) * CFrame.Angles(math.rad(-5 * math.cos(Sine / 36)), math.rad(-7 - 5 * math.cos(Sine / 36)), math.rad(5 * math.sin(Sine / 36))), 0.05)
						LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -1, -0.01) * CFrame.Angles(math.rad(-27), math.rad(-90), 0) * CFrame.Angles(math.rad(5 * math.cos(Sine / 36)), math.rad(11 + 5 * math.cos(Sine / 36)), math.rad(-5 * math.sin(Sine / 36))), 0.05)
						if not Mover.Holstered then
							GunJoint.C0 = Clerp(GunJoint.C0, CFrame.new(0,-.5,0) * CFrame.Angles(0,0,0), 0.5)
						else
							GunJointBack.C0 = Clerp(GunJointBack.C0, CFrame.new(0,-1,1) * CFrame.Angles(math.rad(90),math.rad(15),math.rad(90)), 0.5)
						end
					elseif Mover.Mode == "6th" then
						RootJoint.C0 = Clerp(RootJoint.C0, RC0 * CFrame.new(0, 0, 3 + 0.2 * math.cos(Sine / 24)) * CFrame.Angles(math.rad(60), math.rad(-7 * math.sin(Sine / 24)), 0) * CFrame.Angles(0, math.rad(-SidewaysMovement * 10), 0), 0.05)
						Neck.C0 = Clerp(Neck.C0, NC0 * CFrame.new(0,0,0) * CFrame.Angles(math.rad(-30), math.rad(14 * math.cos(Sine / 24)), 0), 0.05)
						LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.5, 0.5 + 0.1 * math.cos(Sine / 12), 0) * CFrame.Angles(math.rad(120 + 5 * math.sin(Sine / 24)), math.rad(7 + 5 * math.cos(Sine / 24)), math.rad(-7)) * LSCP, 0.05)
						RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -1, -0.01) * CFrame.Angles(math.rad(-20), math.rad(90), 0) * CFrame.Angles(math.rad(-14 * math.cos(Sine / 24)), math.rad(-11 - 5 * math.cos(Sine / 24)), 0), 0.05)
						LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -.6, -0.5) * CFrame.Angles(math.rad(-30), math.rad(-90), 0) * CFrame.Angles(math.rad(14 * math.cos(Sine / 24)), math.rad(7 + 5 * math.cos(Sine / 24)), 0), 0.05)
						if not Mover.Holstered then
							GunJoint.C0 = Clerp(GunJoint.C0, CFrame.new(0,-.5,0) * CFrame.Angles(0,0,0), 0.5)
							RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.35 + 0.1 * math.cos(Sine / 12), 0) * CFrame.Angles(math.rad(175 - 5 * math.sin(Sine / 24)), math.rad(-11 - 5 * math.cos(Sine / 24)), math.rad(7)) * RSCP, 0.05)
						else
							GunJointBack.C0 = Clerp(GunJointBack.C0, CFrame.new(0,-1,1) * CFrame.Angles(math.rad(90),math.rad(15),math.rad(90)), 0.5)
							RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.35 + 0.1 * math.cos(Sine / 12), 0) * CFrame.Angles(math.rad(120 + 5 * math.sin(Sine / 24)), math.rad(-7 - 5 * math.cos(Sine / 24)), math.rad(7)) * RSCP, 0.05)
						end
					elseif Mover.Mode == "7th" then
						RootJoint.C0 = Clerp(RootJoint.C0, RC0 * CFrame.new(0, 0, 0.05 * math.cos(Sine / 12)) * CFrame.Angles(math.rad(6 + 4 * math.cos(Sine / 10)) * ForwardMovement, math.rad(3 * math.sin(Sine / 10)), 0) * CFrame.Angles(0, math.rad(-SidewaysMovement * 10), 0), 0.15)
						Neck.C0 = Clerp(Neck.C0, NC0 * CFrame.new(0,0,0) * CFrame.Angles(0,0,0), 0.05)
						RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.5 + 0.05 * math.cos(Sine / 12), 0) * CFrame.Angles(math.rad(175), 0, 0) * RSCP, 0.15)
						LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.5, 0.5 + 0.05 * math.cos(Sine / 12), 0) * CFrame.Angles(math.rad(-30 * math.sin(Sine / 10)), 0, 0) * LSCP, 0.15)
						RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -.8 - .25 * math.cos(Sine / 10), -.35 + .3 * math.sin(Sine / 10)) * CFrame.Angles(0, math.rad(90 - 5 * math.sin(Sine / 10)), math.rad(-30 * math.sin(Sine / 10))), 0.15)
						LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -.8 + .25 * math.cos(Sine / 10), -.35 - .3 * math.sin(Sine / 10)) * CFrame.Angles(0, math.rad(-90 - 5 * math.sin(Sine / 10)), math.rad(-30 * math.sin(Sine / 10))), 0.15)
					elseif Mover.Mode == "8th" then
						RootJoint.C0 = Clerp(RootJoint.C0, RC0 * CFrame.new(0, 0, 0.15 * math.sin(Sine / 8)) * CFrame.Angles(math.rad(15 * math.sin(Sine / 8)), 0, 0), 0.05)
						Neck.C0 = Clerp(Neck.C0, NC0 * CFrame.new(0,0,0) * CFrame.Angles(math.rad(15 * math.sin(Sine / 8)), 0, 0), 0.05)
						RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.5 + 0.1 * math.sin(Sine / 10), 0) * CFrame.Angles(math.rad(160 + 10 * math.sin(Sine / 8)), math.rad(-5 * math.cos(Sine / 8)), math.rad(70 + 30 * math.cos(Sine / 8))) * RSCP, 0.05)
						LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.5, 0.5 + 0.1 * math.sin(Sine / 10), 0) * CFrame.Angles(math.rad(160 + 10 * math.sin(Sine / 8)), math.rad(5 * math.cos(Sine / 8)), math.rad(-70 - 30 * math.cos(Sine / 8))) * LSCP, 0.05)
						RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -1 - 0.15 * math.sin(Sine / 8), -0.3) * CFrame.Angles(math.rad(-5 + 30 * math.sin(Sine / 8)), math.rad(90), 0) * CFrame.Angles(math.rad(-7), math.rad(-4), 0), 0.05)
						LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -1 - 0.15 * math.sin(Sine / 8), -0.3) * CFrame.Angles(math.rad(-5 + 30 * math.sin(Sine / 8)), math.rad(-90), 0) * CFrame.Angles(math.rad(-8), math.rad(8), 0), 0.05)
					elseif Mover.Mode == "9th" then
						RootJoint.C0 = Clerp(RootJoint.C0, RC0 * CFrame.new(0, 0, -0.1 + 0.05 * math.cos(Sine / 10)) * CFrame.Angles(math.rad(15) * ForwardMovement, math.rad(3 * math.sin(Sine / 10)), math.rad(-5 * math.cos(Sine / 10))) * CFrame.Angles(0, math.rad(-SidewaysMovement * 10), 0), 0.15)
						Neck.C0 = Clerp(Neck.C0, NC0 * CFrame.new(0,0,-0.05 * math.cos(Sine / 10)) * CFrame.Angles(math.rad(-5), math.rad(-3 * math.cos(Sine / 10)), 0), 0.05)
						LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.5, 0.45 + 0.05 * math.cos(Sine / 10), 0.05 * math.cos(Sine / 10)) * CFrame.Angles(math.rad(-20 * math.sin(Sine / 10)), 0, math.rad(-5)) * LSCP, 0.15)
						RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -.8 - .25 * math.cos(Sine / 10), -.35 + .3 * math.sin(Sine / 10)) * CFrame.Angles(0, math.rad(90 - 5 * math.sin(Sine / 10)), math.rad(-45 * math.sin(Sine / 10))), 0.15)
						LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -.8 + .25 * math.cos(Sine / 10), -.35 - .3 * math.sin(Sine / 10)) * CFrame.Angles(0, math.rad(-90 - 5 * math.sin(Sine / 10)), math.rad(-45 * math.sin(Sine / 10))), 0.15)
						if not Mover.Holstered then
							GunJoint.C0 = Clerp(GunJoint.C0, CFrame.new(0,-.5,0) * CFrame.Angles(math.rad(-90),0,0), 0.5)
							RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.4 + 0.05 * math.cos(Sine / 10), 0.35) * CFrame.Angles(math.rad(-7 - 5 * math.sin(Sine / 10)), math.rad(-45 - 3 * math.cos(Sine / 10)), math.rad(9)) * RSCP, 0.15)
						else
							GunJointBack.C0 = Clerp(GunJointBack.C0, CFrame.new(0,-1,1) * CFrame.Angles(math.rad(90),math.rad(15),math.rad(90)), 0.5)
							RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.45 + 0.05 * math.cos(Sine / 10), -0.05 * math.cos(Sine / 10)) * CFrame.Angles(math.rad(20 * math.sin(Sine / 10)), 0, math.rad(5)) * RSCP, 0.15)
						end
					elseif Mover.Mode == "M7" then
						GunJoint.C0 = Clerp(GunJoint.C0, CFrame.new(0,-.6,0) * CFrame.Angles(math.rad(-180),0,0), 0.05)
						RootJoint.C0 = Clerp(RootJoint.C0, RC0 * CFrame.new(0, 0, -0.1 + 0.05 * math.cos(Sine / 22)) * CFrame.Angles(math.rad(15), 0, math.rad(-5 * math.cos(Sine / 10))), 0.15)
						Neck.C0 = Clerp(Neck.C0, NC0 * CFrame.new(0,0,-0.05 * math.cos(Sine / 12)) * CFrame.Angles(math.rad(-5), 0, 0), 0.05)
						LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.2, 0.4 + 0.05 * math.cos(Sine / 12), 0.3) * CFrame.Angles(math.rad(-30), 0, math.rad(50)) * LSCP, 0.05)
						RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1, -.8 - .25 * math.cos(Sine / 12), -.35 + .3 * math.sin(Sine / 12)) * CFrame.Angles(0, math.rad(90 - 5 * math.sin(Sine / 12)), math.rad(-45 * math.sin(Sine / 12))), 0.25)
						LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1, -.8 + .25 * math.cos(Sine / 12), -.35 - .3 * math.sin(Sine / 12)) * CFrame.Angles(0, math.rad(-90 - 5 * math.sin(Sine / 12)), math.rad(-45 * math.sin(Sine / 12))), 0.25)
						if not Mover.Holstered then
							GunJoint.C0 = Clerp(GunJoint.C0, CFrame.new(0,-.5,0) * CFrame.Angles(math.rad(-70),0,0), 0.5)
							RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.4 + 0.05 * math.cos(Sine / 12), 0.15) * CFrame.Angles(math.rad(-30), 0, math.rad(7)) * RSCP, 0.05)
						else
							GunJointBack.C0 = Clerp(GunJointBack.C0, CFrame.new(0,-1,1) * CFrame.Angles(math.rad(90),math.rad(15),math.rad(90)), 0.5)
							RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5, 0.4 + 0.05 * math.cos(Sine / 12), -0.05 * math.cos(Sine / 12)) * CFrame.Angles(math.rad(20 * math.sin(Sine / 12)), 0, math.rad(5)) * RSCP, 0.05)
						end
					end
				end
			
				if Mover.Jump == true then
					RootJoint.C0 = Clerp(RootJoint.C0, RC0 * CFrame.new(0,0,0) * CFrame.Angles(math.rad(-5),0,0), 0.33)
					Neck.C0 = Clerp(Neck.C0, NC0 * CFrame.new(0,0,0) * CFrame.Angles(math.rad(-25), 0, math.rad(10)), 0.33)
					RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5,0.5,0) * CFrame.Angles(math.rad(-50), 0, math.rad(10 * math.cos(Sine / 12))) * RSCP, 0.33)
					LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.5,0.5,0) * CFrame.Angles(math.rad(50), 0, math.rad(-25 - 10 * math.cos(Sine / 12))) * LSCP, 0.33)
					RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1,-0.4,-0.6) * CFrame.Angles(math.rad(1), math.rad(90), 0) * CFrame.Angles(math.rad(-1 * math.sin(Sine / 6)), 0, 0), 0.33)
					LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1,-1,0) * CFrame.Angles(0, math.rad(-85), 0) * CFrame.Angles(math.rad(-1 * math.sin(Sine / 6)), 0, 0), 0.33)
					GunJoint.C0 = Clerp(GunJoint.C0, CFrame.new(0.05,-1,-0.15) * CFrame.Angles(0,0,0), 0.5)
				elseif Mover.Fall == true and Mover.Jump == false then
					RootJoint.C0 = Clerp(RootJoint.C0, RC0 * CFrame.new(0,0,0) * CFrame.Angles(math.rad(15),0,0), 0.33)
					Neck.C0 = Clerp(Neck.C0, NC0 * CFrame.new(0,0,0) * CFrame.Angles(math.rad(-15), math.rad(2.5), math.rad(5 + 5 * math.cos(Sine / 12))), 0.33)
					RightShoulder.C0 = Clerp(RightShoulder.C0, CFrame.new(1.5,0.5,0) * CFrame.Angles(math.rad(-90 - 4 * math.cos(Sine / 6)), 0, math.rad(10 * math.cos(Sine / 12))) * RSCP, 0.33)
					LeftShoulder.C0 = Clerp(LeftShoulder.C0, CFrame.new(-1.5,0.5,0) * CFrame.Angles(math.rad(35 - 4 * math.cos(Sine / 6)), 0, math.rad(-45 - 10 * math.cos(Sine / 12))) * LSCP, 0.33)
					RightHip.C0 = Clerp(RightHip.C0, CFrame.new(1,-0.3,-0.7) * CFrame.Angles(math.rad(-25 + 5 * math.sin(Sine / 12)), math.rad(90), 0) * CFrame.Angles(math.rad(-1 * math.sin(Sine / 6)), 0, 0), 0.33)
					LeftHip.C0 = Clerp(LeftHip.C0, CFrame.new(-1,-0.8,-0.3) * CFrame.Angles(math.rad(-10), math.rad(-80), 0) * CFrame.Angles(math.rad(-1 * math.sin(Sine / 6)), 0, 0), 0.33)
					GunJoint.C0 = Clerp(GunJoint.C0, CFrame.new(0.05,-1,-0.15) * CFrame.Angles(0,0,0), 0.5)
				end
			end
		
			task.wait()
		end
	end)
end)
local LogService = game:GetService("LogService")

if rconsoleclear then
    rconsoleclear()
end

print("")
local t = task.wait
local c = chatfunc
t(3)
c("Loaded ḤŁČ̣ V²")
t(2)
c("this was converted and fixed by megumi scripts")
