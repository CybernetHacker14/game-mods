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
    navigationUtils.moveTo(10,8,@onMove)
    navigationUtils.rotateToDir(0)
    me.useWateringCan
    navigationUtils.moveTo(xTemp,yTemp,@onMove)
    navigationUtils.rotateToDir(f)
  end if
  me.useHoe
  me.useWateringCan
end function

main = function
  if me.isBot != 0 and me.name == "Farmtronics Bot 1" then
    print "Bot 1 is starting"
    navigationUtils.moveInGrid(4,10,15,19,@useHoeAndWaterGreenhouse)
  end if
end function

return main