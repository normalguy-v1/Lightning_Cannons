-- fixed by normalguy-v1
game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.Health, false)

local function randomstring()
local length = math.random(10,20)
local array = {}
for i = 1,length do
array[i] = string.char(math.random(32,126))
end
return table.concat(array)
end

local lplr = game:GetService("Players").LocalPlayer
local Player = lplr
Mouse = Player:GetMouse()

local Anim,warning,killa = "Idle",false,"mdmg"
local ohgod,Animation_Speed,tiredval,co1,add,k = 0,2,0,0,10,1
local afk,nomain,tiredinterrupted = false,false,false
local ISFLYING,stopeverything,alreadyfixing,attack = false,false,false,false
local DedParts,TOBANISH = {},{}
local BAW,cotof = Color3.new(),true
local delays,play,BG,BV = false,true,nil,nil
local GUN,Sheld = nil,false
local Services,weird_classes,PossibleRedoneUSLClassNames = {"SoundService","Chat","MarketplaceService","Players","StarterPlayer","LocalizationService","JointsService","FriendService","InsertService","Lighting","Teams","ReplicatedStorage","TestService","ProximityPromptService"},{"Humanoid","MeshPart","UnionOperation","WedgePart","MeshPart","WorldModel","Mesh","Shirt","Pants","CharacterMesh"},{"Camera", "RemoteEvent", "BindableFunction", "Flag", "Hat", "Hole", "Actor", "Folder", "Team"}
local TiredMsg,Texting1,Texting2,Texting3,Texting4,Texting5,Texting6,Texting7,Texting8,Texting9,Texting10,Texting11,Texting12 = {":>","ok.","Man, I'm starting to get tired fr.","Can i take a nap now?","sleepy...","So, uh... got any coffee?","Wish i was back at home in bed.","if 2x2 = fish, then whats 2/2?","there's prob a skiddy kiddy destroying everything but im too tired to care.","i didnt even know scripts could get tired..."},{"Fix Character","Ｆｉｘ Ｃｈａｒａｃｔｅｒ","Ｆɪx ᴄʜᵃʀａᴄｔᴇʀ","ɹǝʇɔɐɹɐɥƆ xıF","ɿɘƚɔɒɿɒʜƆ xiF","F̸͇̈́i̶͎̾x̸̘̃ ̴̱̅Ć̴̟h̸̼̄a̷̰̐r̶̞͒a̵͉͊c̴̨͊t̸̤͒e̷͉̋r̴͚̊","🅵🅸🆇 🅲🅷🅰🆁🅰🅲🅃🅴🆁","Fᵢₓ Cｈₐᵣₐcｔₑᵣ","ᶠⁱˣ ᶜʰᵃʳᵃᶜᵗᵉʳ","Ŧเא ςђคгคςƈƚєг","Fιx Cԋαɾαƈｔe🇷","ʄɨӼ ƈɦǟʀǟƈȶɛ𝐫","fix ¢hคrค¢tēr","FIX ᄃΉΛЯΛᄃƬΣ🇷","ƒιχ ¢нαяα¢тє🇷","£ïx Çhårå¢†êr","₣łӾ ₵Ⱨ₳Ɽ₳₵₮ɆⱤ","千丨乂 匚卄卂尺卂匚ㄒ乇🇷","ｷﾉﾒ ᄃんﾑ尺ﾑ`ｲﾑ🇷","F҉i҉x҉ ҉C҉h҉a҉r҉a҉c҉t҉e҉r҉","F̶i̶x̶ ̶C̶h̶a̶r̶a̶c̶t̶e̶r̶","F̴i̴x̴ ̴C̶h̶a̶r̶a̶c̴t̶e̴r̶","F̷i̶x̷ ̷C̶h̶a̶r̶a̶c̶t̶e̶r̶","F̲i̲x̲ ̲C̶h̲a̶r̷a̶c̶t̶e̶r̶","F̳i̲x̳ ̳C̶h̶a̶r̶a̶c̶t̶e̶r̶","F̾i̾x̾ ̾C̾h̾a̾r̾a̾c̾t̾e̾r̾","F͎i͎x͎ ͎C͎h͎a͎r͎a͎c̶t̶e̶r̶","F͓̽i͓̽x͓̽ ͓̽C͓̽h̶a̶r̷a̶c̶t̶e̶r̶"},{"Ｓｈｕｔｄｏｗｎ Ｇａｍᴇ","Ｓʜᴜᴛᴅᵒᴡɴ ɢᴀᴍᴇ","ǝɯɐＧ uʍopʇnɥS","🅂🄷🅄🄃🄳🄾🅆🄽 🄶🄰🄼🄴","ɘmɒＧ ᴎwobƚuʜＳ","S̵̩̕h̷̫̐u̷͉̐t̷̰͠d̴͎̓o̵̙̓w̵̲̃n̴͚̕ ̵̳͒G̸̟̉ḁ̸̋m̸̳̉e̸͕̿","ˢʰᵘᵗᵈᵒʷⁿ ᴳᵃᵐᵉ","รђยƚ๔๏ฬภ ﻮค๓є","Sԋυƚԃσɯɳ Gαɱҽ","ʂɧųɬɖơῳŋ ɠąɱɛ","ƧΉЦƬDӨЩП GΛMΣ","ѕнυт∂σωη gαмє","§hµ†Ððwñ Gåmê","₴ⱧɄ₮ĐØ₩₦ ₲₳₥ɶ","丂卄ㄩㄒDㄖ山几 G卂爪乇","丂んひｲりのW刀 ムﾑﾶ乇","S҉h҉u҉t҉d҉o҉w҉n҉ ҉G҉a҉m҉e҉","S̶h̶u̶t̶d̶o̶w̶n̶ ̶G̶a̶m̶e̶","S̴h̶u̶t̶d̶o̶w̶n̶ ̶G̶a̶m̶e̶","S̷h̶u̶t̶d̶o̶w̶n̶ ̶G̶a̶m̶e̶","S̲h̲u̶t̶d̶o̶w̶n̶ ̶G̶a̶m̶e̶","S̳h̲u̶t̶d̶o̶w̶n̶ ̶G̶a̶m̶e̶","S̾h̾u̶t̶d̶o̶w̶n̶ ̶G̶a̶m̶e̶","S͎h̲u̶t̶d̶o̶w̶n̶ ͎G̶a̶m̶e̶","S͓̽h̶u̶t̶d̶o̶w̶n̶ ͓̽G̶a̶m̶e̶"},{"Horizon LC","Horizon LC","H0r1z0n 1C","Horizon LC","H0rizon LC","Hor1zon LC","Horiz0n LC","HOrizon LC","HOrizon LC","HOrizon LC","hOrIzOn LC","HORizon LC","hORIZon LC","HORizon LC","HoRIzOn LC","H0rIzON LC","HOR1ZON LC","HORizon LC","HORIzon LC","HORIzon LC","HORRIZON LC","HORIzon LC","HORIZon LC","HORIZon LC","HØrizØn LC","ⱧOrizon LC","HORIZon LC","HORIZOn LC","H0RIZON 1C","HORIZOn LC","HORIZOn LC","HORIZON LC","ⱧORIZON L₵","HORIZON LC","horÌz0n LC","HORIZON LC","H0RIZO₦ LC","hORIZON LC","hORIZON LC","hORIZON LC","hOr1Ⱬ0N L3","hoRIZON LC","hoRIZON LC","hOⱤ|Z()N LC","hoRIZON LC","HOяiZon ᄂC","horIZON LC","horIZON LC","horIZON LC","HσRIZOn IC","HÖR1ZÖn LC","horiZON LC","horiZON LC","horiZON LC","horizON LC","hoRiZӨn ιc","horizON LC","horizON LC","HσrRiiZ0N L1C","Hor1zEn LC","horizoN LC","horizoN LC","HoRiZON LC","horizoN LC","horizon LC","horizon LC","hoRIzOñ lC","Ή0riZ[]n Lc","H_r'Zon |3","horizon LC","Horizon LC","H(R-+N LC","Horizon LC","Horizon LC","horizon lc","HoRIZon LC","Horizon lc"},{"Berg","berg","B3rg","b3rg","B_rg","BERG","Be[]g"},{"Endeavors","Endeavors","End3av0rs","EnDeVorS","3ndEv0eZ","Endeavors","Endeavors","endeavors","3nd3av0rs","end3v0rs","Endev()rs"},{"Last Standing","L4st St4nding","LaSt StaNdiNG","LasT standIng","lAst STAndiNG","l4St st4nDING","L@st stANdiNg","|ast $tand'ng"},{"Menace","Menace","Men&ce","Menace","Menace","Menace","Menace","Menace","Menace","Menace","Men@ce","Menace","Menace","Menace","Menace","Menace","Menace","Menace","M3nace","Menace","Menace","Menace","Menace","Menace","Menace","Menace","Menac3","Menace","Menace","Menace","Menace","Menace","Menace","Menace","M3n@c(3","menaC","Menac"},{"iNSaNiTY","InSAnITy","inSaNItY","iNSANitY","InsANIty","iNsanIty","INsANiTY","insAnitY","iNsaNiTy","InsAnItY","iNsAnItY","iNSaNiTY"},{"0100101","0010011","1001101","0111010","0010110","1100100","10111O1","0100001","0101001","0001001","1011101","0111001","1110110","1001110","0100100"},{"Gl|tch","Gl!tch","GL:TcH","Gl1tCH","GlItch","Gl_tCh","Glit(h","G\itch","Gi1t[ch","g\1t(h","GlIt=_","Glitch"},{"Witch","Witch","Witch","Witch","Witch","Witch","Witch","Witch","Witch","Witch","Witch","Witch","W1tch"},{"Immortality King"}
local FONTS,Style,Weight = {Enum.Font.Arcade,Enum.Font.Cartoon,Enum.Font.Code,Enum.Font.SciFi,Enum.Font.Antique,Enum.Font.Arial,Enum.Font.ArialBold,Enum.Font.Fantasy,Enum.Font.Garamond,Enum.Font.Legacy,Enum.Font.GothamSemibold,Enum.Font.Gotham,Enum.Font.GothamBlack,Enum.Font.Highway,Enum.Font.Bodoni,},{Enum.FontStyle.Italic,Enum.FontStyle.Normal},{Enum.FontWeight.Regular,Enum.FontWeight.Bold,Enum.FontWeight.Thin,Enum.FontWeight.Heavy,Enum.FontWeight.Light,Enum.FontWeight.Medium,Enum.FontWeight.SemiBold,Enum.FontWeight.ExtraBold,Enum.FontWeight.ExtraLight}
local Work = game:GetService("Workspace")
local Terrain = Work:FindFirstChild("Terrain")
local TweenService = game:GetService("TweenService")
local Lightin = game:GetService("Lighting")
local Debris = game:GetService("Debris")

local S,Player_Size,walkspeed,sensitivity,walkspeed2,walkspeed3 = 1,1,16,12,50,14
local shade = Color3.new()
local BallSize = Vector3.new(1*(4 / 3),1*(4 / 3),1*(4 / 3))
local SquareSize = Vector3.new(1,1,1)

function rayCast(Position,Direction,Range,Ignore)
return Work:FindPartOnRay(Ray.new(Position,Direction.unit * (Range or 999.999)),Ignore) 
end 
function Raycast(POSITION, DIRECTION, RANGE, IGNOREDECENDANTS)
return Work:FindPartOnRay(Ray.new(POSITION, DIRECTION.unit * RANGE), IGNOREDECENDANTS)
end
function CastProperRay(StartPos, EndPos, Distance, Ignore)
local DIRECTION = CF(StartPos,EndPos).lookVector
return Raycast(StartPos, DIRECTION, Distance, Ignore)
end

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
euler=CFrame.fromEulerAnglesXYZ
cn = CFrame.new
rad = math.rad
cos = math.cos
sin = math.sin
function cn2(x,y,z)
return cn(x*S,y*S,z*S)
end

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

