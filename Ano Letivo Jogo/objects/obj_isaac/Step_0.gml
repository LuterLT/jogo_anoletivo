/// @description Isaac Step

script_execute(estado);
depth = -y;
/*
	#region movimentação
direita = keyboard_check(ord("D"));
esquerda = keyboard_check(ord("A"));
cima = keyboard_check(ord("W"));
baixo = keyboard_check(ord("S"));
hveloc = (direita - esquerda)*veloc;
#endregion

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
*/
