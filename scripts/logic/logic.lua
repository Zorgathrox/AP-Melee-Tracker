-- put logic functions here using the Lua API: https://github.com/black-sliver/PopTracker/blob/master/doc/PACKS.md#lua-interface
-- don't be afraid to use custom logic functions. it will make many things a lot easier to maintain, for example by adding logging.
-- to see how this function gets called, check: locations/locations.json
-- example:
function has_more_then_n_consumable(n)
    local count = Tracker:ProviderCountForCode('consumable')
    local val = (count > tonumber(n))
    if ENABLE_DEBUG_LOG then
        print(string.format("called has_more_then_n_consumable: count: %s, n: %s, val: %s", count, n, val))
    end
    if val then
        return 1 -- 1 => access is in logic
    end
    return 0 -- 0 => no access
end

function got_character(char_code)
    local character = Tracker:ProviderCountForCode(char_code)
    local val = (character == 1)
    if val then 
        return 1
    end
    return 0
end

function got_all_characters()
    local all_char_codes = {
        "CharacterDrMario",
        "CharacterMario",
        "CharacterLuigi",
        "CharacterBowser",
        "CharacterPeach",
        "CharacterYoshi",
        "CharacterDonkeyKong",
        "CharacterCaptainFalcon",
        "CharacterGanondorf",
        "CharacterFalco",
        "CharacterFox",
        "CharacterNess",
        "CharacterIceClimbers",
        "CharacterKirby",
        "CharacterSamus",
        "CharacterZelda",
        "CharacterLink",
        "CharacterYoungLink",
        "CharacterPichu",
        "CharacterPikachu",
        "CharacterJigglypuff",
        "CharacterMewtwo",
        "CharacterMrGame&Watch",
        "CharacterMarth",
        "CharacterRoy"
    }
    for i=1, 25 do
        if (got_character(all_char_codes[i]) == 0) then
            return 0
        end
    end
    return 1
end

function got_all_characters_except_GW()
    local all_char_codes = {
        "CharacterDrMario",
        "CharacterMario",
        "CharacterLuigi",
        "CharacterBowser",
        "CharacterPeach",
        "CharacterYoshi",
        "CharacterDonkeyKong",
        "CharacterCaptainFalcon",
        "CharacterGanondorf",
        "CharacterFalco",
        "CharacterFox",
        "CharacterNess",
        "CharacterIceClimbers",
        "CharacterKirby",
        "CharacterSamus",
        "CharacterZelda",
        "CharacterLink",
        "CharacterYoungLink",
        "CharacterPichu",
        "CharacterPikachu",
        "CharacterJigglypuff",
        "CharacterMewtwo",
        "CharacterMarth",
        "CharacterRoy"
    }
    for i=1, 24 do
        if (got_character(all_char_codes[i]) == 0) then
            return 0
        end
    end
    return 1
end

function got_all_starter_characters()
    local starter_char_codes = {
        "CharacterMario",
        "CharacterBowser",
        "CharacterPeach",
        "CharacterYoshi",
        "CharacterDonkeyKong",
        "CharacterCaptainFalcon",
        "CharacterFox",
        "CharacterNess",
        "CharacterIceClimbers",
        "CharacterKirby",
        "CharacterSamus",
        "CharacterZelda",
        "CharacterLink",
        "CharacterPikachu"
    }
    for i=1, 14 do
        if (got_character(starter_char_codes[i]) == 0) then
            return 0
        end
    end
    return 1
end

function got_10_characters()
    local all_char_codes = {
        "CharacterDrMario",
        "CharacterMario",
        "CharacterLuigi",
        "CharacterBowser",
        "CharacterPeach",
        "CharacterYoshi",
        "CharacterDonkeyKong",
        "CharacterCaptainFalcon",
        "CharacterGanondorf",
        "CharacterFalco",
        "CharacterFox",
        "CharacterNess",
        "CharacterIceClimbers",
        "CharacterKirby",
        "CharacterSamus",
        "CharacterZelda",
        "CharacterLink",
        "CharacterYoungLink",
        "CharacterPichu",
        "CharacterPikachu",
        "CharacterJigglypuff",
        "CharacterMewtwo",
        "CharacterMrGame&Watch",
        "CharacterMarth",
        "CharacterRoy"
    }
    local count=0
    for i=1, 25 do
        if (got_character(all_char_codes[i]) == 1) then
            count = count+1
            if (count >= 10) then
                return 1
            end
        end
    end
    if (count >= 10) then
        return 1
    end
    return 0
end