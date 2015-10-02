BIN=../../bin
OBJ=./obj



build:
	mkdir -p $(OBJ)
	$(BIN)/gbdk-n-compile.sh galaxy.c -o $(OBJ)/galaxy.rel
	$(BIN)/gbdk-n-link.sh $(OBJ)/galaxy.rel -o $(OBJ)/galaxy.ihx
	$(BIN)/gbdk-n-make-rom.sh $(OBJ)/galaxy.ihx galaxy.gb

clean:
	rm -rf $(OBJ)
	rm -f galaxy.gb
