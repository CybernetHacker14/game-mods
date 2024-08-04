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
    navigationUtils.moveTo(79,53,@onMove)
    navigationUtils.moveTo(68,53,@onMove)
    navigationUtils.rotateToDir(3)
    me.useWateringCan
    navigationUtils.moveTo(79,51,@onMove)
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
    navigationUtils.moveTo(87,53,@onMove)
    navigationUtils.moveTo(68,53,@onMove)
    navigationUtils.rotateToDir(3)
    me.useWateringCan
    navigationUtils.moveTo(87,51,@onMove)
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
    navigationUtils.moveTo(95,53,@onMove)
    navigationUtils.moveTo(68,53,@onMove)
    navigationUtils.rotateToDir(3)
    me.useWateringCan
    navigationUtils.moveTo(95,51,@onMove)
    navigationUtils.moveTo(xTemp,yTemp,@onMove)
    navigationUtils.rotateToDir(f)
  end if
  if not tileUtils.isTileCrop(me.ahead) then me.useHoe;
  if tileUtils.isTileDry(me.ahead) then me.useWateringCan;
  if tileUtils.isTileCropHarvestable(me.ahead) then me.harvest;
end function

main = function
  if me.isBot != 0 and me.name == "Farmtronics Bot 6" then
    print "Bot 6 is starting"
    navigationUtils.moveTo(98,53,@onMove)
    navigationUtils.moveTo(68,53,@onMove)
    navigationUtils.rotateToDir(3)
    me.useWateringCan
    navigationUtils.moveTo(79,51,@onMove)
    navigationUtils.moveInGrid(76,45,82,51,@useHoeAndWaterFarm001_001)
    navigationUtils.moveTo(79,53,@onMove)
    navigationUtils.moveTo(87,51,@onMove)
    navigationUtils.moveInGrid(84,45,90,51,@useHoeAndWaterFarm001_002)
    navigationUtils.moveTo(87,53,@onMove)
    navigationUtils.moveTo(95,51,@onMove)
    navigationUtils.moveInGrid(92,45,98,51,@useHoeAndWaterFarm001_003)
    navigationUtils.moveTo(95,53,@onMove)
    navigationUtils.moveTo(98,53,@onMove)
  end if
end function

return main