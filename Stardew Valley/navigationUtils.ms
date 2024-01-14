rotateToDir = function(direction)
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

// This is very simple and low-footprint traversal algo
// I am keeping it this way, since I want to run it on steam deck
// without eating a lot of battery power
// It will just go to final point, and there won't be any
// fancy A* pathfinding or other heuristic's calculation
// So if there's any obstace that's going to be in the probable way, you
// gotta remove it - there won't be any computation to handle that
moveTo = function(x, y)
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
  rotateToDir(xDir)
  while me.position.x != x 
    if me.ahead != null and me.ahead.type == "Character" then
      wait(1)
    else
      me.forward
    end if
  end while
  rotateToDir(yDir)
  while me.position.y != y
    if me.ahead != null and me.ahead.type == "Character" then
      wait(1)
    else
      me.forward
    end if
  end while
end function
