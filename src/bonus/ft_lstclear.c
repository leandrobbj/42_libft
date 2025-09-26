/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_lstclear.c                                      :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: lbraga <lbraga@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/04/29 23:40:13 by lbraga            #+#    #+#             */
/*   Updated: 2025/09/26 15:05:30 by lbraga           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

void	ft_lstclear(t_list **lst, void (*del)(void *))
{
	t_list	*swp;

	if (!lst || !del)
		return ;
	while (*lst)
	{
		swp = (*lst)->next;
		ft_lstdelone(*lst, del);
		*lst = swp;
	}
}
