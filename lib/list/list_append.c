/*
** EPITECH PROJECT, 2022
** LinkedList - Mini LinkedList lib
** File description:
** Append a node to a list
*/

#include <malloc.h>
#include "list.h"
#include "utils.h"

local u_int list_append_node(list_t *list, list_node_t *node)
{
    list->size++;
    if (list->tail == NULL) {
        list->tail = node;
        list->head = node;
        return 0;
    }
    list->tail->next = node;
    node->prev = list->tail;
    list->tail = node;
    return list->size - 1;
}

u_int list_append(list_t *list, list_node_t *value)
{
    list_node_t *node;

    if (list == NULL || value == NULL)
        return -1;
    node = malloc(sizeof(list_node_t));
    node->value = value;
    node->next = NULL;
    node->prev = NULL;
    return list_append_node(list, node);
}
