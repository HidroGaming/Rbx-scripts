local ArrayField = loadstring(game:HttpGet('https://raw.githubusercontent.com/UI-Interface/ArrayField/main/Source.lua'))()
local Window = ArrayField:CreateWindow({
    Name = "Rainbow Friends Gui",
    LoadingTitle = "Rainbow Friends GUI",
    LoadingSubtitle = "by ItsHidro",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil, -- Create a custom folder for your hub/game
        FileName = "rainbowfriendsgui"
    },
    Discord = {
        Enabled = false,
        Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
        RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    },
    KeySystem = false, -- Set this to true to use our key system
    KeySettings = {
        Title = "Untitled",
        Subtitle = "Key System",
        Note = "No method of obtaining the key is provided",
        FileName = "Key", -- It is recommended to use something unique as other scripts using ArrayField may overwrite your key file
        SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
        GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like ArrayField to get the key from
        Actions = {
            [1] = {
                Text = 'Click here to copy the key link <--',
                OnPress = function()
                    print('Pressed')
                end,
                }
            },
        Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
})
local itemtab = Window:CreateTab("Items", 4483345998)
local playertab = Window:CreateTab("Player", 4483345998)
local esptab = Window:CreateTab("ESP", 4483345998)
local credits = Window:CreateTab("Credits", 4483345998)

local localplayer = game:GetService("Players").LocalPlayer
local noclip = false

function getallitems()
    attempts = 0
    for i,v in pairs(workspace:GetChildren()) do
        if v:FindFirstChild("TouchTrigger") and attempts < 10 then
            attempts = attempts + 1
            print(attempts)
            firetouchinterest(localplayer.Character.HumanoidRootPart,v.TouchTrigger,0)
        end
    end
end

function placeitems()
    localplayer.Character.HumanoidRootPart.CFrame = CFrame.new(49.5639267, 137.947021, -5.74115038, 0.419525206, -1.6861982e-08, -0.907743692, 5.94611897e-08, 1, 8.90503049e-09, 0.907743692, -5.77114037e-08, 0.419525206)
end

itemtab:CreateButton({
    Name = "Attempt to get all items",
    Interact = 'Click',
    Callback = function()
        getallitems()
    end
})

itemtab:CreateButton({
    Name="Attempt to place all items",
    Interact = 'Click',
    Callback = function()
        placeitems()
    end
})

playertab:CreateSlider({
    Name = "Speed",
    Range = {localplayer.Character.Humanoid.WalkSpeed,50},
    Increment = 1,
    Suffix = "",
    CurrentValue = localplayer.Character.Humanoid.WalkSpeed,
    Flag = "speed",
    Callback = function(value)
        localplayer.Character.Humanoid.WalkSpeed = Value
    end,
})

playertab:CreateSlider({
    Name = "FOV",
    Range = {70,120},
    Increment = 1,
    Suffix = "",
    CurrentValue = 70,
    Flag = "fov",
    Callback = function(value)
        workspace.CurrentCamera.FieldOfView = value
    end,
})

playertab:CreateToggle({
    Name = "Noclip",
    CurrentValue = false,
    Flag = "noclip",
    Callback = function()
        noclip = not noclip
    end
})

esptab:CreateToggle({
    Name = "Monster ESP",
    CurrentValue = false,
    Flag = "monster",
    Callback = function(value)
        if value == true then
            for index,monster in pairs(workspace.Monsters:GetChildren()) do
                if not monster:FindFirstChild("monster") then
                    local Highlight = Instance.new("Highlight")
                    Highlight.Name = "monster"
                    Highlight.Parent = monster
                    Highlight.FillTransparency = 0.5
                end
            end
        else
            for index, monster in pairs(workspace.Monsters:GetChildren()) do
	            if  monster:FindFirstChild("monster") then
                    monster:FindFirstChild("monster"):Destroy()
                end
            end
        end
    end,
})

esptab:CreateToggle({
    Name = "Item Esp",
    CurrentValue = false,
    Flag = "itemesp",
    Callback = function(value)
        if value == true then
            for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
                if v:FindFirstChild("TouchTrigger") and not v:FindFirstChild("itemesp")  then
                    local Highlight = Instance.new("Highlight")
                    Highlight.Name = "itemesp"
                    Highlight.Parent = v
                    Highlight.FillTransparency = 1
        else
            for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
                if v:FindFirstChild("TouchTrigger") and  v:FindFirstChild("itemesp")  then
                    v:FindFirstChild("itemesp"):Destroy()
                end
            end
        end
    end
    end
    end
})

game:GetService("RunService").Stepped:Connect(function()
    if not noclip == false then
        for a,b in pairs(workspace:GetChildren()) do
            if b.Name == localplayer.Name then
                for i,v in pairs(workspace[localplayer.Name]:GetChildren()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                    end
                end
            end
        end
    else
        for a,b in pairs(workspace:GetChildren()) do
            if b.Name == localplayer.Name then
                for i,v in pairs(workspace[localplayer.Name]:GetChildren()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = true
                    end
                end
            end
        end
    end
end)

credits:CreateLabel("Scripted By ItsHidro")