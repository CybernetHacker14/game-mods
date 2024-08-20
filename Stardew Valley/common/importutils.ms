// Taken from - https://github.com/limit07065/farmtronics-lib/blob/main/lib/first.ms

globals.importsafe = function(module)
  if globals.hasIndex(module) then return
  import module
  globals[module] = locals[module]
end function

// directory should end in "/"
globals.importall = function(directory)
  allModules = file.children(directory)

  if not allModules then
    print "Fail to importall for " + directory
    return
  end if

  for module in allModules
    if module.indexOf(".ms") then
      importsafe(directory + module[0:module.len-3])
    end if
  end for

end function

// directory should end in "/"
globals.importpathsaddchilddirs = function(directory)
  for path in file.children(directory)
    info = file.info(directory + path)
    if info.isDirectory then
      if not env.importPaths.indexOf(info.path) then
        env.importPaths.push(info.path)
      end if
    end if
  end for
end function

globals.importpathsremove = function(path)
  length = env.importPaths.len
  for i in range(0, length - 1)
    if env.importPaths[i] == path then
      env.importPaths.remove(i)
      return
    end if
  end for
end function
