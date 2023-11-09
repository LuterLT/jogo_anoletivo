// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_isaac_colisao()
{

		#region colisão
	if place_meeting(x + hveloc, y, obj_parede)// or place_meeting(x + hveloc, y, obj_porta)
		{
			while !place_meeting(x + sign(hveloc), y, obj_parede)// or !place_meeting(x + sign(hveloc), y, obj_porta)
			{
				x += sign(hveloc);
			}
			hveloc = 0;
		}

	x += hveloc;
	if place_meeting(x, y + vveloc, obj_parede)// or place_meeting(x, y + vveloc, obj_porta)
		{
			while !place_meeting(x, y + sign(vveloc), obj_parede)// or !place_meeting(x, y + sign(vveloc), obj_porta)
			{
				y += sign(vveloc);
			}
			vveloc = 0;
		}

	y += vveloc;
	#endregion

}

function scr_isaac_andando()
{
	
	#region movimentação
	direita = keyboard_check(ord("D"));
	esquerda = keyboard_check(ord("A"));
	cima = keyboard_check(ord("W"));
	baixo = keyboard_check(ord("S"));
	
	hveloc = (direita - esquerda);
	vveloc = (baixo - cima);
	veloc_dir = point_direction(x, y, x + hveloc, y + vveloc);
	
	
	
	if hveloc != 0 or vveloc != 0
		{
			veloc = 0.9;
		}
		else
		{
			veloc = 0;
		}
	
	hveloc = lengthdir_x(veloc, veloc_dir);
	vveloc = lengthdir_y(veloc, veloc_dir);
		
	#endregion

scr_isaac_colisao();

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
	#region Dash
	if stamina > 29 and alarm[2] < 0
	{
		if keyboard_check(ord("Q"))
		{
			stamina -= 30;
			alarm[2] = 20;
			alarm[1] = 180;
			alarm[0] = 24;
			dash_direc = point_direction(x, y, mouse_x, mouse_y);
			estado = scr_isaac_dash;
		}
	}
}

function scr_isaac_dash()
{
	hveloc = lengthdir_x(dash_veloc, dash_direc);
	vveloc = lengthdir_y(dash_veloc, dash_direc);	
	estado = scr_isaac_andando;
	scr_isaac_colisao();
	var _inst = instance_create_layer(x, y, "Instances", obj_dash_isaac);
	_inst.sprite_index = sprite_index;
}
#endregion