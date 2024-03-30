
CC = gcc

CFLAGS    = -g -Wall
DEFINES   = 
INCLUDES = -I $(SOURCE)
SOURCES = $(wildcard $(SOURCE)/*.c)
HEADERS = $(wildcard $(SOURCE)/*.h) 

NAME = example-c


all : $(NAME)

$(NAME): $(SOURCES) $(HEADERS)
	$(CC) $(CFLAGS) $(DEFINES) $(INCLUDES) $(SOURCES) -o $(NAME)

clean::
	-@rm $(NAME)
