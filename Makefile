FC=gfortran

all: libstring.f90
	$(FC) -c libstring.f90

test: all
	./do_test.sh

clean:
	rm *.o
