CC 		= 	/usr/bin/gcc
CC2		= 	/usr/bin/gcc
DATASOURCE      =       SAMPLE
DB2INSTANCEPATH =       /home/$(DB2INSTANCE)
CFLAGS 		= 	-g -w  -Wunused
LIBDIR 		= 	-L$(DB2LIB) -ldb2
INCLUDE 	= 	-I$(DB2_HOME)/include
SHELL		=	/bin/bash
REPLVER         :=      $(shell date +%y%m%d%H%M%S)


.SUFFIXES:  .c .sqc
.sqc.c:
	db2 connect to $(DATASOURCE)
	echo VERSION $(REPLVER)
	db2 prep $> bindfile VERSION `/usr/bin/date +%y%m%d%H%M%S`
	db2 bind $*.bnd
	cp $@ $@.tmp
	db2 terminate


all : wlmtest
wlmtest.c:	wlmtest.sqc
wlmtest:	wlmtest.c
	$(CC) $(CFLAGS) $(INCLUDE) $(LIBDIR) -o $@ $>

clean:
	rm -f *.c.c *.i *.o *.bnd *.tmp $(OBJ) wlmtest wlmtest.c *.trc
