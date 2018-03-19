CC=g++
CFLAGS=-c -Wall -std=c++14
LDFLAGS=-lglfw -std=c++14
UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Darwin)
	LDFLAGS += -framework OpenGL -lglew
endif
ifeq ($(UNAME_S),Linux)
	LDFLAGS += -lGL -lGLEW -lGLU
endif

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