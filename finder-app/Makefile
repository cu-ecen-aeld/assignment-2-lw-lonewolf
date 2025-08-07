CC := $(CROSS_COMPILE)gcc

default: writer

writer: writer.o
	$(CC) writer.o -o writer

writer.o: writer.c
	$(CC) -c writer.c -o writer.o

clean:
	rm -rf writer writer.o
