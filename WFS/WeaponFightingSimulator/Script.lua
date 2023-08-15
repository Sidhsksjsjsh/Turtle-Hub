-- This script I took the code directly from the game, some I took through roblox studio

-- I will add an auto tower feature that can attack enemies automatically . - Dev_Rivanda

_G.LuckyDraw = false
_G.ActiveOnline = false
_G.TowerTake = false
_G.AutoRound = false
_G.farmNearest = false
_G.farmHighest = false
_G.farmLowest = false
_G.autoCollect = false

local RemoveSoundSystem = false

local sinister = math.random(12)
local Tank = math.random(39)

local workspace = game:GetService("Workspace")

local plr = game.Players.LocalPlayer.Character.HumanoidRootPart
local char = game.Players.LocalPlayer.Character

function getHighest()
    local high = {}
    for i, v in pairs(game:GetService("Workspace").Fight.Chests:GetChildren()) do
        for a, b in pairs(game:GetService("Workspace").Fight.ClientChests:GetChildren()) do
            if v.Name == b.Name then
                table.insert(high,v.ChestHp.Value)
                table.sort(high, function(a,b) return a > b end)
            end
        end
    end


    for a, b in pairs(game:GetService("Workspace").Fight.Chests:GetChildren()) do
        if high[1] == b.ChestHp.Value then
            return b.Name
        end
    end    
end


function getLowest()
    local low = {}
    for i, v in pairs(game:GetService("Workspace").Fight.Chests:GetChildren()) do
        for a, b in pairs(game:GetService("Workspace").Fight.ClientChests:GetChildren()) do
            if v.Name == b.Name then
                table.insert(low,v.ChestHp.Value)
                table.sort(low, function(a,b) return a < b end)
            end
        end
    end


    for a, b in pairs(game:GetService("Workspace").Fight.Chests:GetChildren()) do
        if low[1] == b.ChestHp.Value then
            return b.Name
        end
    end    
end


function getNear()
    local near;
    local nearr = math.huge


    for i, v in pairs(game:GetService("Workspace").Fight.ClientChests:GetChildren()) do
        if (plr.Position - v.Root.Position).Magnitude < nearr then
            near = v
            nearr = (plr.Position - v.Root.Position).Magnitude
        end
    end


    return near
end

local function PathFind(ClientItem)
workspace.Gravity = 0


game:GetService('RunService').Stepped:Connect(function()
    if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
       
    end
end)


for i, v in next, workspace:GetDescendants() do
    if v.ClassName == 'TouchTransmitter' and v:FindFirstAncestorOfClass('Model') and v:FindFirstAncestorOfClass('Model').Name:find(ClientItem) then
        
        for i =  0, 01 do
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Parent.CFrame + Vector3.new(0, -1, 0)
            task.wait(0.1)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Parent.CFrame + Vector3.new(0, 1, 0)
        end


    end
end


workspace.Gravity = 196
end
wait()
local function Music(ID) -- rbxassetid://
sound = Instance.new("Sound")
sound.SoundId = ID
sound.Volume = 1
sound.Parent = game:GetService("SoundService")
sound.Looped = true
sound.TimePosition = 1
sound:Play()
end

local Library = loadstring(game:HttpGet("https://pastebin.com/raw/aC8GQEKE"))()
local ui = Library:CreateWindow()



local UpdateLog = {
            Title = "[2023.01.19] [WFS] Update Log:";
            Content_UP = "[Content]";
            Text_UP_1 = "• New World 31 - Ancient Pyramid";
            Text_UP_2 = "• 8 New Weapons";
            Text_UP_3 = "• 4 New Eternal Qi Spells";
            Text_UP_4 = "• New Godlike Qi Rank";
            Text_UP_5 = "• New Chinese New Year Event";
            Text_UP_6 = "• New Gear skins";
            Text_UP_7 = "• Added display of for combat damage numbers";
            Balance_UP = "[Balance]";
            Balance_TextB = "• Reduced the number of spirit stones dropped by enemies in the tower";
            Balance_Text = "• Fixed some bugs";
            Update_Notifier = "update notification by: RBLXFrodan (RBLXFrodan#0149) & CarlBot";
}

