s = request['content'];

local STAT = {[0]="Ожидание",[1]="Розжиг",[2]="Нагрев",[3]="Нерозжиг",[4]="Электрокотел",
              [5]="Дрова",[6]="Ожид. температуры",[7]="Стоп по температуре"}
local pod = 0+(domoticz_applyXPath(s,'//val0/text()') .. "." .. domoticz_applyXPath(s,'//val6/text()'))
local obr = 0+(domoticz_applyXPath(s,'//val1/text()') .. "." .. domoticz_applyXPath(s,'//val7/text()'))
local power = 0+(domoticz_applyXPath(s,'//val2/text()') .. "." .. domoticz_applyXPath(s,'//val10/text()'))
local flame = 0+domoticz_applyXPath(s,'//val4/text()')
local consum = 0+domoticz_applyXPath(s,'//val3/text()')
local rezh = domoticz_applyXPath(s,'//val5/text()')
-- local ustobr = domoticz_applyXPath(s,'//val8/text()')

domoticz_updateDevice(41,'',pod)
domoticz_updateDevice(42,'',obr)
domoticz_updateDevice(43,'',power*1000)
-- domoticz_updateDevice(53,'',rezh)
domoticz_updateDevice(44,'',STAT[0+rezh])
domoticz_updateDevice(45,'',flame)
domoticz_updateDevice(46,'',consum*100)
-- domoticz_updateDevice(52,'',ustobr)
