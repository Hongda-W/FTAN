#
INST_DIR = $(HOME)/bin
BIN = aftani_c_pgl_amp

fflags = -O2 -Wall -ffixed-line-length-132
cflags = -O3 -Wall -I"/home/wang/code/Programs/head" -I/usr/include
#cflags = -O3  -I/usr/include -I/home/tianye/code/Programs/head
#cflags = -O3 -Wall  -I/usr/include -I/projects/yeti4009/code/Programs/head
#cflags = -O3 -Wall  -I/projects/howa1663/local/fftw-3.3.5/include -I/home/howa1663/code/Programs/head

#LDLIBS = -L/home/yeti4009/usr/lib -lfftw3
LDLIBS = -L/home/howa1663/usr/lib -lfftw3
#LDLIBS = -L/usr/lib64 -lfftw3

FFLAGS = $(DBG) $(fflags)

CFLAGS = $(DBG) $(cflags)

FC = gfortran -lstdc++

CC = g++ -std=c++11

DBG =

FOBJS = driver_c.o swapn.o aftanpg.o aftanipg.o ftfilt.o Filter.o fmax.o \
        taper.o trigger.o tapers.o tgauss.o mspline.o pred_cur.o misc.o \
        phtovel.o whiten_phamp.o get_snr.o

$(BIN) : $(FOBJS)
	$(FC) $(FFLAGS) $(CFLAGS) $(FOBJS) -o $(BIN) $(LDLIBS) 

install : $(BIN)
	install -s $(BIN) $(INST_DIR)

clean :
	rm -f $(BIN) core.* $(FOBJS)
