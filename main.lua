meta.name = 'JunkyLunky Script'
meta.version = '0.1'
meta.description = 'Performs Junky Scripts (Souns, Textures, etc.)'
meta.author = 'Trixelized, Vissa'

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


texture_def.texture_path = "custom_textures/custom_shoppie_01.png"
shoppie_tex_01 = define_texture(texture_def)

texture_def.texture_path = "custom_textures/custom_shoppie_02.png"
shoppie_tex_02 = define_texture(texture_def)
    
texture_def.texture_path = "custom_textures/custom_shoppie_03.png"
shoppie_tex_03 = define_texture(texture_def)

texture_def.texture_path = "custom_textures/custom_shoppie_04.png"
shoppie_tex_04 = define_texture(texture_def)

texture_def.texture_path = "custom_textures/custom_shoppie_05.png"
shoppie_tex_05 = define_texture(texture_def)

texture_def.texture_path = "custom_textures/custom_shoppie_06.png"
shoppie_tex_06 = define_texture(texture_def)

texture_def.texture_path = "custom_textures/custom_shoppie_07.png"
shoppie_tex_07 = define_texture(texture_def)

texture_def.texture_path = "custom_textures/custom_shoppie_08.png"
shoppie_tex_08 = define_texture(texture_def)

texture_def.texture_path = "custom_textures/custom_shoppie_09.png"
shoppie_tex_09 = define_texture(texture_def)

texture_def.texture_path = "custom_textures/custom_shoppie_10.png"
shoppie_tex_10 = define_texture(texture_def)

texture_def.texture_path = "custom_textures/custom_shoppie_11.png"
shoppie_tex_11 = define_texture(texture_def)

texture_def.texture_path = "custom_textures/custom_shoppie_12.png"
shoppie_tex_12 = define_texture(texture_def)

texture_def.texture_path = "custom_textures/custom_shoppie_13.png"
shoppie_tex_13 = define_texture(texture_def)

texture_def.texture_path = "custom_textures/custom_shoppie_14.png"
shoppie_tex_14 = define_texture(texture_def)

texture_def.texture_path = "custom_textures/custom_shoppie_15.png"
shoppie_tex_15 = define_texture(texture_def)

texture_def.texture_path = "custom_textures/custom_shoppie_16.png"
shoppie_tex_16 = define_texture(texture_def)


texture_def.texture_path = "custom_textures/custom_skeleton.png"
skeleton_text = define_texture(texture_def)


texture_def = get_texture_definition(TEXTURE.DATA_TEXTURES_MONSTERS01_0)
texture_def.texture_path = "custom_textures/custom_lizard.png"
lizard_text = define_texture(texture_def)



set_callback(function()

	local shoppies = get_entities_by_type(ENT_TYPE.MONS_SHOPKEEPER)
	for s, shoppie in ipairs(shoppies) do
	
		local r_tex = math.random(16)+1
		message("n: " .. tostring(r_tex))

        if r_tex == 1 then
            -- simply don't change the texture
        elseif r_tex == 2 then
            get_entity(shoppie):set_texture(shoppie_tex_01)
        elseif r_tex == 3 then
            get_entity(shoppie):set_texture(shoppie_tex_02)
        elseif r_tex == 4 then
            get_entity(shoppie):set_texture(shoppie_tex_03)
        elseif r_tex == 5 then
            get_entity(shoppie):set_texture(shoppie_tex_04)
        elseif r_tex == 6 then
            get_entity(shoppie):set_texture(shoppie_tex_05)
        elseif r_tex == 7 then
            get_entity(shoppie):set_texture(shoppie_tex_06)
        elseif r_tex == 8 then
            get_entity(shoppie):set_texture(shoppie_tex_07)
        elseif r_tex == 9 then
            get_entity(shoppie):set_texture(shoppie_tex_08)
        elseif r_tex == 10 then
            get_entity(shoppie):set_texture(shoppie_tex_09)
        elseif r_tex == 11 then
            get_entity(shoppie):set_texture(shoppie_tex_10)
        elseif r_tex == 12 then
            get_entity(shoppie):set_texture(shoppie_tex_11)
        elseif r_tex == 13 then
            get_entity(shoppie):set_texture(shoppie_tex_12)
        elseif r_tex == 14 then
            get_entity(shoppie):set_texture(shoppie_tex_13)
        elseif r_tex == 15 then
            get_entity(shoppie):set_texture(shoppie_tex_14)
        elseif r_tex == 16 then
            get_entity(shoppie):set_texture(shoppie_tex_15)
        elseif r_tex == 17 then
            get_entity(shoppie):set_texture(shoppie_tex_16)
        end

		--[[
        if r_tex == 1 then
            -- simply don't change the texture
        elseif r_tex == 2 then
            get_entity(shoppie):set_texture(shoppie_tex_1)
        elseif r_tex == 3 then
            get_entity(shoppie):set_texture(shoppie_tex_2)
        end
        ]]
		
	end
    
    local skeletons = get_entities_by_type(ENT_TYPE.MONS_SKELETON)
    for s, skeleton in ipairs(skeletons) do
    
        local r_tex = math.random(50)
        
        if r_tex == 1 then
            get_entity(skeleton):set_texture(skeleton_text)
        end   
    end

    local lizards = get_entities_by_type(ENT_TYPE.MONS_HORNEDLIZARD)
    for s, lizard in ipairs(lizards) do
    
        local r_tex = math.random(3)
        
        if r_tex == 1 then
            get_entity(lizard):set_texture(lizard_text)
        end   
    end
    

end, ON.POST_LEVEL_GENERATION)



