function love.load()
    N = arg[2] -- First argument
    if (N == nil) then
        N = 4 -- Default
    else
        N = tonumber(N)
    end
    
    if (N ~= 3 and N ~= 4) then
        error("Unsupported bitmarker size")
    end

    love.window.setMode(640, 640, {resizable=true})
    font = love.graphics.setNewFont(48)
    init()
end

function init()
    if (N == 4) then
        x_base = {
            {32, 8, 1, 0},
            {16, 2, 0, 0},
            {4, 0, 0, 0},
            {0, 0, 0, 0}
        }
        y_base = {
            {0, 0, 0, 0},
            {0, 0, 0, 1},
            {0, 0, 2, 8},
            {0, 4, 16, 32}
        }
        state = {
            {false, false, false, true},
            {false, false, true, false},
            {false, true, false, false},
            {true, false, false, false}
        }
    else
        x_base = {
            {4, 1, 0},
            {2, 0, 0},
            {0, 0, 0}
        }
        y_base = {
            {0, 0, 0},
            {0, 0, 1},
            {0, 2, 4}
        }
        state = {
            {false, false, true},
            {false, true, false},
            {true, false, false}
        }
    end

    calcCoordinate()
end

function love.draw()
    local w = love.graphics.getWidth() / N
    local h = love.graphics.getHeight() / N

    for i = 1,N,1 do
        for j = 1,N,1 do
            if (state[j][i]) then
                -- White
                love.graphics.setColor(1, 1, 1)
            else
                -- Black
                love.graphics.setColor(0, 0, 0)
            end

            -- Diagonal
            --if (N - i == j - 1) then love.graphics.setColor(0.5, 0.5, 0.5) end
            
            love.graphics.rectangle("fill", w*(i-1), h*(j-1), w, h)

            love.graphics.setColor(0.5, 0.5, 0.5)
            love.graphics.rectangle("line", w*(i-1), h*(j-1), w, h)
        end
    end

    love.graphics.setColor(1, 0, 0)
    love.graphics.setFont(font)
    love.graphics.printf(coordinateStr, 0, love.graphics.getHeight() / 2 - font:getHeight() / 2, love.graphics.getWidth(), "center")
end

function calcCoordinate()
    local x = 0
    local y = 0

    for i = 1,N,1 do
        for j = 1,N,1 do
            if (state[j][i]) then
                x = x + x_base[j][i]
                y = y + y_base[j][i]
            end
        end
    end

    coordinateStr = string.format("(%i, %i)", x, y)
    love.window.setTitle(coordinateStr)
end

function love.mousepressed(x, y, button, istouch, presses)
    if (button ~= 1) then return end
    
    local w = love.graphics.getWidth() / N
    local h = love.graphics.getHeight() / N

    local i = math.floor(x / w + 1)
    local j = math.floor(y / h + 1)

    -- Diagonal is immutable
    if (N - i == j - 1) then return end

    state[j][i] = not state[j][i]
    calcCoordinate()
end

function love.keypressed(key, scancode, isrepeat)
    if (key == "escape" or key == "q") then
       love.event.quit()
    end

    if (key == "r") then
        init()
    end

    if (key == "3" and N ~= 3) then
        N = 3
        init()
    end

    if (key == "4" and N ~= 4) then
        N = 4
        init()
    end
 end