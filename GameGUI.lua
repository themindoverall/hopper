local _GameGUI = class('GameGUI')

function _GameGUI:initialize()
  Object.initialize(self)
  
  self.mainPlayer = nil
end

function _GameGUI:registerPlayer(player)
	self.mainPlayer = player
end

function _GameGUI:draw()
	g.setColor(255,255,255,255)
	g.print(string.format("Score: %d", self.mainPlayer.score), 5,5)
end

GameGUI = _GameGUI:new()