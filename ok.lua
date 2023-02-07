local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local selectedEgg = nil
local nameOfGame = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)

local Window = Rayfield:CreateWindow({
   Name = "YX Hub | CM:DH",
   LoadingTitle = "YX Hub is loading...",
   LoadingSubtitle = "by fracture#0001",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "YX"
   },
   Discord = {
      Enabled = true,
      Invite = "yy458KSTPG",
      RememberJoins = true 
   },
   KeySystem = true,
   KeySettings = {
      Title = "YX HUB",
      Subtitle = "Key System",
      Note = "Join the discord (https://discord.gg/yy458KSTPG)",
      FileName = "YX Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = "yxbetter"
   }
})

local Tab = Window:CreateTab('Main', 4483362458) 

local Section = Tab:CreateSection('Main')

local Dropdown = Tab:CreateDropdown({
   Name = 'Chose Mob',
   Options = {'Ant Fiend','Imposter Fiend', 'Cricket Fiend', 'Tomato Devil'},
   CurrentOption = 'Ant Fiend',
   Flag = 'chosenMob',
   Callback = function(Option)
    selectedMob = Option
   end,
})

local Toggle = Tab:CreateToggle({
   Name = 'Auto Farm Selected Mob',
   CurrentValue = false,
   Flag = 'afToggle',
   Callback = function(Value)
      autoFarm = Value
      if autoFarm then
        spawn(
          function()
            while autoFarm and wait() do
               for _,v in pairs(game:GetService("Workspace").Living:GetChildren()) do 
                  if v.Name == selectedMob then
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                  local args = {
                     [1] = false,
                     [2] = Vector3.new(),
                     [3] = CFrame.new(Vector3.new(), Vector3.new())
                  }

                  game.ReplicatedStorage.events.remote:FireServer("NormalAttack")
                  end
               end
            end
          end
        )
      end
   end
})