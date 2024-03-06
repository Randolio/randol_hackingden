Config = {}

Config.Debug = false

Config.ProjectSloth = true -- Set to false if you don't use the ps-ui minigames. [[https://github.com/Project-Sloth/ps-ui]]

Config.MHacking = true -- You should have the mhacking resource by default. Used in qb-bankrobbery. [[https://github.com/qbcore-framework/mhacking]]

Config.FingerPrint = true -- [[https://github.com/utkuali/Finger-Print-Hacking-Game]] -- Download from here.

Config.Blip = {
    Enable = true,
    coords = vector3(751.04, -1906.62, 29.46),
}

Config.SlothMinigames = {
    ["Circle"] = {
        NumberOfCircles = {min = 2, max = 5},
        MS = {min = 10, max = 15},
    },
    ["Maze"] = {
        HackTime = {min = 15, max = 25},
    },
    ["VarHack"] = {
        Blocks = 2,
        Seconds = 3,
    },
    ["Thermite"] = {
        Time = 10, 
        Gridsize = 5, -- Gridsize (5, 6, 7, 8, 9, 10)
        IncorrectBlocks = 3,
    },
    ["Scrambler"] = {
        Type = {"alphabet", "numeric", "alphanumeric", "greek", "braille", "runes"}, -- Type chosen at random.
        Time = 30, -- Seconds
        Mirrored = 0, -- (0: Normal, 1: Normal + Mirrored 2: Mirrored only )
    },
}

Config.CodeBlockMinigame = {
    minChars = 4,
    maxChars = 8, -- Wouldn't go higher than 8, it's hard to see.
    minTime = 15,
    maxTime = 25,
}

Config.FingerHack = {
    levels = {min = 2, max = 4}, -- Max is 4, Min is 1.
    lifes = {min = 0, max = 3}, -- Max is 6.
}