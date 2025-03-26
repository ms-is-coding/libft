/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_calloc.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: smamalig <smamalig@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/02/10 16:15:48 by smamalig          #+#    #+#             */
/*   Updated: 2025/02/10 16:33:53 by smamalig         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"
#include <errno.h>

void	*ft_calloc(size_t n, size_t size)
{
	bool	overflow;
	void	*ptr;

	overflow = (size != 0) && (n > SIZE_MAX / size);
	if (overflow)
	{
		errno = EOVERFLOW;
		return (NULL);
	}
	ptr = malloc(n * size);
	if (!ptr)
		return (NULL);
	ft_memset(ptr, 0, n * size);
	return (ptr);
}
