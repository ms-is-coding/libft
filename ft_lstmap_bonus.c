/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_lstmap_bonus.c                                  :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: smamalig <smamalig@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/02/12 01:50:39 by smamalig          #+#    #+#             */
/*   Updated: 2025/04/07 00:04:19 by smamalig         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

t_list	*ft_lstmap(t_list *list, void *(*f)(void *), void (*del)(void *))
{
	t_list	*new;
	t_list	*ref;
	t_list	*temp;

	if (!list)
		return (NULL);
	new = ft_lstnew(f(list->content));
	ref = new;
	list = list->next;
	while (list)
	{
		ref->next = ft_lstnew(f(list->content));
		ref = ref->next;
		temp = list;
		list = list->next;
		ft_lstdelone(temp, del);
	}
	return (new);
}
