local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "NIYE HUB",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "L O A D I N G",
   LoadingSubtitle = "by NIYE Hub",
   ShowText = "NIYE HUB", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "NIYE HUB"
   },

   Discord = {
      Enabled = true, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "https://discord.gg/Fg5fs6dcpt", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "NIYE HUB",
      Subtitle = "Key System",
      Note = "Join the discord", -- Use this to tell the user how to get a key
      FileName = "NIYEHUBSLAP!", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = false, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"NIYEHUBSLAP!"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local Tab = Window:CreateTab("Script", 4483362458) -- Title, Image

local Button = Tab:CreateButton({
   Name = "Teleport to end",
   Callback = function()
   local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")

hrp.CFrame = CFrame.new(-175, 769, 56)
   end,
})

local teleportLoop = false

local Toggle = Tab:CreateToggle({
    Name = "Troll",
    CurrentValue = false,
    Flag = "TeleportLoopToggle",
    Callback = function(Value)
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local hrp = character:WaitForChild("HumanoidRootPart")

        local pos1 = CFrame.new(38, 166, 87)
        local pos2 = CFrame.new(34, 167, 16)

        if Value then
            teleportLoop = true
            task.spawn(function()
                while teleportLoop do
                    -- teleport to pos1
                    hrp.CFrame = pos1
                    task.wait(1) -- wait 1 second

                    if not teleportLoop then break end

                    -- teleport to pos2
                    hrp.CFrame = pos2
                    task.wait(1) -- wait 1 second
                end
            end)
        else
            teleportLoop = false
        end
    end,
})

local Button = Tab:CreateButton({
    Name = "Teleport Sequence",
    Callback = function()
        local plr = game.Players.LocalPlayer
        local char = plr.Character or plr.CharacterAdded:Wait()
        local hrp = char:WaitForChild("HumanoidRootPart")

        -- Save original position
        local originalCFrame = hrp.CFrame

        -- Full teleport sequence
        local sequence = {
            CFrame.new(-12, -10, 102),  -- first given
            CFrame.new(-182, 769, 38),  -- second given

            -- intermediate coordinates
            CFrame.new(-11, -10, 102),
            CFrame.new(-12, -10, 106),
            CFrame.new(-10, -10, 107),
            CFrame.new(-11, -10, 109),
            CFrame.new(-8, -10, 109),
        }

        -- Execute teleports with a short delay
        for _, pos in ipairs(sequence) do
            hrp.CFrame = pos
            task.wait(0.5) -- adjust delay if needed
        end

        -- Return to original position
        hrp.CFrame = originalCFrame
    end,
})

local Label = Tab:CreateLabel("When using Troll remember to shiftlock", 4483362458, Color3.fromRGB(255, 255, 255), false) -- Title, Icon, Color, IgnoreTheme

local Button = Tab:CreateButton({
   Name = "Button Example",
   Callback = function()
   
   end,
})
