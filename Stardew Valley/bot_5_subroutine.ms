import "coreUtils"
ensureImport "navigationUtils"
ensureImport "toolUtils"
ensureImport "tileUtils"
ensureImport "math"

onMove = function(x,y)
  // Do nothing
end function

useHoeAndWaterFarm001_001 = function(x,y)
  if me.inventory[2].waterLeft < 1 then
    xTemp = x
    yTemp = y
    f = me.facing
    navigationUtils.moveTo(55,45,@onMove)
    navigationUtils.moveTo(40,45,@onMove)
    navigationUtils.rotateToDir(0)
    me.useWateringCan
    navigationUtils.moveTo(55,47,@onMove)
    navigationUtils.moveTo(xTemp,yTemp,@onMove)
    navigationUtils.rotateToDir(f)
  end if
  if not tileUtils.isTileCrop(me.ahead) then me.useHoe;
  if tileUtils.isTileDry(me.ahead) then me.useWateringCan;
  if tileUtils.isTileCropHarvestable(me.ahead) then me.harvest;
end function

useHoeAndWaterFarm001_002 = function(x,y)
  if me.inventory[2].waterLeft < 1 then
    xTemp = x
    yTemp = y
    f = me.facing
    navigationUtils.moveTo(63,45,@onMove)
    navigationUtils.moveTo(40,45,@onMove)
    navigationUtils.rotateToDir(2)
    me.useWateringCan
    navigationUtils.moveTo(63,47,@onMove)
    navigationUtils.moveTo(xTemp,yTemp,@onMove)
    navigationUtils.rotateToDir(f)
  end if
  if not tileUtils.isTileCrop(me.ahead) then me.useHoe;
  if tileUtils.isTileDry(me.ahead) then me.useWateringCan;
  if tileUtils.isTileCropHarvestable(me.ahead) then me.harvest;
end function

useHoeAndWaterFarm001_003 = function(x,y)
  if me.inventory[2].waterLeft < 1 then
    xTemp = x
    yTemp = y
    f = me.facing
    navigationUtils.moveTo(71,45,@onMove)
    navigationUtils.moveTo(40,45,@onMove)
    navigationUtils.rotateToDir(2)
    me.useWateringCan
    navigationUtils.moveTo(71,47,@onMove)
    navigationUtils.moveTo(xTemp,yTemp,@onMove)
    navigationUtils.rotateToDir(f)
  end if
  if not tileUtils.isTileCrop(me.ahead) then me.useHoe;
  if tileUtils.isTileDry(me.ahead) then me.useWateringCan;
  if tileUtils.isTileCropHarvestable(me.ahead) then me.harvest;
end function

main = function
  if me.isBot != 0 and me.name == "Farmtronics Bot 5" then
    print "Bot 5 is starting"
    navigationUtils.moveTo(74,45,@onMove)
    navigationUtils.moveTo(40,45,@onMove)
    navigationUtils.rotateToDir(2)
    me.useWateringCan
    navigationUtils.moveTo(55,47,@onMove)
    navigationUtils.moveInGrid(52,47,58,53,@useHoeAndWaterFarm001_001)
    navigationUtils.moveTo(55,45,@onMove)
    navigationUtils.moveTo(63,47,@onMove)
    navigationUtils.moveInGrid(60,47,66,53,@useHoeAndWaterFarm001_002)
    navigationUtils.moveTo(63,45,@onMove)
    navigationUtils.moveTo(71,47,@onMove)
    navigationUtils.moveInGrid(68,47,74,53,@useHoeAndWaterFarm001_003)
    navigationUtils.moveTo(71,45,@onMove)
    navigationUtils.moveTo(74,45,@onMove)
  end if
end function

return main