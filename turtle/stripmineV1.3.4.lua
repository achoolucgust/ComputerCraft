function split(inputstr, sep)
        if sep == nil then
                sep = "%s"
        end
        local t={}
        for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
                table.insert(t, str)
        end
        return t
end
function isSlot(slot,name)
    turtle.select(slot)
    details = turtle.getItemDetail()
    if details and details["name"]:lower() == name:lower() then
        return true
    end
    return false
end
function refuel(min,max)
    for i = min,max do
        turtle.select(i)
        noerror(turtle.refuel)
    end
    return false
end
function noerror(func)
    return pcall(function()func()end)
end
local counter = 1
while true do
    os.sleep(0.1)
    term.clear()

    local fuel = turtle.getFuelLevel()
    local maxFuel = turtle.getFuelLimit()
    local maxSlots = 16
    local fuelSlot = 1
    local fuelPercentage = math.floor((fuel/maxFuel))
    print(fuel,"out of",maxFuel)
    print(fuelPercentage.."% fuel left.")
    if fuel < 25 then
        print("refueling because "..fuelPercentage.."% left")
        refuel(1,16)
        print("REFUELED!")
    end
    if counter == 1 then
        noerror(turtle.dig())
    elseif counter == 2 then
        noerror(turtle.forward())
    elseif counter == 3 then
        noerror(turtle.digDown())
        counter = 0
    end
    counter = counter + 1
end