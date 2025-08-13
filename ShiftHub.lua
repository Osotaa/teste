local a=17687504411
if game.PlaceId~=a then warn("Script only works in All Star Tower Defense.") return end
local b=game:GetService("HttpService")
local c=game:GetService("UserInputService")
local d=game:GetService("ReplicatedStorage")
local e="rbxassetid://84041558102940"
local f="rbxassetid://78706875936198"
local function g(h)local i=Instance.new("Sound")i.SoundId=h i.Volume=1 i.Parent=game:GetService("SoundService") i:Play() i.Ended:Connect(function()i:Destroy()end)end

local j=loadstring(game:HttpGet("https://raw.githubusercontent.com/oxotaa/teste/refs/heads/main/source2.lua"))()
local k=j:CreateWindow({Name="Shift Hub - Key",LoadingTitle="Loading Shift Hub...",LoadingSubtitle="Checking Key...",ConfigurationSaving={Enabled=false},KeySystem=false})
local l=k:CreateTab("🔑 Key")
local m=""
l:CreateInput({Name="Your Key",PlaceholderText="Enter your key here",RemoveTextAfterFocusLost=false,Callback=function(n)m=n end})
l:CreateButton({Name="Validate Key",Callback=function()
local o="http://localhost:3000/validate/"..b:UrlEncode(m)
local p,q=pcall(function()return game:HttpGet(o)end)
if p then
local r=b:JSONDecode(q)
if r.valid then
j:Notify({Title="Success",Content="Valid key! Welcome to Shift Hub.",Duration=3})
j:Destroy() wait(0.2)
local s=loadstring(game:HttpGet("https://raw.githubusercontent.com/oxotaa/teste/refs/heads/main/source2.lua"))()
t(s)
else
j:Notify({Title="Error",Content="Invalid key! Try again.",Duration=5})
end
else j:Notify({Title="Error",Content="Could not connect to server.",Duration=5}) end
end})
l:CreateButton({Name="Open Discord",Callback=function()setclipboard("https://discord.gg/mAn7k89V") j:Notify({Title="Link copied!",Content="Discord link copied to clipboard. Paste in browser to join.",Duration=5}) end})

function t(u)
local v=u:CreateWindow({Name="Shift Hub",LoadingTitle="Shift Hub",LoadingSubtitle="",ConfigurationSaving={Enabled=false},KeySystem=false})
local w=v:CreateTab("🏠 Main")
w:CreateSection("Welcome to Shift Hub!")
w:CreateToggle({Name="Rollback Trait",CurrentValue=false,Callback=function(x)print("Rollback Ativado.",x)end})
local y=0
w:CreateInput({Name="Amount of Gems",PlaceholderText="Enter gems amount",RemoveTextAfterFocusLost=false,Callback=function(z)local aa=tonumber(z) if aa then y=aa print("Amount of Gems set to:",y) else print("Please enter a valid number") end end})
w:CreateToggle({Name="Give Gems",CurrentValue=false,Callback=function(ab)print("Give Gems toggled:",ab,"Amount:",y) if ab and y>0 then local ac={["Premium"]=y,["Type"]="Cash",["Cash"]=260} if d:FindFirstChild("Binds") and d.Binds:FindFirstChild("CashBind") then d.Binds.CashBind:Fire(ac) print("Fired remote for",y,"gems! Table sent:",ac) else print("ERROR: Remote not found! ReplicatedStorage.Binds.CashBind does not exist.") end end end})
local ad=v:CreateTab("⚙️ Config")
ad:CreateSection("Settings")
ad:CreateButton({Name="Rejoin",Callback=function()game:GetService("TeleportService"):Teleport(game.PlaceId,game.Players.LocalPlayer)end})
local ae=nil
local af=false
local ag=ad:CreateLabel({Name="Current Bind: None"})
ad:CreateButton({Name="Choose bind to show/hide interface",Callback=function()af=true ag:SetText("Press any key...") end})
c.InputBegan:Connect(function(ah,ai)if af and ah.UserInputType==Enum.UserInputType.Keyboard then ae=ah.KeyCode af=false ag:SetText("Current Bind: "..tostring(ae.Name)) elseif ae and ah.UserInputType==Enum.UserInputType.Keyboard and ah.KeyCode==ae then v.Visible=not v.Visible if v.Visible then g(e) else g(f) end end end)
v.Visible=true g(e)
end
