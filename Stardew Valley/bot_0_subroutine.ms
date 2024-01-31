import "coreUtils"
ensureImport "navigationUtils"
ensureImport "toolUtils"

onMove = function(x,y)
  // Do nothing
end function

// Let's hard-code this initially
traverseWaypoints = function
  navigationUtils.moveTo(53,7,@onMove)
  navigationUtils.moveTo(53,10,@onMove)
  navigationUtils.moveTo(73,10,@onMove)
  navigationUtils.moveTo(73,11,@onMove)
  navigationUtils.moveTo(76,11,@onMove)
  navigationUtils.moveTo(76,13,@onMove)
  navigationUtils.rotateToDir(1)
  me.useWateringCan
  navigationUtils.moveTo(76,14,@onMove)
  navigationUtils.rotateToDir(1)
  me.useWateringCan
  navigationUtils.moveTo(76,29,@onMove)
  navigationUtils.rotateToDir(3)
  me.useWateringCan
  navigationUtils.moveTo(76,11,@onMove)
  navigationUtils.moveTo(73,11,@onMove)
  navigationUtils.moveTo(73,10,@onMove)
  navigationUtils.moveTo(53,10,@onMove)
  navigationUtils.moveTo(53,7,@onMove)
  navigationUtils.rotateToDir(1)
  me.useWateringCan
end function

main = function
  if me.isBot != 0 and me.name == "Farmtronics Bot 0" then
    print "Bot 0 is starting"
    traverseWaypoints
  end if
end function

return main