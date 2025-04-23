/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strtrim.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: smamalig <smamalig@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/02/10 21:09:08 by smamalig          #+#    #+#             */
/*   Updated: 2025/04/03 21:19:05 by smamalig         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"
#include <stddef.h>
#include <stdio.h>

char	*ft_strtrim(const char *s, const char *trim)
{
	size_t	len;

	while (*s && ft_strchr(trim, *s))
		s++;
	len = ft_strlen(s) - 1;
	while (s[len] && ft_strrchr(trim, s[len]))
		len--;
	return (ft_substr(s, 0, len + 1));
}
