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
    navigationUtils.moveTo(71,55,@onMove)
    navigationUtils.moveTo(66,55,@onMove)
    navigationUtils.rotateToDir(3)
    me.useWateringCan
    navigationUtils.moveTo(71,57,@onMove)
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
    navigationUtils.moveTo(79,55,@onMove)
    navigationUtils.moveTo(66,55,@onMove)
    navigationUtils.rotateToDir(3)
    me.useWateringCan
    navigationUtils.moveTo(79,57,@onMove)
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
    navigationUtils.moveTo(87,55,@onMove)
    navigationUtils.moveTo(66,55,@onMove)
    navigationUtils.rotateToDir(3)
    me.useWateringCan
    navigationUtils.moveTo(87,57,@onMove)
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
    navigationUtils.moveTo(95,55,@onMove)
    navigationUtils.moveTo(66,55,@onMove)
    navigationUtils.rotateToDir(3)
    me.useWateringCan
    navigationUtils.moveTo(95,57,@onMove)
    navigationUtils.moveTo(xTemp,yTemp,@onMove)
    navigationUtils.rotateToDir(f)
  end if
  if not tileUtils.isTileCrop(me.ahead) then me.useHoe;
  if tileUtils.isTileDry(me.ahead) then me.useWateringCan;
  if tileUtils.isTileCropHarvestable(me.ahead) then me.harvest;
end function

main = function
  if me.isBot != 0 and me.name == "Farmtronics Bot 7" then
    print "Bot 7 is starting"
    navigationUtils.moveTo(98,55,@onMove)
    navigationUtils.moveTo(66,55,@onMove)
    navigationUtils.rotateToDir(3)
    me.useWateringCan
    navigationUtils.moveTo(71,57,@onMove)
    navigationUtils.moveInGrid(68,57,74,63,@useHoeAndWaterFarm001_001)
    navigationUtils.moveTo(71,55,@onMove)
    navigationUtils.moveTo(79,57,@onMove)
    navigationUtils.moveInGrid(76,57,82,63,@useHoeAndWaterFarm001_002)
    navigationUtils.moveTo(79,55,@onMove)
    navigationUtils.moveTo(87,57,@onMove)
    navigationUtils.moveInGrid(84,57,90,63,@useHoeAndWaterFarm001_003)
    navigationUtils.moveTo(87,55,@onMove)
    navigationUtils.moveTo(95,57,@onMove)
    navigationUtils.moveInGrid(92,57,98,63,@useHoeAndWaterFarm001_004)
    navigationUtils.moveTo(95,55,@onMove)
    navigationUtils.moveTo(98,55,@onMove)
  end if
end function

return main