local function setupCharacter(character)
	-- Disable Roblox's default Animate script
	local animate = character:WaitForChild("Animate", 5)
	if animate then
		animate.Disabled = true
	end

	local humanoid = character:WaitForChild("Humanoid", 5)
	local humanoidRootPart = character:WaitForChild("HumanoidRootPart", 5)
	local torso = character:WaitForChild("Torso", 5)
	
	if not humanoidRootPart or not torso or not humanoid then return end

	-- Stop any active default tracks
	local animator = humanoid:FindFirstChildOfClass("Animator")
	if animator then
		for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
			track:Stop(0)
		end
	end

	-- Direct R6 Motor6Ds
	local RootJoint = humanoidRootPart:WaitForChild("RootJoint", 5)
	local Neck = torso:WaitForChild("Neck", 5)
	local RightShoulder = torso:WaitForChild("Right Shoulder", 5)
	local LeftShoulder = torso:WaitForChild("Left Shoulder", 5)
	local RightHip = torso:WaitForChild("Right Hip", 5)
	local LeftHip = torso:WaitForChild("Left Hip", 5)

	if not RootJoint or not Neck or not RightShoulder or not LeftShoulder or not RightHip or not LeftHip then return end

	local SIN = math.sin
	local COS = math.cos
	local CF = CFrame.new
	local ANGLES = CFrame.Angles
	local RAD = math.rad

	local Animation_Speed = 3

	local function Clerp(a, b, t)
		return a:Lerp(b, math.clamp(t, 0, 1))
	end

	local ROOTC0 = CF(0, 0, 0) * ANGLES(RAD(-90), RAD(0), RAD(180))
	local NECKC0 = CF(0, 1, 0) * ANGLES(RAD(-90), RAD(0), RAD(180))
	local RIGHTSHOULDERC0 = CF(-0.5, 0, 0) * ANGLES(RAD(0), RAD(90), RAD(0))
	local LEFTSHOULDERC0 = CF(0.5, 0, 0) * ANGLES(RAD(0), RAD(-90), RAD(0))
	local rc0 = CFrame.new() * CFrame.Angles(math.rad(-90), math.rad(0), math.rad(180))
	local nc0 = CFrame.new(0, 1, 0) * CFrame.Angles(math.rad(-90), math.rad(0), math.rad(180))
	local rscp = CFrame.new(-.5, 0, 0) * CFrame.Angles(math.rad(0), math.rad(90), math.rad(0))
	local lscp = CFrame.new(.5, 0, 0) * CFrame.Angles(math.rad(0), math.rad(-90), math.rad(0))

	local sine = 0
	local candoanim = true

	local connection
	connection = RunService.RenderStepped:Connect(function()
		if not character.Parent or humanoid.Health <= 0 then
			connection:Disconnect()
			return
		end

		local velocity = humanoidRootPart.Velocity
		local horizontalVelocity = Vector3.new(velocity.X, 0, velocity.Z)
		local walking = horizontalVelocity.Magnitude > 0.5

		-- Make character/animation turn smoothly with movement direction
		if walking then
			local targetCFrame = CFrame.new(humanoidRootPart.Position, humanoidRootPart.Position + horizontalVelocity)
			humanoidRootPart.CFrame = humanoidRootPart.CFrame:Lerp(targetCFrame, 0.2)
		end

		sine = sine + 1

		if candoanim then
			if walking then
				RootJoint.C1 = Clerp(RootJoint.C1, rc0 * CF(0, 0, 0.1 + 0.05 * SIN(sine / 6)) * ANGLES(0, 0, 0), 2 / Animation_Speed)
				Neck.C1 = Clerp(Neck.C1, CF(0, -0.5, 0) * ANGLES(RAD(-90), 0, RAD(180)), 0.2 / Animation_Speed)
				RightHip.C1 = Clerp(RightHip.C1, CF(0.5, .95 - .2 * SIN(sine / 12), -.15 * COS(sine / 12)) * ANGLES(RAD(-5), RAD(90), 0) * ANGLES(0, 0, RAD(-10 + 35 * SIN(sine / 12))), 0.6 / Animation_Speed)
				LeftHip.C1 = Clerp(LeftHip.C1, CF(-0.5, .95 + .2 * SIN(sine / 12), .15 * COS(sine / 12)) * ANGLES(RAD(-5), RAD(-90), 0) * ANGLES(0, 0, RAD(10 + 35 * SIN(sine / 12))), 0.6 / Animation_Speed)
				
				RootJoint.C0 = Clerp(RootJoint.C0, rc0 * CF(0, 0, 0.05 * SIN(sine / 12)) * ANGLES(RAD(20), RAD(2.5 * SIN(sine / 12)), RAD(-2.5 * SIN(sine / 12))), 0.7 / Animation_Speed)
				Neck.C0 = Clerp(Neck.C0, nc0 * ANGLES(RAD(-20 - 3 * COS(sine / 12)), RAD(-2.5 * COS(sine / 12)), RAD(-2.5 * COS(sine / 12))), 0.7 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(150), RAD(-2.5 * COS(sine / 12)), RAD(5 + 2.5 * COS(sine / 12))) * rscp, 0.7 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, -0.2 * SIN(sine / 12)) * ANGLES(RAD(20 - 45 * COS(sine / 12)), RAD(-10 * SIN(sine / 12)), RAD(2.5 * SIN(sine / 12))) * lscp, 0.7 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(1, -1, 0) * ANGLES(0, RAD(85), 0), 0.7 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1, 0) * ANGLES(0, RAD(-85), 0), 0.7 / Animation_Speed)
			else
				RootJoint.C1 = Clerp(RootJoint.C1, rc0, 0.2 / Animation_Speed)
				Neck.C1 = Clerp(Neck.C1, CF(0, -0.5, 0) * ANGLES(RAD(-90), 0, RAD(180)), 0.2 / Animation_Speed)
				RightHip.C1 = Clerp(RightHip.C1, CF(0.5, 1, 0) * ANGLES(0, RAD(90), 0), 0.7 / Animation_Speed)
				LeftHip.C1 = Clerp(LeftHip.C1, CF(-0.5, 1, 0) * ANGLES(0, RAD(-90), 0), 0.7 / Animation_Speed)
				
				RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0, 0, .1 * COS(sine / 15) + .1 * SIN(sine / 15)) * ANGLES(RAD(2 * -COS(sine / 15)), 0, RAD(-5)) * ANGLES(RAD(2 * -SIN(sine / 15)), 0, 0), 0.7 / Animation_Speed)
				Neck.C0 = Clerp(Neck.C0, NECKC0 * ANGLES(RAD(-1.4 + 5 * COS(sine / 35)), RAD(-3.3 + 5 * SIN(sine / 35)), RAD(11)), 0.7 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, .2 + .025 * COS(sine / 15), 0) * ANGLES(RAD(52.4 + 1.75 * COS(sine / 15)), RAD(3 - 1.75 * SIN(sine / 15)), RAD(17)) * RIGHTSHOULDERC0, 0.7 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, .5 + .025 * COS(sine / 15), 0) * ANGLES(RAD(2.77), RAD(10.77 + 2 * COS(sine / 15)), RAD(-12.97 + 2 * SIN(sine / 12))) * LEFTSHOULDERC0, 0.7 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(1.15, -1 - .1 * COS(sine / 15) - .1 * SIN(sine / 15), -.2) * ANGLES(RAD(-10 + 3 * -COS(sine / 15)), RAD(-18), RAD(7)) * ANGLES(0, RAD(90 + 3 * -SIN(sine / 15)), 0), 0.7 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 - .1 * COS(sine / 15) - .1 * SIN(sine / 15), -.45) * ANGLES(RAD(-3.98 + 3 * -COS(sine / 15)), RAD(7), RAD(-2.4)) * ANGLES(0, RAD(-90 - 3 * SIN(sine / 15)), 0), 0.7 / Animation_Speed)
			end
		end
	end)
end

if player.Character then
	task.spawn(setupCharacter, player.Character)
end
player.CharacterAdded:Connect(setupCharacter)


local function weldBetween(a,b)
local weldd = Instance.new("Weld")
weldd.Part0 = a
weldd.Part1 = b
weldd.C0 = CFrame.new()
weldd.C1 = b.CFrame:inverse() * a.CFrame
weldd.Parent = b
return weldd
end
function CreateConnection(TYPE,PARENT,PART0,PART1,C0,C1)
local NEWWELD = Instance.new(TYPE)
NEWWELD.Part0 = PART0
NEWWELD.Part1 = PART1
NEWWELD.C0 = C0
NEWWELD.C1 = C1
NEWWELD.Parent = PARENT
return NEWWELD
end

local Character = lplr.Character or lplr.CharacterAdded:Wait()

-- Disable Roblox's default R6 animation controller so its idle/run/jump/fall
-- animations cannot overwrite the script's CFrame-based animation.
local function disableDefaultAnimations(char)
	local animate = char:FindFirstChild("Animate")
	if animate then
		animate.Disabled = true
		animate:Destroy()
	end

	for _, obj in ipairs(char:GetChildren()) do
		if obj:IsA("LocalScript") and obj.Name == "Animate" then
			obj.Disabled = true
			obj:Destroy()
		end
	end
end

disableDefaultAnimations(Character)

Character.ChildAdded:Connect(function(child)
	if child.Name == "Animate" and (child:IsA("LocalScript") or child:IsA("Script")) then
		task.defer(function()
			if child.Parent == Character then
				child.Disabled = true
				child:Destroy()
			end
		end)
	end
end)


local Humanoid = Character:WaitForChild("Humanoid")

local Animator = Humanoid:FindFirstChildOfClass("Animator")
if Animator then
	for _, track in ipairs(Animator:GetPlayingAnimationTracks()) do
		pcall(function()
			track:Stop(0)
			track:Destroy()
		end)
	end
	Animator:Destroy()
end

Humanoid.AutoRotate = false
local Head = Character:WaitForChild("Head")
local Torso = Character:WaitForChild("Torso")
local LeftArm = Character:WaitForChild("Left Arm")
local RightArm = Character:WaitForChild("Right Arm")
local LeftLeg = Character:WaitForChild("Left Leg")
local RightLeg = Character:WaitForChild("Right Leg")
local RootPart = Character:WaitForChild("HumanoidRootPart")

local Effects = Character:FindFirstChild("Effects")
if not Effects then
	Effects = Instance.new("Folder")
	Effects.Name = "Effects"
	Effects.Parent = Character
end

-- Compatibility weapon objects used by the original script.
local GunRig = Instance.new("Model")
GunRig.Name = "HorizonLC_GunRig"
GunRig.Parent = Effects

local GunJointPart = Instance.new("Part")
GunJointPart.Name = "Joint"
GunJointPart.Size = Vector3.new(0.2, 0.2, 0.2)
GunJointPart.Transparency = 1
GunJointPart.CanCollide = false
GunJointPart.CanTouch = false
GunJointPart.CanQuery = false
GunJointPart.Massless = true
GunJointPart.CFrame = RightArm.CFrame
GunJointPart.Parent = GunRig

local NeonParts = Instance.new("Part")
NeonParts.Name = "NeonParts"
NeonParts.Size = Vector3.new(0.2, 0.2, 0.2)
NeonParts.Transparency = 1
NeonParts.CanCollide = false
NeonParts.CanTouch = false
NeonParts.CanQuery = false
NeonParts.Massless = true
NeonParts.Color = Color3.fromRGB(255, 0, 0)
NeonParts.CFrame = RightArm.CFrame
NeonParts.Parent = GunRig

