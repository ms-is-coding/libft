/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_substr.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: smamalig <smamalig@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/02/10 16:34:37 by smamalig          #+#    #+#             */
/*   Updated: 2025/04/03 20:57:47 by smamalig         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"
#include <stddef.h>

static size_t	ft_strnlen(const char *s, size_t n)
{
	size_t	len;

	len = 0;
	while (n-- && s[len])
		len++;
	return (len);
}

char	*ft_substr(const char *s, size_t start, size_t size)
{
	size_t	i;
	size_t	real_size;
	char	*res;

	real_size = size;
	if (!s)
		return (NULL);
	if (ft_strlen(s) < start)
		return (ft_strdup(""));
	if (ft_strnlen(s + start, size) < real_size)
		real_size = ft_strnlen(s + start, size);
	res = malloc(sizeof(char) * (real_size + 1));
	if (!res)
		return (NULL);
	i = -1;
	while (++i < real_size)
		res[i] = s[start + i];
	res[i] = 0;
	return (res);
}
