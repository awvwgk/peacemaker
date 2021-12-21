SOURCES = kinds.f90 \
		  lengths.f90 \
		  constants.f90 \
		  iso_varying_string.f90 \
		  auxiliary.f90 \
		  error.f90 \
		  atomic_data.f90 \
		  config.f90 \
		  input.f90 \
		  cluster.f90 \
		  info.f90 \
		  polynomial.f90 \
		  shared_data.f90 \
		  partition_functions.f90 \
		  thermo.f90 \
		  qce.f90 \
		  main.f90

all: release

FC = gfortran
FFLAGS = -cpp
OPENMPFLAGS = -fopenmp
DEBUGFLAGS = -Og -std=f2008 -pedantic -Wall -Wextra -fcheck=all -ggdb -fbacktrace -ffpe-trap=zero,overflow,underflow,denormal
PROFILEFLAGS = -pg
RELEASEFLAGS = -O3 -march=native -flto

#FC = ifort
#FFLAGS = -fpp
#OPENMPFLAGS = -qopenmp
#DEBUGFLAGS = -O0 -g -traceback -std08 -warn all -check all -debug all -ftrapuv
#PROFILEFLAGS = -p
#RELEASEFLAGS = -O3 -xHost -ipo

debug:
	$(FC) $(FFLAGS) $(OPENMPFLAGS) $(DEBUGFLAGS) ${SOURCES} -o peacemaker
debug_serial:
	$(FC) $(FFLAGS) $(DEBUGFLAGS) ${SOURCES} -o peacemaker
release:
	$(FC) $(FFLAGS) $(OPENMPFLAGS) $(RELEASEFLAGS) ${SOURCES} -o peacemaker
release_serial:
	$(FC) $(FFLAGS) $(RELEASEFLAGS) ${SOURCES} -o peacemaker
profile:
	$(FC) $(FFLAGS) $(PROFILEFLAGS) ${SOURCES} -o peacemaker
clean:
	rm -rvf *.o *.mod