local GunWeld = Instance.new("Weld")
GunWeld.Part0 = RightArm
GunWeld.Part1 = GunJointPart
GunWeld.C0 = CFrame.new(0, -1, 0)
GunWeld.Parent = GunJointPart

local GunJoint = GunWeld
local GUN = GunRig
local Holetwo = GunJointPart
local Hole = NeonParts
local Gunneon = {Color = NeonParts.Color}
local USERNAME = lplr.Name


function CreateMesh(MESH,PARENT,MESHTYPE,MESHID,TEXTUREID,SCALE,OFFSET)
local NEWMESH = Instance.new(MESH)
if MESH == "SpecialMesh" then
NEWMESH.MeshType = MESHTYPE
if MESHID ~= "nil" and MESHID ~= "" then
NEWMESH.MeshId = "rbxassetid://"..MESHID
end
if TEXTUREID ~= "nil" and TEXTUREID ~= "" then
NEWMESH.TextureId = "rbxassetid://"..TEXTUREID
end
end
NEWMESH.Offset = OFFSET or Vector3.new()
NEWMESH.Scale = SCALE
NEWMESH.Parent = PARENT
return NEWMESH
end
function CreatePart(IsBase,FORMFACTOR,PARENT,MATERIAL,REFLECTANCE,TRANSPARENCY,BRICKCOLOR,NAME,SIZE,ANCHOR)
if IsBase == true then
NEWPART = Instance.new("Part")
else
NEWPART = Instance.new("SkateboardPlatform")
end
NEWPART.Massless = true
NEWPART.formFactor = FORMFACTOR
NEWPART.Reflectance = REFLECTANCE
NEWPART.Transparency = TRANSPARENCY
NEWPART.CanCollide = false
NEWPART.CanTouch = false
NEWPART.CanQuery = false
NEWPART.Locked = true
NEWPART.Anchored = true
if ANCHOR == false then
NEWPART.Anchored = false
end
NEWPART.Color = BRICKCOLOR
NEWPART.Name = randomstring()
NEWPART.Size = SIZE
NEWPART.Position = Torso.Position
NEWPART.Material = MATERIAL
NEWPART:BreakJoints()
NEWPART.Parent = PARENT
return NEWPART
end
function CreateSound(ID,PARENT,VOLUME,PITCH,DOESLOOP)
local S = Instance.new("Sound")
local NEWSOUND = nil
coroutine.resume(coroutine.create(function()
NEWSOUND = S:Clone()
NEWSOUND.Parent = PARENT
NEWSOUND.Volume = VOLUME
NEWSOUND.Pitch = PITCH
NEWSOUND.SoundId = "rbxassetid://"..ID
NEWSOUND:play()
if DOESLOOP == true then
NEWSOUND.Looped = true
else
coroutine.resume(coroutine.create(function()
pcall(function()
if warning == false then
repeat Swait() until NEWSOUND.Playing == false
else
repeat task.wait() until NEWSOUND.Playing == false
end
NEWSOUND:Destroy()
end)
end))
end
end))
return NEWSOUND
end
function MakeForm(PART,TYPE)
if TYPE == "Cyl" then
local MSH = Instance.new("CylinderMesh",PART)
elseif TYPE == "Ball" then
local MSH = Instance.new("SpecialMesh",PART)
MSH.MeshType = "Sphere"
elseif TYPE == "Wedge" then
local MSH = Instance.new("SpecialMesh",PART)
MSH.MeshType = "Wedge"
end
end

local RootJoint = RootPart:FindFirstChild("RootJoint") or RootPart:FindFirstChildOfClass("Motor6D")
if not RootJoint then
	RootJoint = Instance.new("Motor6D")
	RootJoint.Name = "RootJoint"
	RootJoint.Part0 = RootPart
	RootJoint.Part1 = Torso
	RootJoint.C0 = CFrame.new()
	RootJoint.C1 = CFrame.new()
	RootJoint.Parent = RootPart
end

local function getOrCreateJoint(parent, names, part0, part1)
	for _, name in ipairs(names) do
		local joint = parent:FindFirstChild(name)
		if joint and (joint:IsA("Motor6D") or joint:IsA("Weld") or joint:IsA("WeldConstraint")) then
			return joint
		end
	end

	local joint = Instance.new("Motor6D")
	joint.Name = names[1]
	joint.Part0 = part0
	joint.Part1 = part1
	joint.C0 = CFrame.new()
	joint.C1 = CFrame.new()
	joint.Parent = parent
	return joint
end

local Neck = getOrCreateJoint(Torso, {"Neck"}, Torso, Head)
local RightShoulder = getOrCreateJoint(Torso, {"Right Shoulder", "RightShoulder"}, Torso, RightArm)
local LeftShoulder = getOrCreateJoint(Torso, {"Left Shoulder", "LeftShoulder"}, Torso, LeftArm)
local RightHip = getOrCreateJoint(Torso, {"Right Hip", "RightHip"}, Torso, RightLeg)
local LeftHip = getOrCreateJoint(Torso, {"Left Hip", "LeftHip"}, Torso, LeftLeg)

local ShieldPart = CreatePart(false,3,RootPart,"ForceField",0,1,Color3.new(1,1,1),"Shieldlol",Vector3.new(4,1,2),false)
ShieldPart.CastShadow = false
ShieldPart.CanCollide = false
ShieldPart.CanTouch = false
ShieldPart.CanQuery = false
local Shield = Instance.new("SpecialMesh",ShieldPart)
Shield.MeshType = "Sphere"
Shield.Scale = Vector3.new(4, 16, 8)
local ShieldWeld = weldBetween(RootPart,ShieldPart)

local ROOTC0 = CF(0, 0, 0) * ANGLES(RAD(-90), RAD(0), RAD(180))
local NECKC0 = CF(0, 1, 0) * ANGLES(RAD(-90), RAD(0), RAD(180))
local RIGHTSHOULDERC0 = CF(-0.5, 0, 0) * ANGLES(RAD(0), RAD(90), RAD(0))
local LEFTSHOULDERC0 = CF(0.5, 0, 0) * ANGLES(RAD(0), RAD(-90), RAD(0))
local Torsovelocity = (RootPart.Velocity * Vector3.new(1,0,1)).Magnitude 
local rc0 = CFrame.new() * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(180))
local nc0 = CFrame.new(0,1,0) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(180))
local rscp = CFrame.new(-.5,0,0) * CFrame.Angles(math.rad(0),math.rad(90),math.rad(0))
local lscp = CFrame.new(.5,0,0) * CFrame.Angles(math.rad(0),math.rad(-90),math.rad(0))

hc0,lac0,rac0,llc0,rlc0,sine,animspeed = cn2(0,1.5,0),cn2(-1.5,0,0),cn2(1.5,0,0),cn2(-0.5,-2,0),cn2(0.5,-2,0),0,1/4
hoffset,toffset,laoffset,raoffset,lloffset,rloffset,gunoffset = hc0,cn(),lac0,rac0,llc0,rlc0,cn2(-0.365001678,-2.11000013,-0.125)*euler(rad(90),rad(180),0)

eee = Instance.new("Sound",RootPart)
eee.Volume = 10
eee.PlaybackSpeed = 1
eee.Pitch = 1
eee.SoundId = "rbxassetid://1841425036"
eee:Play()
eee.Name = randomstring()
eee.Looped = true
eee.RollOffMode = "LinearSquare"
eee.RollOffMaxDistance = 200
eee.RollOffMinDistance = 10
eee.TimePosition = 1
sick = eee
PlaybackLoudness = eee.PlaybackLoudness

local taunt = Instance.new("StringValue")
taunt.Value = "None"
local TauntRemote = Instance.new("BindableEvent")
TauntRemote.Event:connect(function(Taunt, Audio)
taunt.Value = Taunt
eee.SoundId = "rbxassetid://"..Audio
end)

local NAMEMODE2 = Instance.new("BillboardGui",Effects)
NAMEMODE2.AlwaysOnTop = false
NAMEMODE2.Size = UDim2.new(7,35,3,15)
NAMEMODE2.StudsOffset = Vector3.new(0,1.8,0)
NAMEMODE2.MaxDistance = 10000
NAMEMODE2.Adornee = Head
NAMEMODE2.Name = "Name2"
NAMEMODE2.ResetOnSpawn = false
local NAMEMODE = Instance.new("TextLabel",NAMEMODE2)
NAMEMODE.BackgroundTransparency = 1
NAMEMODE.TextScaled = true
NAMEMODE.BorderSizePixel = 0
NAMEMODE.TextSize = 35
NAMEMODE.TextStrokeTransparency = 0
NAMEMODE.Size = UDim2.new(1,0,0.5,0)
NAMEMODE.Parent = NAMEMODE2

