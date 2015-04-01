INCLUDEDIR=./include
SRCDIR=./libc
OBJDIR=./obj
LIBDIR=./lib

CC=sdcc
CCF=-mgbz80 -I $(INCLUDEDIR)/

CA=sdasgb
CAF=-plosgff

build:
	mkdir -p $(OBJDIR)
	$(CC) $(CCF) -c $(SRCDIR)/digits.c -o $(OBJDIR)/digits.rel
	$(CC) $(CCF) -c $(SRCDIR)/gprint.c -o $(OBJDIR)/gprint.rel
	$(CC) $(CCF) -c $(SRCDIR)/gprintf.c -o $(OBJDIR)/gprintf.rel
	$(CC) $(CCF) -c $(SRCDIR)/gprintln.c -o $(OBJDIR)/gprintln.rel
	$(CC) $(CCF) -c $(SRCDIR)/gprintn.c -o $(OBJDIR)/gprintn.rel

	$(CA) $(CAF) $(OBJDIR)/arand.rel $(SRCDIR)/arand.s
	$(CA) $(CAF) $(OBJDIR)/cgb.rel $(SRCDIR)/cgb.s
	$(CA) $(CAF) $(OBJDIR)/cpy_data.rel $(SRCDIR)/cpy_data.s
	$(CA) $(CAF) $(OBJDIR)/delay.rel $(SRCDIR)/delay.s
	$(CA) $(CAF) $(OBJDIR)/drawing.rel $(SRCDIR)/drawing.s
	$(CA) $(CAF) $(OBJDIR)/f_ibm_sh.rel $(SRCDIR)/f_ibm_sh.s
	$(CA) $(CAF) $(OBJDIR)/f_italic.rel $(SRCDIR)/f_italic.s
	$(CA) $(CAF) $(OBJDIR)/f_min.rel $(SRCDIR)/f_min.s
	$(CA) $(CAF) $(OBJDIR)/f_spect.rel $(SRCDIR)/f_spect.s
	$(CA) $(CAF) $(OBJDIR)/get_bk_t.rel $(SRCDIR)/get_bk_t.s
	$(CA) $(CAF) $(OBJDIR)/get_data.rel $(SRCDIR)/get_data.s
	$(CA) $(CAF) $(OBJDIR)/get_prop.rel $(SRCDIR)/get_prop.s
	$(CA) $(CAF) $(OBJDIR)/get_spr.rel $(SRCDIR)/get_spr.s
	$(CA) $(CAF) $(OBJDIR)/get_wi_t.rel $(SRCDIR)/get_wi_t.s
	$(CA) $(CAF) $(OBJDIR)/get_xy_t.rel $(SRCDIR)/get_xy_t.s
	$(CA) $(CAF) $(OBJDIR)/global.rel $(SRCDIR)/global.s
	$(CA) $(CAF) $(OBJDIR)/hiramcpy.rel $(SRCDIR)/hiramcpy.s
	$(CA) $(CAF) $(OBJDIR)/ibmfixed.rel $(SRCDIR)/ibmfixed.s
	$(CA) $(CAF) $(OBJDIR)/init_tt.rel $(SRCDIR)/init_tt.s
	$(CA) $(CAF) $(OBJDIR)/input.rel $(SRCDIR)/input.s
	$(CA) $(CAF) $(OBJDIR)/mv_bkg.rel $(SRCDIR)/mv_bkg.s
	$(CA) $(CAF) $(OBJDIR)/mv_spr.rel $(SRCDIR)/mv_spr.s
	$(CA) $(CAF) $(OBJDIR)/mv_win.rel $(SRCDIR)/mv_win.s
	$(CA) $(CAF) $(OBJDIR)/pad.rel $(SRCDIR)/pad.s
	$(CA) $(CAF) $(OBJDIR)/rand.rel $(SRCDIR)/rand.s
	$(CA) $(CAF) $(OBJDIR)/sample.rel $(SRCDIR)/sample.s
	$(CA) $(CAF) $(OBJDIR)/scroll_b.rel $(SRCDIR)/scroll_b.s
	$(CA) $(CAF) $(OBJDIR)/scroll_s.rel $(SRCDIR)/scroll_s.s
	$(CA) $(CAF) $(OBJDIR)/scroll_w.rel $(SRCDIR)/scroll_w.s
	$(CA) $(CAF) $(OBJDIR)/serial.rel $(SRCDIR)/serial.s
	$(CA) $(CAF) $(OBJDIR)/set_bk_t.rel $(SRCDIR)/set_bk_t.s
	$(CA) $(CAF) $(OBJDIR)/set_data.rel $(SRCDIR)/set_data.s
	$(CA) $(CAF) $(OBJDIR)/set_prop.rel $(SRCDIR)/set_prop.s
	$(CA) $(CAF) $(OBJDIR)/set_spr.rel $(SRCDIR)/set_spr.s
	$(CA) $(CAF) $(OBJDIR)/set_wi_t.rel $(SRCDIR)/set_wi_t.s
	$(CA) $(CAF) $(OBJDIR)/set_xy_t.rel $(SRCDIR)/set_xy_t.s
	$(CA) $(CAF) $(OBJDIR)/sfr.rel $(SRCDIR)/sfr.s
	$(CA) $(CAF) $(OBJDIR)/sgb.rel $(SRCDIR)/sgb.s
	$(CA) $(CAF) $(OBJDIR)/crt0.rel $(SRCDIR)/crt0.s
	
	ls $(OBJDIR)/*.rel > $(OBJDIR)/rels.txt	
	
	

	mkdir -p $(LIBDIR)
	sdcclib -l $(LIBDIR)/gb.lib $(OBJDIR)/rels.txt


clean:
	rm -rf $(OBJDIR)/*
