# ComputerCraft: Tweaked Stuff

## Are you tired of having to manually write everything?
### Well then, Use this!
#### It's either you copy straight from this repository, or copy and modify!

Just copy, and CTRL + V this line of code into a file.
```lua
return load(http.get("https://raw.githubusercontent.com/achoolucgust/ComputerCraft/main/main.lua"))()
```
Now you can require that file!
```lua
local ccs = require("whateveryounamedyourfile")
ccs.turtle("stripmine")() -- This runs turtle/stripmine.lua
```