// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_personagem_colisao(){
	if place_meeting(x + hveloc, y, obj_parede)// or place_meeting(x + hveloc, y, obj_porta)
		{
			while !place_meeting(x + sign(hveloc), y, obj_parede)// or !place_meeting(x + sign(hveloc), y, obj_porta)
			{
				x += sign(hveloc);
			}
			hveloc = 0;
		}

	x += hveloc;
	vveloc = (baixo - cima)*veloc;
	if place_meeting(x, y + vveloc, obj_parede)// or place_meeting(x, y + vveloc, obj_porta)
		{
			while !place_meeting(x, y + sign(vveloc), obj_parede)// or !place_meeting(x, y + sign(vveloc), obj_porta)
			{
				y += sign(vveloc);
			}
			vveloc = 0;
		}

	y += vveloc;
}
function scr_isaac_andando()
{
	
	#region movimentação
	direita = keyboard_check(vk_right) || keyboard_check(ord("D"));
	esquerda = keyboard_check(vk_left) || keyboard_check(ord("A"));
	cima = keyboard_check(vk_up) || keyboard_check(ord("W"));
	baixo = keyboard_check(vk_down) || keyboard_check(ord("S"));
	hveloc = (direita - esquerda)*veloc;
	vveloc = (baixo - cima)*veloc;
	#endregion

		#region colisão
	scr_personagem_colisao();
	#endregion

	#region Direção
	direc = floor((point_direction(x, y, mouse_x, mouse_y)+ 45)/90);
	if hveloc == 0 and vveloc == 0
	{
		switch direc
			{
				default:
					sprite_index = spr_isaac_parado_direita;
				break;
				case 1:
					sprite_index = spr_isaac_parado_costas;
				break;
				case 2:
					sprite_index = spr_isaac_parado_esquerda;
				break;
				case 3:
					sprite_index = spr_isaac_parado_frente;
				break;
			}
	}
	else
	{
		switch direc
			{
				default:
					sprite_index = spr_isaac_andando_dir_strip8;
				break;
				case 1:
					sprite_index = spr_isaac_andando_costas_strip8;
				break;
				case 2:
					sprite_index = spr_isaac_andando_esq_strip8;
				break;
				case 3:
					sprite_index = spr_isaac_andando_frente_strip8;
				break;
			}
	}
	#endregion
	#region dash
	if keyboard_check(ord("Q"))
	{
		alarm[0] = 24;
		dash_direc = point_direction(x, y, mouse_x, mouse_y);
		estado = scr_isaac_dash;
	}
}

function scr_isaac_dash()
{
	hveloc = lengthdir_x(dash_veloc, dash_direc);
	vveloc = lengthdir_y(dash_veloc, dash_direc);
	scr_personagem_colisao();
	var _inst = instance_create_layer(x, y, "Instances", obj_dash_isaac);
	_inst.sprite_index = sprite_index;
	estado = scr_isaac_andando;
	#endregion
	if mouse_check_button_pressed(mb_left)
	{
	image_index = 0
	switch direc
			{
				default:
					sprite_index = spr_isaac_atacando_faca_direita_strip6;
				break;
				case 1:
					sprite_index = spr_isaac_atacando_faca_costas_strip6;
				break;
				case 2:
					sprite_index = spr_isaac_atacando_faca_esq_strip6;
				break;
				case 3:
					sprite_index = spr_isaac_ataque_faca_frente_strip11;
				break;
			}
	estado = scr_isaac_atacando;
	}
}

function scr_isaac_atacando()
{
	if image_index >= 1{
	if atacar == false
	{
		switch direc
				{
					default:
						instance_create_layer(x + 10, y, "Instances", obj_colisao_ataque);
					break;
					case 1:
						instance_create_layer(x, y - 10, "Instances", obj_colisao_ataque);
					break;
					case 2:
						instance_create_layer(x - 10, y, "Instances", obj_colisao_ataque);
					break;
					case 3:
						instance_create_layer(x, y + 10, "Instances", obj_colisao_ataque);
					break;
				}
		atacar = true;
	}
}
}