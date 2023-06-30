local joysticks = love.joystick.getJoysticks()
function love.load()
    SCENE = require('scene_manager')

end

function love.update(dt)
    if type(CURRENT_SCENE.update) == 'function' then CURRENT_SCENE.update(dt) end

    local dx, dy = 0, 0
    if love.keyboard.isScancodeDown('up')    or love.keyboard.isScancodeDown('w') then dy = dy - 500 * dt end
    if love.keyboard.isScancodeDown('down')  or love.keyboard.isScancodeDown('s') then dy = dy + 500 * dt end
    if love.keyboard.isScancodeDown('left')  or love.keyboard.isScancodeDown('a') then dx = dx - 500 * dt end
    if love.keyboard.isScancodeDown('right') or love.keyboard.isScancodeDown('d') then dx = dx + 500 * dt end

    if #joysticks > 0 then
        dx = dx + joysticks[1]:getAxis(1) * -500 * dt
        dy = dy + joysticks[1]:getAxis(2) * 500 * dt
    end
    
    if math.abs(dx) > 0.1 then
        love.mouse.setX(love.mouse.getX() + dx)
    end
    if math.abs(dy) > 0.1 then
        love.mouse.setY(love.mouse.getY() + dy)
    end
end


local function getCursorColor(buttons)
    local color = {1, 1, 1}
    local cursorColors = {
        {0.5, 0.5, 0.5},
        {1, 1, 0},
        {1, 0, 1}
    }
    for i = 1, #buttons do
        if buttons[i] then
            color[1] = color[1] * cursorColors[i][1]
            color[2] = color[2] * cursorColors[i][2]
            color[3] = color[3] * cursorColors[i][3]
        end
    end
    return color
end

function love.draw()
    if type(CURRENT_SCENE.draw) == 'function' then CURRENT_SCENE.draw() end

    local cursorRotation = love.timer.getTime() * 3
    love.graphics.push()
        love.graphics.translate(love.mouse.getPosition())
        love.graphics.setLineWidth(3)
        love.graphics.rotate(cursorRotation)
        love.graphics.setColor(getCursorColor({
            love.mouse.isDown(1),
            love.mouse.isDown(2),
            love.mouse.isDown(3)
        }))
        love.graphics.circle('line', 0, 0, 16, 6)
    love.graphics.pop()
    love.graphics.setColor(1, 1, 1, 1)
end

function love.mousepressed(x,y)
    if type(CURRENT_SCENE.click) == 'function' then CURRENT_SCENE.click(x,y) end
end

function love.keypressed(key,scancode)
    if type(CURRENT_SCENE.onKeyPress) == 'function' then
        local continue = CURRENT_SCENE.onKeyPress(key, scancode)
        if continue == false then return end
    end

    if scancode == 'return' then love.mousepressed{love.mouse.getPosition()} end
end
