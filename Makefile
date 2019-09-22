#SRC = $(wildcard src/*.c)
#OBJ = $(patsubst %.c, %.o, $(SRC))
# 
# 
#$(OBJ): $(SRC)
#	gcc -c $< -lpthread -ldl -o $@

sqlite3.o:
	gcc -c src/sqlite3.c -o sqlite3.o
main.o:
	gcc -c src/main.c -o main.o

.PHONY: build

build: main.out

main.out: sqlite3.o main.o 
	gcc main.o sqlite3.o -lpthread -ldl -o $@

.PHONY: clean  
clean:  
	$(info "command make clean")
	rm -rf *.o *.db *.out

.PHONY: help
help:  
	$(info "command make help")
	pwd
