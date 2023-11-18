TARGET = toy_system

SYSTEM = ./system
UI = ./ui
WEB_SERVER = ./web_server

CC = gcc
CFLAGS = -Wall -O -g

DIR = -I$(UI) -I$(WEB_SERVER) -I$(SYSTEM)
OBJS = main.o gui.o input.o web_server.o system_server.o

.PHONY: clean

$(TARGET): $(OBJS)
	$(CC) -o $(TARGET) $(OBJS)

main.o: main.c
	$(CC) -g $(DIR) -c main.c

gui.o: $(UI)/gui.h $(UI)/gui.c
	$(CC) -c $(DIR) -c $(UI)/gui.c

web_server.o: $(WEB_SERVER)/web_server.h $(WEB_SERVER)/web_server.c
	$(CC) -g $(DIR) -c $(WEB_SERVER)/web_server.c

system_server.o: $(SYSTEM)/system_server.h $(SYSTEM)/system_server.c
	$(CC) -g $(DIR) -c ./system/system_server.c

input.o: $(UI)/input.h $(UI)/input.c
	$(CC) -g $(DIR) -c $(UI)/input.c

clean:
	rm -rf *.o $(TARGET)



