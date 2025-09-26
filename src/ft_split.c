/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_split.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: lbraga <lbraga@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/04/24 22:50:11 by lbraga            #+#    #+#             */
/*   Updated: 2025/09/26 14:09:11 by lbraga           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

static size_t	cntwrd(char const *s, char c);
static size_t	cpywrds(char const *s, char **words, char c);

char	**ft_split(char const *s, char c)
{
	size_t	w;
	size_t	count;
	char	**words;

	count = cntwrd(s, c);
	words = (char **)malloc((count + 1) * sizeof(char *));
	if (!words)
		return (NULL);
	w = cpywrds(s, words, c);
	if (w != (size_t) -1)
	{
		while (w--)
			free(words[w]);
		free(words);
		return (NULL);
	}
	words[count] = NULL;
	return (words);
}

static size_t	cntwrd(char const *s, char c)
{
	size_t	count;

	count = 0;
	while (*s)
	{
		while (*s == c)
			s++;
		if (*s)
			count++;
		while (*s != c && *s)
			s++;
	}
	return (count);
}

static size_t	cpywrds(char const *s, char **words, char c)
{
	size_t	w;
	size_t	end;
	size_t	sta;

	w = 0;
	end = 0;
	while (s[end])
	{
		while (s[end] == c)
			end++;
		sta = end;
		while (s[end] != c && s[end])
			end++;
		if (end > sta)
		{
			words[w] = ft_substr(s, sta, end - sta);
			if (!words[w])
				return (w);
			w++;
		}
	}
	return ((size_t) -1);
}

//return ((size_t) -1) means success 
