globals.ActionSequence = {}
ActionSequence.actionList = []

ActionSequence.make = function
  sequence = new ActionSequence
  sequence.actionList = []
  return sequence
end function

ActionSequence.pushAction = function(func)
  self.actionList.push(func)
end function

ActionSequence.removeAtIndex = function(index)
  self.actionList.remove(index)
end function

ActionSequence.execute = function
  for action in self.actionList
    action
  end for
end function
