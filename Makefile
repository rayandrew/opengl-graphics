CC=g++
CFLAGS=-c -Wall -std=c++1z
LDFLAGS=-framework OpenGL -lglfw -lglew -std=c++14

SOURCES=$(wildcard ./src/*.cpp) $(wildcard ./src/**/*.cpp)
OBJECTS=$(SOURCES:.cpp=.o)
MAIN=./src/main.cpp
EXECUTABLE=./bin/main

.PHONY: all bin clean

all: bin

bin: $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	mkdir -p bin
	$(CC) $(OBJECTS) -o $@ $(LDFLAGS)

%.o: %.cpp
	$(CC) $(CFLAGS) $< -o $@

clean:
	-rm $(OBJECTS)
	-rm $(EXECUTABLE)