local Vtitle = UpdateLog.Title
local CUP = UpdateLog.Content_UP
local T2_3 = UpdateLog.Text_UP_1
local t3_4 = UpdateLog.Text_UP_2
local t78 = UpdateLog.Text_UP_3 -- from this
local pfvp = UpdateLog.Text_UP_4
local gbg = UpdateLog.Text_UP_5
local Love = UpdateLog.Text_UP_6
local Uv = UpdateLog.Text_UP_7 -- to this
local gvg = UpdateLog.Balance_UP
local tvt = UpdateLog.Balance_Text
local idn = UpdateLog.Balance_TextB -- neww
local fgv = UpdateLog.Update_Notifier

local ViewUpdateLogTemplate = Vtitle .. "\n" .. CUP .. "\n" .. T2_3 .. "\n" .. t3_4 .. "\n" .. t78 .. "\n" .. pfvp .. "\n" .. gbg .. "\n" .. Love .. "\n" .. Uv .. "\n\n" .. gvg .. "\n" .. tvt .. "\n" .. idn .. "\n" .. fgv .. "\n\nNOTE: This update uses Webhooks via the WFS (official) discord server and has been approved by the developer or moderator."

local SaveConfig = {
          A_1 = false;
          B_1 = false;
}

local P_1 = ui:new("Farm")
local P_2 = ui:new("Defense & Dungeon")
local P_3 = ui:new("Music")
local P_4 = ui:new("Misc")
local P_5 = ui:new("Tower")
local P_6 = ui:new("Credit & Social")
local P_7 = ui:new("???")

P_1:Ping()
P_1:FPS()
P_1:TimePlayed()
P_1:UTC()

P_6:CreateLabel("","My discord: C4#4172")
P_6:CreateLabel("","My tiktok: @capviktor")
P_6:CreateLabel("","Roblox account: Rivanda_Cheater")
P_6:CreateLabel("","Enjoy!")

P_4:CreateToggle("Mount", false, function(value)
game:GetService("Workspace").Fight.Events.FightSwitchKnight:InvokeServer(value)
end)

P_1:CreateDropdown("Farm type", {"Teleport","Tween","Reach"}, function(value)
     FarmType = value
end)

P_1:CreateToggle("Farm", false, function(v)
if FarmType == "Teleport" then
    _G.farmNearest = v
    
    spawn(function()
        while task.wait() do
            if not _G.farmNearest then break end
            pcall(function()
                local nearest = getNear()
                
                plr.CFrame = nearest.Root.CFrame * CFrame.new(0,0,10)
                wait(.2)


                workspace.Fight.Events.FightAttack:InvokeServer(0,nearest.Name)   
                
                repeat task.wait()
                    plr.CFrame = nearest.Root.CFrame * CFrame.new(0,0,10)
                until nearest.Root == nil or not _G.farmNearest
            end)
        end
    end)
elseif FarmType == "Tween" then
    _G.farmNearest = v
    
    spawn(function()
        while task.wait() do
            if not _G.farmNearest then break end
            pcall(function()
                local nearest = getNear()
                
                local TweenService = game:GetService("TweenService")
local Tw = TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out,0,false,0), 


{CFrame = nearest.Root.CFrame * CFrame.new(0,0,10)}):Play()
                wait(0)


                workspace.Fight.Events.FightAttack:InvokeServer(0,nearest.Name)   
                
                repeat task.wait()
                    local TweenService = game:GetService("TweenService")
local Tw = TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out,0,false,0), 


{CFrame = nearest.Root.CFrame * CFrame.new(0,0,10)}):Play()
                until nearest.Root == nil or not _G.farmNearest
            end)
        end
    end)
elseif FarmType == "Reach" then
    _G.farmNearest = v
    
    
        while task.wait() do
            if not _G.farmNearest then break end
            local nearest = getNear()
workspace.Fight.Events.FightAttack:InvokeServer(0,nearest.Name)
end
end
end)

