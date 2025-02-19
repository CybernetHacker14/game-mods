me.rotateToDir = function(direction)
  if me.facing == direction or direction == null then
    return
  end if

  diff = me.facing - direction
  rotateRight = diff < 0
  steps = abs(diff)
  for i in range(0, steps-1)
    if rotateRight then
      me.right
    else
      me.left
    end if
  end for
end function

// Move around the tile it's facing currently
// Executes the function on the tile behind the one to be passed
me.moveAroundObject = function(func)
  me.rotateToDir(math.loop(me.facing + 1, 0, 3))
  me.forward
  me.rotateToDir(math.loop(me.facing - 1, 0, 3))
  me.forward
  me.forward
  me.rotateToDir(math.loop(me.facing - 1, 0, 3))
  func(me.position.x, me.position.y)
  me.forward
  me.rotateToDir(math.loop(me.facing + 1, 0, 3))
end function

// Move forward one step properly, checking all objects
me.moveForward = function(func)
  internalCallFunc = function(x,y)
    func(x,y)
  end function

  if me.ahead != null and me.ahead.type == "Character" then
    wait(1)
  else if me.ahead != null and me.ahead.passable == 0 then
    me.moveAroundObject(@internalCallFunc)
  else
    func(me.position.x, me.position.y);
    me.forward
  end if
end function

// Simple, non-heuristic traversal algo
// Executes the function on each tile being passed
me.moveTo = function(x, y, func)
  internalCallFunc = function(x,y)
    func(x,y)
  end function

  xDiff = me.position.x - x
  yDiff = me.position.y - y
  xDir = null
  yDir = null
  if xDiff < 0 then
    xDir = 1
  else if xDiff > 0 then
    xDir = 3
  else
    xDir = null
  end if

  if yDiff < 0 then
    yDir = 2
  else if yDiff > 0 then
    yDir = 0
  else
    yDir = null
  end if

  // Solve x first
  me.rotateToDir(xDir)
  while me.position.x != x
    me.moveForward(@internalCallFunc)
  end while
  me.rotateToDir(yDir)
  while me.position.y != y
    me.moveForward(@internalCallFunc)
  end while
end function

me.moveInGrid = function(xStart, yStart, xEnd, yEnd, func)
  internalCallFunc = function(x,y)
    func(x,y)
  end function
    
  executeFuncForStart = function(x,y)
    f = me.facing
    aheadX = 0
    aheadY = 0

    if f == 0 then aheadX = x; aheadY = y-1
		if f == 1 then aheadX = x+1; aheadY = y
		if f == 2 then aheadX = x; aheadY = y+1
		if f == 3 then aheadX = x-1; aheadY = y

    if aheadX == xStart and abs(aheadY-yStart) <= 1 or
      aheadY == yStart and abs(aheadX-xStart) <= 1 then
      func(x,y)
    end if
  end function

  xIndex = xStart
  yIndex = yStart
  me.moveTo(xStart, yStart, @executeFuncForStart)
  while yIndex <= yEnd
    if me.position.x == xStart then
      me.moveTo(xEnd, yIndex, @internalCallFunc)
      yIndex = yIndex + 1
      if yIndex <= yEnd then
        me.moveTo(xEnd, yIndex, @internalCallFunc)
      end if
    else if me.position.x == xEnd then
      me.moveTo(xStart, yIndex, @internalCallFunc)
      yIndex = yIndex + 1
      if yIndex <= yEnd then
        me.moveTo(xStart, yIndex, @internalCallFunc)
      end if
    end if
  end while
end function
