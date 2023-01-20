/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_printf.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: tde-sous <tde-sous@42.porto.com>           +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/01/18 10:32:56 by tde-sous          #+#    #+#             */
/*   Updated: 2023/01/20 13:24:40 by tde-sous         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft/libft.h"
#include "ft_printf.h"

int	ft_check(const char *str, va_list ap)
{
	int	count;

	count = 0;
	if (*str == 'c')
		count += ft_int_putchar(va_arg(ap, int));
	if (*str == 's')
		count += ft_int_putstr(va_arg(ap, char *));
	if (*str == 'p')
		count += ft_int_putpointer(va_arg(ap, unsigned long));
	if (*str == 'd' || *str == 'i')
		count += ft_int_putnbr(va_arg(ap, int));
	if (*str == 'u')
		count += ft_int_putnbr(va_arg(ap, unsigned int));
	if (*str == 'x' || *str == 'X')
		count += ft_int_puthex(va_arg(ap, unsigned int), *str);
	if (*str == '%')
		count += ft_int_putchar('%');
	return (count);
}

int	ft_printf(const char *str, ...)
{
	int		count;
	va_list	ap;

	count = 0;
	va_start(ap, str);
	while (*str)
	{
		if (*(str) == '%')
		{
			count += ft_check((str + 1), ap);
			str++;
		}
		else
			count += ft_int_putchar(*str);
		str++;
	}
	va_end(ap);
	return (count);
}

/* #include <stdio.h>

int	main(int argc, char **argv)
{
	(void) argc;
	(void) argv;
	unsigned int p = 581283;
	
	int i;
	printf("Printf replica:\n");
	i = ft_printf(" %p %p ", 0, 0);
	printf("\nReturn Value: %d", i);
	printf("\nPrintf original:\n");
	i = printf(" %p %p ", 0, 0);
	printf("\nReturn Value: %d", i);
	return (0);
} */