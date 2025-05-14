/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_split.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: smamalig <smamalig@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/01/30 14:43:48 by smamalig          #+#    #+#             */
/*   Updated: 2025/05/08 23:00:02 by smamalig         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

static int	count_words(const char *s, char delim)
{
	int	count;
	int	in_word;

	count = 0;
	in_word = 0;
	if (!s)
		return (1);
	while (*s)
	{
		if (*s != delim)
		{
			if (!in_word)
			{
				count++;
				in_word = 1;
			}
		}
		else
			in_word = 0;
		s++;
	}
	return (count + 1);
}

static void	ft_split_inner(const char *s, char delim, char **retval)
{
	int		set;
	char	*start;

	set = 0;
	start = (char *)s;
	while (*s)
	{
		if (*s == delim)
		{
			if (set)
				*retval++ = ft_substr(start, 0, s - start);
			set = 0;
			start = (char *)s + 1;
		}
		if (*s != delim)
			set = 1;
		s++;
	}
	if (set)
		*retval++ = ft_substr(start, 0, s - start);
	*retval = 0;
}

char	**ft_split(const char *s, char delim)
{
	char	**retval;

	retval = malloc(sizeof(char *) * count_words(s, delim));
	if (!retval)
		return (NULL);
	if (!s)
		return (retval);
	ft_split_inner(s, delim, retval);
	return (retval);
}
