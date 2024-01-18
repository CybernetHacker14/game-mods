globals.ensureImport = function(module)
  if globals.hasIndex(module) then return
  import module
  globals[module] = locals[module]
end function