/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_split.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: smamalig <smamalig@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/01/30 14:43:48 by smamalig          #+#    #+#             */
/*   Updated: 2025/05/07 10:47:15 by smamalig         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

static int	ft_count_letters(char *s, char sep)
{
	int	i;

	i = 0;
	while (s[i] && s[i] != sep)
		i++;
	return (i);
}

static int	ft_count_words(char *s, char sep)
{
	int	i;
	int	j;

	j = 0;
	while (*s)
	{
		if (*s && *s == sep)
			s++;
		i = ft_count_letters(s, sep);
		s += i;
		if (i)
			j++;
	}
	return (j);
}

static char	*ft_strndup(char *s, int size)
{
	char	*dest;

	dest = malloc(sizeof(char) * (size + 1));
	if (!dest)
		return (NULL);
	dest[size] = '\0';
	while (size--)
		dest[size] = s[size];
	return (dest);
}

char	**ft_split(const char *s, char c)
{
	char	**arr;
	int		size;
	int		i;
	int		j;

	i = 0;
	size = ft_count_words((char *)s, c);
	arr = malloc(sizeof(char *) * (size + 1));
	if (!arr)
		return (NULL);
	while (i < size)
	{
		while (*s && *s == c)
			s++;
		j = ft_count_letters((char *)s, c);
		arr[i] = ft_strndup((char *)s, j);
		if (!arr[i])
			return (NULL);
		s += j;
		i++;
	}
	arr[size] = 0;
	return (arr);
}
