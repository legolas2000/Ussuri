--[[
Debug Header
Intercepts Keystrokes to assist in speedy debugging
]]

local engine, lib
local header

header = {
	event_priority = {
		keydown = -503
	},

	event = {
		keydown = function(self, event)
			if (love.keyboard.isDown("lctrl")) then
				if (event.key == "tab") then
					event.cancel = true

					if (love.keyboard.isDown("lshift")) then
						engine.config.log_recording_enabled = true
						engine:log_write(lib.utility.table_tree(engine))
					end

					engine:quit()
				end
			end
		end
	},

	init = function(self, g_engine)
		engine = g_engine
		lib = engine.lib
	end
}

return header