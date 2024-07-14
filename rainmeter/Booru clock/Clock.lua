local counter = 0
local showSeconds = 1
local digits = {
    ["0"] = {
        max     = 22,
        repeats = {5,2,1,1,2,5,2,1,1,2},
        frames  = {1,1,1,1,1,2,2,3,4,5,5,6,6,6,6,6,7,7,8,9,10,10}
    },
    ["1"] = {
        max     = 17,
        repeats = {5,2,1,2,1,2,1,2,1},
        frames  = {1,1,1,1,1,2,2,3,4,4,5,6,6,7,8,8,9}
    },
    ["2"] = {
        max     = 16,
        repeats = {5,2,1,2,1,1,1,1,2},
        frames  = {1,1,1,1,1,2,2,3,4,4,5,6,7,8,9,9}
    },
    ["3"] = {
        max     = 32,
        repeats = {5,1,2,5,1,2,5,1,2,5,1,2},
        frames  = {1,1,1,1,1,2,3,3,4,4,4,4,4,5,6,6,7,7,7,7,7,8,9,9,10,10,10,10,10,11,12,12}
    },
    ["4"] = {
        max     = 10,
        repeats = {1,1,1,1,1,1,1,1,1,1},
        frames  = {1,2,3,4,5,6,7,8,9,10}
    },
    ["5"] = {
        max     = 23,
        repeats = {5,1,3,1,5,2,5,1},
        frames  = {1,1,1,1,1,2,3,3,3,4,5,5,5,5,5,6,6,7,7,7,7,7,8}
    },
    ["6"] = {
        max     = 11,
        repeats = {1,1,2,1,1,1,1,2,1},
        frames  = {1,2,3,3,4,5,6,7,8,8,9}
    },
    ["7"] = {
        max     = 50,
        repeats = {10,2,2,10,2,10,2,10,2},
        frames  = {1,1,1,1,1,1,1,1,1,1,2,2,3,3,4,4,4,4,4,4,4,4,4,4,5,5,6,6,6,6,6,6,6,6,6,6,7,7,8,8,8,8,8,8,8,8,8,8,9,9}
    },
    ["8"] = {
        max     = 31,
        repeats = {20,1,2,2,1,5},
        frames  = {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,3,3,4,4,5,6,6,6,6,6}
    },
    ["9"] = {
        max     = 65,
        repeats = {20,1,10,1,20,2,10,1},
        frames  = {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,3,3,3,3,3,3,3,3,3,3,4,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,6,6,7,7,7,7,7,7,7,7,7,7,8}
    }
}

function Initialize()
    showSeconds = SKIN:GetVariable('showSeconds', 1)
end

function Update()
    counter = counter + 1
    local time = os.date('%X')
    UpdateCrop('ImageHour1Meter',   time:sub(1,1), 0)
    UpdateCrop('ImageHour2Meter',   time:sub(2,2), 8)
    UpdateCrop('ImageMinute1Meter', time:sub(4,4), 4)
    UpdateCrop('ImageMinute2Meter', time:sub(5,5), 10)
    if (showSeconds) then
        UpdateCrop('ImageSecond1Meter', time:sub(7,7), 2)
        UpdateCrop('ImageSecond2Meter', time:sub(8,8), 6)
    end
end

function UpdateCrop(meter, digit, shift)
    local index = ((counter + shift) % digits[digit].max) + 1
    SKIN:Bang('!SetOption', meter, 'ImageCrop', (digits[digit].frames[index]-1)*(45) .. ',' .. (digit*100) .. ',45,100')
end