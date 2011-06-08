require 'middleclass'

require 'Hopper'
g = love.graphics

function love.load()
  hop = Hopper:new()
end

function love.update(dt)
  hop:update(dt)
end

function love.draw()  
  hop:draw()
end