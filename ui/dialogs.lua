local _, nekometer = ...

local configFrame = nekometer.frames.config
local commands = nekometer.commands

local resetDialog = {
    text = "Reset Nekometer data?",
    button1 = "Yes",
    button2 = "No",
    OnAccept = function ()
        commands:reset()
    end,
    timeout = 0,
    whileDead = true,
    hideOnEscape = true,
    preferredIndex = 3,
}

StaticPopupDialogs["NEKOMETER_RESET"] = resetDialog

local resetSettingsDialog = {
    text = "Reset all settings to default?",
    button1 = "Yes",
    button2 = "No",
    OnAccept = function ()
        configFrame:ResetSettings()
        ReloadUI()
    end,
    timeout = 0,
    whileDead = true,
    hideOnEscape = true,
    preferredIndex = 3,
}

StaticPopupDialogs["NEKOMETER_RESET_SETTINGS"] = resetSettingsDialog

local reloadDialog = {
    text = "Reload required to apply changes.",
    button1 = "OK",
    OnAccept = function ()
        ReloadUI()
    end,
    timeout = 0,
    whileDead = true,
    hideOnEscape = false,
    preferredIndex = 3,
}

StaticPopupDialogs["NEKOMETER_RELOAD"] = reloadDialog