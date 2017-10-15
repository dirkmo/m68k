all: serial.o

serial.o: serial.c
	gcc -c -Wall serial.c -o serial.o

bin: serial.c
	gcc -Wall serial.c -o serial -D__EXEC__

clean:
	rm -f serial.o
