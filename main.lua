meta.name = 'JunkyLunky Script'
meta.version = '1.2'
meta.description = 'Performs Junky Scripts (Sounds, Textures, etc.)'
meta.author = 'Trixelized, Vissa'
meta.online_safe = true

-- Thanks @Trixelized
pre_spiritwhip = create_sound('custom_sounds/pre_spiritattack.wav')
spiritwhip = create_sound('custom_sounds/spiritattack.wav')
pre_chainwhip = create_sound('custom_sounds/whipchain_a1.wav')
chainwhip = create_sound('custom_sounds/whipchain_b1.wav')

roffy_character_id = 4
alto_character_id = 5
dirk_character_id = 18

-- the whip sound is split into two different vanilla sounds, one when pulling out the whip
set_vanilla_sound_callback(VANILLA_SOUND.PLAYER_WHIP1, VANILLA_SOUND_CALLBACK_TYPE.STARTED, function(whip_sound)
    if whip_sound:get_parameter(VANILLA_SOUND_PARAM.PLAYER_CHARACTER) == roffy_character_id then
        whip_sound:stop() -- stop the original sound
        local pre_chainwhip_playing = pre_chainwhip:play(true) -- play our own sound
        pre_chainwhip_playing:set_volume(0.7) -- though it's a bit loud, so tune it down just a bit
        pre_chainwhip_playing:set_pitch(math.random()*0.2+0.85)
        pre_chainwhip_playing:set_pause(false) -- and unpause it
    end
    if whip_sound:get_parameter(VANILLA_SOUND_PARAM.PLAYER_CHARACTER) == alto_character_id then
        whip_sound:stop() -- stop the original sound
        local pre_spiritwhip_playing = pre_spiritwhip:play(true) -- play our own sound
        pre_spiritwhip_playing:set_volume(0.65) -- though it's a bit loud, so tune it down just a bit
        pre_spiritwhip_playing:set_pitch(math.random()*0.2+0.9)
        pre_spiritwhip_playing:set_pause(false) -- and unpause it
    end
end)
-- and one when swinging it
set_vanilla_sound_callback(VANILLA_SOUND.PLAYER_WHIP2, VANILLA_SOUND_CALLBACK_TYPE.STARTED, function(whip_sound)
    if whip_sound:get_parameter(VANILLA_SOUND_PARAM.PLAYER_CHARACTER) == roffy_character_id then
        whip_sound:stop()
        local chainwhip_playing = chainwhip:play(true)
        chainwhip_playing:set_volume(0.9)
        chainwhip_playing:set_pitch(math.random()*0.2+0.8)
        chainwhip_playing:set_pause(false)
    end
    if whip_sound:get_parameter(VANILLA_SOUND_PARAM.PLAYER_CHARACTER) == alto_character_id then
        whip_sound:stop()
        local spiritwhip_playing = spiritwhip:play(true)
        spiritwhip_playing:set_volume(0.85)
        spiritwhip_playing:set_pitch(math.random()*0.1+0.95)
        spiritwhip_playing:set_pause(false)
    end
    if whip_sound:get_parameter(VANILLA_SOUND_PARAM.PLAYER_CHARACTER) == dirk_character_id then
        whip_sound:set_pitch(1.5+math.random())
    end
end)

--[[

Random shoppie code! By Trixelized

--]]

local texture_def = get_texture_definition(TEXTURE.DATA_TEXTURES_MONSTERSBASIC01_0)
shoppie_tex = {}

texture_def.texture_path = "custom_textures/custom_shoppie_01.png"
shoppie_tex[1] = define_texture(texture_def)

texture_def.texture_path = "custom_textures/custom_shoppie_02.png"
shoppie_tex[2] = define_texture(texture_def)
    
texture_def.texture_path = "custom_textures/custom_shoppie_03.png"
shoppie_tex[3] = define_texture(texture_def)

texture_def.texture_path = "custom_textures/custom_shoppie_04.png"
shoppie_tex[4] = define_texture(texture_def)

texture_def.texture_path = "custom_textures/custom_shoppie_05.png"
shoppie_tex[5] = define_texture(texture_def)

texture_def.texture_path = "custom_textures/custom_shoppie_06.png"
shoppie_tex[6] = define_texture(texture_def)

texture_def.texture_path = "custom_textures/custom_shoppie_07.png"
shoppie_tex[7] = define_texture(texture_def)

texture_def.texture_path = "custom_textures/custom_shoppie_08.png"
shoppie_tex[8] = define_texture(texture_def)

texture_def.texture_path = "custom_textures/custom_shoppie_09.png"
shoppie_tex[9] = define_texture(texture_def)

texture_def.texture_path = "custom_textures/custom_shoppie_10.png"
shoppie_tex[10] = define_texture(texture_def)

texture_def.texture_path = "custom_textures/custom_shoppie_11.png"
shoppie_tex[11] = define_texture(texture_def)

texture_def.texture_path = "custom_textures/custom_shoppie_12.png"
shoppie_tex[12] = define_texture(texture_def)

texture_def.texture_path = "custom_textures/custom_shoppie_13.png"
shoppie_tex[13] = define_texture(texture_def)

texture_def.texture_path = "custom_textures/custom_shoppie_14.png"
shoppie_tex[14] = define_texture(texture_def)

texture_def.texture_path = "custom_textures/custom_shoppie_15.png"
shoppie_tex[15] = define_texture(texture_def)

texture_def.texture_path = "custom_textures/custom_shoppie_16.png"
shoppie_tex[16] = define_texture(texture_def)


texture_def.texture_path = "custom_textures/custom_skeleton.png"
skeleton_text = define_texture(texture_def)


texture_def = get_texture_definition(TEXTURE.DATA_TEXTURES_MONSTERS01_0)
texture_def.texture_path = "custom_textures/custom_lizard.png"
lizard_text = define_texture(texture_def)



set_callback(function()

	local shoppies = get_entities_by_type(ENT_TYPE.MONS_SHOPKEEPER)
	seed_increment, seed_current = get_adventure_seed()
	texture_seed = seed_current
	for s, shoppie in ipairs(shoppies) do
		
		
		-- vissa rewrite in 2026:
		-- i replaced math.random with level seed dependant calculation
		-- should not be synced in co-op
		
		local r_tex = texture_seed % 17
		texture_seed = (texture_seed * 25214903917 + 11) % math.maxinteger
		--print("shopk_id="..r_tex)
		--local r_tex = math.random(16)+1
		--message("n: " .. tostring(r_tex))

        if r_tex == 0 then
            -- simply don't change the texture
        else
            get_entity(shoppie):set_texture(shoppie_tex[r_tex])
        end
		
	end
    
	texture_seed = seed_current
    local skeletons = get_entities_by_type(ENT_TYPE.MONS_SKELETON)
    for s, skeleton in ipairs(skeletons) do
    
        local r_tex = texture_seed % 50
		texture_seed = (texture_seed * 25214903917 + 11) % math.maxinteger
        
        if r_tex == 1 then
            get_entity(skeleton):set_texture(skeleton_text)
        end   
    end

	texture_seed = seed_current
    local lizards = get_entities_by_type(ENT_TYPE.MONS_HORNEDLIZARD)
    for s, lizard in ipairs(lizards) do
    
        local r_tex = texture_seed % 3
		texture_seed = (texture_seed * 25214903917 + 11) % math.maxinteger
        
        if r_tex == 1 then
            get_entity(lizard):set_texture(lizard_text)
        end   
    end
    

end, ON.POST_LEVEL_GENERATION)