P_1:CreateToggle("Farm Highest", false, function(v)
if FarmType == "Teleport" then
    _G.farmHighest = v


    spawn(function()
        while task.wait() do
            if not _G.farmHighest then break end
            pcall(function()
                local highest = getHighest()


                plr.CFrame = game:GetService("Workspace").Fight.ClientChests[highest].Root.CFrame * CFrame.new(0,0,10)
                wait(.2)


                workspace.Fight.Events.FightAttack:InvokeServer(0,highest)


                repeat task.wait()
                        plr.CFrame = game:GetService("Workspace").Fight.ClientChests[highest].Root.CFrame * CFrame.new(0,0,10)
                until not game:GetService("Workspace").Fight.ClientChests[highest] or not _G.farmHighest
            end)
        end
    end)
elseif FarmType == "Tween" then
    _G.farmHighest = v


    spawn(function()
        while task.wait() do
            if not _G.farmHighest then break end
            pcall(function()
                local highest = getHighest()


                local TweenService = game:GetService("TweenService")
local Tw = TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out,0,false,0), 


{CFrame = game:GetService("Workspace").Fight.ClientChests[highest].Root.CFrame * CFrame.new(0,0,10)}):Play() 
                wait(0)


                workspace.Fight.Events.FightAttack:InvokeServer(0,highest)


                repeat task.wait()
                        local TweenService = game:GetService("TweenService")
local Tw = TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out,0,false,0), 


{CFrame = game:GetService("Workspace").Fight.ClientChests[highest].Root.CFrame * CFrame.new(0,0,10)}):Play()
                until not game:GetService("Workspace").Fight.ClientChests[highest] or not _G.farmHighest
            end)
        end
    end)
elseif FarmType == "Reach" then
    _G.farmHighest = v


    
        while task.wait() do
            if not _G.farmHighest then break end
            local highest = getHighest()
workspace.Fight.Events.FightAttack:InvokeServer(0,highest)
end
end)

P_1:CreateToggle("Farm Lowest", false, function(v)
if FarmType == "Teleport" then
    _G.farmLowest = v


    spawn(function()
        while task.wait() do
            if not _G.farmLowest then break end
            pcall(function()
                local lowest = getLowest()


                plr.CFrame = game:GetService("Workspace").Fight.ClientChests[lowest].Root.CFrame * CFrame.new(0,0,10)
                wait(.2)


                workspace.Fight.Events.FightAttack:InvokeServer(0,lowest)


                repeat task.wait()
                        plr.CFrame = game:GetService("Workspace").Fight.ClientChests[lowest].Root.CFrame * CFrame.new(0,0,10)
                until not game:GetService("Workspace").Fight.ClientChests[lowest] or not _G.farmLowest
            end)
        end
    end)
elseif FarmType == "Tween" then
    _G.farmLowest = v


    spawn(function()
        while task.wait() do
            if not _G.farmLowest then break end
            pcall(function()
                local lowest = getLowest()


                local TweenService = game:GetService("TweenService")
local Tw = TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out,0,false,0), 


{CFrame = game:GetService("Workspace").Fight.ClientChests[lowest].Root.CFrame * CFrame.new(0,0,10)}):Play()
                wait(0)


                workspace.Fight.Events.FightAttack:InvokeServer(0,lowest)


                repeat task.wait()
                        local TweenService = game:GetService("TweenService")
local Tw = TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out,0,false,0), 


{CFrame = game:GetService("Workspace").Fight.ClientChests[lowest].Root.CFrame * CFrame.new(0,0,10)}):Play()
                until not game:GetService("Workspace").Fight.ClientChests[lowest] or not _G.farmLowest
            end)
        end
    end)
elseif FarmType == "Reach" then
    _G.farmLowest = v


   
        while task.wait() do
            if not _G.farmLowest then break end
            local lowest = getLowest()
            workspace.Fight.Events.FightAttack:InvokeServer(0,lowest)
end
end
end)

