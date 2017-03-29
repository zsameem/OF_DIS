MEX=mex
_CFLAGS=\$CFLAGS -Wall -std=++11 -msse4

MEXFLAGS=-v 
INCLUDES=-I/usr/local/include/eigen3
LIB_DIRS=
OTHER_LIBS=-L/usr/local/cuda/lib64/
OPENCV_LIBS=$(shell pkg-config --cflags --libs opencv)

SRC=run_dense.cpp oflow.cpp patch.cpp patchgrid.cpp refine_variational.cpp MxArray.cpp FDF1.0.1/image.c FDF1.0.1/opticalflow_aux.c FDF1.0.1/solver.c

all:
	mex $(MEXFLAGS) -DSELECTMODE=1 -DSELECTCHANNEL=1 CFLAGS="$(_CFLAGS)" $(SRC) $(INCLUDES) $(OTHER_LIBS) $(OPENCV_LIBS) -output run_OF_INT.mexa64
	mex $(MEXFLAGS) -DSELECTMODE=1 -DSELECTCHANNEL=3 CFLAGS="$(_CFLAGS)" $(SRC) $(INCLUDES) $(OTHER_LIBS) $(OPENCV_LIBS) -output run_OF_RGB.mexa64
	mex $(MEXFLAGS) -DSELECTMODE=2 -DSELECTCHANNEL=1 CFLAGS="$(_CFLAGS)" $(SRC) $(INCLUDES) $(OTHER_LIBS) $(OPENCV_LIBS) -output run_DE_INT.mexa64
	mex $(MEXFLAGS) -DSELECTMODE=2 -DSELECTCHANNEL=3 CFLAGS="$(_CFLAGS)" $(SRC) $(INCLUDES) $(OTHER_LIBS) $(OPENCV_LIBS) -output run_DE_RGB.mexa64
clean:
	rm ./*.mexa64