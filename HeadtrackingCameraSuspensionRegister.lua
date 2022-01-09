if g_specializationManager:getSpecializationByName("headtrackingCameraSuspension") == nil then
    g_specializationManager:addSpecialization(
      "headtrackingCameraSuspension", 
      "HeadtrackingCameraSuspension", 
      Utils.getFilename("HeadtrackingCameraSuspension.lua", 
      g_currentModDirectory), 
      true
    )
end

for typeName, typeEntry in pairs(g_vehicleTypeManager.types) do
  if
        
      SpecializationUtil.hasSpecialization(Enterable, typeEntry.specializations)
     
  
  then
       g_vehicleTypeManager:addSpecialization(typeName, "headtrackingCameraSuspension")
  end
end