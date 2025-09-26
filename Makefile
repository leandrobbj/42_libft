# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lbraga <lbraga@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/04/23 16:04:42 by lbraga            #+#    #+#              #
#    Updated: 2025/09/26 17:27:40 by lbraga           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	=	libft.a
HEADER	=	libft.h
CC		=	cc
CFLAGS	=	-Wall -Wextra -Werror -I.
LIBC	=	ar rcs
RM		=	rm -f

SRC		=	$(wildcard src/*.c)
#SRC	=	ft_atoi.c ft_bzero.c ft_calloc.c ft_isalnum.c ft_isalpha.c ft_isascii.c \
			ft_isdigit.c ft_isprint.c ft_memchr.c ft_memcmp.c ft_memcpy.c ft_memmove.c \
			ft_memset.c ft_strchr.c ft_strdup.c ft_strlcat.c ft_strlcpy.c ft_strlen.c \
			ft_strncmp.c ft_strnstr.c ft_strrchr.c ft_tolower.c ft_toupper.c \
			ft_substr.c ft_strjoin.c ft_strtrim.c ft_split.c ft_itoa.c ft_strmapi.c \
			ft_striteri.c ft_putchar_fd.c ft_putstr_fd.c ft_putendl_fd.c ft_putnbr_fd.c

OBJ		=	$(SRC:.c=.o)

SRCB	=	$(wildcard src/bonus/*.c)
#SRCB	=	ft_lstnew.c ft_lstadd_front.c ft_lstsize.c ft_lstlast.c ft_lstadd_back.c \
			ft_lstdelone.c ft_lstclear.c ft_lstiter.c ft_lstmap.c

OBJB	=	$(SRCB:.c=.o)
	
all: $(NAME)
$(NAME): $(OBJ)
	@echo "Linking $(NAME)"
	@$(LIBC) $(NAME) $(OBJ)
	@echo "Complete"

%.o: %.c $(HEADER)
	@echo "Compiling $<"
	@$(CC) $(CFLAGS) -c $< -o $@

clean: 
	@echo "Cleaning objs"
	@$(RM) $(OBJ) $(OBJB)

fclean: clean
	@echo "Cleaning Headers"
	@$(RM) $(NAME)

re: fclean all

bonus: $(OBJ) $(OBJB)
	@echo "Linking $(NAME) with bonus objects"
	@$(LIBC) $(NAME) $(OBJ) $(OBJB)

.PHONY: all clean fclean re bonus