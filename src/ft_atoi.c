/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_atoi.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: lbraga <lbraga@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/04/13 16:12:06 by lbraga            #+#    #+#             */
/*   Updated: 2025/09/26 11:18:39 by lbraga           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

static int	ft_isspace(int c);

int	ft_atoi(const char *nptr)
{
	int	s;
	int	r;

	s = 1;
	r = 0;
	while (ft_isspace(*nptr))
		nptr++;
	if (*nptr == '+' || *nptr == '-')
	{
		if (*(nptr++) == '-')
			s = -s;
	}
	while (ft_isdigit(*nptr))
		r = (r * 10) + (*(nptr++) - '0');
	return (r * s);
}

static int	ft_isspace(int c)
{
	if (c == 32 || (c >= 9 && c <= 13))
		return (8192);
	return (0);
}

/* int	main(int ac, char **av)
{
	if (ac == 2)
		printf("%d", ft_atoi(av[1]));
	printf("\n");
	return (0);
} */
