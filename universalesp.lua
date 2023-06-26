local ArrayField = loadstring(game:HttpGet('https://raw.githubusercontent.com/UI-Interface/ArrayField/main/Source.lua'))()
local Sense = loadstring(game:HttpGet('https://sirius.menu/sense'))()
local w = ArrayField:CreateWindow({
    Name = "Universal Player ESP",
    LoadingTitle = "Universal Player ESP",
    LoadingSubtitle = "by ItsHidro",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil,
        FileName = "esp"
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
local main = w:CreateTab("ESP", 10802202968)
local credits = w:CreateTab("Credits", 10802181160)

local enabled = main:CreateToggle({
    Name = "Enabled",
    CurrentValue = false,
    Flag = "enable",
    Callback = function(Value)
        Sense.teamSettings.enemy.enabled = Value
        Sense.teamSettings.friendly.enabled = Value
    end
})

local chams = main:CreateToggle({
    Name = "Chams",
    CurrentValue = false,
    Flag = "chams",
    Callback = function(Value)
        Sense.teamSettings.enemy.chams = Value
        Sense.teamSettings.enemy.chamsOutlineColor ={"Team Color",0}
        Sense.teamSettings.enemy.chamsFillColor ={"Team Color",0.5}
        Sense.teamSettings.friendly.chams = Value
        Sense.teamSettings.friendly.chamsFillColor ={"Team Color",0.5}
        Sense.teamSettings.friendly.chamsOutlineColor ={"Team Color",0}
    end
})
local box = main:CreateToggle({
    Name = "BoxESP",
    CurrentValue = false,
    Flag = "box",
    Callback = function(Value)
        Sense.teamSettings.enemy.box = Value
        Sense.teamSettings.enemy.boxColor = {"Team Color",1}
        Sense.teamSettings.friendly.box = Value
        Sense.teamSettings.friendly.boxColor = {"Team Color",1}
    end
})
local name = main:CreateToggle({
    Name = "Name ESP",
    CurrentValue = false,
    Flag = "name",
    Callback = function(Value)
        Sense.teamSettings.enemy.name = Value
        Sense.teamSettings.friendly.name = Value
    end
})

local tracer = main:CreateToggle({
    Name = "Tracer",
    CurrentValue = false,
    Flag = "name",
    Callback = function(value)
        Sense.teamSettings.enemy.tracer = value
        Sense.teamSettings.friendly.tracer = value
        Sense.teamSettings.friendly.tracerColor = {"Team Color",1}
        Sense.teamSettings.enemy.tracerColor = {"Team Color",1}
    end,
})
local label = credits:CreateLabel("Scripted by ItsHidro")
local label = credits:CreateLabel("UI is ArrayField")
Sense.Load()