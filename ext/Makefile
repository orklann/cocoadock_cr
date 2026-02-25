CC = cc
CFLAGS = -O2 -fPIC
AR = ar
TARGET = libcocoadock.a

all: $(TARGET)

$(TARGET): cocoadock.o
	$(AR) rcs $(TARGET) cocoadock.o

cocoawebview.o: cocoadock.m
	$(CC) $(CFLAGS) -c cocoadock.m

clean:
	rm -f *.o *.a