coroutine.resume(coroutine.create(function()
while true do
task.wait()
if not alreadyfixing and NAMEMODE:IsDescendantOf(game) then
NAMEMODE.TextColor3 = Gunneon and Gunneon.Color or Color3.new(1,1,1)
NAMEMODE.Rotation = MRANDOM(-5,5)
NAMEMODE.Position = UDim2.new(math.random(-.4,.4),math.random(-5,5),.05,math.random(-5,5))
if taunt.Value == "None" or taunt.Value == "taunt" or taunt.Value == "taunt2" or taunt.Value == "Fave" or taunt.Value == "Krump" or taunt.Value == "Sit" then
NAMEMODE.Text = Texting3[MRANDOM(1, #Texting3)]
elseif taunt.Value == "GOD" then
NAMEMODE.Text = Texting5[MRANDOM(1, #Texting5)]
elseif taunt.Value == "Superior" then
NAMEMODE.Text = Texting6[MRANDOM(1, #Texting6)]
elseif taunt.Value == "KickGod" then
NAMEMODE.Text = Texting7[MRANDOM(1, #Texting7)]
elseif taunt.Value == "iNSaNiTY" then
NAMEMODE.Text = Texting8[MRANDOM(1, #Texting8)]
elseif taunt.Value == "Err0r" then
NAMEMODE.Text = Texting9[MRANDOM(1, #Texting9)]
elseif taunt.Value == "Glitch" then
NAMEMODE.Text = Texting10[MRANDOM(1, #Texting10)]
elseif taunt.Value == "Fallen" then
NAMEMODE.Text = Texting11[MRANDOM(1, #Texting11)]
elseif taunt.Value == "Berger" then
NAMEMODE.Text = Texting4[MRANDOM(1, #Texting4)]
elseif taunt.Value == "KingMan" then
NAMEMODE.Text = Texting12[MRANDOM(1, #Texting12)]
elseif taunt.Value == "Lost" then
NAMEMODE.Text = "Lost"
elseif taunt.Value == "Toxic" then
NAMEMODE.Text = "Toxic"
end
end
end
end))

if lplr.Name == USERNAME or true then
local gui = Instance.new("ScreenGui")
gui.Name = randomstring()
local fixcharbutton = Instance.new("TextButton",gui)
fixcharbutton.TextScaled = true
fixcharbutton.Name = randomstring()
fixcharbutton.BorderSizePixel = 0
fixcharbutton.BackgroundTransparency = .5
fixcharbutton.TextStrokeColor3 = shade
fixcharbutton.TextStrokeTransparency = 0
fixcharbutton.BackgroundColor3 = Color3.new(0.227451, 0.227451, 0.227451)
fixcharbutton.Size = UDim2.new(.25,0,0,36)
fixcharbutton.AnchorPoint = Vector2.new(1,1)
fixcharbutton.Position = UDim2.new(.5,0,0,0)
coroutine.resume(coroutine.create(function()
while fixcharbutton.Parent ~= nil do
task.wait()
fixcharbutton.FontFace.Style = Style[MRANDOM(1,#Style)]
fixcharbutton.FontFace.Weight = Weight[MRANDOM(1,#Weight)]
fixcharbutton.Font = FONTS[MRANDOM(1, #FONTS)]
fixcharbutton.Text = Texting1[MRANDOM(1, #Texting1)]
end
end))
local exitbutton = Instance.new("TextButton",gui)
exitbutton.TextScaled = true
exitbutton.Name = randomstring()
exitbutton.BorderSizePixel = 0
exitbutton.BackgroundTransparency = .5
exitbutton.TextStrokeColor3 = shade
exitbutton.TextStrokeTransparency = 0
exitbutton.BackgroundColor3 = Color3.new(0.227451, 0.227451, 0.227451)
exitbutton.Size = UDim2.new(.25,0,0,36)
exitbutton.AnchorPoint = Vector2.new(0,1)
exitbutton.Position = UDim2.new(.5,0,0,0)
coroutine.resume(coroutine.create(function()
while exitbutton.Parent ~= nil do
task.wait()
exitbutton.FontFace.Style = Style[MRANDOM(1,#Style)]
exitbutton.FontFace.Weight = Weight[MRANDOM(1,#Weight)]
exitbutton.Font = FONTS[MRANDOM(1, #FONTS)]
exitbutton.Text = Texting2[MRANDOM(1, #Texting2)]
end
end))
local LCImage = Instance.new("ImageLabel",gui)
LCImage.AnchorPoint = Vector2.new(0,0.5)
LCImage.BackgroundColor3 = Color3.new(0.227451, 0.227451, 0.227451)
LCImage.BackgroundTransparency = 1
LCImage.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
LCImage.BorderSizePixel = 0
LCImage.Name = randomstring()
LCImage.Position = UDim2.new(.75,0,0,0)
LCImage.Size = UDim2.new(0,98,0,87)
LCImage.Image = "http://www.roblox.com/asset/?id=10199833198"
LCImage.Rotation = 0
gui.Parent = Player:FindFirstChildOfClass("PlayerGui") or Player:WaitForChild("PlayerGui", 10)
fixcharbutton.MouseButton1Click:Connect(function()
chatfunc("Cannot fix script.")
end)
exitbutton.MouseButton1Click:Connect(function()
Player:Kick("ciao")
end)
coroutine.resume(coroutine.create(function()
local noob = 0
repeat noob = noob + game:GetService("RunService").RenderStepped:Wait() until noob >= .1
while true do
if not alreadyfixing then
local neonColor = (Gunneon and Gunneon.Color) or Color3.new(1,1,1)
fixcharbutton.TextColor3 = neonColor
exitbutton.TextColor3 = neonColor
LCImage.ImageColor3 = neonColor
LCImage.Rotation = LCImage.Rotation + .5
end
task.wait()
end
end))
end

local ArtificialHB = Instance.new("BindableEvent")
ArtificialHB.Name = "ArtificialHB"
ArtificialHB.Parent = script

frame = 1/60
tf = 0
allowframeloss = false
tossremainder = false
lastframe = tick()
script.ArtificialHB:Fire()

game:GetService("RunService").Heartbeat:connect(function(s, p)
tf = tf + s
if tf >= frame then
if allowframeloss then
script.ArtificialHB:Fire()
lastframe = tick()
else
for i = 1, math.floor(tf / frame) do
script.ArtificialHB:Fire()
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

function Swait(NUMBER)
if NUMBER == 0 or NUMBER == nil then
ArtificialHB.Event:wait()
else
for i = 1, NUMBER do
ArtificialHB.Event:wait()
end
end
end
swait = Swait

coroutine.resume(coroutine.create(function()
while not stopeverything do
task.wait()
if not alreadyfixing then
BAW = Color3.new(co1,co1,0)
if co1 >= 250 then
cotof = false
elseif co1 <= 4 then
cotof = true
end
if cotof == true then
co1 = co1 + 1*3
elseif cotof == false then
co1 = co1 - 1*3
end
if taunt.Value == "None" then
Gunneon.Color = Color3.fromHSV((tick() % 15/15),1,1)
elseif taunt.Value == "iNSaNiTY" then
Gunneon.Color = Color3.fromRGB(math.random(0,255),math.random(0,255),math.random(0,255))
elseif taunt.Value == "Err0r" then
Gunneon.Color = Color3.fromRGB(0,math.clamp(eee.PlaybackLoudness-100,0,255),0)
elseif taunt.Value == "Glitch" then
Gunneon.Color = Color3.fromHSV(0,1,math.clamp((eee.PlaybackLoudness/300)-.5,0,1))
elseif taunt.Value == "Fallen" then
Gunneon.Color = Color3.fromRGB(math.clamp(eee.PlaybackLoudness-150,0,213),math.clamp(eee.PlaybackLoudness-150,0,115),math.clamp(eee.PlaybackLoudness-150,0,61))
elseif taunt.Value == "GOD" then
Gunneon.Color = Color3.fromRGB(math.clamp(eee.PlaybackLoudness-150,0,140),math.clamp(eee.PlaybackLoudness-150,0,91),math.clamp(eee.PlaybackLoudness-150,0,159))
elseif taunt.Value == "Superior" then
Gunneon.Color = Color3.fromHSV(0.644444, 1, math.clamp((eee.PlaybackLoudness/255)-.5,0,1))
elseif taunt.Value == "KickGod" then
Gunneon.Color = C3(math.min(1,eee.PlaybackLoudness/500),math.min(1,eee.PlaybackLoudness/500),math.min(1,eee.PlaybackLoudness/500))
elseif taunt.Value == "Berger" then
Gunneon.Color = Color3.fromRGB(0,math.clamp(eee.PlaybackLoudness-100,0,195),math.clamp(eee.PlaybackLoudness-100,0,195))
elseif taunt.Value == "KingMan" then
Gunneon.Color = BAW
elseif taunt.Value == "Toxic" then
Gunneon.Color = Color3.fromRGB(26, 136, 25)
elseif taunt.Value == "Lost" then
Gunneon.Color = Color3.fromRGB(118, 30, 32)
elseif taunt.Value == "taunt" then
Gunneon.Color = Color3.fromHSV(math.random(0,19)/20,1,1)
end
if not alreadyfixing then
Work.CurrentCamera.FieldOfView = 70 - eee.PlaybackLoudness/255
end
end
end
end))

function Clerp(A,B,C)
return A:Lerp(B,C < 1 and math.clamp(C*1,0,1) or 1)
end

function Effect(Table)
local TYPE = (Table.EffectType or "Sphere")
local SIZE = (Table.Size or Vector3.new(1,1,1))
local ENDSIZE = (Table.Size2 or Vector3.new())
local TRANSPARENCY = (Table.Transparency or 0)
local ENDTRANSPARENCY = (Table.Transparency2 or 1)
local CFRAME = (Table.CFrame or Torso.CFrame)
local MOVEDIRECTION = (Table.MoveToPos or nil)
local ROTATION1 = (Table.RotationX or 0)
local ROTATION2 = (Table.RotationY or 0)
local ROTATION3 = (Table.RotationZ or 0)
local MATERIAL = (Table.Material or "Neon")
local COLOR = (Table.Color or shade)
local hOK,sOK,vOK = Color3.toHSV(COLOR)
local RAINBOWPART = false
if sOK > .1 then
RAINBOWPART = true
end
local TIME = (Table.Time or 45)
local SOUNDID = (Table.SoundID or nil)
local SOUNDPITCH = (Table.SoundPitch or nil)
local SOUNDVOLUME = (Table.SoundVolume or nil)
local USEBOOMERANGMATH = (Table.UseBoomerangMath or false)
local BOOMERANG = (Table.Boomerang or 0)
local SIZEBOOMERANG = (Table.SizeBoomerang or 0)
coroutine.resume(coroutine.create(function()
local PLAYSSOUND = false
local SOUND = nil
local EFFECT = CreatePart(false,3,Effects,MATERIAL,0,TRANSPARENCY,shade,"Effect",Vector3.new(1,1,1),true)
if RAINBOWPART then
coroutine.resume(coroutine.create(function()
while EFFECT:IsDescendantOf(game) do
EFFECT.Color = (Gunneon and Gunneon.Color) or Color3.new(1,1,1)
task.wait()
end
end))
end
if SOUNDID ~= nil and SOUNDPITCH ~= nil and SOUNDVOLUME ~= nil then
PLAYSSOUND = true
SOUND = CreateSound(SOUNDID,EFFECT,SOUNDVOLUME,SOUNDPITCH,false)
end
EFFECT.Color = COLOR
local MSH = nil
if TYPE == "Sphere" then
MSH = CreateMesh("SpecialMesh",EFFECT,"Sphere","","",SIZE,Vector3.new())
elseif TYPE == "Block" or TYPE == "Box" then
MSH = Instance.new("BlockMesh",EFFECT)
MSH.Scale = SIZE
elseif TYPE == "Wave" then
MSH = CreateMesh("SpecialMesh",EFFECT,"FileMesh","20329976","",SIZE,Vector3.new(0,0,-SIZE.X/8))
elseif TYPE == "Ring" then
MSH = CreateMesh("SpecialMesh",EFFECT,"FileMesh","559831844","",Vector3.new(SIZE.X,SIZE.X,0.1),Vector3.new())
elseif TYPE == "Slash" then
MSH = CreateMesh("SpecialMesh",EFFECT,"FileMesh","662586858","",Vector3.new(SIZE.X/10,0,SIZE.X/10),Vector3.new())
elseif TYPE == "Round Slash" then
MSH = CreateMesh("SpecialMesh",EFFECT,"FileMesh","662585058","",Vector3.new(SIZE.X/10,0,SIZE.X/10),Vector3.new())
elseif TYPE == "Swirl" then
MSH = CreateMesh("SpecialMesh",EFFECT,"FileMesh","168892432","",SIZE,Vector3.new())
elseif TYPE == "Skull" then
MSH = CreateMesh("SpecialMesh",EFFECT,"FileMesh","4770583","",SIZE,Vector3.new())
elseif TYPE == "Crystal" then
MSH = CreateMesh("SpecialMesh",EFFECT,"FileMesh","9756362","",SIZE,Vector3.new())
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
if EFFECT.Transparency == 1 then
PLAYSSOUND = false
EFFECT:Destroy()
end
if PLAYSSOUND == false then
EFFECT:Destroy()
else
repeat task.wait() until EFFECT:FindFirstChildOfClass("Sound") == nil
EFFECT:Destroy()
end
end
end))
end

function Lightning(Part0,Part1,Timess,Offset,Color,Timer,sSize,eSize,Trans,Boomer,sBoomer,Trans2)
local magz = (Part0 - Part1).Magnitude
local Times = math.floor(math.clamp(magz/10,1,20))
local curpos = Part0
local trz = {-Offset, Offset}
for i = 1,Times do
local li = Instance.new("SkateboardPlatform",Effects)
li.Name = randomstring()
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
local trolpos = CFrame.new(curpos,Part1) * CFrame.new(0,0,magz/Times).p + Offzet
if Times == i then
local magz2 = (curpos - Part1).Magnitude
li.Size = Vector3.new(.1,.1,magz2)
li.CFrame = CFrame.new(curpos,Part1) * CFrame.new(0,0,-magz2/2)
else
li.CFrame = CFrame.new(curpos,trolpos) * CFrame.new(0,0,magz/Times/2)
end
curpos = li.CFrame * CFrame.new(0,0,magz/Times/2).p
li:Destroy()
Effect({Time = Timer,EffectType = "Box",Size = Vector3.new(sSize,sSize,li.Size.Z),Size2 = Vector3.new(eSize,eSize,li.Size.Z),Transparency = Trans,Transparency2 = Trans2 or 1,CFrame = li.CFrame,MoveToPos = nil,RotationX = nil,RotationY = nil,RotationZ = nil,Material = "Neon",Color = li.Color,SoundID = nil,SoundPitch = nil,SoundVolume = nil,UseBoomerangMath = Boomer,Boomerang = 0,SizeBoomerang = sBoomer})
swait()
end
end

function sphere(bonuspeed,type,pos,scale,value,color)
local type = type
local rng = Instance.new("SkateboardPlatform",Effects)
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
task.wait()
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
local rng = Instance.new("SkateboardPlatform",Effects)
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
local scaler2,scaler2b,scaler2c = 1,1,1
if type == "Add" then
scaler2,scaler2b,scaler2c = 1*value,1*value2,1*value3
elseif type == "Divide" then
scaler2,scaler2b,scaler2c = 1/value,1/value2,1/value3
end
coroutine.resume(coroutine.create(function()
for i = 0,10/bonuspeed,.1 do
task.wait()
if type == "Add" then
scaler2,scaler2b,scaler2c = scaler2 - .01*value/bonuspeed,scaler2b - .01*value/bonuspeed,scaler2c - .01*value/bonuspeed
elseif type == "Divide" then
scaler2,scaler2b,scaler2c = scaler2 - .01/value*bonuspeed,scaler2b - .01/value*bonuspeed,scaler2c - .01/value*bonuspeed
end
rng.Transparency = rng.Transparency + .01*bonuspeed
rngm.Scale = rngm.Scale + Vector3.new(scaler2*bonuspeed,scaler2b*bonuspeed,scaler2c*bonuspeed)
end
rng:Destroy()
end))
end

function PixelBlockX(bonuspeed,FastSpeed,type,pos,x1,y1,z1,value,color,outerpos)
local type = type
local rng = Instance.new("SkateboardPlatform",Effects)
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
task.wait()
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
local rng = Instance.new("SkateboardPlatform",Effects)
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
task.wait()
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
local rng = Instance.new("SkateboardPlatform",Effects)
rng.Anchored = true
rng.BrickColor = color
rng.CanCollide = false
rng.FormFactor = 3
rng.Name = "Ring"
rng.Material = "Neon"
rng.Size = Vector3.new(1,1,1)
rng.Transparency = (typeoftrans == "In" and 1 or 0)
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
local scaler2 = (type == "Add" and 1*value/10 or 1/value/10)
local randomrot = math.random(1,2)
coroutine.resume(coroutine.create(function()
for i = 0,10/bonuspeed,.1 do
task.wait()
if type == "Add" then
scaler2 = scaler2 - .01*value/bonuspeed/10
elseif type == "Divide" then
scaler2 = scaler2 - .01/value*bonuspeed/10
end
if rotenable == true then
rng.CFrame = rng.CFrame*CFrame.Angles(0,math.rad((randomrot == 1 and rotspeed or -rotspeed)*bonuspeed/2),0)
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

function EFFECT1(bonuspeed,FastSpeed,type,pos,x1,y1,z1,value,color,outerpos)
local type = type
local rng = Instance.new("SkateboardPlatform",Effects)
rng.Anchored = true
rng.Color = GUN.NeonParts.Color
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
local scaler2 = (type == "Add" and 1*value or 1/value)
local speeder = FastSpeed/10
coroutine.resume(coroutine.create(function()
for i = 0,10/bonuspeed,.1 do
task.wait()
if type == "Add" then
scaler2 = scaler2 - .01*value/bonuspeed
elseif type == "Divide" then
scaler2 = scaler2 - .01/value*bonuspeed
end
rng.Color = GUN.NeonParts.Color
speeder = speeder - .01*FastSpeed*bonuspeed/10
rng.CFrame = rng.CFrame + rng.CFrame.lookVector*speeder*bonuspeed
rng.Transparency = rng.Transparency + .01*bonuspeed
rngm.Scale = rngm.Scale - Vector3.new(scaler2*bonuspeed,scaler2*bonuspeed,scaler2*bonuspeed)
end
rng:Destroy()
end))
end

function mdmg(centerofeffect,range)
pcall(function()
for i,v in pairs(Work:GetDescendants()) do
if not v:IsDescendantOf(Character) and v:IsA("Humanoid") and v.RootPart and (v.RootPart.Position - centerofeffect).Magnitude <= range + v.RootPart.Size.Magnitude then
local deathp = Instance.new("SkateboardPlatform")
deathp.Anchored = true 
deathp.Transparency = 1
deathp.CanCollide = false
deathp.CFrame = v.RootPart.CFrame
local bruh = CreateSound(206082273,deathp,5,.75)
bruh.PlayOnRemove = true
deathp.Parent = Work
pcall(function()
game:GetService("Debris"):AddItem(deathp,0)
end)
if v:IsDescendantOf(game) and v.Parent ~= Work and v.Parent ~= Terrain then
v.RootPart:Destroy()
local maxparent = v
repeat maxparent = maxparent.Parent until maxparent.Parent == Work or maxparent.Parent == Terrain
maxparent:Destroy()
elseif v:IsDescendantOf(game) then
v.RootPart:Destroy()
v:Destroy()
end
end
end
end)
end

function Banish(Foe)
if Foe then
local loudness = eee.PlaybackLoudness
coroutine.resume(coroutine.create(function()
printbye("game."..Foe.Name)
Foe.Archivable = true
local MATERIALS = {"Glass","Neon"}
for _, c in pairs(Foe:GetDescendants()) do
if c:IsA("BasePart") then
if c.Name == "Torso" or c.Name == "Torso" or c == Foe.PrimaryPart then
CreateSound(340722848, c, 10, 1, false)
end
c.Anchored = true
c.Transparency = c.Transparency + 0.2
c.Material = MATERIALS[MRANDOM(1,2)]
c.Color = (Gunneon and Gunneon.Color) or Color3.new(1,1,1)
if c.ClassName == "MeshPart" then c.TextureID = "" end
if c:FindFirstChildOfClass("SpecialMesh") then c:FindFirstChildOfClass("SpecialMesh").TextureId = "" end
if c:FindFirstChildOfClass("Decal") then c:FindFirstChildOfClass("Decal"):remove() end
c.Name = "Banished"
c.CanCollide = false
else
c:remove()
end
end
local A = false
for i = 1, 35 do
A = not A
for _, c in pairs(Foe:GetDescendants()) do
if c:IsA("BasePart") then
c.Anchored = true
c.Material = MATERIALS[MRANDOM(1,2)]
for _ = 1, 50 do c.Color = (Gunneon and Gunneon.Color) or Color3.new(1,1,1) end
c.Transparency = c.Transparency + 0.8/35
for _ = 1, 3 do
game:GetService("TweenService"):Create(c,TweenInfo.new(.25,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,true),{CFrame = c.CFrame*CF(MRANDOM(-45,45)/45,MRANDOM(-45,45)/45,MRANDOM(-45,45)/45)}):Play()
end
end
end
task.wait()
end
Foe:remove()
end))
end
end

Work.ChildAdded:connect(function(instance)
for BANISH = 1, #TOBANISH do
if TOBANISH[BANISH] ~= nil then
if instance.Name == TOBANISH[BANISH] then
coroutine.resume(coroutine.create(function()
instance.Parent = game:GetService("ServerStorage")
printbye("game."..instance.Name)
end))
end
end
end
end)

function FireArc(Part,ToLocation,AmountOfTime,Height,DoesCourontine)
if DoesCourontine == false then
local Direction = CFrame.new(Part.Position,ToLocation)
local Distance = (Part.Position - ToLocation).magnitude
for i = 1,AmountOfTime do
task.wait()
Part.CFrame = Direction*CFrame.new(0,(AmountOfTime/200)+((AmountOfTime/Height)-((i*2)/Height)),-Distance/AmountOfTime)
Direction = Part.CFrame
end
elseif DoesCourontine == true then
coroutine.resume(coroutine.create(function()
local Direction = CFrame.new(Part.Position,ToLocation)
local Distance = (Part.Position - ToLocation).magnitude
for i = 1,AmountOfTime do
task.wait()
Part.CFrame = Direction*CFrame.new(0,(AmountOfTime/200)+((AmountOfTime/Height)-((i*2)/Height)),-Distance/AmountOfTime)
Direction = Part.CFrame
end
end))
end
end

function turnto(position)
RootPart.CFrame=CFrame.new(RootPart.CFrame.p,VT(position.X,RootPart.Position.Y,position.Z)) * CFrame.new(0, 0, 0)
end

function chatfunc(text)
local chat = coroutine.wrap(function()
local oldthing = Work:FindFirstChild("TalkingBillBoard")
if oldthing then oldthing:Destroy() end
local naeeym2 = Instance.new("BillboardGui",Work)
naeeym2.Size = UDim2.new(0,9999,2,0)
naeeym2.StudsOffset = Vector3.new(0,4.5,0)
naeeym2.Adornee = Head
naeeym2.Name = "TalkingBillBoard"
local tecks2 = Instance.new("TextLabel",naeeym2)
tecks2.BackgroundTransparency = 1
tecks2.BorderSizePixel = 0
tecks2.Text = ""
tecks2.Font = "Code"
tecks2.TextScaled = true
tecks2.TextStrokeTransparency = 0
coroutine.resume(coroutine.create(function()
while tecks2:IsDescendantOf(game) do
local hBRUH,sBRUH,vBRUH = Color3.toHSV(Gunneon.Color)
tecks2.TextColor3 = Color3.fromHSV(hBRUH,sBRUH,vBRUH / 1.5)
task.wait()
end
end))
tecks2.TextStrokeColor3 = shade
tecks2.Size = UDim2.new(1,0,1,0)
coroutine.resume(coroutine.create(function()
while naeeym2 ~= nil do
task.wait()
tecks2.Position = UDim2.new(0,math.random(-3,3),0,math.random(-3,3)) 
end
end))
for i = 1,string.len(text) do
CreateSound(9116154737,RootPart,10,.7)
task.wait(.025)
tecks2.Text = string.sub(text,1,i)
end
task.wait(1.20)
for i = 1,50 do
task.wait()
tecks2.Position = tecks2.Position - UDim2.new(0,math.random(-3,3),0,math.random(-3,3))
tecks2.Rotation = tecks2.Rotation + math.random(-2,2)
tecks2.TextStrokeTransparency = i/50
tecks2.TextTransparency = tecks2.TextStrokeTransparency
end
naeeym2:Destroy()
end)
chat()
end

if type(Player) ~= "table" then
Player.Chatted:Connect(chatfunc)
end

function printbye(Name)
local MESSAGES = {"Stay Out, ","That's Enough, ","Fall to the inevitable., ","Don't Tempt Fate., ","You are not to decide your fate, ","R.I.P, ","You are already dead, ","Your existance is not required, ","Don't dare to return, ","Why are you resisting, ","You cannot exist here, ","Why are you struggling, ","Your fate was already decided, ","Goodbye, ","Sad, ","I lack interest for your existance, ","You already died, "}
chatfunc(MESSAGES[MRANDOM(1,#MESSAGES)]..Name)	
end

function void(Pos,centerofeffect,range)
for i,v in pairs(game:GetDescendants()) do
if v:IsA("BasePart") and not v:IsA("Decal") and not v:IsA("Texture") and not v:IsDescendantOf(Character) and v ~= antivoid and not v:IsA("Terrain") and v and (v.Position - centerofeffect).Magnitude <= range + v.Size.Magnitude then
if v.Size.X > 200 and v.Size.X < 2050 and v.Size.Y > 1 and v.Size.Y < 75 and v.Size.Z > 200 and v.Size.Z < 2050 and v.CanCollide and not v:FindFirstChildOfClass("SpecialMesh") and not v:IsA("MeshPart") and v:IsA("Part") then
else
chatfunc("Voided:"..""..v.Name)
if v:IsDescendantOf(game) and not v:IsDescendantOf(Character) then
v.Archivable = true
table.insert(DedParts,v:Clone())
v.Archivable = false
end
v:BreakJoints()
if killa ~= "Nil" then
v.CFrame = CFrame.new(-999999,1000000,99999)
v.Anchored = true
v.Changed:Connect(function()
v.Anchored = true
v.CFrame = CFrame.new(-999999,1000000,99999) 
end)
else
v.Parent = nil
end
for _,b in pairs(DedParts) do
for _,v in pairs(b:GetChildren()) do
if not v:IsA("DataModelMesh") then v:Destroy() else v:ClearAllChildren() end
end
b.Name = randomstring()
b.Anchored = true
b.CanCollide = false
game:GetService("TweenService"):Create(b,TweenInfo.new(1,Enum.EasingStyle.Bounce),{Size = Vector3.new(0,0,0)}):Play()
Debris:AddItem(b,1.01)
b.Parent = Effects
DedParts = {}
end
end
end
end
end

function attackone()
attack = true
walkspeed = 5
turnto(Mouse.Hit.p)
for i = 0,0.5,0.05 do
task.wait()
RootJoint.C0 = Clerp(RootJoint.C0,rc0 * CFrame.new() * CFrame.Angles(math.rad(0),math.rad(0),math.rad(30)),1 / 3)
Neck.C0 = Clerp(Neck.C0,nc0 * CFrame.new() * CFrame.Angles(math.rad(15),math.rad(0),math.rad(-30)),1 / 3)
RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5,0.5,0) * CFrame.Angles(math.rad(90),math.rad(0),math.rad(30)) * rscp,1 / 3)
LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,0.5,0) * CFrame.Angles(math.rad(30),math.rad(0),math.rad(0)) * lscp,1 / 3)
RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-1,0) * CFrame.Angles(math.rad(-5),math.rad(80),math.rad(0)) * CFrame.Angles(math.rad(-4),math.rad(0),math.rad(0)),1 / 3)
LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1,0) * CFrame.Angles(math.rad(0),math.rad(-70),math.rad(0)) * CFrame.Angles(math.rad(-5),math.rad(0),math.rad(0)),1 / 3)
GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(0.05,-1,-0.15) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0)),1 / 2)
end
Effect({Time = 25,EffectType = "Box",Size = Vector3.new(),Size2 = Vector3.new(3,3,3),Transparency = 0,Transparency2 = 1,CFrame = Holetwo.CFrame,MoveToPos = nil,RotationX = math.random(-1,1),RotationY = math.random(-1,1),RotationZ = math.random(-1,1),Material = "Neon",Color = Color3.new(1,0,0),SoundID = 642890855,SoundPitch = .65,SoundVolume = 10,UseBoomerangMath = true,Boomerang = 0,SizeBoomerang = 50})
Effect({Time = 25,EffectType = "Box",Size = Vector3.new(),Size2 = Vector3.new(3,3,3),Transparency = 0,Transparency2 = 1,CFrame = Holetwo.CFrame,MoveToPos = nil,RotationX = math.random(-1,1),RotationY = math.random(-1,1),RotationZ = math.random(-1,1),Material = "Neon",Color = shade,SoundID = nil,SoundPitch = nil,SoundVolume = nil,UseBoomerangMath = true,Boomerang = 0,SizeBoomerang = 50})
for i = 0,2 do
Effect({Time = math.random(25,50),EffectType = "Round Slash",Size = Vector3.new(),Size2 = Vector3.new(.1,0,.1),Transparency = 0,Transparency2 = 1,CFrame = Holetwo.CFrame*CFrame.Angles(math.rad(math.random(0,360)),math.rad(math.random(0,360)),math.rad(math.random(0,360))),MoveToPos = nil,RotationX = math.random(-1,1),RotationY = math.random(-1,1),RotationZ = math.random(-1,1),Material = "Neon",Color = Color3.new(1,0,0),SoundID = nil,SoundPitch = nil,SoundVolume = nil,UseBoomerangMath = true,Boomerang = 0,SizeBoomerang = 15})
Effect({Time = math.random(25,50),EffectType = "Round Slash",Size = Vector3.new(),Size2 = Vector3.new(.1,0,.1),Transparency = 0,Transparency2 = 1,CFrame = Holetwo.CFrame*CFrame.Angles(math.rad(math.random(0,360)),math.rad(math.random(0,360)),math.rad(math.random(0,360))),MoveToPos = nil,RotationX = math.random(-1,1),RotationY = math.random(-1,1),RotationZ = math.random(-1,1),Material = "Neon",Color = shade,SoundID = nil,SoundPitch = nil,SoundVolume = nil,UseBoomerangMath = true,Boomerang = 0,SizeBoomerang = 15})
end
local DISTANCE = (Holetwo.Position - Mouse.Hit.p).Magnitude
local killbeam = CreatePart(false,3,Effects,"Neon",0,0,shade,"Kill Beam",Vector3.new(1,DISTANCE,1))
killbeam.CFrame = CFrame.new(Holetwo.Position,Mouse.Hit.p) * CFrame.new(0,0,-DISTANCE/2) * CFrame.Angles(math.rad(90),math.rad(0),math.rad(0))
MakeForm(killbeam,"Cyl")
killbeam.Touched:Connect(function(victim)
if voidy == false and banishing == false then
mdmg(victim.Position,5)
elseif voidy == true and banishing == false then
voidlc(victim.Position,5)
elseif banishing == true and voidy == false then
local HIT,POS = CastProperRay(Hole.Position, Mouse.Hit.p, 1000, Character)
if HIT ~= nil and HIT.Parent ~= Work and HIT.Parent.ClassName ~= "Folder" then
Banish(HIT.Parent)
end
elseif voidy == false and banishing == false and killa == "Nil" then
void(Mouse.Hit.p)
end
end)
coroutine.resume(coroutine.create(function()
for i = 1,25 do
task.wait()
killbeam.Transparency = i/25
end
killbeam:Destroy()
end))
for i = 1,4 do
coroutine.resume(coroutine.create(function()
Lightning(Holetwo.Position,Mouse.Hit.p,15,3.5,Color3.new(0,0,1),25,0,1,0,true,55)
end))
end
coroutine.resume(coroutine.create(function()
if voidy == false and banishing == false then
Lightning(Holetwo.Position,Mouse.Hit.p,15,3.5,Color3.new(0,0,1),25,0,1,0,true,55)
Effect({Time = 25,EffectType = "Box",Size = Vector3.new(),Size2 = Vector3.new(3,3,3),Transparency = 0,Transparency2 = 1,CFrame = Mouse.Hit,MoveToPos = nil,RotationX = math.random(-1,1),RotationY = math.random(-1,1),RotationZ = math.random(-1,1),Material = "Neon",Color = Color3.new(1,0,0),SoundID = 821439273,SoundPitch = .8,SoundVolume = 10,UseBoomerangMath = true,Boomerang = 0,SizeBoomerang = 50})
Effect({Time = 25,EffectType = "Box",Size = Vector3.new(),Size2 = Vector3.new(3,3,3),Transparency = 0,Transparency2 = 1,CFrame = Mouse.Hit,MoveToPos = nil,RotationX = math.random(-1,1),RotationY = math.random(-1,1),RotationZ = math.random(-1,1),Material = "Neon",Color = shade,SoundID = nil,SoundPitch = nil,SoundVolume = nil,UseBoomerangMath = true,Boomerang = 0,SizeBoomerang = 50})
for i = 0,2 do
Effect({Time = math.random(25,50),EffectType = "Round Slash",Size = Vector3.new(),Size2 = Vector3.new(.1,0,.1),Transparency = 0,Transparency2 = 1,CFrame = Mouse.Hit*CFrame.Angles(math.rad(math.random(0,360)),math.rad(math.random(0,360)),math.rad(math.random(0,360))),MoveToPos = nil,RotationX = math.random(-1,1),RotationY = math.random(-1,1),RotationZ = math.random(-1,1),Material = "Neon",Color = Color3.new(1,0,0),SoundID = nil,SoundPitch = nil,SoundVolume = nil,UseBoomerangMath = true,Boomerang = 0,SizeBoomerang = 15})
Effect({Time = math.random(25,50),EffectType = "Round Slash",Size = Vector3.new(),Size2 = Vector3.new(.1,0,.1),Transparency = 0,Transparency2 = 1,CFrame = Mouse.Hit*CFrame.Angles(math.rad(math.random(0,360)),math.rad(math.random(0,360)),math.rad(math.random(0,360))),MoveToPos = nil,RotationX = math.random(-1,1),RotationY = math.random(-1,1),RotationZ = math.random(-1,1),Material = "Neon",Color = shade,SoundID = nil,SoundPitch = nil,SoundVolume = nil,UseBoomerangMath = true,Boomerang = 0,SizeBoomerang = 15})
end
mdmg(Mouse.Hit.p,10)
elseif voidy == true and banishing == false then
voidlc(Mouse.Hit.p,10)
elseif banishing == true and voidy == false then
local HIT,POS = CastProperRay(Hole.Position, Mouse.Hit.p, 1000, Character)
if HIT ~= nil and HIT.Parent ~= Work and HIT.Parent.ClassName ~= "Folder" then
Banish(HIT.Parent)
end
for i = 0,2 do
for a = 0, 14 do
EFFECT1(3,math.random(4,8),"Add",Mouse.Hit*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),3,3,3,0.03,Gunneon.Color,0)
end
end
elseif voidy == false and banishing == false and killa == "Nil" then
void(Mouse.Hit.p)
end
end))
for i = 0,0.5,0.075 do
task.wait()
RootJoint.C0 = Clerp(RootJoint.C0,rc0 * CFrame.new() * CFrame.Angles(math.rad(-5),math.rad(0),math.rad(60)),1 / 3)
Neck.C0 = Clerp(Neck.C0,nc0 * CFrame.new() * CFrame.Angles(math.rad(10),math.rad(0),math.rad(-60)),1 / 3)
RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5,0.5,0) * CFrame.Angles(math.rad(160),math.rad(-20),math.rad(60)) * rscp,1 / 3)
LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,0.5,0) * CFrame.Angles(math.rad(40),math.rad(5),math.rad(5)) * lscp,1 / 3)
RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-1,0) * CFrame.Angles(math.rad(-5),math.rad(75),math.rad(0)) * CFrame.Angles(math.rad(-4),math.rad(0),math.rad(0)),1 / 3)
LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1,0) * CFrame.Angles(math.rad(0),math.rad(-65),math.rad(0)) * CFrame.Angles(math.rad(-5),math.rad(0),math.rad(0)),1 / 3)
GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(0.05,-1,-0.15) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0)),1 / 2)
end
attack = false
end

function attacktwo()
attack = true
walkspeed = 0
turnto(Mouse.Hit.p)
local gBullet = CreatePart(false,3,Effects,"Neon",0,0,Gunneon.Color,"Bully",Vector3.new())
MakeForm(gBullet,"Ball")
gBullet.CFrame = LeftArm.CFrame*CFrame.new(0,-1.5,0)
CreateSound(2785493,gBullet,2,0.8)
for i = 0,1.25,0.025 do
task.wait()
Effect({Time = math.random(35,55),EffectType = "Sphere",Size = Vector3.new(0.5,0.5,0.5),Size2 = Vector3.new(1,1,1),Transparency = 0,Transparency2 = 1,CFrame = LeftArm.CFrame*CFrame.new(0,-1.5,0),MoveToPos = LeftArm.CFrame*CFrame.new(0,-1.5,0)*CFrame.new(math.random(-10,10),math.random(-10,10),math.random(-10,10)).Position,RotationX = nil,RotationY = nil,RotationZ = nil,Material = "Neon",Color = Gunneon.Color,SoundID = nil,SoundPitch = nil,SoundVolume = nil,UseBoomerangMath = true,Boomerang = 50,SizeBoomerang = 50})
gBullet.Size = gBullet.Size * 1.085
gBullet.CFrame = LeftArm.CFrame*CFrame.new(0,-1.5,0)
end
local bullets = {}
for i = 1,math.random(27,41) do
task.wait()
local Bullet = CreatePart(false,3,Effects,"Neon",0,0,Gunneon.Color,"BulletFuck",Vector3.new(0.6,0.6,0.6))
MakeForm(Bullet,"Ball")
Bullet.CFrame = gBullet.CFrame
table.insert(bullets,Bullet)
end
for b = 1,#bullets do
task.wait()
local part,pos = rayCast(LeftArm.CFrame*CFrame.new(0,-1.5,0).Position,((Mouse.Hit.p+Vector3.new(math.random(-15,15),math.random(-7,7),math.random(-15,15))) - LeftArm.CFrame*CFrame.new(0,-1.5,0).Position),500,Character)
coroutine.resume(coroutine.create(function()
FireArc(bullets[b],pos,math.random(17,31),math.random(9,15),false)
if warning == false then swait(math.random(55,65)) else task.wait(math.random(1.55,1.65)) end
for i = 0,10 do
task.wait()
bullets[b].Transparency = bullets[b].Transparency + 0.1
end
if voidy == false and banishing == false then
mdmg(bullets[b].Position,10)
elseif voidy == true and banishing == false then
voidlc(bullets[b].Position,10)
elseif banishing == true and voidy == false then
local HIT,POS = CastProperRay(RightArm.Position, bullets[b].Position, 1000, Character)
if HIT ~= nil and HIT.Parent ~= Work and HIT.Parent.ClassName ~= "Folder" then
Banish(HIT.Parent)
end
elseif voidy == false and banishing == false and killa == "Nil" then
void(Mouse.Hit.p)
end
local EEEBRUHEEE = CreateSound(168513088,bullets[b],3.5,1.1,false)
bullets[b].Transparency = 1
EEEBRUHEEE.Ended:Connect(function() bullets[b]:Destroy() end)
end))
end
for i = 0,10 do task.wait() gBullet.Transparency = gBullet.Transparency + 0.1 end
gBullet:Destroy()
attack = false
end

function hedshoot()
attack = true
walkspeed = 5
CreateSound(235097614,RootPart,6,1.5,false)
for i = 0,0.5,0.05 do
task.wait()
RootJoint.C0 = Clerp(RootJoint.C0,rc0 * CFrame.new() * CFrame.Angles(math.rad(0),math.rad(0),math.rad(-60)),1 / 3)
Neck.C0 = Clerp(Neck.C0,nc0 * CFrame.new() * CFrame.Angles(math.rad(0),math.rad(0),math.rad(60)),1 / 3)
RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.25,0.5,-.25) * CFrame.Angles(math.rad(90),math.rad(0),math.rad(-60)) * rscp,1 / 3)
LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.25,0.5,-.25) * CFrame.Angles(math.rad(95),math.rad(0),math.rad(10)) * lscp,1 / 3)
RightHip.C0 = Clerp(RightHip.C0,CFrame.new(1,-1,0) * CFrame.Angles(math.rad(-5),math.rad(75),math.rad(0)) * CFrame.Angles(math.rad(-4),math.rad(0),math.rad(0)),1 / 3)
LeftHip.C0 = Clerp(LeftHip.C0,CFrame.new(-1,-1,0) * CFrame.Angles(math.rad(0),math.rad(-65),math.rad(0)) * CFrame.Angles(math.rad(-5),math.rad(0),math.rad(0)),1 / 3)
GunJoint.C0 = Clerp(GunJoint.C0,CFrame.new(0,-.5,0) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0)),1 / 2)
end
if voidy == false and banishing == false then
mdmg(RootPart.Position,14)
elseif voidy == true and banishing == false then
voidlc(RootPart.Position,14)
elseif banishing == true and voidy == false then
local HIT,POS = CastProperRay(RootPart.Position, Holetwo.Position, 1000, Character)
if HIT ~= nil and HIT.Parent ~= Work and HIT.Parent.ClassName ~= "Folder" then
Banish(HIT.Parent)
end
elseif voidy == false and banishing == false and killa == "Nil" then
void(Mouse.Hit.p)
end
for i = 1,4 do
RootPart.CFrame = RootPart.CFrame * CFrame.new(0,0,-25)
if voidy == false and banishing == false then
mdmg(RootPart.Position,14)
elseif voidy == true and banishing == false then
voidlc(RootPart.Position,14)
elseif banishing == true and voidy == false then
local HIT,POS = CastProperRay(RootPart.Position, Holetwo.Position, 1000, Character)
if HIT ~= nil and HIT.Parent ~= Work and HIT.Parent.ClassName ~= "Folder" then
Banish(HIT.Parent)
end
elseif voidy == false and banishing == false and killa == "Nil" then
void(Mouse.Hit.p)
end
end
attack = false
end

function painlessrain()
attack = true
walkspeed = 5
coroutine.wrap(function()
for i = 0,2 do wait(12) CreateSound(199145095,GUN,6,1) end
end)()
for i = 0,2,0.1 do
task.wait()
RootJoint.C0 = Clerp(RootJoint.C0,rc0 * CFrame.new() * CFrame.Angles(math.rad(0),math.rad(0),math.rad(-10)),1 / 3)
Neck.C0 = Clerp(Neck.C0,nc0 * CFrame.new(0,0,0) * CFrame.Angles(math.rad(25),math.rad(0),math.rad(-20)),1 / 3)
RightShoulder.C0 = Clerp(RightShoulder.C0,CFrame.new(1.5,0.5,0) * CFrame.Angles(math.rad(35),math.rad(-35),math.rad(20)) * rscp,1 / 3)
LeftShoulder.C0 = Clerp(LeftShoulder.C0,CFrame.new(-1.5,0.5,0) * CFrame.Angles(math.rad(-20),math.rad(-5),math.rad(-10)) * lscp,1 / 3)
end
attack = false
end

function SingularityBeam()
attack = true
walkspeed = 0
turnto(Mouse.Hit.p)
for i = 0,0.5,0.05 do
task.wait()
RootJoint.C0 = Clerp(RootJoint.C0,rc0 * CFrame.new() * CFrame.Angles(math.rad(0),math.rad(0),math.rad(-60)),1 / 3)
Neck.C0 = Clerp(Neck.C0,nc0 * CFrame.new() * CFrame.Angles(math.rad(0),math.rad(0),math.rad(60)),1 / 3)
end
local HoleDist = (Hole.Position - Holetwo.Position).Magnitude
local chargebeam = CreatePart(false,3,Effects,"Neon",0,0,shade,"Charge Beam",Vector3.new(.125,HoleDist,.125),false)
MakeForm(chargebeam,"Cyl")
chargebeam.CFrame = CFrame.new(Hole.Position,Holetwo.Position) * CFrame.new(0,0,-HoleDist/2) * CFrame.Angles(math.rad(90),math.rad(0),math.rad(0))
weldBetween(GUN.Joint,chargebeam)
local chargeball = CreatePart(false,3,Effects,"Neon",0,0,shade,"Charge Ball",Vector3.new(.5,.5,.5),false)
chargeball.Shape = "Ball"
chargeball.CFrame = Holetwo.CFrame
weldBetween(Holetwo,chargeball)
CreateSound(342793847,Hole,10,1,false)
local bigball = game:GetService("TweenService"):Create(chargeball,TweenInfo.new(3.86,Enum.EasingStyle.Sine),{Size = Vector3.new(2.5,2.5,2.5)})
bigball:Play()
bigball.Completed:Wait()
chargebeam:Destroy()
local KillDist = (Holetwo.Position - Mouse.Hit.p).Magnitude
local killbeam = CreatePart(false,3,Effects,"Neon",0,0,shade,"Kill Beam",Vector3.new(1.25,KillDist,1.25))
MakeForm(killbeam,"Cyl")
killbeam.Touched:Connect(function(victim)
if voidy == false and banishing == false then
mdmg(victim.Position,5)
elseif voidy == true and banishing == false then
voidlc(victim.Position,5)
elseif banishing == true and voidy == false then
local HIT,POS = CastProperRay(Hole.Position, Mouse.Hit.p, 1000, Character)
if HIT ~= nil and HIT.Parent ~= Work and HIT.Parent.ClassName ~= "Folder" then
Banish(HIT.Parent)
end
end
end)
CreateSound(138677306,Holetwo,10,1,false)
swait(150)
chargeball:Destroy()
killbeam:Destroy()
attack = false
end

function voidlc(AttackPosition)
pcall(function()
local IgnoreChar,DeadParts = {},{}
local SoundHolder = Instance.new("SkateboardPlatform",nil,{CFrame = RightArm.CFrame})
Instance.new("Sound",SoundHolder,{SoundId = "rbxassetid://642890855",PlaybackSpeed = .65,Volume = 10,PlayOnRemove = true,Playing = true})
SoundHolder.Parent = game:GetService(Services[math.random(1,#Services)])
SoundHolder:Destroy()

for i,v in pairs(Character:GetDescendants()) do
if v:IsA("BasePart") or v:IsA("MeshPart") or v:IsA("UnionOperation") then table.insert(IgnoreChar,v) end
end

local Parts = Work:FindPartsInRegion3WithIgnoreList(Region3.new(AttackPosition-Vector3.new(4,4,4),AttackPosition+Vector3.new(4,4,4)),IgnoreChar,100)
local PartKiller = Instance.new("ViewportFrame",Work,{Name = randomstring()})
PartKiller:Destroy()
end)
end

function fixlighting()
local bruh = Lightin:GetDescendants()
for i,dude in pairs(bruh) do
if dude:IsA("BloomEffect") then dude.Intensity = 0 dude.Size = 0 dude.Threshold = 0 end
if dude:IsA("ColorCorrectionEffect") then dude.Enabled = false end
if dude:IsA("BlurEffect") then dude.Size = 0 end
end
Lightin.TimeOfDay = "06:07:19"
Lightin.FogEnd = 100000
Lightin.FogStart = 0
Lightin.Ambient = Color3.fromRGB(138,138,138)
Lightin.Brightness = 2
end

function GroundShards()
local Size,StudsAway = Vector3.new(2.5,9,2.5),-4
attack = true
for i = 1,50 do
local Shard = Instance.new("SkateboardPlatform",Effects)
Shard.Size = Size
Shard.CFrame = RootPart.CFrame*CFrame.new(math.random(-2,2)/4,-3-Size.Y/2,StudsAway+math.random(-2,2)/4)*CFrame.fromEulerAnglesXYZ(100,math.random(0,180),.4)
Shard.Anchored = true
Shard.Color = Color3.fromRGB(17,17,17)
Shard.Material = "Glass"
Shard.CanCollide = false
local ShardMesh = Instance.new("SpecialMesh",Shard)
ShardMesh.MeshId = "rbxassetid://9756362"
ShardMesh.Scale = Size
game:GetService("Debris"):AddItem(Shard,3)
game:GetService("TweenService"):Create(Shard,TweenInfo.new(.3),{CFrame = Shard.CFrame*CFrame.new(0,Size.Y,0)}):Play()
StudsAway = StudsAway-2
Size = Vector3.new(2.5,9,2.5)*(1+i/10)
task.wait()
end
attack = false
end

function destroycannons()
coroutine.resume(coroutine.create(function()
attack = true
walkspeed = 0
CreateSound(3663144448,Head,10,1,false)
chatfunc("Die!")
delay(2.5,function() end)
CreateSound(907330011,Head,10,0.9)
chatfunc("You, Have Fallen.")
attack = false
end))
end

function killtoggle()
if killa == "mdmg" then
voidy = false
killa = "Banish"
vpkill = false
chatfunc("KillType Set To: Banish")
banishing = true
elseif killa == "Banish" then
voidy = true
killa = "Void"
vpkill = false
chatfunc("KillType Set To: Void")
banishing = false
elseif killa == "Void" then
voidy = false
chatfunc("KillType Set To: Nil")
banishing = false
vpkill = false
killa = "Nil"
elseif killa == "Nil" then
voidy = false
chatfunc("KillType Set To: mdmg")
banishing = false
vpkill = false
killa = "mdmg"
end
end

function ShakeCam(Length,Intensity)
coroutine.resume(coroutine.create(function()
local intensity = 1*Intensity
for i = 0, Length, 0.1 do
game:GetService("RunService").RenderStepped:Wait()
intensity = intensity - 0.05*Intensity/Length
Humanoid.CameraOffset = Vec3(math.rad(math.random(-intensity, intensity)), math.rad(math.random(-intensity, intensity)), math.rad(math.random(-intensity, intensity)))
end
Humanoid.CameraOffset = Vec3(0, 0, 0)
end))
end

function LightningBomb()
attack = true
walkspeed = 0
local LightningBomb = CreatePart(false,3,Effects,"Neon",0,0,((Gunneon and Gunneon.Color) or Color3.new(1,1,1)),"Bomb",Vector3.new(1,1,1),true)
MakeForm(LightningBomb,"Ball")
for i=0, 1.5, 0.1 / Animation_Speed do
task.wait()
RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CFrame.new(0,0,0) * CFrame.Angles(math.rad(4),math.rad(0),math.rad(0)),.7/3)
end
repeat task.wait() LightningBomb.Size = Vector3.new(LightningBomb.Size.X +.25,LightningBomb.Size.Y +.25,LightningBomb.Size.Z +.25) LightningBomb.CFrame = Holetwo.CFrame LightningBomb.Color = Gunneon.Color until LightningBomb.Size == Vector3.new(20,20,20)
local tomouse = game:GetService("TweenService"):Create(LightningBomb,TweenInfo.new(2.86,Enum.EasingStyle.Sine),{Position = Mouse.Hit.p})
tomouse:Play()
tomouse.Completed:Wait()
mdmg(LightningBomb.Position,LightningBomb.Size.Z)
Debris:AddItem(LightningBomb,2.2)
attack = false
end

antivoid = Instance.new("SkateboardPlatform")
antivoid.Name = randomstring()
antivoid.Size = Vector3.new(400,10,400)
antivoid.Anchored = true
antivoid.Transparency = 1
antivoid.Position = Vector3.new(RootPart.Position.X,Work.FallenPartsDestroyHeight+5,RootPart.Position.Z)
antivoid.Parent = Work

function attackonev2()
attack = true
walkspeed = 0
for i=0, .5, 0.1 / Animation_Speed do
task.wait()
turnto(Mouse.Hit.p)
end
local aimassist = IT("SkateboardPlatform",Effects) aimassist.Transparency = 1 aimassist.Anchored = true aimassist.Size = Vector3.new(3,3,3) aimassist.CanCollide = true
aimassist.Position = Mouse.Hit.Position + Vector3.new(0,2.5,0)
void(Mouse.Hit.p,Mouse.Hit.p,.0025)
Debris:AddItem(aimassist,1.01)
attack = false
end

function voidkill()
attack = true
walkspeed = 0
for i=0, .5, 0.1 / Animation_Speed do task.wait() end
local aimassist = IT("SkateboardPlatform",Effects) aimassist.Anchored = true aimassist.Size = Vector3.new(0,0,0) aimassist.CanCollide = false
local appear = game:GetService("TweenService"):Create(aimassist,TweenInfo.new(.5,Enum.EasingStyle.Bounce),{Size = Vector3.new(3.5,3.5,3.5)}) aimassist.CFrame = RightArm.CFrame + Vector3.new(0,0,.45)
appear:Play()
appear.Completed:Wait()
void(Mouse.Hit.p,aimassist.Position,.005)
game:GetService("TweenService"):Create(aimassist,TweenInfo.new(.5,Enum.EasingStyle.Bounce),{Size = Vector3.new(0,0,0)}):Play()
Debris:AddItem(aimassist,1)
attack = false
end

function New_SuperNova_Grenade()
attack = true
ShakeCam(14,12)
local earexploder9000 = CreateSound(177212413, Work, 10, 1, false)
for i=0, 11, 0.1 / Animation_Speed do task.wait() end
attack = false
earexploder9000:Destroy()
end

local FLYING = false
iyflyspeed = 1
function sFLY()
if not ISFLYING then
FLYING = false
else
local CONTROL = {F = 0,B = 0,L = 0,R = 0,Q = 0,E = 0}
local SPEED = 0			
local function FLY()
FLYING = true
BG = Instance.new('BodyGyro',RootPart)
BV = Instance.new('BodyVelocity',RootPart)
BG.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
BG.P = 1e4
BG.CFrame = RootPart.CFrame
BV.Velocity = Vector3.new()
BV.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
coroutine.resume(coroutine.create(function()
repeat
game:GetService("RunService").RenderStepped:Wait()
if not alreadyfixing then
if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0 then SPEED = 50 else SPEED = 0 end
BV.Velocity = ((Work.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((Work.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R,(CONTROL.F + CONTROL.B + CONTROL.Q + CONTROL.E) * .2,0).Position) - Work.CurrentCamera.CoordinateFrame.p)) * SPEED
BG.CFrame = Work.CurrentCamera.CoordinateFrame
end
until not FLYING
for _,v in pairs(RootPart:GetChildren()) do if v:IsA("BodyMover") then v:Destroy() end end
end))
end
local IYMouse = Player:GetMouse()
IYMouse.KeyDown:connect(function(KEY)
if KEY:lower() == 'w' then CONTROL.F = iyflyspeed elseif KEY:lower() == 's' then CONTROL.B = - iyflyspeed elseif KEY:lower() == 'a' then CONTROL.L = - iyflyspeed elseif KEY:lower() == 'd' then CONTROL.R = iyflyspeed elseif KEY:lower() == 'e' then CONTROL.Q = iyflyspeed*2 elseif KEY:lower() == 'q' then CONTROL.E = -iyflyspeed*2 end
end)
IYMouse.KeyUp:connect(function(KEY)
if KEY:lower() == 'w' then CONTROL.F = 0 elseif KEY:lower() == 's' then CONTROL.B = 0 elseif KEY:lower() == 'a' then CONTROL.L = 0 elseif KEY:lower() == 'd' then CONTROL.R = 0 elseif KEY:lower() == 'e' then CONTROL.Q = 0 elseif KEY:lower() == 'q' then CONTROL.E = 0 end
end)
FLY()
end
end

Mouse.Button1Down:Connect(function()
if attack == false and taunt.Value ~= "Krump" and taunt.Value ~= "Fave" and taunt.Value ~= "Sit" and taunt.Value ~= "Lost" then
attackone()
end
end)

Mouse.KeyDown:Connect(function(k)
k = k:lower()
if k == "z" and attack == false and taunt.Value ~= "Lost" then	
hedshoot()
elseif k == "z" and attack == false and taunt.Value == "Lost" then
New_SuperNova_Grenade()
elseif k == "x" and attack == false then
SingularityBeam()
elseif k == "c" and attack == false then
painlessrain()
elseif k == "v" and attack == false then
attacktwo()
elseif k == "q" and attack == false then
voidkill()
elseif k == "b" and attack == false then
LightningBomb()
elseif k == "n" and attack == false then
GroundShards()
elseif k == "k" and attack == false then
attackonev2()
elseif k == "e" and attack == false then
if taunt.Value ~= "taunt2" then TauntRemote:Fire("taunt2",1841599995) else TauntRemote:Fire("None",1841425036) end
elseif k == "j" then
Sheld = not Sheld
elseif k == "r" then
RootPart.CFrame = CFrame.new(0,25,0)
elseif k == "g" then
killtoggle()
elseif k == "f" then
ISFLYING = not ISFLYING
sFLY()
elseif k == "h" then
if taunt.Value ~= "taunt" then TauntRemote:Fire("taunt",1837418595) else TauntRemote:Fire("None",1841425036) end
elseif k == "l" then
fixlighting()
elseif k == "," then
destroycannons()
elseif k == "=" then
Lightin.ClockTime = (Lightin.ClockTime ~= 0 and 0 or 14)
elseif k == "-" then
TOBANISH = {}
elseif k == "1" and not attack and taunt.Value ~= "None" then
TauntRemote:Fire("None",1841425036)
elseif k == "m" and not attack and taunt.Value == "None" then
TauntRemote:Fire("Lost",9046526805)
elseif k == "2" and not attack and taunt.Value ~= "GOD" then
TauntRemote:Fire("GOD",9039290292)
elseif k == "3" and not attack and taunt.Value ~= "Superior" then
TauntRemote:Fire("Superior",1841374480)
elseif k == "4" and taunt.Value ~= "KickGod" then
TauntRemote:Fire("KickGod",9041936082)
elseif k == "5" and not attack and taunt.Value ~= "iNSaNiTY" then
TauntRemote:Fire("iNSaNiTY",1836812625)
elseif k == "6" and not attack then
TauntRemote:Fire("Err0r",1840963650)
elseif k == "7" and not attack then
TauntRemote:Fire("Glitch",1837087520)
elseif k == "8" and not attack then
TauntRemote:Fire("Fallen",9047679043)
elseif k == "9" and not attack then
TauntRemote:Fire("Berger",9045948785)
elseif k == "0" and not attack then
TauntRemote:Fire("KingMan",9040303465)
elseif k == "u" then
TauntRemote:Fire(taunt.Value ~= "Sit" and "Sit" or "None", 1842196220)
elseif k == "t" then
TauntRemote:Fire(taunt.Value ~= "Fave" and "Fave" or "None", 1839774719)
elseif k == "y" then
TauntRemote:Fire(taunt.Value ~= "Krump" and "Krump" or "None", 9048324220)
end
end)

while not stopeverything do
if not alreadyfixing then
Humanoid.HipHeight = 0
Humanoid.Sit = false
Humanoid.PlatformStand = ISFLYING
Humanoid.UseJumpPower = true
Humanoid.JumpPower = 50
Humanoid.BreakJointsOnDeath = false
Humanoid.MaxHealth = 99e99
Humanoid.Health = 99e99
sine = sine + 1
if Sheld == true then
ShieldPart.Transparency = 0
ShieldPart.Position = Torso.Position
ShieldPart.Orientation = Vector3.new(0,0,ShieldPart.Orientation.Z + 1)
else
ShieldPart.Transparency = 1
end
ShieldPart.Color = (Gunneon and Gunneon.Color) or Color3.new(1,1,1)
end
task.wait()
end