GameObject = class('GameObject', Object)

function GameObject:initialize(opts)
  Object.initialize(self)
  
  GameCore:register(self)
  
  self.pos = opts.pos or {x=0, y=0}
  self.vel = {x = 0, y = 0}
  self.radius = opts.radius or 10
  self.color = opts.color or {255, 255, 255, 255}
  self.dead = false
end

function GameObject:update(dt)
  for k, v in pairs(self.vel) do
    self.pos[k] = self.pos[k] + (v * dt)
  end
end


function GameObject:draw()
  if self.dead then
    return
  end
  g.setColor(self.color)
  g.circle('fill', self.pos.x, self.pos.y, self.radius, 16)
end