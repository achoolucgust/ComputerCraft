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
function isSlot(slot,name) -- WORKS probably. -- doesnt work
    turtle.select(slot)
    details = turtle.getItemDetail()
    if details then
        if details["name"] == name then
            return true
        end
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
function get_mineral() -- for that one mineral chances mod.
    noerror(turtle.suckDown())
    return false
end
function drop_useless(min,max) -- Probably works now! ignore next few lines. -- dont use, i have no idea how to check the details name.
    for i = min,max do
        turtle.select(i)
        if isSlot(i,"minecraft:cobblestone") then
            turtle.dropUp()
        end
    end
    return false
end
function noerror(func)
    return pcall(function()func()end)
end
local counter = 1
while true do
    term.clear()
    
    local fuel = turtle.getFuelLevel()
    local maxFuel = turtle.getFuelLimit()
    local fuelPercentage = math.floor((fuel/maxFuel))
    print(fuel,"out of",maxFuel)
    print(fuelPercentage.."% fuel left.")
    get_mineral()
    if fuel < 25 then
        print("refueling because "..fuelPercentage.."% left")
        refuel(1,16)
        print("REFUELED!")
    end
    print("Action: "..counter)
    if counter == 1 then
        noerror(turtle.dig)
    elseif counter == 2 then
        noerror(turtle.forward)
    elseif counter == 3 then
        noerror(turtle.digDown)
    elseif counter == 4 then
        noerror(turtle.turnLeft)
    elseif counter == 5 then
        noerror(turtle.dig)
    elseif counter == 6 then
        noerror(turtle.turnRight)
    elseif counter == 7 then
        noerror(turtle.turnRight)
    elseif counter == 8 then
        noerror(turtle.dig)
    elseif counter == 9 then
        noerror(turtle.turnLeft)
        counter = 0
    end
    if counter > 9 then
        counter = 0
    end
    counter = counter + 1
end