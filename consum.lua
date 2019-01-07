return {
	on = {
		devices = {38, 46},
	},
	data = {
	    sumWeight = { initial = 0 }, -- в граммах
	    prevData = { initial = 0 }
	    
	},
 	execute = function(domoticz, item)
	    local id = item.id
	    local ResetDev = domoticz.devices(38)
	    local curWeight = domoticz.devices(46).state
	    local TotalConsumDev = domoticz.devices(39)
	    local sumW = domoticz.data.sumWeight
	    local Time = require('Time')
	    local Now = Time()
	    if domoticz.data.prevData==0 then
	        domoticz.data.prevData = Now
	    end
	    local delta = Now.compare(domoticz.data.prevData).milliseconds
        if id == 38 then
            if (ResetDev.state =='On') then
                ResetDev.switchOff()
                domoticz.data.sumWeight = 0
                TotalConsumDev.updateWeight(0)
            end
    elseif id==46 then
            sumW = sumW + curWeight*delta/3600000
            domoticz.data.prevData = Now
            domoticz.data.sumWeight = sumW
            TotalConsumDev.updateWeight(sumW/1000)            
        end
	end
}