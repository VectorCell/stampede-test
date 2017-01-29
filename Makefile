SHELL := /bin/bash

CSTD   := c11
CPPSTD := c++11

ifeq "$(CXX)" "g++"
	GCCVERSIONLT48 := $(shell expr `gcc -dumpversion` \< 4.8)
	ifeq "$(GCCVERSIONLT48)" "1"
		CSTD := c99
		CPPSTD := c++0x
	endif
endif

CFLAGS   := -pedantic -std=$(CSTD) -Wall -Werror -O3
CPPFLAGS := -pedantic -std=$(CPPSTD) -Wall -Werror -O3
LIBFLAGS := -lcrypto -lssl

all : 01-serial

01-serial : 01-serial.c
	$(CC) $(CFLAGS) -o 01-serial 01-serial.c $(LIBFLAGS)

test : all
	./01-serial

submit : all
	sbatch 01-serial.sh

clean :
	rm -f *.d
	rm -f *.o
	rm -f 01-serial

purge : clean
	rm -f log/*

-include *.d
