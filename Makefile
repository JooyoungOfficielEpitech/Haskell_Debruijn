##
## EPITECH PROJECT, 2019
## Makefile
## File description:
## for the FUN
##

NAME	=	deBruijn

CC	=	stack build --copy-bins --local-bin-path .

RM	=	rm -rf

all:	$(NAME)

$(NAME):
		$(CC)
		mv deBrujin deBruijn

clean:
		$(RM) $(NAME)

fclean:	clean

re:	fclean all
