obj-m 		= intrepid.o
KVERSION 	= $(shell uname -r)
all:
	make -C /lib/modules/$(KVERSION)/build M=$(PWD) modules
install:
	mkdir -p /lib/modules/$(KVERSION)/extra
	cp intrepid.ko /lib/modules/$(KVERSION)/extra/
	depmod -a
clean:
	make -C /lib/modules/$(KVERSION)/build M=$(PWD) clean
