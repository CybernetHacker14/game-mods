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
    navigationUtils.moveTo(71,34,@onMove)
    navigationUtils.moveTo(74,34,@onMove)
    navigationUtils.rotateToDir(0)
    me.useWateringCan
    navigationUtils.moveTo(71,36,@onMove)
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
    navigationUtils.moveTo(63,34,@onMove)
    navigationUtils.moveTo(74,34,@onMove)
    navigationUtils.rotateToDir(0)
    me.useWateringCan
    navigationUtils.moveTo(63,36,@onMove)
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
    navigationUtils.moveTo(55,34,@onMove)
    navigationUtils.moveTo(74,34,@onMove)
    navigationUtils.rotateToDir(0)
    me.useWateringCan
    navigationUtils.moveTo(55,36,@onMove)
    navigationUtils.moveTo(xTemp,yTemp,@onMove)
    navigationUtils.rotateToDir(f)
  end if
  if not tileUtils.isTileCrop(me.ahead) then me.useHoe;
  if tileUtils.isTileDry(me.ahead) then me.useWateringCan;
  if tileUtils.isTileCropHarvestable(me.ahead) then me.harvest;
end function

useHoeAndWaterFarm001_004 = function(x,y)
  if me.inventory[2].waterLeft < 1 then
    xTemp = x
    yTemp = y
    f = me.facing
    navigationUtils.moveTo(47,34,@onMove)
    navigationUtils.moveTo(74,34,@onMove)
    navigationUtils.rotateToDir(0)
    me.useWateringCan
    navigationUtils.moveTo(47,36,@onMove)
    navigationUtils.moveTo(xTemp,yTemp,@onMove)
    navigationUtils.rotateToDir(f)
  end if
  if not tileUtils.isTileCrop(me.ahead) then me.useHoe;
  if tileUtils.isTileDry(me.ahead) then me.useWateringCan;
  if tileUtils.isTileCropHarvestable(me.ahead) then me.harvest;
end function

main = function
  if me.isBot != 0 and me.name == "Farmtronics Bot 2" then
    print "Bot 2 is starting"
    navigationUtils.moveTo(74,34,@onMove)
    navigationUtils.rotateToDir(0)
    me.useWateringCan
    navigationUtils.moveTo(71,36,@onMove)
    navigationUtils.moveInGrid(68,36,74,42,@useHoeAndWaterFarm001_001)
    navigationUtils.moveTo(71,34,@onMove)
    navigationUtils.moveTo(63,36,@onMove)
    navigationUtils.moveInGrid(60,36,66,42,@useHoeAndWaterFarm001_002)
    navigationUtils.moveTo(63,34,@onMove)
    navigationUtils.moveTo(55,36,@onMove)
    navigationUtils.moveInGrid(52,36,58,42,@useHoeAndWaterFarm001_003)
    navigationUtils.moveTo(55,34,@onMove)
    navigationUtils.moveTo(47,36,@onMove)
    navigationUtils.moveInGrid(44,36,50,42,@useHoeAndWaterFarm001_004)
    navigationUtils.moveTo(47,34,@onMove)
    navigationUtils.moveTo(74,34,@onMove)
  end if
end function

return main