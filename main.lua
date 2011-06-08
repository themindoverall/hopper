require 'middleclass'
tween = require 'tween/tween'

require 'GameCore'
require 'GameGUI'
require 'GameDirector'

require 'GameObject'
require 'Hopper'
require 'Cell'

g = love.graphics

function love.load()
  math.randomseed(os.time())
  
  hop = Hopper:new()
  GameGUI:registerPlayer(hop)

  GameDirector:listen(hop, 'deltaScore', 5, function()
    hop.deltaScore = 0
    generateCells()
  end)

  cells = {}
  generateCells()
end

function generateCells()
  for i=0, 4 do
    table.insert(cells, Cell:new({x=math.random(g.getWidth()), y=math.random(g.getHeight())}))
  end
end

function love.update(dt)
  hop:update(dt)
  tween.update(dt)

  GameDirector:update(dt)
end

function love.draw()  
  hop:draw()
  for i, c in ipairs(cells) do
    c:draw()
  end

  GameGUI:draw()
end