main = function
if me.isBot != 0 and me.name == "Farmtronics Bot 5" then
    print "Bot 5 is starting"

    parser = FarmActionJSONDataParser.make
    parser.parse(me, "farmtech_v001/data/data_subroutine_5.json")
    parser.Actions.execute

  end if
end function

return main
