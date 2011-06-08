Hopper = class('Hopper', Object)

mouse = love.mouse

function Hopper:initialize()
  Object.initialize(self)
  
  self.target = nil
  self.pos = {x = 50, y = 50}
  self.vel = {x = 0, y = 0}
end

function Hopper:update(dt)
  if self.target == nil and mouse.isDown("l") then
    local tar = {x=mouse.getX(),y=mouse.getY()}
    local dx = tar.x - self.pos.x
    local dy = tar.y - self.pos.y
    local d = math.sqrt(dx * dx + dy * dy)
    dx = dx / d
    dy = dy / d
    
    self.vel = {x = dx * 200, y = dy * 200}
    self.target = {x = self.pos.x + (dx * 90), y = self.pos.y + (dy * 90)}
  end
  
  
  if self.target ~= nil then
    local dx = self.pos.x - self.target.x
    local dy = self.pos.y - self.target.y
    local d = math.sqrt(dx * dx + dy * dy)
    if d > 5 then
      self.pos.x = self.pos.x + (self.vel.x * dt)
      self.pos.y = self.pos.y + (self.vel.y * dt)
    else
      self.target = nil
    end 
  end
end

function Hopper:draw()
  g.setColor({255,255,0,255})
  g.circle('fill', self.pos.x, self.pos.y, 20, 16)
end