import "coreUtils"
ensureImport "navigationUtils"
ensureImport "toolUtils"
ensureImport "tileUtils"
ensureImport "math"

onMove = function(x,y)
  // Do nothing
end function

traverseWaypoints = function
  navigationUtils.moveTo(11,8,@onMove)
  navigationUtils.rotateToDir(0)
  me.useWateringCan
  navigationUtils.moveTo(12,8,@onMove)
  navigationUtils.rotateToDir(0)
  me.useWateringCan
  navigationUtils.moveTo(10,8,@onMove)
  navigationUtils.rotateToDir(0)
  me.useWateringCan
end function

main = function
  if me.isBot != 0 and me.name == "Farmtronics Bot 1" then
    print "Bot 1 is starting"
    traverseWaypoints
  end if
end function

return main