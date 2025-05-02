/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_lstmap_bonus.c                                  :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: smamalig <smamalig@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/02/12 01:50:39 by smamalig          #+#    #+#             */
/*   Updated: 2025/05/02 10:42:21 by smamalig         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

t_list	*ft_lstmap(t_list *lst, void *(*f)(void *), void (*del)(void *))
{
	t_list	*tmp;
	t_list	*new;

	tmp = NULL;
	while (lst)
	{
		new = ft_lstnew(f(lst->content));
		if (!new)
		{
			while (tmp)
			{
				new = tmp->next;
				del(tmp->content);
				free(tmp);
				tmp = new;
			}
			return (NULL);
		}
		ft_lstadd_back(&tmp, new);
		lst = lst->next;
	}
	return (tmp);
}
