return {
	on = {
		devices = {31, 32},
		timer = {'every other minute'}
	},
	data = {
	    state = { initial = 0 }
	},
	execute = function(domoticz, item)
	    local TermSwDev = domoticz.devices(32)
	    local SetTermDev = domoticz.devices(31)
	    local OutpDev = domoticz.devices(24)
	    local Hist = 0.5
	    local Outp = OutpDev.state
	    local SetTemp = SetTermDev.setPoint
	    local Temp = domoticz.devices(7).temperature

        if (TermSwDev.state =='On') then
            if (Temp >= SetTemp) then
     		    if (OutpDev.state == 'On') then
                    OutpDev.switchOff()
                end
            elseif (Temp < (SetTemp-Hist) ) then
     		    if (OutpDev.state == 'Off') then
                    OutpDev.switchOn()
                end
            end    
        else
		    if (OutpDev.state == 'On') then
                OutpDev.switchOff()
            end
        end
	end
}