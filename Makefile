# Fruitshop Reborn - VIC-20 build system
# Requires: petcat, c1541, xvic (from VICE emulator suite)

DISK = fruitshop-reborn.d64
MEMORY = 8k

.PHONY: all clean run

all: $(DISK)

# Compile BASIC sources to PRG (VIC-20 +8K expansion, BASIC at $1201)
fruitshop.prg: fruitshop.bas
	petcat -w2 -l 1201 -o $@ -- $<

boot.prg: boot.bas
	petcat -w2 -l 1201 -o $@ -- $<

# titleimg.prg is pre-built (ppmtovic output, patched)
# To regenerate from source image:
#   convert loading-screen.jpg -resize 100x160! [image adjustments] /tmp/loading.ppm
#   ppmtovic -p -d1 -c20 /tmp/loading.ppm titleimg.prg
#   python3 patch-viewer.py titleimg.prg

# Build disk image with all three files
$(DISK): boot.prg titleimg.prg fruitshop.prg
	c1541 -format "fruitshop,fs" d64 $@ \
	  -write boot.prg "boot" \
	  -write titleimg.prg "titleimg" \
	  -write fruitshop.prg "fruitshop"

# Run in VICE emulator
run: $(DISK)
	xvic -memory $(MEMORY) -autostart $(DISK)

clean:
	rm -f boot.prg fruitshop.prg $(DISK)
