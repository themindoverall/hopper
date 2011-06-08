Cell = class('Cell', GameObject)

function Cell:initialize(pos)
  local opts = {
    pos = pos,
    color = {255, 255, 255, 255},
    radius = 5
  }
  GameObject.initialize(self, opts)
end