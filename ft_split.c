/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_split.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: smamalig <smamalig@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/01/30 14:43:48 by smamalig          #+#    #+#             */
/*   Updated: 2025/05/02 10:46:41 by smamalig         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

static int	ft_is_sep(char *str, char charset)
{
	if (*str == charset)
		return (1);
	return (0);
}

static int	ft_count_letters(char *str, char charset)
{
	int		i;

	i = 0;
	while (str[i] && !(ft_is_sep(str + i, charset)))
		i++;
	return (i);
}

static int	ft_count_words(char *str, char charset)
{
	int		i;
	int		j;

	j = 0;
	while (*str)
	{
		if (*str && ft_is_sep(str, charset))
			str++;
		i = ft_count_letters(str, charset);
		str += i;
		if (i)
			j++;
	}
	return (j);
}

static char	*ft_strndup(char *str, int size)
{
	char	*dest;

	dest = malloc(sizeof(char) * (size + 1));
	if (!dest)
		return (NULL);
	dest[size] = '\0';
	while (size--)
		dest[size] = str[size];
	return (dest);
}

char	**ft_split(const char *s, char c)
{
	char	**str;
	int		size;
	int		i;
	int		j;

	i = 0;
	size = ft_count_words((char *)s, c);
	str = malloc(sizeof(char *) * (size + 1));
	if (!str)
		return (NULL);
	while (i < size)
	{
		while (*s && ft_is_sep((char *)s, c))
			s++;
		j = ft_count_letters((char *)s, c);
		str[i] = ft_strndup((char *)s, j);
		if (!str[i])
			return (NULL);
		s += j;
		i++;
	}
	str[size] = 0;
	return (str);
}
