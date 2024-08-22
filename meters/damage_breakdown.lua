local _, nekometer = ...

local meter = {
    title = "Damage Breakdown",
    aggregator = nekometer.aggregator:new(),
}

function meter:CombatEvent(e)
    if e:IsDoneByPlayer() and (e:IsDamage() or e:IsSpellReflect()) then
        local ability = e:GetAbilityName()
        local amount = e:GetAmount()
        self.aggregator:Add({
            key = ability,
            name = ability,
            value = amount,
        })
    end
end

function meter:Report()
    local data = self.aggregator:GetData()
    return nekometer.CreateReport(data, false)
end

function meter:Reset()
    self.aggregator:Clear()
end

nekometer.meters = nekometer.meters or {}
nekometer.meters.damageBreakdown = meter
