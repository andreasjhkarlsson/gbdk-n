SRCDIR=./libc
OBJDIR=./obj
LIBDIR=./lib

CC=bin/gbdk-n-compile.sh
CA=bin/gbdk-n-assemble.sh

build:
	chmod u+x bin/*
	mkdir -p $(OBJDIR)
	$(CC) $(SRCDIR)/digits.c -o $(OBJDIR)/digits.rel
	$(CC) $(SRCDIR)/gprint.c -o $(OBJDIR)/gprint.rel
	$(CC) $(SRCDIR)/gprintf.c -o $(OBJDIR)/gprintf.rel
	$(CC) $(SRCDIR)/gprintln.c -o $(OBJDIR)/gprintln.rel
	$(CC) $(SRCDIR)/gprintn.c -o $(OBJDIR)/gprintn.rel

	$(CA) $(OBJDIR)/arand.rel $(SRCDIR)/arand.s
	$(CA) $(OBJDIR)/cgb.rel $(SRCDIR)/cgb.s
	$(CA) $(OBJDIR)/cpy_data.rel $(SRCDIR)/cpy_data.s
	$(CA) $(OBJDIR)/delay.rel $(SRCDIR)/delay.s
	$(CA) $(OBJDIR)/drawing.rel $(SRCDIR)/drawing.s
	$(CA) $(OBJDIR)/f_ibm_sh.rel $(SRCDIR)/f_ibm_sh.s
	$(CA) $(OBJDIR)/f_italic.rel $(SRCDIR)/f_italic.s
	$(CA) $(OBJDIR)/f_min.rel $(SRCDIR)/f_min.s
	$(CA) $(OBJDIR)/f_spect.rel $(SRCDIR)/f_spect.s
	$(CA) $(OBJDIR)/get_bk_t.rel $(SRCDIR)/get_bk_t.s
	$(CA) $(OBJDIR)/get_data.rel $(SRCDIR)/get_data.s
	$(CA) $(OBJDIR)/get_prop.rel $(SRCDIR)/get_prop.s
	$(CA) $(OBJDIR)/get_spr.rel $(SRCDIR)/get_spr.s
	$(CA) $(OBJDIR)/get_wi_t.rel $(SRCDIR)/get_wi_t.s
	$(CA) $(OBJDIR)/get_xy_t.rel $(SRCDIR)/get_xy_t.s
	$(CA) $(OBJDIR)/global.rel $(SRCDIR)/global.s
	$(CA) $(OBJDIR)/hiramcpy.rel $(SRCDIR)/hiramcpy.s
	$(CA) $(OBJDIR)/ibmfixed.rel $(SRCDIR)/ibmfixed.s
	$(CA) $(OBJDIR)/init_tt.rel $(SRCDIR)/init_tt.s
	$(CA) $(OBJDIR)/input.rel $(SRCDIR)/input.s
	$(CA) $(OBJDIR)/mv_bkg.rel $(SRCDIR)/mv_bkg.s
	$(CA) $(OBJDIR)/mv_spr.rel $(SRCDIR)/mv_spr.s
	$(CA) $(OBJDIR)/mv_win.rel $(SRCDIR)/mv_win.s
	$(CA) $(OBJDIR)/pad.rel $(SRCDIR)/pad.s
	$(CA) $(OBJDIR)/rand.rel $(SRCDIR)/rand.s
	$(CA) $(OBJDIR)/sample.rel $(SRCDIR)/sample.s
	$(CA) $(OBJDIR)/scroll_b.rel $(SRCDIR)/scroll_b.s
	$(CA) $(OBJDIR)/scroll_s.rel $(SRCDIR)/scroll_s.s
	$(CA) $(OBJDIR)/scroll_w.rel $(SRCDIR)/scroll_w.s
	$(CA) $(OBJDIR)/serial.rel $(SRCDIR)/serial.s
	$(CA) $(OBJDIR)/set_bk_t.rel $(SRCDIR)/set_bk_t.s
	$(CA) $(OBJDIR)/set_data.rel $(SRCDIR)/set_data.s
	$(CA) $(OBJDIR)/set_prop.rel $(SRCDIR)/set_prop.s
	$(CA) $(OBJDIR)/set_spr.rel $(SRCDIR)/set_spr.s
	$(CA) $(OBJDIR)/set_wi_t.rel $(SRCDIR)/set_wi_t.s
	$(CA) $(OBJDIR)/set_xy_t.rel $(SRCDIR)/set_xy_t.s
	$(CA) $(OBJDIR)/sfr.rel $(SRCDIR)/sfr.s
	$(CA) $(OBJDIR)/sgb.rel $(SRCDIR)/sgb.s
	$(CA) $(OBJDIR)/crt0.rel $(SRCDIR)/crt0.s


	ls $(OBJDIR)/*.rel > $(OBJDIR)/rels.txt	

	mkdir -p $(LIBDIR)
	rm -f $(LIBDIR)/gb.lib
	sdcclib -l $(LIBDIR)/gb.lib $(OBJDIR)/rels.txt
	cp $(OBJDIR)/crt0.rel $(LIBDIR)/


clean:
	rm -rf $(OBJDIR)/*
