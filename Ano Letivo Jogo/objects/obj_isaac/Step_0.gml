/// @description Isaac Step
direita = keyboard_check(ord("D"));
esquerda = keyboard_check(ord("A"));
cima = keyboard_check(ord("W"));
baixo = keyboard_check(ord("S"));

hveloc = (direita - esquerda)*veloc;
if place_meeting(x + hveloc, y, obj_parede)
	{
		while !place_meeting(x + sign(hveloc), y, obj_parede)
		{
			x += sign(hveloc);
		}
		hveloc = 0;
	}

x += hveloc;
vveloc = (baixo - cima)*veloc;
if place_meeting(x, y + vveloc, obj_parede)
	{
		while !place_meeting(x, y + sign(vveloc), obj_parede)
		{
			y += sign(vveloc);
		}
		vveloc = 0;
	}

y += vveloc;
