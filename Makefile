TARGET = toy_system

SYSTEM = ./system
UI = ./ui
WEB_SERVER = ./web_server

CC = gcc


DIR = -I$(UI) -I$(WEB_SERVER) -I$(SYSTEM)
OBJS = main.o gui.o input.o web_server.o system_server.o

.PHONY: clean

$(TARGET): clean  $(OBJS)
	$(CC)  -o $(TARGET) $(OBJS)

main.o: main.c
	$(CC)  -c main.c $(DIR)

gui.o: $(UI)/gui.h $(UI)/gui.c
	$(CC)  -c $(UI)/gui.c $(DIR)

web_server.o: $(WEB_SERVER)/web_server.h $(WEB_SERVER)/web_server.c
	$(CC)  -c $(WEB_SERVER)/web_server.c $(DIR)

system_server.o: $(SYSTEM)/system_server.h $(SYSTEM)/system_server.c
	$(CC)  -c $(SYSTEM)/system_server.c $(DIR)

input.o: $(UI)/input.h $(UI)/input.c
	$(CC) -c $(UI)/input.c $(DIR)

clean:
	rm -rf *.o




