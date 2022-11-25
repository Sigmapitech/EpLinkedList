##
## EPITECH PROJECT, 2022
## LS - LiSting command-like
## File description:
## Makefile
##

# Compilation
CC = gcc
CFLAGS = -I includes/
DFLAGS = -W -Wall -Wextra -fno-builtin -std=c99 -MMD -MP
LIB = $(BUILD_DIR)/lib/liblist.a

# Sources
SRC_DIR = lib/list
SRC = \
	$(SRC_DIR)/list_append.c                                                   \
	$(SRC_DIR)/list_create.c                                                   \
	$(SRC_DIR)/list_get.c                                                      \
	$(SRC_DIR)/list_remove.c

# Build
BUILD_DIR = build
OBJ := $(SRC:%.c=$(BUILD_DIR)/%.o)

# Deps
DEPS := $(SRC:%.c=$(BUILD_DIR)/%.d)


# Colors
ifneq ($(shell tput colors),0)
    C_BOLD=\e[1m
    C_RESET=\033[00m
    C_BLUE=\e[34m
    C_RED=\e[31m
    C_CYAN=\e[36m
else
    C_BOLD=
    C_RESET=
    C_BLUE=
    C_CYAN=
endif

# Definitions
_ECHO  = /bin/echo -e

# Output
ASK = @ $(_ECHO) "$(C_BOLD)$(C_BLUE)?$(C_RESET)"
OK = @ $(_ECHO) "$(C_BOLD)[$(C_BLUE)OK$(C_RESET)$(C_BOLD)]$(C_RESET)"
KO = @ $(_ECHO) "$(C_BOLD)[$(C_RED)KO$(C_RESET)$(C_BOLD)]$(C_RESET)"
NTD = @ $(_ECHO) "$(C_BOLD)Nothing to do.$(C_RESET)"

# Errors
DIE = exit 1

all: $(LIB)
	$(NTD)

# Check
%.c:
	$(KO) "Missing file: $@" && $(DIE)

%:
	$(KO) "Unknown directive $@" && $(DIE)

$(BUILD_DIR)/%.d: %.c
	@ mkdir -p $(dir $@)
	@ $(CC) $(CFLAGS) $(DFLAGS) -MM -MT $(@:.d=.o) $< -MF $@

-include $(DEPS)

# Link
$(BUILD_DIR)/%.o: %.c
	@ mkdir -p $(@D)
	@ $(CC) $(CFLAGS) $(DFLAGS) -c $< -o $@ || $(DIE)
	$(OK) "$(CC) $(C_CYAN)    $<$(C_RESET)"

# Exec
$(LIB): $(DEPS) $(OBJ)
	ar rc $(LIB) $(OBJ)
	$(OK) "Compiled $(C_BLUE)$(shell echo "$?" | wc -w)$(C_RESET) file(s)"


# Debug
debug: CFLAGS += $(DFLAGS)
debug: re

v: CFLAGS += -g

v: re
	$(ASK) "program arguments"
	@ read ARG; valgrind --track-origins=yes --leak-check=full -s \
 		./$(EXEC) $${ARG} 2> "logs/trace_$(shell date +%s)_.log"
	$(NTD)

we: CFLAGS += $(WFLAGS)
we: re

.PHONY: debug v we

# Clean
clean:
	@ rm -rf $(BUILD_DIR)
	$(OK) "Deleted $(C_BLUE)$(BUILD_DIR)$(C_RESET)"
	@ rm -f *.log
	$(OK) "Deleted $(C_BLUE)*.log$(C_RESET)"
	@ rm -rf $(COV_DIR)
	$(OK) "Deleted $(C_BLUE)$(COV_DIR)$(C_RESET)"

fclean: clean
	@ rm -f "$(EXEC)"
	@ rm -f "$(TESTS_EXEC)"
	$(OK) "Deleted executable(s)"


re: fclean all

.PHONY: fclean re
