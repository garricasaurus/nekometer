local _, nekometer = ...

local bar = {}

local main = nekometer.frames.main
local template = nekometer.bars.template

function bar:new(index)
    local parent = nekometer.frames.barContainer.frame
    local frame = CreateFrame("StatusBar", nil, parent)
    local height = NekometerConfig.barHeight
    local offset = (index - 1) * height
    frame:SetHeight(height)
    frame:SetPoint("TOPLEFT", parent, "TOPLEFT", 0, -offset)
    frame:SetPoint("TOPRIGHT", parent, "TOPRIGHT", 0, -offset)
    frame:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
    local o = {
        frame = frame,
        index = index,
        widgets = template:createWidgets(frame),
    }
    setmetatable(o, self)
    self.__index = self
    return o
end

function bar:SetData(data)
    self:setColor(data.id)
    self.frame:SetMinMaxValues(0, data.maxValue)
    self.frame:SetValue(data.value)
    for _, widget in ipairs(self.widgets) do
        widget.update(data)
    end
end

function bar:Show()
    self.frame:Show()
end

function bar:Hide()
    self.frame:Hide()
end

function bar:setColor(id)
    local c
    local meter = main:GetCurrentMeter()
    if meter.reportsAbilities or not NekometerConfig.classColors then
        c = NekometerConfig.barNeutralColor
    else
        local class = nekometer.classes:Lookup(id)
        if class then
            c = C_ClassColor.GetClassColor(class)
            c.a = 0.6
        else
            c = NekometerConfig.barNeutralColor
        end
    end
    self.frame:SetColorFill(c.r, c.g, c.b, c.a)
end

nekometer.bars = nekometer.bars or {}
nekometer.bars.bar = bar
