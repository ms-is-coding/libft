/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strnstr.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: smamalig <smamalig@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/02/09 16:41:09 by smamalig          #+#    #+#             */
/*   Updated: 2025/02/11 21:49:25 by smamalig         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

char	*ft_strnstr(const char *haystack, const char *needle, size_t n)
{
	char		*match;
	size_t		i;

	(void)n;
	if (!haystack || !needle)
		return (NULL);
	if (!*needle)
		return ((char *)haystack);
	while (*haystack && n--)
	{
		if (*haystack == *needle)
		{
			match = (char *)haystack;
			i = 1;
			while (n-- && needle[i] && haystack[i] == needle[i])
				i++;
			if (!needle[i])
				return (match);
			n += i;
		}
		haystack++;
	}
	return (NULL);
}
