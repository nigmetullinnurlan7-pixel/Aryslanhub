-- Aryslan Hub
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Aryslan Hub",
    LoadingTitle = "Loading Aryslan...",
    LoadingSubtitle = "by You",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "AryslanHub",
        FileName = "settings"
    }
})

local Tab = Window:CreateTab("Player", 4483362458)
local Section = Tab:CreateSection("Main")

Tab:CreateButton({
    Name = "Discord",
    Callback = function()
        setclipboard("https://discord.gg/4U9HEFwX")
        Rayfield:Notify({
            Title = "Copied!",
            Content = "Discord link copied to clipboard.",
            Duration = 4
        })
    end
})
