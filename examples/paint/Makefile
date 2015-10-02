BIN=../../bin
OBJ=./obj



build:
	mkdir -p $(OBJ)
	$(BIN)/gbdk-n-compile.sh paint.c -o $(OBJ)/paint.rel
	$(BIN)/gbdk-n-link.sh $(OBJ)/paint.rel -o $(OBJ)/paint.ihx
	$(BIN)/gbdk-n-make-rom.sh $(OBJ)/paint.ihx paint.gb

clean:
	rm -rf $(OBJ)
	rm -f paint.gb
