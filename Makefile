

HDR = RStarVisitor.h RStarBoundingBox.h RStarTree.h
SRC = main.cpp
EXE = rstar
CC = g++
OBJ = ${SRC:.cpp=.o}
CPPFLAGS = -ggdb -Wall -Werror
#CPPFLAGS = -O2 -Wall

.DEFAULT : all

all : ${EXE} 
	
${EXE} : ${OBJ}
	${CC} ${CPPFLAGS} -o $@ ${OBJ}

.SUFFIXES : .o  .cxx

.cpp.o:
	${CC} ${CPPFLAGS} -c $<


.PHONY : clean
clean :
	-rm -f all ${OBJ} ${EXE} *~ Depends


.PHONY : exec run
run exec : all
	./${EXE}


.PHONY : depend
.PHONY : Depends
Depends depend :
ifneq (${MAKECMDGOALS},clean)
	@echo "Creating dependencies..."
	@${CC} -E -MM ${SRC} > Depends
endif

-include Depends



