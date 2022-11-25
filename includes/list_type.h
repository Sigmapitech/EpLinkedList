/*
** EPITECH PROJECT, 2022
** LinkedList - Mini LinkedList lib
** File description:
** Header file for list structures
*/

#ifndef SG_LINKED_LIST_TYPE_
    #define SG_LINKED_LIST_TYPE_

    #include "utils.h"

typedef struct list_s list_t;
typedef struct list_node_s list_node_t;

struct list_node_s {
    void *value;
    list_node_t *next;
    list_node_t *prev;
};

struct list_s {
    list_node_t *head;
    list_node_t *tail;
    u_int size;
};
#endif
