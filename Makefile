#SDL_VERSION=
SDL_VERSION=2

SRC=main.c apr.c mem.c tty.c
# clang
#CFLAGS= -Wno-shift-op-parentheses -Wno-logical-op-parentheses \
#        -Wno-bitwise-op-parentheses
CFLAGS=  -fno-diagnostics-show-caret \
	`sdl$(SDL_VERSION)-config --cflags` \
	`pkg-config SDL$(SDL_VERSION)_image --cflags`

LIBS=	`sdl$(SDL_VERSION)-config --libs` \
	`pkg-config SDL$(SDL_VERSION)_image --libs` \
	-lpthread

pdp6: $(SRC) pdp6.h
	$(CC) $(CFLAGS) $(SRC) $(LIBS) -o pdp6

clean:
	rm pdp6
