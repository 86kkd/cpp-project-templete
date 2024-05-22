CFLAGS   += $(pkgconf --cflags opencv4)
LDLIBS   += $(pkgconf --libs opencv4)
# Usage:
# make        # compile all binary
# make clean  # remove ALL binaries and objects

.PHONY = all clean

CC = g++			# compiler to use

LINKERFLAG =  -lopencv_core -lopencv_highgui -lopencv_imgproc
INCLUDE = -I/usr/include/opencv4

SRCS := $(wildcard *.cpp)
BINS := $(SRCS:%.cpp=%.bin)
OBJS := $(SRCS:%.cpp=%.o)

all: main.bin
# all: 
# 	@echo "${BINS}"

%.bin: ${OBJS}
	@echo "Checking.."
	${CC} ${OBJS}  -o $@  ${LINKERFLAG}

# default out is %.o here is verbose
%.o: %.cpp 
	@echo "Creating object.."
	${CC} -c $< ${INCLUDE} -o $@

clean:
	@echo "Cleaning up..."
	rm -rvf *.o ${BINS}.bin