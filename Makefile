# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tde-sous <tde-sous@42.porto.com>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/18 11:27:43 by tde-sous          #+#    #+#              #
#    Updated: 2023/01/25 13:09:12 by tde-sous         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRCS = ft_printf.c \
	
OBJS = $(SRCS:.c=.o)

NAME = libftprintf.a
LIBFT_DIR := libft
LIBFT_LIB := $(LIBFT_DIR)/libft.a
CC = cc
FLAGS = -Wall -Wextra -Werror
LIBC = ar rc
RM = rm -f
OUTPUTFILE = a.out

all: $(NAME)

$(NAME): $(OBJS) $(LIBFT_LIB)
	cp $(LIBFT_LIB) $(NAME)													
	$(LIBC) $(NAME) $(OBJS)

clean:
	@make clean -C libft
	$(RM) $(OBJS) $(BNS_OBJS)

fclean: clean
	@make fclean -C libft
	$(RM) $(NAME) $(OUTPUTFILE)

re: fclean all

$(LIBFT_LIB): makelibft ;

.PHONY: makelibft
makelibft:
	$(MAKE) -C $(LIBFT_DIR)