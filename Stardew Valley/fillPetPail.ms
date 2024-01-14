import "coreUtils"
ensureImport "navigationUtils"

me.useWateringCan = function
    me.select 2
    me.useTool
end function

// Let's hard-code this initially
traverseWaypoints = function
  navigationUtils.moveTo(53,7)
  navigationUtils.moveTo(53,10)
  navigationUtils.moveTo(73,10)
  navigationUtils.moveTo(73,11)
  navigationUtils.moveTo(76,11)
  navigationUtils.moveTo(76,29)
  navigationUtils.rotateToDir(3)
  me.useWateringCan
  navigationUtils.moveTo(76,11)
  navigationUtils.moveTo(73,11)
  navigationUtils.moveTo(73,10)
  navigationUtils.moveTo(53,10)
  navigationUtils.moveTo(53,7)
  navigationUtils.rotateToDir(1)
  me.useWateringCan
end function

main = function
  if me.isBot != 0 and me.name == "Farmtronics Bot 0" then
    print "Bot is starting"
    traverseWaypoints
  end if
end function

return main