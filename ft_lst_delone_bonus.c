/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_lst_delone.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: smamalig <smamalig@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/02/12 01:44:30 by smamalig          #+#    #+#             */
/*   Updated: 2025/02/12 01:47:42 by smamalig         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

void	ft_lst_delone(t_list *el, void (*del)(void *))
{
	if (!el || !del)
		return ;
	if (el->content)
		del(el->content);
	free(el);
}
