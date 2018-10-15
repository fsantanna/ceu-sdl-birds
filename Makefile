include Makefile.conf

each:
	for i in src/birds-*.ceu; do                                            \
		echo;                                                               \
		echo "###############################################";             \
		echo File: "$$i -> /tmp/$$(basename $$i .ceu)";	                    \
		echo "###############################################";             \
		echo -n "Press <enter> to start...";                                \
		read _;                                                             \
	    ceu --pre --pre-args="-I$(CEU_DIR)/include -I$(CEU_SDL_DIR)/include" \
	              --pre-input=$$i                                           \
	        --ceu --ceu-err-unused=pass --ceu-err-uninitialized=pass        \
	        --ceu-features-dynamic=true \
	        --ceu-features-pool=true \
	        --ceu-features-pause=true \
	        --ceu-features-os=true \
	        --ceu-features-async=true \
	        --ceu-features-trace=true \
	        --env --env-types=$(CEU_DIR)/env/types.h                        \
	              --env-threads=$(CEU_DIR)/env/threads.h                    \
	              --env-main=$(CEU_DIR)/env/main.c                          \
	              --env-output=/tmp/_ceu.c \
	        --cc --cc-args="-lm -g -llua5.3 -lpthread -lSDL2 -lSDL2_image -lSDL2_mixer -lSDL2_ttf -lSDL2_gfx" \
	             --cc-output=/tmp/$$(basename $$i .ceu);                     \
		/tmp/$$(basename $$i .ceu);	                                        \
		echo ">>> OK";                                                      \
		echo;                                                               \
		echo;                                                               \
		echo;                                                               \
		echo;                                                               \
		echo;                                                               \
		echo;                                                               \
	done

all:
	ceu --pre --pre-args="-I$(CEU_DIR)/include -I$(CEU_SDL_DIR)/include" \
	          --pre-input=src/all.ceu                                    \
	    --ceu --ceu-err-unused=pass --ceu-err-uninitialized=pass         \
	          --ceu-features-dynamic=true \
	          --ceu-features-pool=true \
	          --ceu-features-pause=true \
	    --env --env-types=$(CEU_DIR)/env/types.h                         \
	          --env-threads=$(CEU_DIR)/env/threads.h                     \
	          --env-main=$(CEU_DIR)/env/main.c                           \
	          --env-output=/tmp/birds-all.c \
	    --cc --cc-args="-lm -llua5.3 -lpthread -lSDL2 -lSDL2_image -lSDL2_mixer -lSDL2_ttf -lSDL2_gfx" \
	         --cc-output=/tmp/birds-all
	/tmp/birds-all

.PHONY: all
