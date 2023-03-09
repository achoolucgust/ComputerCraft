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
function unclog(slot,min,max)
    for i = min,max do
        if isSlot(i,"minecraft:air") then
            turtle.select(slot)
            turtle.transferTo(i)
            return true
        end
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
    if fuel < 2 then
        print("refueling because "..fuelPercentage.."% left")
        turtle.select(1)
        turtle.refuel()
        print("REFUELED!")
    end
    if not isSlot(fuelSlot,"minecraft:coal") then
        unclog(1,2,maxSlots)
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