#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <unistd.h>
#include "include/libft.h"

int main(void) {
	printf("[BZERO] ----------------------------------------------------------------------\n");
	char bzero_test0[256];
	char bzero_test1[256];

	memset(bzero_test0, 0xFF, 255);
	memset(bzero_test1, 0, 255);
	bzero_test0[255] = 0xDD;
	bzero_test1[255] = 0xDD;

	ft_bzero(bzero_test0, 255);
	if (memcmp(bzero_test0, bzero_test1, 256))
		printf("ft_bzero() test FAILED!\n");
	else
		printf("ft_bzero() test SUCCEEDED!\n");

	printf("\n[STRCAT] ---------------------------------------------------------------------\n");
	char strcat_test0[256] = "STRCAT ";
	char strcat_test1[256] = "";
	char strcat_test2[256] = "lol nice";
	char strcat_test3[256] = "w O  A H     MA NG ";
	printf("ft_strcat(\"STRCAT \", \"IS GREAT\") => %s\n", ft_strcat(strcat_test0, "IS GREAT"));
	printf("ft_strcat(\"\", \"TESTING EMPTY STRINGS\") => %s\n", ft_strcat(strcat_test1, "TESTING EMPTY STRINGS"));
	printf("ft_strcat(\"lol nice\", \"\") => %s\n", ft_strcat(strcat_test2, ""));
	printf("ft_strcat(\"w O  A H     MA NG \", \"!!!!!!!!!\") => %s\n", ft_strcat(strcat_test3, "!!!!!!!!!"));

	printf("\n[ISALPHA] --------------------------------------------------------------------\n");
	int i;
	for (i = -128; i < 256; i++) {
		if (ft_isalpha(i) != isalpha(i)) {
			printf("[%d] ft_isalpha() tests FAILED!\n", i);
			break;
		}
	}
	if (i == 256)
		printf("ft_isalpha() tests SUCCEEDED!\n");

	printf("\n[ISDIGIT] --------------------------------------------------------------------\n");
	for (i = -128; i < 256; i++) {
		if (ft_isdigit(i) != isdigit(i)) {
			printf("[%d] ft_isdigit() tests FAILED!\n", i);
			break;
		}
	}
	if (i == 256)
		printf("ft_isdigit() tests SUCCEEDED!\n");

	printf("\n[ISALNUM] --------------------------------------------------------------------\n");
	for (i = -128; i < 256; i++) {
		if (ft_isalnum(i) != isalnum(i)) {
			printf("[%d] ft_isalnum() tests FAILED!\n", i);
			break;
		}
	}
	if (i == 256)
		printf("ft_isalnum() tests SUCCEEDED!\n");

	printf("\n[ISASCII] --------------------------------------------------------------------\n");
	for (i = -128; i < 256; i++) {
		if (ft_isascii(i) != isascii(i)) {
			printf("[%d] ft_isascii() tests FAILED!\n", i);
			break;
		}
	}
	if (i == 256)
		printf("ft_isascii() tests SUCCEEDED!\n");

	printf("\n[ISPRINT] --------------------------------------------------------------------\n");
	for (i = -128; i < 256; i++) {
		if (ft_isprint(i) != isprint(i)) {
			printf("[%d] ft_isprint() tests FAILED!\n", i);
			break;
		}
	}
	if (i == 256)
		printf("ft_isprint() tests SUCCEEDED!\n");

	printf("\n[TOUPPER] --------------------------------------------------------------------\n");
	for (i = -128; i < 256; i++) {
		if (ft_toupper(i) != toupper(i)) {
			printf("[%d] ft_toupper() tests FAILED!\n", i);
			break;
		}
	}
	if (i == 256)
		printf("ft_toupper() tests SUCCEEDED!\n");

	printf("\n[TOLOWER] --------------------------------------------------------------------\n");
	for (i = -128; i < 256; i++) {
		if (ft_tolower(i) != tolower(i)) {
			printf("[%d] ft_tolower() tests FAILED!\n", i);
			break;
		}
	}
	if (i == 256)
		printf("ft_tolower() tests SUCCEEDED!\n");

	printf("\n[PUTS] -----------------------------------------------------------------------\n");
	fflush(stdout);
	ft_puts("TEST0");
	ft_puts("");
	ft_puts("TEST1 WAS AN EMPTY STRING ^^^^^, THIS IS TEST2");

	printf("\n[STRLEN] ---------------------------------------------------------------------\n");
	printf("ft_strlen(\"\") => %zu\n", ft_strlen(""));
	printf("ft_strlen(\"TEST STRING\") => %zu\n", ft_strlen("TEST STRING"));
	printf("ft_strlen(\"123456789\") => %zu\n", ft_strlen("123456789"));
	printf("ft_strlen(\"ft_strlen(\\\"ft_strlen(\\\"\\\")\\\")\") => %zu\n", ft_strlen("ft_strlen(\"ft_strlen(\"\")\")"));

	printf("\n[MEMSET] ---------------------------------------------------------------------\n");
	char memset_test0[256];
	char memset_test1[256];

	memset(memset_test0, 0, 255);
	memset(memset_test1, 0xCC, 255);
	memset_test0[255] = 0xEE;
	memset_test1[255] = 0xEE;

	void *memset_res = ft_memset(memset_test0, 0xCC, 255);
	if (memcmp(memset_test0, memset_test1, 256))
		printf("ft_memset() test FAILED!\n");
	else
		printf("ft_memset() test SUCCEEDED!\n");
	if (memset_res != memset_test0)
		printf("ft_memset() returned an invalid result!\n");

	printf("\n[MEMCPY] ---------------------------------------------------------------------\n");
	char memcpy_test[256] = "I KNOW A SONG THAT GETS ON EVERYBODY'S NERVES";
	char memcpy_buffer[256];

	memcpy_test[255] = 0xFD;
	memset(memcpy_buffer, 0xFD, 256);
	void *memcpy_res = ft_memcpy(memcpy_buffer, memcpy_test, 255);
	if (memcmp(memcpy_buffer, memcpy_test, 256))
		printf("ft_memcpy() test FAILED!\n");
	else
		printf("ft_memcpy() test SUCCEEDED!\n");
	if (memcpy_res != memcpy_buffer)
		printf("ft_memcpy() returned an invalid result!\n");

	printf("\n[STRDUP] ---------------------------------------------------------------------\n");
	char	*strdup_test0 = "TEST0";
	char	*strdup_test1 = "";
	char	*strdup_test2 = "TEST1 WAS AN EMPTY STRING ^^^^^, THIS IS TEST2";

	char *strdup_buffer0 = ft_strdup(strdup_test0);
	char *strdup_buffer1 = ft_strdup(strdup_test1);
	char *strdup_buffer2 = ft_strdup(strdup_test2);

	printf("[%p] %s => [%p] => %s\n", strdup_test0, strdup_test0, strdup_buffer0, strdup_buffer0);
	printf("[%p] %s => [%p] => %s\n", strdup_test1, strdup_test1, strdup_buffer1, strdup_buffer1);
	printf("[%p] %s => [%p] => %s\n", strdup_test2, strdup_test2, strdup_buffer2, strdup_buffer2);

	// printf("\n[ISSPACE] --------------------------------------------------------------------\n");
	// for (i = -128; i < 256; i++) {
	// 	if (ft_isspace(i) != isspace(i)) {
	// 		printf("[%d] ft_isspace() tests FAILED!\n", i);
	// 		break;
	// 	}
	// }
	// if (i == 256)
	// 	printf("ft_isspace() tests SUCCEEDED!\n");

	// printf("\n[MEMCMP] ---------------------------------------------------------------------\n");
	// if (ft_memcmp(bzero_test0, bzero_test1, 256))
	// 	printf("ft_memcmp() => ft_bzero() test FAILED!\n");
	// else
	// 	printf("ft_memcmp() => ft_bzero() test SUCCEEDED!\n");

	// if (ft_memcmp(memset_test0, memset_test1, 256))
	// 	printf("ft_memcmp() => ft_memset() test FAILED!\n");
	// else
	// 	printf("ft_memcmp() => ft_memset() test SUCCEEDED!\n");

	// if (ft_memcmp(bzero_test0, memset_test1, 256))
	// 	printf("ft_memcmp() test SUCCEEDED!\n");
	// else
	// 	printf("ft_memcmp() test FAILED!\n");

	// printf("\n[MEMMOVE] --------------------------------------------------------------------\n");
	// char memmove_test[] = "memmove can be very useful......";

	// void *memmove_res = ft_memmove(memmove_test + 20, memmove_test + 15, 11);
	// if (strcmp(memmove_test, "memmove can be very very useful."))
	// 	printf("ft_memmove() test FAILED!\n");
	// else
	// 	printf("ft_memmove() test SUCCEEDED!\n");
	// if (memmove_res != (memmove_test + 20))
	// 	printf("ft_memmove() returned an invalid result!\n");

	// printf("\n[STRCPY] ---------------------------------------------------------------------\n");
	// char strcpy_test[256] = "I KNOW A SONG THAT GETS ON EVERYBODY'S NERVES";
	// char strcpy_buffer[256];

	// memset(strcpy_buffer, 0, 256);
	// char *strcpy_res = ft_strcpy(strcpy_buffer, strcpy_test);
	// if (memcmp(strcpy_buffer, strcpy_test, 256))
	// 	printf("ft_strcpy() test FAILED!\n");
	// else
	// 	printf("ft_strcpy() test SUCCEEDED!\n");
	// if (strcpy_res != strcpy_buffer)
	// 	printf("ft_strcpy() returned an invalid result!\n");

	// printf("\n[STRCMP] ---------------------------------------------------------------------\n");
	// if (ft_strcmp(memmove_test, "memmove can be very very useful."))
	// 	printf("ft_strcmp() => ft_memmove() test FAILED!\n");
	// else
	// 	printf("ft_strcmp() => ft_memmove() test SUCCEEDED!\n");

	// if (ft_strcmp("WOA", "WOA") == strcmp("WOA", "WOA"))
	// 	printf("ft_strcmp() test0 SUCCEEDED!\n");
	// else
	// 	printf("ft_strcmp() test0 FAILED!\n");

	// if (ft_strcmp("", "WOA") == strcmp("", "WOA"))
	// 	printf("ft_strcmp() test1 SUCCEEDED!\n");
	// else
	// 	printf("ft_strcmp() test1 FAILED!\n");

	// if (ft_strcmp("WOA", "") == strcmp("WOA", ""))
	// 	printf("ft_strcmp() test2 SUCCEEDED!\n");
	// else
	// 	printf("ft_strcmp() test2 FAILED!\n");

	// if (ft_strcmp("", "") == strcmp("", ""))
	// 	printf("ft_strcmp() test3 SUCCEEDED!\n");
	// else
	// 	printf("ft_strcmp() test3 FAILED!\n");

	// if (ft_strcmp("WATER", "WATTR") == strcmp("WATER", "WATTR"))
	// 	printf("ft_strcmp() test4 SUCCEEDED!\n");
	// else
	// 	printf("ft_strcmp() test4 FAILED!\n");

	// if (ft_strcmp("SEVENTY", "SIZ") == strcmp("SEVENTY", "SIZ"))
	// 	printf("ft_strcmp() test5 SUCCEEDED!\n");
	// else
	// 	printf("ft_strcmp() test5 FAILED!\n");

	// if (ft_strcmp("SIZ", "SEVENTY") == strcmp("SIZ", "SEVENTY"))
	// 	printf("ft_strcmp() test6 SUCCEEDED!\n");
	// else
	// 	printf("ft_strcmp() test6 FAILED!\n");

	printf("\n[CAT] ------------------------------------------------------------------------\n");
	fflush(stdout);
	ft_cat(-1);
	ft_cat(STDIN_FILENO);

	return (0);
}
