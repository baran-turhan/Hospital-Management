CC = gcc
CFLAGS = -Wall -Wextra -Iinclude
OBJ_DIR = build
SRC = $(wildcard src/*.c)
OBJ = $(patsubst src/%.c, $(OBJ_DIR)/%.o, $(SRC))
TARGET = my_program

$(OBJ_DIR)/%.o: src/%.c include/%.h
	mkdir -p $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

$(TARGET): $(OBJ)
	$(CC) $(CFLAGS) $^ -o $(TARGET)

clean:
	rm -rf $(OBJ_DIR) $(TARGET)
