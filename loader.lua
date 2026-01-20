local Players = game:GetService("Players")

local colors = {
    Background = Color3.fromRGB(18, 18, 22),
    Topbar     = Color3.fromRGB(30, 30, 38),
    Content    = Color3.fromRGB(24, 24, 30),
    Text       = Color3.fromRGB(255, 255, 255),
}

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ScriptHubUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = game:GetService("CoreGui")

local basePadding = 40
local approxCharWidth = 12
local topBarHeight = 40
local baseHeightPadding = 20

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 0, 0, 0)
mainFrame.Position = UDim2.new(0.5, -0, 0.5, -0)
mainFrame.BackgroundColor3 = colors.Background
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 10)
mainCorner.Parent = mainFrame

local topBar = Instance.new("Frame")
topBar.Size = UDim2.new(1, 0, 0, topBarHeight)
topBar.BackgroundColor3 = colors.Topbar
topBar.BorderSizePixel = 0
topBar.Parent = mainFrame

local topLabel = Instance.new("TextLabel")
topLabel.Size = UDim2.new(1, -10, 1, 0)
topLabel.Position = UDim2.new(0, 10, 0, 0)
topLabel.BackgroundTransparency = 1
topLabel.Text = "NeoHub"
topLabel.Font = Enum.Font.GothamBold
topLabel.TextSize = 20
topLabel.TextColor3 = colors.Text
topLabel.TextXAlignment = Enum.TextXAlignment.Left
topLabel.Parent = topBar

local content = Instance.new("Frame")
content.Size = UDim2.new(1, 0, 1, -topBarHeight)
content.Position = UDim2.new(0, 0, 0, topBarHeight)
content.BackgroundColor3 = colors.Content
content.BorderSizePixel = 0
content.Parent = mainFrame

local contentCorner = Instance.new("UICorner")
contentCorner.CornerRadius = UDim.new(0, 10)
contentCorner.Parent = content

local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(1, -20, 1, -20)
statusLabel.Position = UDim2.new(0, 10, 0, 10)
statusLabel.BackgroundTransparency = 1
statusLabel.Font = Enum.Font.GothamBold
statusLabel.TextSize = 22
statusLabel.TextColor3 = colors.Text
statusLabel.TextWrapped = false
statusLabel.TextXAlignment = Enum.TextXAlignment.Center
statusLabel.TextYAlignment = Enum.TextYAlignment.Center
statusLabel.Parent = content

local gameName
local scriptURL

if game.GameId == 7264587281 then
    gameName = "Sniper Duels"
    scriptURL = "https://raw.githubusercontent.com/Neo-223/NeoHub/refs/heads/main/Sniper%20Duels.lua"
elseif game.GameId == 1335695570 then
    gameName = "Ninja Legends"
    scriptURL = "https://raw.githubusercontent.com/Neo-223/NeoHub/refs/heads/main/Ninja%20Legends.lua"
else
    gameName = "Unknown Game"
    scriptURL = nil
end

local textLength = #"Detected: " + #gameName
local estimatedWidth = math.clamp(textLength * approxCharWidth + basePadding, 200, 800)
local estimatedHeight = topBarHeight + baseHeightPadding * 2

mainFrame.Size = UDim2.new(0, estimatedWidth, 0, estimatedHeight)
mainFrame.Position = UDim2.new(0.5, -estimatedWidth / 2, 0.5, -estimatedHeight / 2)

statusLabel.Text = "Detected: " .. gameName

task.delay(2, function()
    if scriptURL then
        loadstring(game:HttpGet(scriptURL))()
    else
        warn("Universal script not implemented for this game. GameId:", game.GameId)
    end
    mainFrame.Visible = false
end)

print("Detected: " .. gameName)

-- TODO:
-- create more scripts for different games to add to this list.
-- maybe add executor support check ( probably not... but maybe )
