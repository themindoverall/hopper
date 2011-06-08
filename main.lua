require 'middleclass'
tween = require 'tween/tween'

require 'GameCore'

require 'GameObject'
require 'Hopper'
require 'Cell'

g = love.graphics

function love.load()
  math.randomseed(os.time())
  
  hop = Hopper:new()
  
  cells = {}
  for i=0, 4 do
    table.insert(cells, Cell:new({x=math.random(640), y=math.random(480)}))
  end
end

function love.update(dt)
  hop:update(dt)
  tween.update(dt)
end

function love.draw()  
  hop:draw()
  for i, c in ipairs(cells) do
    c:draw()
  end
end