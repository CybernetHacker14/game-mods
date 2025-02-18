main = function
if me.isBot != 0 and me.name == "Farmtronics Bot 6" then
    print "Bot 6 is starting"

    parser = FarmActionJSONDataParser.make
    parser.parse(me, "farmtech_v001/data/data_subroutine_6.json")
    parser.Actions.execute

  end if
end function

return main
