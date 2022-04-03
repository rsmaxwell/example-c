
CC = gcc

CFLAGS    = -g -Wall -Wno-format-zero-length -Wno-pointer-sign -Wno-unused-variable
DEFINES   = 
INCLUDES = -I $(SOURCE)
SOURCES = $(wildcard $(SOURCE)/*.c)
HEADERS = $(wildcard $(SOURCE)/*.h) 

NAME = example-c

all : $(NAME)

$(NAME): $(SOURCES) $(HEADERS)
	@echo BUILD_TYPE = $(BUILD_TYPE)
	@echo SOURCE = $(SOURCE)
	@echo INSTALL = $(INSTALL)
	@echo INCLUDES = $(INCLUDES)
	@echo SOURCES = $(SOURCES)
	@echo HEADERS = $(HEADERS)
	@echo pwd = ${CURDIR}
	$(CC) $(CFLAGS) $(DEFINES) $(INCLUDES) $(SOURCES) -o $(NAME)

clean::
	-@rm $(NAME)
