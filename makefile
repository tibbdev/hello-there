# Specify which compiler being used
CC  = gcc

# output, source and object directories
OUT_DIR=bin
SRC_DIR=src
OBJ_DIR=obj

#zipped up package filename
PACKNAME=sup_broski

#BIN specifies the name of our exectuable
BIN=$(OUT_DIR)/hey_there

#List all source files
SRCS=$(wildcard $(SRC_DIR)/*.c)

#Use path substitution to create object files from SRCS variable
OBJS=$(patsubst $(SRC_DIR)/%.c, $(OBJ_DIR)/%.o, $(SRCS))

#Compiler and linker flags
CXXFLAGS = -Iinc -MMD -MP
CFLAGS   = -Wall
LDFLAGS  = 
LDLIBS   = 

.PHONY: all clean release debug

#This is the target that compiles our executable
all : CFLAGS +=-Og -DDEBUG
all : $(BIN) | $(OUT_DIR)

release : CFLAGS +=-O2
release : clean
release : $(BIN) | $(OUT_DIR)

$(BIN): $(OBJS) | $(OUT_DIR)
	@echo "  --== Building 'Hello There' ==--"
	$(CXX) $(LDFLAGS) $^ $(LDLIBS) -o $@

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
	@echo "  --== Compiling Objects ==--"
	${CXX} ${CXXFLAGS} ${CFLAGS} -c $< -o $@

$(OUT_DIR) $(OBJ_DIR):
	@echo "  --== mkdir ==--"
	mkdir -p $@

clean: 
	@echo "  --== Cleaning 'obj' and 'bin' Directories ==--"
	$(RM) -rfv $(OUT_DIR) $(OBJ_DIR)

package:
	@echo "  --== Packaging it up ==--"
	$(RM) $(PACKNAME)
	zip $(PACKNAME).zip $(BIN)

-include $(OBJS:.o=.d)
