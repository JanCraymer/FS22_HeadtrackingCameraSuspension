HeadtrackingCameraSuspension = {}

---Called when camera suspension setting has changed
-- @param bool newState new setting state
function HeadtrackingCameraSuspension:onActiveCameraSuspensionSettingChanged(superFunc, newState)
    -- print("VehicleCamera:onActiveCameraSuspensionSettingChanged")

    if self.suspensionNode ~= nil then
        if self.lastActiveCameraSuspensionSetting ~= newState then
            if newState then
                link(self.cameraSuspensionParentNode, self.cameraPositionNode)
            else
                link(self.cameraBaseParentNode, self.cameraPositionNode)
            end

            -- Update headTrackingNode
            if self.headTrackingNode ~= nil then
                link(getParent(self.cameraPositionNode), self.headTrackingNode)
            end

            self.lastActiveCameraSuspensionSetting = newState
        end
    end
end

VehicleCamera.onActiveCameraSuspensionSettingChanged = Utils.overwrittenFunction(VehicleCamera.onActiveCameraSuspensionSettingChanged, HeadtrackingCameraSuspension.onActiveCameraSuspensionSettingChanged)
