# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vnazioze <vnazioze@student.42sp.org.br>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/21 20:01:04 by vnazioze          #+#    #+#              #
#    Updated: 2022/11/21 20:01:04 by vnazioze         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

RED 			=	\033[0;31m
GREEN 			=	\033[0;32m
YELLOW 			=	\033[0;33m
BLUE 			=	\033[0;34m
MAGENTA 		=	\033[0;35m
MAGENTA_2		=	\033[0;95m
CYAN 			=	\033[0;36m
RE 				=	\033[0m

NAME			=	cub3D
HEADER			=	cub3D.h

INCLUDE			=	-I ./include

CC				=	@ gcc -Wall -Wextra -Werror -g
LIB				=	-lbsd -lmlx -lXext -lX11 -lm -lz

SRC_PATH		=	./src/
OBJ_PATH		=	./obj/

SRC_FILES		=	main.c

SRC            	=    $(addprefix $(SRC_PATH),$(SRC_FILES))
OBJ            	=    $(addprefix $(OBJ_PATH),$(subst .c,.o,$(SRC_FILES)))

CUB				= $(MAGENTA_2)cub$(BLUE)3$(RED)D$(RE)

LIBFT			=	./libs/libft/libft.a

$(LIBFT): 
				@ make bonus --no-print-directory -C ./libs/libft

$(OBJ_PATH)%.o:	$(SRC_PATH)%.c
				@ mkdir -p $(OBJ_PATH)
				@ $(CC) $(INCLUDE) -c $< -o $@

all:            $(NAME)
				

$(NAME):        $(OBJ) $(LIBFT)
				$(CC) -o $(NAME) $(OBJ)
				@echo "$(CUB)$(RE): was $(GREEN)created$(RE)"

clean:
				@ $(RM) rm -rf $(OBJ_PATH)
				@ make clean --no-print-directory -C ./libs/libft
				@echo "$(CUB): object files were $(RED)deleted$(RE)"

fclean:         clean
				@ $(RM) $(NAME) rm -rf  $(LIBFT) $(OBJ_PATH)
				@echo "$(CUB): was $(RED)deleted$(RE)"

re:				fclean all

.PHONY:			all, clean, fclean, re