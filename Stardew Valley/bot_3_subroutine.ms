import "coreUtils"
ensureImport "navigationUtils"
ensureImport "toolUtils"

onMove = function(x,y)
  // Do nothing
end function

useHoeAndWaterGreenhouse = function(x,y)
  if me.inventory[2].waterLeft < 1 then
    xTemp = x
    yTemp = y
    f = me.facing
    navigationUtils.moveTo(9,8,@onMove)
    navigationUtils.rotateToDir(0)
    me.useWateringCan
    navigationUtils.moveTo(9, yTemp,@onMove)
    navigationUtils.moveTo(xTemp,yTemp,@onMove)
    navigationUtils.rotateToDir(f)
  end if
  if not tileUtils.isTileCrop(me.ahead) then me.useHoe;
  if tileUtils.isTileDry(me.ahead) then me.useWateringCan;
  if tileUtils.isTileCropHarvestable(me.ahead) then me.harvest;
end function

main = function
  if me.isBot != 0 and me.name == "Farmtronics Bot 3" then
    print "Bot 3 is starting"
    navigationUtils.moveTo(5,10,@onMove)
    navigationUtils.moveInGrid(4,10,15,19,@useHoeAndWaterGreenhouse)
    navigationUtils.rotateToDir(2)
    me.forward
  end if
end function

return main