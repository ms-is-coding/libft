/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_itoa.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: smamalig <smamalig@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/02/11 22:14:24 by smamalig          #+#    #+#             */
/*   Updated: 2025/03/20 12:31:24 by smamalig         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

static int	ft_intlen_itoa(int n)
{
	int	len;

	len = 0;
	if (n <= 0)
		len++;
	while (n)
	{
		len++;
		n /= 10;
	}
	return (len);
}

static int	ft_abs(int n)
{
	const int	mask = n >> 31;

	return ((n + mask) ^ mask);
}

char	*ft_itoa(int n)
{
	char	*buf;
	int		i;

	i = ft_intlen_itoa(n);
	buf = malloc(i + 1);
	if (!buf)
		return (NULL);
	buf[i--] = 0;
	if (n < 0)
		buf[0] = '-';
	if (n == 0)
		buf[0] = '0';
	while (n)
	{
		buf[i--] = ft_abs(n % 10) + '0';
		n /= 10;
	}
	return (buf);
}
