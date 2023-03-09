function isSlot(slot,name)
    details = textutils.serialise(turtle.getItemDetail(slot))
    if details["name"].lower().split(":")[2] == name.lower() then
        return true
    end
    return false
end
function unclog(slot,min,max)
    for i = min,max do
        if isSlot(i,"air") then
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
while true do
    os.sleep(1)
    term.clear()

    local fuel = turtle.getFuelLevel()
    local maxFuel = turtle.getFuelLimit()
    local maxSlots = 16
    local fuelSlot = 1
    local fuelPercentage = math.floor((fuel/maxFuel)*10)/10

    term.write(fuelPercentage.." fuel left.")
    if fuelPercentage < 2 then
        term.write("refueling because "..fuelPercentage.." left")
        turtle.select(1)
        turtle.refuel()
        term.write("REFUELED!")
    end
    if not isSlot(fuelSlot,"coal") then
        unclog(1,2,maxSlots)
    end
    noerror(turtle.dig())
    noerror(turtle.forward())
    noerror(turtle.digDown())
end