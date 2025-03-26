/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_lstclear.c                                      :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: smamalig <smamalig@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/02/12 01:47:59 by smamalig          #+#    #+#             */
/*   Updated: 2025/02/12 01:50:19 by smamalig         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

void	ft_lstclear(t_list **ptr, void (*del)(void *))
{
	t_list	*temp;

	if (!ptr)
		return ;
	while (*ptr)
	{
		temp = *ptr;
		*ptr = temp->next;
		if (temp->content)
			del(temp->content);
		free(temp);
	}
}
