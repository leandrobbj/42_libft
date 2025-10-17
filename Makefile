# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lbraga <lbraga@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/04/23 16:04:42 by lbraga            #+#    #+#              #
#    Updated: 2025/10/16 23:07:41 by lbraga           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	=	libft.a
HEADER	=	libft.h
CC		=	cc
CFLAGS	=	-Wall -Wextra -Werror -I.
LIBC	=	ar rcs
RM		=	rm -f

SRC		=	src/ft_atoi.c		src/ft_bzero.c		src/ft_calloc.c		src/ft_isalnum.c \
			src/ft_isalpha.c	src/ft_isascii.c	src/ft_isdigit.c	src/ft_isprint.c \
			src/ft_memchr.c		src/ft_memcmp.c		src/ft_memcpy.c		src/ft_memmove.c \
			src/ft_memset.c		src/ft_strchr.c		src/ft_strdup.c		src/ft_strlcat.c \
			src/ft_strlcpy.c	src/ft_strlen.c		src/ft_strncmp.c	src/ft_strnstr.c \
			src/ft_strrchr.c	src/ft_tolower.c	src/ft_toupper.c	src/ft_substr.c	\
			src/ft_strjoin.c	src/ft_strtrim.c	src/ft_split.c		src/ft_itoa.c \
			src/ft_strmapi.c	src/ft_striteri.c	src/ft_putchar_fd.c	src/ft_putstr_fd.c	\
			src/ft_putendl_fd.c	src/ft_putnbr_fd.c

OBJ		=	$(SRC:.c=.o)

SRCB	=	src/bonus/ft_lstnew.c	src/bonus/ft_lstadd_front.c	src/bonus/ft_lstsize.c \
			src/bonus/ft_lstlast.c	src/bonus/ft_lstadd_back.c	src/bonus/ft_lstdelone.c \
			src/bonus/ft_lstclear.c	src/bonus/ft_lstiter.c		src/bonus/ft_lstmap.c

OBJB	=	$(SRCB:.c=.o)
	
all: $(NAME)
$(NAME): $(OBJ)
	@$(LIBC) $(NAME) $(OBJ)
	@echo "$(NAME) created"

%.o: %.c $(HEADER)
	@echo "Compiling $<"
	@$(CC) $(CFLAGS) -c $< -o $@

clean: 
	@$(RM) $(OBJ) $(OBJB)
	@echo "Objects deleted"

fclean: clean
	@$(RM) $(NAME)
	@echo "Library deleted"

re: fclean all

bonus: $(OBJ) $(OBJB)
	@$(LIBC) $(NAME) $(OBJ) $(OBJB)
	@echo "$(NAMEB) created with bonus objects"

.PHONY: all clean fclean re bonus
