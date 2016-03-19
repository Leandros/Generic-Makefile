CC			?= gcc
LD			?= ld

DEBUG		?= -ggdb -O0 -march=native
OUTPUT		:= -MMD -MP
override CFLAGS		+= $(DEBUG) -Wall -Wextra -pedantic -ansi
override CFLAGS		+= -Wstrict-overflow -fno-strict-aliasing
override CPPFLAGS	+=
override LDFLAGS	+= -macosx_version_min 10.11 -arch x86_64
override LDLIBS		+= -lc

SRC			:= $(wildcard *.c)
OBJ			:= $(SRC:.c=.o)
DEP			:= $(SRC:.c=.d)
EXE			:= benchmark
-include $(DEP)

PREFIX		?= /usr/local
BINDIR		:= $(PREFIX)/bin

RM			?= rm
RMFLAGS		?= -f

.PHONY: clean
.DEFAULT_GOAL := all

all: $(EXE)

%.o: %.c
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< $(OUTPUT) -o $@

$(EXE): $(OBJ)
	$(LD) $(LDFLAGS) $(LDLIBS) -o $(EXE) $<


install: $(EXE)
	install -d $(BINDIR)
	install $(BIN) $(BINDIR)

clean:
	$(RM) $(RMFLAGS) $(OBJ) $(DEP) $(EXE)
