
CC = gcc

CFLAGS    = -g -Wall
DEFINES   = 
INCLUDES = -I $(SOURCE)
SOURCES = $(wildcard $(SOURCE)/*.c)
HEADERS = $(wildcard $(SOURCE)/*.h) 

NAME = example-c
ARTIFACTID = ${NAME}_amd64-linux
VERSION = ${BUILD_ID:-SNAPSHOT}
PACKAGING = zip
ZIPFILE = ${ARTIFACTID}_${VERSION}.${PACKAGING}

all : $(NAME)

$(NAME): $(SOURCES) $(HEADERS)
	$(CC) $(CFLAGS) $(DEFINES) $(INCLUDES) $(SOURCES) -o $(NAME)

$(ZIPFILE): $(NAME)
	$(CC) $(CFLAGS) $(DEFINES) $(INCLUDES) $(SOURCES) -o $(NAME)

clean::
	-@rm $(NAME)
