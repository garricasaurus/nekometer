local lu = require("luaunit")

require("core.aggregator_test")
require("core.autohide_test")
require("core.autoreset_test")
require("core/cache_test")
require("core/commands_test")
require("core/dispatcher_test")
require("core/event_test")
require("core/pets_test")
require("core/report_test")
require("core/specs_test")
require("core/util_test")

require("meters/base_meter_test")
require("meters/damage_breakdown_test")
require("meters/damage_test")
require("meters/deaths_test")
require("meters/dispels_test")
require("meters.dps_test")
require("meters/healing_breakdown_test")
require("meters/healing_test")
require("meters/interrupts_test")
require("meters/overheal_test")

os.exit(lu.LuaUnit.run())