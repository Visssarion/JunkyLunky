meta.name = 'JunkyLunky Script'
meta.version = '0.1'
meta.description = 'Performs Junky Scripts (Souns, etc.)'
meta.author = 'Vissa'

-- Thanks @Trixelized
pre_chainwhip = create_sound('resources/whipchain_a1.wav')
chainwhip = create_sound('resources/whipchain_b1.wav')
pre_spiritwhip = create_sound('resources/pre_spiritattack.wav')
spiritwhip = create_sound('resources/spiritattack.wav')

roffy_character_id = 4
alto_character_id = 5

-- the whip sound is split into two different vanilla sounds, one when pulling out the whip
set_vanilla_sound_callback(VANILLA_SOUND.PLAYER_WHIP1, VANILLA_SOUND_CALLBACK_TYPE.STARTED, function(whip_sound)
    if whip_sound:get_parameter(VANILLA_SOUND_PARAM.PLAYER_CHARACTER) == roffy_character_id then
        whip_sound:stop() -- stop the original sound
        local pre_chainwhip_playing = pre_chainwhip:play(true) -- play our own sound
        pre_chainwhip_playing:set_volume(0.7) -- though it's a bit loud, so tune it down just a bit
        pre_chainwhip_playing:set_pause(false) -- and unpause it
    end
    if whip_sound:get_parameter(VANILLA_SOUND_PARAM.PLAYER_CHARACTER) == alto_character_id then
        whip_sound:stop() -- stop the original sound
        local pre_spiritwhip_playing = pre_spiritwhip:play(true) -- play our own sound
        pre_spiritwhip_playing:set_volume(0.7) -- though it's a bit loud, so tune it down just a bit
        pre_spiritwhip_playing:set_pause(false) -- and unpause it
    end
end)
-- and one when swinging it
set_vanilla_sound_callback(VANILLA_SOUND.PLAYER_WHIP2, VANILLA_SOUND_CALLBACK_TYPE.STARTED, function(whip_sound)
    if whip_sound:get_parameter(VANILLA_SOUND_PARAM.PLAYER_CHARACTER) == roffy_character_id then
        whip_sound:stop()
        chainwhip:play()
    end
    if whip_sound:get_parameter(VANILLA_SOUND_PARAM.PLAYER_CHARACTER) == alto_character_id then
        whip_sound:stop()
        spiritwhip:play()
    end
end)
