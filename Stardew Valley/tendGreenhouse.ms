import "coreUtils"
ensureImport "navigationUtils"

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
    me.select 2
    me.useTool
    print xTemp + " " + yTemp
    navigationUtils.moveTo(xTemp,yTemp,@onMove)
    navigationUtils.rotateToDir(f)
  end if
  me.select 1
  me.useTool
  me.select 2
  me.useTool
end function

main = function
  if me.isBot != 0 and me.name == "Farmtronics Bot 1" then
    print "Bot is starting"
    // navigationUtils.moveInGrid(44,19,50,25,@useHoeAndWater)
    navigationUtils.moveInGrid(4,10,15,19,@useHoeAndWaterGreenhouse)
  end if
end function

return main