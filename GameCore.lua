local _GameCore = class('GameCore')

function _GameCore:initialize()
  Object.initialize(self)
  
  self.gameObjects = {}
end

function _GameCore:register(obj)
  table.insert(self.gameObjects, obj)
end

function _GameCore:collide(obj)
  cols = {}
    
  for i, obj2 in ipairs(self.gameObjects) do
    if obj ~= obj2 and not obj2.dead then 
      local dx, dy, d
      dx = obj.pos.x - obj2.pos.x
      dy = obj.pos.y - obj2.pos.y
      d = math.sqrt(dx * dx + dy * dy)
      if d <= obj.radius + obj2.radius then
        table.insert(cols, obj2)
      end
    end
  end
  
  return cols
end

GameCore = _GameCore:new()
