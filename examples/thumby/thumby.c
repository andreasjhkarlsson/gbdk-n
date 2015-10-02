#include <gb/gb.h>

/*
 * Game Boy Development Kit Demonstration program
 * Creates a rectangle on screen
 * which can be moved around with the game pad
 *
 */

unsigned char backgroundcharacters[] = {
	0xFF,0xDF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,
	0xFF,0xFF,0xFF,0xFF,0xFF,0xF9,0xFF,0xF0,

	0x80,0xFF,0x7F,0xE0,0x9F,0xE0,0xFF,0xF0,
	0xFF,0xF9,0xFF,0xBF,0xFF,0xFF,0xFF,0xFF,

	0xFF,0xFF,0xFF,0xCF,0xFF,0x87,0xFF,0xCF,
	0xFF,0xFF,0xFF,0xFF,0xFF,0xFD,0xFF,0xFF,

	0x1F,0xFF,0xEF,0x7F,0x9F,0x7F,0xFF,0xFF,
	0xFF,0xFF,0xFF,0xFF,0xFF,0xF7,0xFF,0xFF
}; 

unsigned char spritetiles[] = {
	255,0,255,0,255,0,255,0,255,0,255,0,255,0,255,0
};

unsigned char bgmap[] = {
	0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,
	1,3,1,3,1,3,1,3,1,3,1,3,1,3,1,3,1,3,1,3
}; 

void main()
{
	UBYTE counter,x,y;
	x=40;
	y=17;

	disable_interrupts();
	DISPLAY_OFF;

	// load background
	set_bkg_data(0,4,backgroundcharacters);
	for(counter=0;counter<=16;counter+=2)
		set_bkg_tiles( 0, counter, 20, 2, bgmap);

	// load sprite
	SPRITES_8x8;
	set_sprite_data(0, 1, spritetiles);
	set_sprite_tile(0,0);
	move_sprite(0,x,y);

	SHOW_BKG;
	SHOW_SPRITES; 
	DISPLAY_ON;
	enable_interrupts();

	while(1) {
	/* Skip four VBLs (slow down animation) */
		for(counter = 0; counter < 4; counter++){
			wait_vbl_done();
		}
		counter = joypad();

		if(counter & J_UP)
			y--;
		if(counter & J_DOWN)
			y++;
		if(counter & J_LEFT)
			x--;
		if(counter & J_RIGHT)
			x++;

		move_sprite(0,x,y);
	}
}
