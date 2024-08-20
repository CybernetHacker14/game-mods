// Loops a value in a given range, so if the supplied value exceeds the max or min range,
// the difference will be calculated, and it will return a value which lies in the given range
loop = function(value, min, max)
  numberRange = max - min + 1
    
  // Adjust for negative values
  value = value - min
  value = value % numberRange

  // Adjust for negative results from modulo operation
  if value < 0 then
    value = value + numberRange
  end if

  return min + value
end function

areCoordinatesInGrid = function(x, y, xStart, yStart, xEnd, yEnd)
  return x >= xStart and x <= xEnd and y >= yStart and y <= yEnd
end function
