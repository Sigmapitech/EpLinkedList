/*
** EPITECH PROJECT, 2022
** LinkedList - Mini LinkedList lib
** File description:
** Create a new empty list
*/

#include <malloc.h>
#include "list.h"


list_t *list_create(void)
{
    list_t *list = malloc(sizeof(list_t));

    if (list == NULL)
        return (NULL);
    list->head = NULL;
    list->tail = NULL;
    list->size = 0;
    return list;
}
