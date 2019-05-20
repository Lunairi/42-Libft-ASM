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

NAME =	libfts.a

FILES = puts bzero strcat toupper tolower \
		isalpha isdigit isalnum isascii isprint strlen

SRC	= $(addprefix ./sources/, $(patsubst %, %.s, $(FILES)))
OBJ = $(addprefix ./objects/, $(patsubst %, %.o, $(FILES)))

all: $(NAME)

$(NAME): $(OBJ)
	ar rc $(NAME) ./objects/*.o
	ranlib $(NAME)
	printf '\033[31m[ ✔ ] %s\n\033[0m' "Created libfts.a"

./objects/%.o: ./sources/%.s
	mkdir -p objects
	nasm -f macho64 $< -o $@

test:
	gcc test.c $(NAME)
	./a.out

clean:
	rm -f ./objects/*.o
	rm -rf ./objects
	rm -f ./a.out
	printf '\033[31m[ ✔ ] %s\n\033[0m' "Cleaned libftasm"

fclean: clean
	rm -f $(NAME)
	printf '\033[31m[ ✔ ] %s\n\033[0m' "Fcleaned libftasm"

re: fclean all
