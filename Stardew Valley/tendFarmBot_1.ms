import "coreUtils"
ensureImport "navigationUtils"
ensureImport "toolUtils"
ensureImport "math"

onMove = function(x,y)
  // Do nothing
end function

useHoeAndWaterFarm001_001 = function(x,y)
  if me.inventory[2].waterLeft < 1 then
    xTemp = x
    yTemp = y
    f = me.facing
    navigationUtils.moveTo(71,27,@onMove)
    navigationUtils.moveTo(74,27,@onMove)
    navigationUtils.rotateToDir(2)
    me.useWateringCan
    navigationUtils.moveTo(71,25,@onMove)
    navigationUtils.moveTo(xTemp,yTemp,@onMove)
    navigationUtils.rotateToDir(f)
  end if
  me.useHoe
  me.useWateringCan
end function

useHoeAndWaterFarm001_002 = function(x,y)
  if me.inventory[2].waterLeft < 1 then
    xTemp = x
    yTemp = y
    f = me.facing
    navigationUtils.moveTo(63,27,@onMove)
    navigationUtils.moveTo(74,27,@onMove)
    navigationUtils.rotateToDir(2)
    me.useWateringCan
    navigationUtils.moveTo(63,25,@onMove)
    navigationUtils.moveTo(xTemp,yTemp,@onMove)
    navigationUtils.rotateToDir(f)
  end if
  me.useHoe
  me.useWateringCan
end function

useHoeAndWaterFarm001_003 = function(x,y)
  if me.inventory[2].waterLeft < 1 then
    xTemp = x
    yTemp = y
    f = me.facing
    navigationUtils.moveTo(55,27,@onMove)
    navigationUtils.moveTo(74,27,@onMove)
    navigationUtils.rotateToDir(2)
    me.useWateringCan
    navigationUtils.moveTo(55,25,@onMove)
    navigationUtils.moveTo(xTemp,yTemp,@onMove)
    navigationUtils.rotateToDir(f)
  end if
  me.useHoe
  me.useWateringCan
end function

useHoeAndWaterFarm001_004 = function(x,y)
  if me.inventory[2].waterLeft < 1 then
    xTemp = x
    yTemp = y
    f = me.facing
    navigationUtils.moveTo(47,27,@onMove)
    navigationUtils.moveTo(74,27,@onMove)
    navigationUtils.rotateToDir(2)
    me.useWateringCan
    navigationUtils.moveTo(47,25,@onMove)
    navigationUtils.moveTo(xTemp,yTemp,@onMove)
    navigationUtils.rotateToDir(f)
  end if
  me.useHoe
  me.useWateringCan
end function

main = function
  if me.isBot != 0 and me.name == "Farmtronics Bot 4" then
    print "Bot 4 is starting"
    navigationUtils.moveTo(74,27,@onMove)
    navigationUtils.moveTo(71,25,@onMove)
    navigationUtils.moveInGrid(68,19,74,25,@useHoeAndWaterFarm001_001)
    navigationUtils.moveTo(71,27,@onMove)
    navigationUtils.moveTo(63,25,@onMove)
    navigationUtils.moveInGrid(60,19,66,25,@useHoeAndWaterFarm001_002)
    navigationUtils.moveTo(63,27,@onMove)
    navigationUtils.moveTo(55,25,@onMove)
    navigationUtils.moveInGrid(52,19,58,25,@useHoeAndWaterFarm001_003)
    navigationUtils.moveTo(55,27,@onMove)
    navigationUtils.moveTo(47,25,@onMove)
    navigationUtils.moveInGrid(44,19,50,25,@useHoeAndWaterFarm001_004)
    navigationUtils.moveTo(47,27,@onMove)
    navigationUtils.moveTo(74,27,@onMove)
  end if
end function

return main