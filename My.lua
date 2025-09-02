-- Загружаем Rayfield
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Создаём окно Aryslan Hub
local Window = Rayfield:CreateWindow({
    Name = "Aryslan Hub",
    LoadingTitle = "Aryslan",
    LoadingSubtitle = "by Aryslan",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "AryslanHub",
        FileName = "settings"
    },
    KeySystem = true,
    KeySettings = {
        Title = "Access Key",
        Subtitle = "Введите ключ для доступа",
        Note = "Ключ: 12345",
        FileName = "KeyFile",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {"12345"} -- ключ
    }
})

-- Вкладка Player
local PlayerTab = Window:CreateTab("Player", 1234567890)
local MovementSection = PlayerTab:CreateSection("Movement")

-- WalkSpeed
PlayerTab:CreateSlider({
    Name = "Walk Speed",
    Range = {16, 500},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 16,
    Callback = function(value)
        local hum = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum.WalkSpeed = value end
    end
})

-- JumpPower
PlayerTab:CreateSlider({
    Name = "Jump Power",
    Range = {50, 500},
    Increment = 1,
    Suffix = "Power",
    CurrentValue = 50,
    Callback = function(value)
        local hum = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum.JumpPower = value end
    end
})

-- Infinite Jump
PlayerTab:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    Flag = "infjump",
    Callback = function(state)
        _G.InfiniteJump = state
        local player = game.Players.LocalPlayer
        local mouse = player:GetMouse()
        mouse.KeyDown:Connect(function(key)
            if _G.InfiniteJump and key:byte() == 32 then
                local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
                if hum then hum:ChangeState("Jumping") end
            end
        end)
    end
})

-- Fly
PlayerTab:CreateButton({
    Name = "Enable Fly",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/YSL3xKYU"))()
    end
})

-- Noclip
PlayerTab:CreateToggle({
    Name = "Noclip",
    CurrentValue = false,
    Callback = function(state)
        local player = game.Players.LocalPlayer
        if state then
            noclipConn = game:GetService("RunService").Stepped:Connect(function()
                if player.Character then
                    for _, part in pairs(player.Character:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                end
            end)
        else
            if noclipConn then noclipConn:Disconnect() end
        end
    end
})

-- Вкладка Scripts
local ScriptsTab = Window:CreateTab("Scripts", 9876543210)

-- Infinite Yield
ScriptsTab:CreateButton({
    Name = "Load Infinite Yield",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end
})

-- GhostHub
ScriptsTab:CreateButton({
    Name = "Load GhostHub",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/GhostHub'))()
    end
})

-- Discord
ScriptsTab:CreateButton({
    Name = "Copy Discord Link",
    Callback = function()
        setclipboard("https://discord.gg/4U9HEFwX")
        Rayfield:Notify({Title="Discord", Content="Ссылка скопирована!", Duration=5})
    end
})
