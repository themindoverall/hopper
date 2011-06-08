local _GameDirector = class('GameDirector')

function _GameDirector:initialize()
  Object.initialize(self)

  self.listeners = {}
end

function _GameDirector:update(dt)
	for i, lsn in ipairs(self.listeners) do
		if lsn.object[lsn.property] == lsn.value then
			lsn.func()
		end
	end
end

function _GameDirector:listen(obj, prop, val, fn)
	table.insert(self.listeners, {
		object = obj,
		property = prop,
		value = val,
		func = fn
	})
end

GameDirector = _GameDirector:new()