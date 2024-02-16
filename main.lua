push = require 'libraries/push'
Class = require 'libraries/class'

require 'classes/Cell'

WINDOW_WIDTH = 2000
WINDOW_HEIGHT = 1200

CELL_SIZE = 20
cols = WINDOW_WIDTH / CELL_SIZE
rows = WINDOW_HEIGHT / CELL_SIZE
cellCount = rows * cols
grid = {}
newState = {}
icolor = 1
myTimer = 0
redG = 0
greenG = 0
blueG = 0




function love.load()    
    push:setupScreen(WINDOW_WIDTH, WINDOW_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        vsync = true,
        fullscreen = false,
        resizable = false
    })
    love.window.setTitle('Rainbow Game of Life!')
    math.randomseed(os.time())

    --              The color list is derived from 24-bit values. Bits 0-7 are blue, 8-15 are green, and 16-23 are red.
    colorlist = {   16711680,   16744448,   16776960,   8453888,    65280,  65408,  65535,  33023,  255,    8388863,    16711935,   16711808}
    --              red         orange      yellow      litegreen   green   teal    aqua    indigo  blue    purple      magenta     pink

    setColorWith24BitVal(colorlist[icolor])

    for i=1, cellCount, 1 do
        xIndex  = (i - 1) % cols
        yIndex  = ((i - 1 - xIndex) / rows) * WINDOW_HEIGHT / WINDOW_WIDTH
        grid[i] = Cell(math.floor(math.random() + 0.5), redG, greenG, blueG, xIndex, yIndex)
    end
end




function love.update(dt) 
    myTimer = myTimer + dt

    if myTimer < .0625 then
        do return end
    end

    myTimer = 0
    icolor = icolor + 1
    if icolor > 12 then icolor = 1 end
    setColorWith24BitVal(colorlist[icolor])

    for i=1, cellCount, 1 do
        local neighbors = checkneighbors(grid[i].x, grid[i].y)

        if grid[i].state == 1 then
            if neighbors < 2 or neighbors > 3 then
                newState[i] = 0
            end
        elseif grid[i].state == 0 and sum == 3 then
            newState[i] = 1
        else
            newState[i] = grid[i].state
        end
    end

    if love.mouse.isDown({0, 1, 2}) then
        mouseX = love.mouse.getX()
        mouseY = love.mouse.getY()
        mouseX = (mouseX - (mouseX % CELL_SIZE)) / CELL_SIZE + 1
        mouseY = (mouseY - (mouseY % CELL_SIZE)) / CELL_SIZE
        newState[(mouseX + (mouseY * cols))] = 1
    end

    for i=1, cellCount, 1 do
        if newState[i] ~= grid[i].state then
            if newState[i] == 1 then
                grid[i]:revive( redG,  greenG, blueG )
            elseif newState[i] == 0 then
                grid[i]:die()
            else
                grid[i]:die()
            end
        end
    end
end




function love.draw()
    for i=1, cellCount, 1 do
        if grid[i].state == 1 then
            love.graphics.setColor(love.math.colorFromBytes(grid[i].red, grid[i].green, grid[i].blue, 255))
            love.graphics.rectangle('fill', (grid[i].x * CELL_SIZE), (grid[i].y * CELL_SIZE), CELL_SIZE - 1, CELL_SIZE - 1)
        end
    end
end




function checkneighbors(x, y)
    sum = 0
    for i=x-1, x+1, 1 do
        for j=y-1, y+1, 1 do
            c = (i + cols) % cols
            r = (j + rows) % rows
            sum = sum + grid[(c + (r * cols)) + 1].state
        end
    end
    sum = sum - grid[(x + (y * cols)) + 1].state
    return sum
end




function setColorWith24BitVal(sum)
    tsum = sum
    blueG = tsum % 256

    tsum = (tsum - blueG) / 256
    greenG = tsum % (256)

    redG = (tsum - greenG) / 256
end
