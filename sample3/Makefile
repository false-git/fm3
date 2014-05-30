NAME=sample3

ARCH_FLAGS=-mthumb -mcpu=cortex-m3
STARTUP=startup_ARMCM3.o
SYSTEM=system_mb9bf61x.o
OBJS=cd_class.o usb_buffer.o usb_dev_desc.o usb_hooks.o usb_hw.o usb_t9.o

CC=arm-none-eabi-gcc

CFLAGS=$(ARCH_FLAGS) -I${HOME}/cmsis/CMSIS/Include -I. --std=c99
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

$(NAME).axf: $(NAME).o $(STARTUP) $(SYSTEM) $(OBJS)
	$(CC) $(CFLAGS) $(LFLAGS) -o $@ $^

clean: 
	rm -f *.o $(NAME)*.axf $(NAME)*.map $(NAME).hex
