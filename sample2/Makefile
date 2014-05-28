NAME=sample2

ARCH_FLAGS=-mthumb -mcpu=cortex-m3
STARTUP=startup_ARMCM3.o
SYSTEM=system_mb9bf61x.o

CC=arm-none-eabi-gcc

CFLAGS=$(ARCH_FLAGS) -I${HOME}/cmsis/CMSIS/Include
CXXFLAGS=$(ARCH_FLAGS)
ASFLAGS=$(ARCH_FLAGS)

# Use newlib-nano. To disable it, specify USE_NANO=
USE_NANO=--specs=nano.specs
# Use seimhosting or not
USE_SEMIHOST=--specs=rdimon.specs
USE_NOHOST=--specs=nosys.specs
GC=-Wl,--gc-sections
MAP=-Wl,-Map=$(NAME).map
LDSCRIPTS=-L. -T mb9bf618.ld
LFLAGS= $(USE_NANO) $(USE_NOHOST) $(LDSCRIPTS) $(GC) $(MAP)

$(NAME).hex: $(NAME).axf
	arm-none-eabi-objcopy -O ihex $< $@

$(NAME).axf: $(NAME).o $(STARTUP) $(SYSTEM)
	$(CC) $(CFLAGS) $(LFLAGS) -o $@ $^

clean: 
	rm -f *.o $(NAME)*.axf $(NAME)*.map $(NAME).hex
