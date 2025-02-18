onMove = function(x,y)
  // Do nothing
end function

main = function
  if me.isBot != 0 and me.name == "Farmtronics Bot 0" then
    print "Bot 0 is starting"

    // Keep all data inside the main function,
    // so that other scripts will not execute or otherwise interfere with other functionalities

    actions = ActionSequence.make
    actions.pushAction(me.moveTo(53,7,@onMove))
    actions.pushAction(me.moveTo(53,10,@onMove))
    actions.pushAction(me.moveTo(73,10,@onMove))
    actions.pushAction(me.moveTo(73,11,@onMove))
    actions.pushAction(me.moveTo(76,11,@onMove))
    actions.pushAction(me.moveTo(76,13,@onMove))
    actions.pushAction(me.rotateToDir(1))
    actions.pushAction(me.useWateringCan)
    actions.pushAction(me.moveTo(76,14,@onMove))
    actions.pushAction(me.rotateToDir(1))
    actions.pushAction(me.useWateringCan)
    actions.pushAction(me.moveTo(76,29,@onMove))
    actions.pushAction(me.rotateToDir(3))
    actions.pushAction(me.useWateringCan)
    actions.pushAction(me.moveTo(76,11,@onMove))
    actions.pushAction(me.moveTo(73,11,@onMove))
    actions.pushAction(me.moveTo(73,10,@onMove))
    actions.pushAction(me.moveTo(53,10,@onMove))
    actions.pushAction(me.moveTo(53,7,@onMove))
    actions.pushAction(me.rotateToDir(1))
    actions.pushAction(me.useWateringCan)

    actions.execute
  end if
end function

return main
