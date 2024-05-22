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

# define the main target is main.bin
all: main.bin
# all: 
# 	@echo "${BINS}"

# define the method to build .bin file (form .o file)
# $@ mean the targe file here is .bin file
%.bin: ${OBJS}
	@echo "Checking.."
	${CC} ${OBJS}  -o $@  ${LINKERFLAG}

# default out is %.o here is verbose
# $< mean .cpp file
%.o: %.cpp 
	@echo "Creating object.."
	${CC} -c $< ${INCLUDE} -o $@

clean:
	@echo "Cleaning up..."
	rm -rvf *.o ${BINS}.bin