Cell = Class{}

function Cell:init(state, red, green, blue, x, y)
    self.state = state
    self.red = red
    self.green = green
    self.blue = blue
    self.x = x
    self.y = y
end


function Cell:revive(red, blue, green)
    self.state = 1
    self.red = red
    self.green = green
    self.blue = blue
end


function Cell:die()
    self.state = 0
    self.red = 0
    self.green = 0
    self.blue = 0
end


