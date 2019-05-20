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

FILES = strlen puts bzero strcat toupper tolower \
		isalpha isdigit isalnum isasciiisprint  

SRC	= $(addprefix ./source, $(patsubst %, %.s, $(FILES)))
OBJ = $(addprefix ./include, $(patsubst %, %.o, $(FILES)))

all: $(NAME)

$(NAME): $(OBJ)
	make -C libft/
	ar rc $(NAME) *.o
	ranlib $(NAME)

./objects/%.o: ./source/%.s
	mkdir -p objects
	nasm -f macho64 $< -o $@

clean:
	rm -f *.o

fclean: clean
	rm -f $(NAME)

re: fclean all
