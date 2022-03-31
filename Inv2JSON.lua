local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua')))()

local Players = game:GetService('Players')
local httpS = game:GetService("HttpService")
local player = Players.LocalPlayer

local pGUI = player:WaitForChild("PlayerGui")
local knifeInv = pGUI:WaitForChild("ScreenGui"):WaitForChild("UI"):WaitForChild("Inventory"):WaitForChild("KnifeInv"):WaitForChild("KnifeGrid")
local tradeGrid = pGUI:WaitForChild("ScreenGui"):WaitForChild("UI"):WaitForChild("Trading"):WaitForChild("InspectHold"):WaitForChild('KnifeGrid')

local untradable = {'Onyx Scepter', 'Onyx Champion', 'Diamond Staff', 'Crystal Blade', 'Diamond Challenger', 'Ancient Sickle', 'Rubber Chicken', 'Evil Chicken', 'Slugger', 'Spark Blade', 'Lucky Chicken', "Fool's Gold", 'Tier VI', 'Tier VII', 'Tier VIII', 'Tier IX', 'Tier X', 'Gold Tier', 'Tier II', 'Tier III', 'Tier IV', 'Tier V', 'Bronze Tier', 'Silver Tier', 'Ninja', 'Purple Nation', 'Basic', 'Stuffed'}

-- UI --
--[[local w = library:CreateWindow("Inv2JSON") -- Creates the window

local l = w:CreateFolder("Local Player")
local op = w:CreateFolder("Other Player")

l:Button("Get String", function()
  local inv = getInv(knifeInv,"ImageButton")
  setclipboard(inv)
  CreateNotification("Inv2JSON", "Inventory Successfully copied to clipboard!")
end)



op:Label("View their inv from trade menu before clicking!", {
  TextSize = 12; -- Self Explaining
  TextColor = Color3.fromRGB(255,255,255); -- Self Explaining
  BgColor = Color3.fromRGB(69,69,69);
})

op:Button("Get String", function()
  local str = getInv(tradeGrid, "Frame")
  setclipboard(str)
  CreateNotification("Inv2JSON", "Inventory Successfully copied to clipboard!")
end)


l:DestroyGui()
op:DestroyGui()]]--

local inv = getInv(knifeInv,"ImageButton")
setclipboard(inv)
CreateNotification("Inv2JSON", "Inventory Successfully copied to clipboard!")

function getInv(parentFrame, type)
  local total = {}

  for i,v in pairs(parentFrame:GetChildren()) do
    if v:IsA(type) then
      if not table.find(untradable, v.Name) then
        local count = 1
        if v.Num.Text ~= "" then
          local cnt = string.gsub(v.Num.Text, "x", "")
          count = tonumber(cnt)
        end
            
        total[v.Name] = {Count = count, Rarity = v.Rarity.Text}
      end
    end
  end

  return httpS:JSONEncode(total)
end

function CreateNotification(Title,Text)
    local SetCore = game:GetService("StarterGui"):SetCore("SendNotification",{
        Title = Title,
        Text = Text,
        Icon = "",
        Duration = 5
    })
end
