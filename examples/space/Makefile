BIN=../../bin
OBJ=./obj

build:
	mkdir -p $(OBJ)
	$(BIN)/gbdk-n-assemble.sh $(OBJ)/space.rel space.s
	$(BIN)/gbdk-n-link.sh $(OBJ)/space.rel -o $(OBJ)/space.ihx
	$(BIN)/gbdk-n-make-rom.sh $(OBJ)/space.ihx space.gb

clean:
	rm -rf $(OBJ)
	rm -f space.gb
