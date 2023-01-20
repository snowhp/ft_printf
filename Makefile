# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tde-sous <tde-sous@42.porto.com>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/18 11:27:43 by tde-sous          #+#    #+#              #
#    Updated: 2023/01/18 17:56:08 by tde-sous         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRCS = ft_printf.c \
	libft/ft_int_putstr.c \
	libft/ft_int_puthex.c \
	libft/ft_int_putnbr.c \
	libft/ft_int_putchar.c \
	libft/ft_int_puthex.c \
	libft/ft_int_putpointer.c \
	

OBJS = $(SRCS:.c=.o)

SOURCES := $(wildcard *.c)

SOURCESLIBFT :=  $(wildcard libft/*.c)

OBJSLIBFT = $(SOURCESLIBFT:.c=.o)

NAME = libftprintf.a
FLAGS = -Wall -Wextra -Werror
CC = cc
LIBC = ar rc
RM = rm -f
LIBFT = libft/libft.a
OUTPUTFILE = a.out

all: $(NAME)

$(NAME): $(OBJS)	
	@make -C libft																
	$(LIBC) $(NAME) $(OBJS) 

clean:
	$(RM) $(OBJS) $(BNS_OBJS)

fclean: clean
	$(RM) $(NAME) $(OUTPUTFILE)

cleanall: fclean
	@make fclean -C libft

final: re
	$(CC) $(FLAGS) $(OBJS)

debug: re
	$(CC) $(FLAGS) -g $(SOURCES) $(SOURCESLIBFT)

re: fclean all
