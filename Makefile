INC_DIR := ./include
SRC_DIR := ./src
OBJ_DIR := ./build

CC          ?= gcc
CXX         ?= g++
CFLAGS      = -g -O2 -Wall -Wextra
CXXFLAGS    = -std=c++17 -g -O2 -Wall -Wextra
CPPFLAGS    = -I$(INC_DIR)/ -DDEBUG
LDFLAGS     =
LDLIBS      =

SOURCES := $(wildcard $(SRC_DIR)/*.cpp)
INCLUDES := $(wildcard $(INC_DIR)/*.hpp)
OBJECTS := $(SOURCES:$(SRC_DIR)/%.cpp=$(OBJ_DIR)/%.o)
BIN := numcalccl

.PHONY: all
all: $(BIN)

$(BIN): $(OBJECTS)
	$(CXX) $(CXXFLAGS) $(CPPFLAGS) -o $@ $^

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp | $(OBJ_DIR)
	$(CXX) -c $(CXXFLAGS) $(CPPFLAGS) -o $@ $<

$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

.PHONY: clean
clean:
	rm -rf $(OBJ_DIR) $(BIN)