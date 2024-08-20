isDry = function(tile)
  if tile == null then return false
  return tile.dry
end function

isCrop = function(tile)
  if tile == null then return false
  return tile.crop
end function

isHarvestable = function(tile)
  if tile == null then return false
  return tile.crop and tile.crop.harvestable
end function
