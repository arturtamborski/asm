TARGET  = $(notdir $(CURDIR))

SRCDIR  = src
OBJDIR  = bin

CC      = nasm
LD 	= ld 

CFLAGS  = -f elf 
LFLAGS 	= -m elf_i386 -s

SRCS	= $(shell find $(SRCDIR) -type f -name '*.s')
SRCTREE	= $(shell find $(SRCDIR) -type d)
OBJTREE = $(foreach DIR,$(SRCTREE),$(shell echo $(DIR) | sed 's/$(SRCDIR)/$(OBJDIR)/'))
OBJS	= $(foreach FILE,$(SRCS), \
		$(shell echo $(FILE) | sed -e 's/$(SRCDIR)/$(OBJDIR)/' -e 's/\.s/\.o/'))

all: $(TARGET)
	@echo Done.

run: $(TARGET)
	@./$(TARGET)

clean:
	@rm -r $(TARGET) $(OBJDIR)

$(TARGET): $(OBJS) | $(OBJDIR) 
	@$(LD) $(LFLAGS) -o $@ $?

$(OBJS): $(OBJDIR)/%.o : $(SRCDIR)/%.s | $(OBJDIR)
	@$(CC) $(CFLAGS) -o $@ $?

$(OBJDIR):
	@mkdir -p $(OBJDIR) $(OBJTREE)

.PHONY: all run clean
