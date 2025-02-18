main = function
if me.isBot != 0 and me.name == "Farmtronics Bot 8" then
    print "Bot 8 is starting"

    parser = FarmActionJSONDataParser.make
    parser.parse(me, "farmtech_v001/data/data_subroutine_8.json")
    parser.Actions.execute

  end if
end function

return main
