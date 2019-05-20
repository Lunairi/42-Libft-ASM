# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mlu <mizukori250@gmail.com>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#                                                      #+#    #+#              #
#                                                     ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME =	libft.a

FILES = puts bzero strcat toupper tolower \
		isalpha isdigit isalnum isasciiisprint  strlen

SRC	= $(addprefix ./sources/, $(patsubst %, %.s, $(FILES)))
OBJ = $(addprefix ./objects/, $(patsubst %, %.o, $(FILES)))

all: $(NAME)

$(NAME): $(OBJ)
	# make -C libft/
	ar rc $(NAME) ./objects/*.o
	ranlib $(NAME)

./objects/%.o: ./sources/%.s
	mkdir -p objects
	nasm -f macho64 $< -o $@

clean:
	rm -f *.o

fclean: clean
	rm -f $(NAME)

re: fclean all
