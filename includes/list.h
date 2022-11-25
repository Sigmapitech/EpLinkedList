/*
** EPITECH PROJECT, 2022
** LinkedList - Mini LinkedList lib
** File description:
** Header file for functions definitions
*/

#ifndef SG_LINKED_LIST_
    #define SG_LINKED_LIST_

    #include "list_type.h"
    #include "utils.h"

list_t *list_create(void);
u_int list_append(list_t *list, list_node_t *value);

void *list_get(list_t *list, u_int index);
list_node_t *list_get_node(list_t *list, u_int index);

void list_remove(list_t *list, u_int index);
#endif