P_4:CreateToggle("auto equip best weapon", false, function(value)
     EquipBest = value
      
         while wait() do
         if EquipBest == false then break end
             game:GetService("ReplicatedStorage").CommonLibrary.Tool.RemoteManager.Funcs.DataPullFunc:InvokeServer("ArtifactEquipBestsChannel")
end
end)

P_4:CreateToggle("auto unequip best weapon", false, function(value)
     UnequipBest = value
      
         while wait() do
         if UnequipBest == false then break end
             game:GetService("ReplicatedStorage").CommonLibrary.Tool.RemoteManager.Funcs.DataPullFunc:InvokeServer("ArtifactUnequipAllChannel")
end
end)

P_2:CreateButton("Defense Mode", function()
game:GetService("ReplicatedStorage").CommonLibrary.Tool.RemoteManager.Funcs.DataPullFunc:InvokeServer("SpiritPlaceOpenSpiritPlaceChannel",1)
end)

P_2:CreateDropdown("Time trial mode", {"Easy","Hard"}, function(v)
game:GetService("ReplicatedStorage").CommonLibrary.Tool.RemoteManager.Funcs.DataPullFunc:InvokeServer("DungeonTeamRoomOpenChannel",v)
end)

P_2:CreateButton("Leave room (Time Trial)", function()
game:GetService("ReplicatedStorage").CommonLibrary.Tool.RemoteManager.Funcs.DataPullFunc:InvokeServer("DungeonTeamRoomDisbandChannel")
end)

P_1:CreateToggle("Collect Rewards", false, function(v)
    _G.autoCollect = v


    spawn(function()
        while task.wait() do
            if not _G.autoCollect then break end
            for i, v in pairs(game:GetService("Workspace").Rewards:GetChildren()) do
                if v ~= nil then
                    v.CFrame = plr.CFrame
                end
            end
        end
    end)
end)

P_1:CreateButton("Collect Limited token", function()
game:GetService("ReplicatedStorage").CommonLibrary.Tool.RemoteManager.Funcs.DataPullFunc:InvokeServer("JewelTakeDailyRewardChannel")
end)

P_5:CreateButton("Start Tower", function()
game:GetService("ReplicatedStorage").CommonLibrary.Tool.RemoteManager.Funcs.DataPullFunc:InvokeServer("TowerEnterChannel")
end)

P_3:CreateButton("Stadium rave", function()
Music("rbxassetid://1846368080")
end)
 
P_3:CreateButton("Crab rave", function()
Music("rbxassetid://5410086218")
end)
 
P_3:CreateButton("Hijacked", function()
Music("rbxassetid://1842559618")
end)
 
P_3:CreateButton("Wonderful day", function()
Music("rbxassetid://1843382633")
end)

P_3:CreateButton("Happy Song (2:48 Minutes)", function()
Music("rbxassetid://1843404009")
end)

P_3:CreateButton("New Arrival (4:02 Minutes)", function()
Music("rbxassetid://1844355042")
end)

P_3:CreateButton("stop all music", function()
sound.Volume = 0
end)

P_5:CreateButton("Leave Tower", function()
game:GetService("ReplicatedStorage").CommonLibrary.Tool.RemoteManager.Funcs.DataPullFunc:InvokeServer("TowerTeleportChannel","Out")
end)

P_5:CreateToggle("Auto round", false, function(v)
    _G.farmNearest = v
    
  
        while task.wait() do
            if not _G.farmNearest then break end
                game:GetService("ReplicatedStorage").CommonLibrary.Tool.RemoteManager.Funcs.DataPullFunc:InvokeServer("TowerTeleportChannel","Next")
    end
end)

P_4:CreateButton("TP Tool", function()
mouse = game.Players.LocalPlayer:GetMouse()
tool = Instance.new("Tool")
tool.RequiresHandle = false
tool.Name = "👑"
tool.Activated:connect(function()
local pos = mouse.Hit+Vector3.new(0,2.5,0)
pos = CFrame.new(pos.X,pos.Y,pos.Z)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
end)
tool.Parent = game.Players.LocalPlayer.Backpack
end)
