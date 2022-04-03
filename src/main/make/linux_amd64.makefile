
CC = gcc

CFLAGS    = -g -Wall -Wno-format-zero-length -Wno-pointer-sign -Wno-unused-variable
DEFINES   = 
INCLUDES = -I $(SOURCE)
SOURCES = $(wildcard $(SOURCE)/*.c)
HEADERS = $(wildcard $(SOURCE)/*.h) 

NAME = example-c

all : $(NAME)

$(NAME): $(SOURCES) $(HEADERS)
	@echo SOURCE = $(SOURCE)
	@echo INCLUDES = $(INCLUDES)
	@echo SOURCES = $(SOURCES)
	@echo HEADERS = $(HEADERS)
	$(CC) $(CFLAGS) $(DEFINES) $(INCLUDES) $(SOURCES) -o $(NAME)

clean::
	-@rm $(NAME)
