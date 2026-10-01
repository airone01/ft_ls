NAME        := ft_ls

CC          := cc
CFLAGS      := -Wall -Wextra -Werror -MMD -MP
CPPFLAGS    := -Isrc -Isrc/cli -Isrc/core -Isrc/display -Isrc/format -Isrc/sort

SRCDIR      := src
OBJDIR      := obj

SRCS        := src/main.c \
               src/util.c \
               src/cli/cli.c \
               src/core/entry.c \
               src/core/traverse.c \
               src/display/display_grid.c \
               src/display/display_list.c \
               src/format/date.c \
               src/format/metadata.c \
               src/format/mode.c \
               src/sort/sort.c

OBJS        := $(SRCS:src/%.c=$(OBJDIR)/%.o)
DEPS        := $(OBJS:.o=.d)

RM          := rm -rf

all: $(NAME)

$(NAME): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $(NAME)

$(OBJDIR)/%.o: $(SRCDIR)/%.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

clean:
	$(RM) $(OBJDIR)

fclean: clean
	$(RM) $(NAME)

re: fclean all

bonus: all

-include $(DEPS)

.PHONY: all clean fclean re bonus
