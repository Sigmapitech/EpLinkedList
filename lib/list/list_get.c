/*
** EPITECH PROJECT, 2022
** LinkedList - Mini LinkedList lib
** File description:
** Retrieve a node from a list
*/

#include "list.h"
#include "utils.h"

list_node_t *list_get_node(list_t *list, u_int index)
{
    list_node_t *node;
    u_int curr = 0;

    if (!list)
        return NULL;
    node = list->head;
    if (!node)
        return NULL;
    while (node && ++curr < index)
        node = node->next;
    return node;
}

void *list_get(list_t *list, u_int index)
{
    list_node_t *node = list_get_node(list, index);

    if (!node)
        return NULL;
    return node->value;
}
