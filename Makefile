NAME = #EXECUTABLE_NAME

SRC_DIR = #SRC_DIRECTORY

BIN_DIR = ./bin/ #BINARY_DIRECTORY

SRC =	$(SRC_DIR)/#FILE					\
		$(SRC_DIR)/#FILE					\

CC = gcc

OBJ = $(SRC:$(SRC_DIR)/%.c=$(BIN_DIR)%.o)

LIB_PATH = ./libft

LIB = -Llibft -lft

INCLUDES = ./includes

CFLAGS = -Werror -Wextra -Wall -I$(INCLUDES) -g3

all :	$(BIN_DIR) $(NAME)

$(OBJ) :	$(BIN_DIR)%.o: $(SRC_DIR)/%.c
		@ $(CC) $(CFLAGS) -c $< -o $@

$(NAME) :	$(BIN_DIR) $(OBJ)
			@ $(MAKE) -s -C $(LIB_PATH)
			@ $(CC) $(CFLAGS) $(OBJ) $(LIB) -o $(NAME)
			@echo "\e[33m\e[1m\tMake\e[0m [🗿] : \e[1mDone ! ✅"

$(BIN_DIR) :
		@ mkdir -p $(BIN_DIR)

clean :
		@ $(MAKE) -s clean -C $(LIB_PATH)
		@ rm -f $(OBJ)
		@ rm -rf $(BIN_DIR)
		@echo "\e[33m\e[1m\tMake\e[0m [🗿] : \e[1mRemove binary files .. 🧹"

fclean : clean
		@ $(MAKE) -s fclean -C $(LIB_PATH)
		@ rm -f $(NAME)
		@echo "\e[33m\e[1m\tMake\e[0m [🗿] : \e[1mRemove executable .. 🗑️"

re :
	@echo "\e[33m\e[1m\tMake\e[0m [🗿] : \e[1mRecompile .. 🔄"
	@ $(MAKE) -s fclean all

.PHONY: all clean fclean re
