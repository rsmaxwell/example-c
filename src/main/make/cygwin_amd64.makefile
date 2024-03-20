
CC = gcc

CFLAGS    = -g -Wall
DEFINES   = 
INCLUDES = -I $(SOURCE)
SOURCES = $(wildcard $(SOURCE)/*.c)
HEADERS = $(wildcard $(SOURCE)/*.h) 

NAME = example-c
FAMILY = cygwin
ARCH = amd64
ARTIFACTID = ${NAME}_${FAMILY}_$(ARCH)
VERSION = $(or $(BUILD_ID), SNAPSHOT)
PACKAGING = zip
ZIPFILE = ${ARTIFACTID}_${VERSION}.${PACKAGING}

all : $(ZIPFILE)

$(NAME): $(SOURCES) $(HEADERS)
	$(CC) $(CFLAGS) $(DEFINES) $(INCLUDES) $(SOURCES) -o $(NAME)

$(ZIPFILE): $(NAME)
	zip $(ZIPFILE) $(NAME)

clean::
	-@rm $(NAME)
