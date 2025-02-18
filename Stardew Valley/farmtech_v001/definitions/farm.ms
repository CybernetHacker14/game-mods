globals.Farm = {}
Farm.data = {} // This should contain the entire data in a JSON-compatible format
Farm.entry = "entry"
Farm.exit = "exit"
Farm.grid = "grid"
Farm.water = "water"
Farm.top = "top"
Farm.bottom = "bottom"
Farm.x = "x"
Farm.y = "y"
Farm.dir = "dir"

Farm.make = function(entryX, entryY, exitX, exitY, topX, topY, bottomX, bottomY, waterPointX, waterPointY, waterPointDir)
  farm = new Farm
  farm.data = {}
  farm.create(entryX, entryY, exitX, exitY, topX, topY, bottomX, bottomY, waterPointX, waterPointY, waterPointDir)
  return farm
end function

Farm.create = function(entryX, entryY, exitX, exitY, topX, topY, bottomX, bottomY, waterPointX, waterPointY, waterPointDir)
  self.data[self.entry] = { self.x : entryX, self.y : entryY }
  self.data[self.exit] = { self.x : exitX, self.y : exitY }
  self.data[self.grid] = { self.top : { self.x : topX, self.y : topY }, self.bottom : { self.x : bottomX, self.y : bottomY } }
  self.data[self.water] = { self.x : waterPointX, self.y : waterPointY, self.dir : waterPointDir }
end function

Farm.Entry = function
  return [ self.data[self.entry][self.x], self.data[self.entry][self.y] ]
end function

Farm.Exit = function
  return [ self.data[self.exit][self.x], self.data[self.exit][self.y] ]
end function

Farm.Top = function
  return [ self.data[self.grid][self.top][self.x], self.data[self.grid][self.top][self.y] ]
end function

Farm.Bottom = function
  return [ self.data[self.grid][self.bottom][self.x], self.data[self.grid][self.bottom][self.y] ]
end function

Farm.Water = function
  return [ self.data[self.water][self.x], self.data[self.water][self.y], self.data[self.water][self.dir] ]
end function

Farm.tend = function(bot)
  onMove = function(x, y)
    // Do nothing
  end function

  localFarm = self

  tendFarmTile = function(x, y)
    if bot.inventory[2].waterLeft < 1 then
      xTemp = x
      yTemp = y
      f = bot.facing
      bot.moveTo(localFarm.Exit[0], localFarm.Exit[1], @onMove)
      bot.moveTo(localFarm.Water[0], localFarm.Water[1], @onMove)
      bot.rotateToDir(localFarm.Water[2])
      bot.useWateringCan
      bot.moveTo(localFarm.Entry[0], localFarm.Entry[1], @onMove)
      bot.moveTo(xTemp, yTemp, @onMove)
      bot.rotateToDir(f)
    end if
    if not tile.isCrop(bot.ahead) then bot.useHoe
    if tile.isDry(bot.ahead) then bot.useWateringCan
    if tile.isHarvestable(bot.ahead) then bot.harvest
  end function

  Farm.tendFarm = function(bot)
    bot.moveTo(self.Entry[0], self.Entry[1], @onMove)
    bot.moveInGrid(self.Top[0], self.Top[1], self.Bottom[0], self.Bottom[1], @tendFarmTile)
    bot.moveTo(self.Exit[0], self.Exit[1], @onMove)
  end function

  self.tendFarm(bot)
end function

globals.FarmActionJSONDataParser = {}
FarmActionJSONDataParser.farms = []
FarmActionJSONDataParser.actions = {}

FarmActionJSONDataParser.make = function
  jsonDataParser = new FarmActionJSONDataParser
  jsonDataParser.farms = []
  jsonDataParser.actions = ActionSequence.make
  return jsonDataParser
end function

FarmActionJSONDataParser.parse = function(bot, filename)
  onMove = function(x, y)
  // Do nothing
  end function

  data = json.parse(file.open(filename).read)

  self.actions.pushAction(bot.moveTo(data.dock.x, data.dock.y, @onMove))
  self.actions.pushAction(bot.moveTo(data.dock.water.x, data.dock.water.y, @onMove))
  self.actions.pushAction(bot.rotateToDir(data.dock.water.dir))
  self.actions.pushAction(bot.useWateringCan)

  for farm in data.farms
    self.farms.push(Farm.make(farm.entry.x, farm.entry.y, 
      farm.exit.x, farm.exit.y, 
      farm.grid.top.x, farm.grid.top.y, 
      farm.grid.bottom.x, farm.grid.bottom.y, 
      farm.water.x, farm.water.y, farm.water.dir))

    self.actions.pushAction(self.farms[self.farms.len - 1].tend(bot))
  end for

  self.actions.pushAction(bot.moveTo(data.dock.x, data.dock.y, @onMove))
end function

FarmActionJSONDataParser.Actions = function
  return self.actions
end function
