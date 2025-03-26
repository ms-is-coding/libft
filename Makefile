# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: smamalig <smamalig@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/02/06 23:24:42 by smamalig          #+#    #+#              #
#    Updated: 2025/03/20 12:31:09 by smamalig         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME        = libft.a
CC          = cc
CPP         = c++
CFLAGS      = -Wall -Wextra -Werror
SRCS        = ft_atoi.c ft_bzero.c ft_calloc.c ft_isalnum.c ft_isalpha.c \
	ft_isascii.c ft_isdigit.c ft_isprint.c ft_itoa.c ft_memchr.c ft_memcmp.c \
	ft_memcpy.c ft_memmove.c ft_memset.c ft_putchar_fd.c ft_putendl_fd.c \
	ft_putnbr_fd.c ft_putstr_fd.c ft_split.c ft_strchr.c ft_strdup.c \
	ft_striteri.c ft_strjoin.c ft_strlcat.c ft_strlcpy.c ft_strlen.c \
	ft_strmapi.c ft_strncmp.c ft_strnstr.c ft_strrchr.c ft_strtrim.c \
	ft_substr.c ft_tolower.c ft_toupper.c
BONUS_SRCS  = ft_lstadd_back_bonus.c ft_lstadd_front_bonus.c \
	ft_lstclear_bonus.c ft_lst_delone_bonus.c ft_lstiter_bonus.c \
	ft_lstlast_bonus.c ft_lstnew_bonus.c ft_lstsize_bonus.c
TEST_SRCS   = main.cpp test.cpp
OBJS        = $(SRCS:.c=.o)
BONUS_OBJS  = $(BONUS_SRCS:.c=.o)
TEST_OBJS   = $(TEST_SRCS:%.cpp=%.o)
INCLUDES    = -Ilibft.h
HEADER      = libft.h

# Colors
RED         = \033[0;31m
GREEN       = \033[0;32m
YELLOW      = \033[0;33m
BLUE        = \033[0;34m
MAGENTA     = \033[0;35m
CYAN        = \033[0;36m
BOLD        = \033[1m
RESET       = \033[0m

all: $(NAME)

$(NAME): $(OBJS)
	@printf "$(BOLD)$(BLUE)%12s$(RESET): $(YELLOW)Building$(RESET) $(NAME)\n" $(NAME)
	@ar rcs $(NAME) $(OBJS)

bonus: $(BONUS_OBJS)
	@printf "$(BOLD)$(BLUE)%12s$(RESET): $(YELLOW)Including$(RESET) bonus $(NAME) files\n" $(NAME)
	@ar rcs $(NAME) $(BONUS_OBJS)

test: $(OBJS) $(TEST_OBJS) $(BONUS_OBJS)
	@-norminette -R CheckDefine | grep -v OK
	@$(CPP) $(OBJS) $(BONUS_OBJS) $(TEST_OBJS) -o test
	@printf "$(BOLD)$(BLUE)%12s$(RESET): $(CYAN)Running$(RESET) $(NAME)\n" $(NAME)
	@./test

%.o: %.cpp $(HEADER)
	@printf "$(BOLD)$(BLUE)%12s$(RESET): $(MAGENTA)Compiling$(RESET) $<\n" $(NAME)
	@$(CPP) -I$(INCLUDES) -c $< -o $@

%.o: %.c $(HEADER)
	@printf "$(BOLD)$(BLUE)%12s$(RESET): $(MAGENTA)Compiling$(RESET) $<\n" $(NAME)
	@$(CC) $(CFLAGS) -I$(INCLUDES) -c $< -o $@

clean:
	@printf "$(BOLD)$(BLUE)%12s$(RESET): $(RED)Removing$(RESET) object files\n" $(NAME)
	@rm -f $(OBJS) $(TEST_OBJS) $(BONUS_OBJS)

fclean: clean
	@printf "$(BOLD)$(BLUE)%12s$(RESET): $(RED)Removing$(RESET) executables and libraries\n" $(NAME)
	@rm -f $(NAME) a.out

re: fclean all

.PHONY: all clean fclean re
