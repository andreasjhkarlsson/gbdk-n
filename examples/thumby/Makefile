BIN=../../bin
OBJ=./obj

build:
	mkdir -p $(OBJ)
	$(BIN)/gbdk-n-compile.sh thumby.c -o $(OBJ)/thumby.rel
	$(BIN)/gbdk-n-link.sh $(OBJ)/thumby.rel -o $(OBJ)/thumby.ihx
	$(BIN)/gbdk-n-make-rom.sh $(OBJ)/thumby.ihx thumby.gb

clean:
	rm -rf $(OBJ)
	rm -f thumby.gb
