--[[
-- Configuration for easier Window Management
--
-- By: David Lin
--
-- See: http://www.hammerspoon.org/go/
--]]


-- Resize the current window to half of the screen vertically
hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "\\", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.y = max.y
    f.w = max.w / 2

    -- Based on current location auto-move to the left or right
    if f.x >= max.x + (max.w / 2) - (f.w / 2) then
        f.x = max.x + (max.w / 2)
    else
        f.x = max.x
    end

    win:setFrame(f)
end)

-- Resize the current window to half of the screen horizontally
hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "-", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.h = max.h / 2
    f.w = max.w

    -- Based on current location auto-move to the top or bottom
    if f.y >= max.y + (max.y / 2) - (f.y / 2) then
        f.y = max.y + (max.y / 2)
    else
        f.y = max.y
    end

    win:setFrame(f)
end)

-- Move the window to the right most location
hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "Right", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.w - f.w

    win:setFrame(f)
end)

-- Move the window to the left most location
hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "Left", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x

    win:setFrame(f)
end)

-- Move the window to the top most location
hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "Up", function()
    local displays = hs.screen.allScreens()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    if f.y > max.y then
      f.y = max.y

      win:setFrame(f)
    else 
      win:moveToScreen(displays[2], false, true)
    end
end)

-- Move the window to the bottom most location
hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "Down", function()
    local displays = hs.screen.allScreens()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    if f.y < max.h - f.h + max.y then
      f.y = max.h - f.h + max.y

      win:setFrame(f)
    else
      win:moveToScreen(displays[1], false, true)
    end
end)

-- Move the window to the right in 10% increments
hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "h", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = f.x - (max.w * 0.10)

    if f.x < 0 then
      f.x = 0
    end

    win:setFrame(f)
end)

-- Move the window to the left in 10% increments
hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "l", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = f.x + (max.w * 0.10)

    win:setFrame(f)
end)

-- Move the window to the top in 10% increments
hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "j", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.y = f.y + (max.h * 0.10)

    win:setFrame(f)
end)

-- Move the window to the bottom in 10% increments
hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "k", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.y = f.y - (max.h * 0.10)

    win:setFrame(f)
end)

-- Decrease width by 10%
hs.hotkey.bind({ "cmd", "alt", "ctrl" }, ",", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.w = f.w - (max.w * 0.10)

    win:setFrame(f)
end)

-- Increase width by 10%
hs.hotkey.bind({ "cmd", "alt", "ctrl" }, ".", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.w = f.w + (max.w * 0.10)

    win:setFrame(f)
end)

