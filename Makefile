# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: smamalig <smamalig@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/02/06 23:24:42 by smamalig          #+#    #+#              #
#    Updated: 2025/05/02 11:03:42 by smamalig         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME        = libft.a
CC          = cc
CFLAGS      = -Wall -Wextra
SRCS        = ft_atoi.c ft_bzero.c ft_calloc.c ft_isalnum.c ft_isalpha.c \
	ft_isascii.c ft_isdigit.c ft_isprint.c ft_itoa.c ft_memchr.c ft_memcmp.c \
	ft_memcpy.c ft_memmove.c ft_memset.c ft_putchar_fd.c ft_putendl_fd.c \
	ft_putnbr_fd.c ft_putstr_fd.c ft_split.c ft_strchr.c ft_strdup.c \
	ft_striteri.c ft_strjoin.c ft_strlcat.c ft_strlcpy.c ft_strlen.c \
	ft_strmapi.c ft_strncmp.c ft_strnstr.c ft_strrchr.c ft_strtrim.c \
	ft_substr.c ft_tolower.c ft_toupper.c
BONUS_SRCS  = ft_lstadd_back_bonus.c ft_lstadd_front_bonus.c \
	ft_lstclear_bonus.c ft_lst_delone_bonus.c ft_lstiter_bonus.c \
	ft_lstlast_bonus.c ft_lstnew_bonus.c ft_lstsize_bonus.c ft_lstmap_bonus.c
OBJS        = $(SRCS:.c=.o)
BONUS_OBJS  = $(BONUS_SRCS:.c=.o)
INCLUDES    = -Ilibft.h
HEADER      = libft.h

ifeq ($(DEBUG), 1)
	CFLAGS += -g3 -O0 -Wpedantic
else
	CFLAGS += -O3 -Werror
endif

# Colors
RED         = \e[31m
GREEN       = \e[32m
YELLOW      = \e[33m
BLUE        = \e[34m
MAGENTA     = \e[35m
CYAN        = \e[36m
RESET       = \e[0m

all: $(NAME)

$(NAME): $(OBJS)
	@printf "$(BLUE)%s$(RESET): $(YELLOW)Building$(RESET) $(NAME)\n" $(NAME)
	@ar rcs $(NAME) $(OBJS)

bonus: all $(BONUS_OBJS)
	@printf "$(BLUE)%s$(RESET): $(YELLOW)Including$(RESET) bonus $(NAME) files\n" $(NAME)
	@ar rcs $(NAME) $(BONUS_OBJS)

%.o: %.c $(HEADER)
	@printf "$(BLUE)%s$(RESET): $(MAGENTA)Compiling$(RESET) $<\n" $(NAME)
	@$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

clean:
	@printf "$(BLUE)%s$(RESET): $(RED)Removing$(RESET) object files\n" $(NAME)
	@rm -f $(OBJS) $(TEST_OBJS) $(BONUS_OBJS)

fclean: clean
	@printf "$(BLUE)%s$(RESET): $(RED)Removing$(RESET) executables and libraries\n" $(NAME)
	@rm -f $(NAME) a.out

re: fclean all

.PHONY: all clean fclean re
