isTileDry = function(tile)
  if tile == null then return false
  return tile.dry
end function

isTileCrop = function(tile)
  if tile == null then return false
  return tile.crop
end function

isTileCropHarvestable = function(tile)
  if tile == null then return false
  return tile.crop and tile.crop.harvestable
end function