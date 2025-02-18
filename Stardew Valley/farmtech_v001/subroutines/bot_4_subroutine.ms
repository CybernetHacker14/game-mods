onMove = function(x,y)
  // Do nothing
end function

main = function
  if me.isBot != 0 and me.name == "Farmtronics Bot 4" then
    print "Bot 4 is starting"

    // Keep all data inside the main function,
    // so that other scripts will not execute or otherwise interfere with other functionalities

    actions = ActionSequence.make
    actions.pushAction(me.moveTo(11,8,@onMove))
    actions.pushAction(me.rotateToDir(0))
    actions.pushAction(me.useWateringCan)
    actions.pushAction(me.moveTo(12,8,@onMove))
    actions.pushAction(me.rotateToDir(0))
    actions.pushAction(me.useWateringCan)
    actions.pushAction(me.moveTo(10,8,@onMove))
    actions.pushAction(me.rotateToDir(0))
    actions.pushAction(me.useWateringCan)

    actions.execute
  end if
end function

return main
