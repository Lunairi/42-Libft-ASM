# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mlu <marvin@student.42.fr>                 +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/04/11 13:48:43 by mlu               #+#    #+#              #
#    Updated: 2017/06/13 12:45:09 by mlu              ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME =	libft.a

SRC = 	strlen.s \
		puts.s \
		bzero.s \
		strcat.s \
		isalpha.s \
		isdigit.s \
		isalnum.s \
		isascii.s \
		isprint.s \
		toupper.s \
		tolower.s

OBJ = $(SRC:.s=.o)
HEADER = include/

all: $(NAME)

$(NAME):
	gcc -Wall -Wextra -Werror -c -I$(HEADER) $(SRC)
	ar rc $(NAME) *.o
	ranlib $(NAME)

clean:
	rm -f *.o

fclean: clean
	rm -f $(NAME)

re: fclean all