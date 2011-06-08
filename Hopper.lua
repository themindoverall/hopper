Hopper = class('Hopper', GameObject)

mouse = love.mouse

function Hopper:initialize()
  local opts = {
    color = {0,255,51,255},
    pos = {x = 50, y = 50},
    radius = 20
  }
  
  GameObject.initialize(self, opts)
  
  self.target = nil
end

function Hopper:update(dt)
  GameObject.update(self, dt)
  if self.target == nil and mouse.isDown('l') then
    local tar = {x=mouse.getX(), y=mouse.getY()}
    local dx = tar.x - self.pos.x
    local dy = tar.y - self.pos.y
    local d = math.sqrt(dx * dx + dy * dy)
    dx = dx / d
    dy = dy / d
    self.target = {x = self.pos.x + (dx * 90), y = self.pos.y + (dy * 90)}
    
    tween(0.5, self.pos, self.target, tween.easing.inOutCubic, function ()
      self.target = nil
    end)
  end
  
  local cols = GameCore:collide(self)
  for i, cell in ipairs(cols) do
    cell.dead = true
  end
end