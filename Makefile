NAME = #EXECUTABLE_NAME

SRC_DIR = #SRC_DIRECTORY

BIN_DIR = ./bin/ #BINARY_DIRECTORY

SRC =	$(SRC_DIR)/#FILE					\
		$(SRC_DIR)/#FILE					\

CC = #C_COMPILER

OBJ = $(SRC:$(SRC_DIR)/%.c=$(BIN_DIR)%.o)

LIB_PATH = ./libft

LIB = -Llibft -lft

INCLUDES = ./includes

CFLAGS = -I$(INCLUDES)

all :	$(NAME)

$(BIN_DIR)%.o : $(SRC_DIR)/%.c
		@ $(CC) $(CFLAGS) -c $< -o $@

$(NAME) :	$(BIN_DIR) $(OBJ)
			@ $(MAKE) -s -C $(LIB_PATH)
			@ $(CC) $(CFLAGS) $(OBJ) $(LIB) -o $(NAME)
			@echo "\e[33m\e[1m\tMake\e[0m [๐ฟ] : \e[1mDone ! โ"

$(BIN_DIR) :
		@ mkdir -p $(BIN_DIR)

clean :
		@ $(MAKE) -s clean -C $(LIB_PATH)
		@ rm -f $(OBJ)
		@ rm -rf $(BIN_DIR)
		@echo "\e[33m\e[1m\tMake\e[0m [๐ฟ] : \e[1mRemove binary files .. ๐งน"

fclean : clean
		@ $(MAKE) -s fclean -C $(LIB_PATH)
		@ rm -f $(NAME)
		@echo "\e[33m\e[1m\tMake\e[0m [๐ฟ] : \e[1mRemove executable .. ๐๏ธ"

re :
	@echo "\e[33m\e[1m\tMake\e[0m [๐ฟ] : \e[1mRecompile .. ๐"
	@ $(MAKE) -s fclean all

.PHONY: all clean fclean re
