local main = {}

function main.turtle(scriptname)
    return load(http.get("https://raw.githubusercontent.com/achoolucgust/ComputerCraft/main/turtle/"..scriptname..".lua"))
end

function main.computer(scriptname)
    return load(http.get("https://raw.githubusercontent.com/achoolucgust/ComputerCraft/main/computer/"..scriptname..".lua"))
end

return main