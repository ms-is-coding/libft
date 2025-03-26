/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libft.h                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: smamalig <smamalig@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/02/06 23:32:58 by smamalig          #+#    #+#             */
/*   Updated: 2025/03/13 10:41:05 by smamalig         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef LIBFT_H
# define LIBFT_H

# include <stdbool.h>
# include <stdlib.h>
# include <stddef.h>
# include <stdint.h>
# include <unistd.h>

/**********************/
/* LibFT #1 functions */
/**********************/

int		ft_isalpha(int c);
int		ft_isalnum(int c);
int		ft_isdigit(int c);
int		ft_isascii(int c);
int		ft_isprint(int c);

int		ft_toupper(int c);
int		ft_tolower(int c);

size_t	ft_strlen(const char *s);
void	*ft_memset(void *s, int c, size_t n);
void	ft_bzero(void *s, size_t n);
void	*ft_memcpy(void *dst, const void *src, size_t n);
void	*ft_memmove(void *dst, const void *src, size_t n);
char	*ft_strchr(const char *s, int c);
char	*ft_strrchr(const char *s, int c);
int		ft_strncmp(const char *s1, const char *s2, size_t n);
void	*ft_memchr(const void *s, int c, size_t n);
int		ft_memcmp(const void *s1, const void *s2, size_t n);
char	*ft_strdup(const char *s);

int		ft_atoi(const char *nptr);
void	*ft_calloc(size_t n, size_t size);

size_t	ft_strlcpy(char *dst, const char *src, size_t dsize);
size_t	ft_strlcat(char *dst, const char *src, size_t dsize);
char	*ft_strnstr(const char *haystack, const char *needle, size_t n);

/**********************/
/* LibFT #2 functions */
/**********************/

char	*ft_substr(const char *s, size_t start, size_t size);
char	*ft_strjoin(const char *s1, const char *s2);
char	*ft_strtrim(const char *s, const char *trim);
char	**ft_split(const char *s, char delim);
char	*ft_itoa(int n);
char	*ft_strmapi(const char *s, char (*f)(size_t, char));
void	ft_striteri(char *s, void (*f)(size_t, char *));

void	ft_putchar_fd(char c, int fd);
void	ft_putstr_fd(const char *s, int fd);
void	ft_putendl_fd(const char *s, int fd);
void	ft_putnbr_fd(int n, int fd);

/*************************/
/* LibFT bonus functions */
/*************************/

typedef struct s_list
{
	void			*content;
	struct s_list	*next;
}	t_list;

int		ft_lstsize(t_list *list);
t_list	*ft_lstnew(void *content);
t_list	*ft_lstlast(t_list *list);
void	ft_lstadd_front(t_list **ptr, t_list *el);
void	ft_lstadd_back(t_list **ptr, t_list *el);
void	ft_lstdelone(t_list *el, void (*del)(void *));
void	ft_lstclear(t_list **ptr, void (*del)(void *));
void	ft_lstiter(t_list *list, void (*f)(void *));
t_list	*ft_lstmap(t_list *list, void *(*f)(void *), void (*del)(void *));

#endif
