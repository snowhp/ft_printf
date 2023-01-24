# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tde-sous <tde-sous@42.porto.com>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/18 11:27:43 by tde-sous          #+#    #+#              #
#    Updated: 2023/01/24 10:08:45 by tde-sous         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRCS = ft_printf.c \
	
OBJS = $(SRCS:.c=.o)

NAME = libftprintf.a
FLAGS = -Wall -Wextra -Werror
CC = cc
LIBC = ar rc
RM = rm -f
OUTPUTFILE = a.out

all: $(NAME)

$(NAME): $(OBJS)	
	@make bonus -C libft
	cp libft/libft.a $(NAME)														
	$(LIBC) $(NAME) $(OBJS) 

clean:
	@make clean -C libft
	$(RM) $(OBJS) $(BNS_OBJS)

fclean: clean
	@make fclean -C libft
	$(RM) $(NAME) $(OUTPUTFILE)

re: fclean all
