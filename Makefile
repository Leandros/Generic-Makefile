CC			?= gcc
CXX			?= g++
LD			?= ld
DEBUG		?= -ggdb -O0 -march=native
OUTPUT		:= -MMD -MP
override CFLAGS		+= $(DEBUG) -x c -Wall -Wextra -pedantic -ansi
override CFLAGS		+= -Wstrict-overflow -fno-strict-aliasing
override CXXFLAGS	+= $(DEBUG) -x c++ -Wall -Wextra -pedantic
override CPPFLAGS	+=
override LDFLAGS	+= -macosx_version_min 10.11 -arch x86_64
override LDLIBS		+= -lc -lc++

CSRC		:= $(wildcard *.c)
CXXSRC		:= $(wildcard *.cc)
COBJ		:= $(CSRC:.c=.o)
CXXOBJ		:= $(CXXSRC:.cc=.o)
CDEP		:= $(CSRC:.c=.d)
CXXDEP		+= $(CXXSRC:.cc=.d)
EXE			:= foo
-include $(CDEP)
-include $(CXXDEP)

PREFIX		?= /usr/local
BINDIR		:= $(PREFIX)/bin

RM			= rm
RMFLAGS		= -f

.PHONY: clean
.DEFAULT_GOAL := all

all: $(EXE)

%.o: %.c
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< $(OUTPUT) -o $@

%.o: %.cc
	$(CXX) $(CXXFLAGS) $(CPPFLAGS) -c $< $(OUTPUT) -o $@

$(EXE): $(COBJ) $(CXXOBJ)
	$(LD) $(LDFLAGS) $(LDLIBS) -o $(EXE) $^


install: $(EXE)
	install -d $(BINDIR)
	install $(BIN) $(BINDIR)

clean:
	$(RM) $(RMFLAGS) $(COBJ) $(CXXOBJ) $(CDEP) $(CXXDEP) $(EXE)
