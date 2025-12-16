-- Minimal Auto Loader (CORRECT VERSION)

local SCRIPT_URL = "https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/FNDayFarm.lua"

-- ===== ANTI DUP =====
if getgenv().LOADER_RUNNING then return end
getgenv().LOADER_RUNNING = true

-- ===== STATE =====
getgenv().AUTO_ENABLED = getgenv().AUTO_ENABLED or false

-- ===== GUI =====
local gui = Instance.new("ScreenGui", game:GetService("CoreGui"))
gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.fromOffset(120, 36)
frame.Position = UDim2.new(0.5, -60, 0.1, 0)
frame.BackgroundColor3 = Color3.fromRGB(25,25,25)
frame.Active = true
frame.Draggable = true

local btn = Instance.new("TextButton", frame)
btn.Size = UDim2.fromScale(1,1)
btn.BorderSizePixel = 0
btn.Font = Enum.Font.GothamBold
btn.TextSize = 13
btn.TextColor3 = Color3.new(1,1,1)

local function update()
    if getgenv().AUTO_ENABLED then
        btn.Text = "ON"
        btn.BackgroundColor3 = Color3.fromRGB(60,180,100)
    else
        btn.Text = "OFF"
        btn.BackgroundColor3 = Color3.fromRGB(180,60,60)
    end
end

-- ===== QUEUE SELF (QUAN TRỌNG) =====
local function queueSelf()
    if queue_on_teleport then
        queue_on_teleport([[
            loadstring(game:HttpGet("https://raw.githubusercontent.com/nguyenkhanhtoan2k10-png/Autoexe/refs/heads/main/AutoLoader.lua"))()
        ]])
    end
end

-- ⚠️ THAY LINK NÀY:
-- 👉 Upload CHÍNH SCRIPT NÀY lên GitHub
-- 👉 Rồi thay THIS_LOADER.lua bằng link đó

btn.MouseButton1Click:Connect(function()
    getgenv().AUTO_ENABLED = not getgenv().AUTO_ENABLED
    update()

    if getgenv().AUTO_ENABLED then
        loadstring(game:HttpGet(SCRIPT_URL))()
        queueSelf()
    end
end)

update()

-- ===== AUTO RUN KHI VÀO SERVER =====
if getgenv().AUTO_ENABLED then
    loadstring(game:HttpGet(SCRIPT_URL))()
    queueSelf()
end
