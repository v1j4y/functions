SRC += IRPF90_temp/irp_stack.irp.F90 IRPF90_temp/irp_touches.irp.F90 IRPF90_temp/print.irp.F90 IRPF90_temp/print.irp.module.F90 IRPF90_temp/points.irp.F90 IRPF90_temp/points.irp.module.F90 IRPF90_temp/yrange.irp.F90 IRPF90_temp/yrange.irp.module.F90 IRPF90_temp/gaussian.irp.F90 IRPF90_temp/gaussian.irp.module.F90 IRPF90_temp/test.irp.F90 IRPF90_temp/test.irp.module.F90
OBJ += IRPF90_temp/irp_stack.irp.o IRPF90_temp/print.irp.o IRPF90_temp/print.irp.module.o IRPF90_temp/points.irp.o IRPF90_temp/points.irp.module.o IRPF90_temp/yrange.irp.o IRPF90_temp/yrange.irp.module.o IRPF90_temp/gaussian.irp.o IRPF90_temp/gaussian.irp.module.o
OBJ1 = $(patsubst %, IRPF90_temp/%,$(notdir $(OBJ))) IRPF90_temp/irp_touches.irp.o 
ALL = test
ALL_OBJ = test.irp.module.o test.irp.o
ALL_OBJ1 = $(patsubst %, IRPF90_temp/%,$(notdir $(ALL_OBJ)))
all:$(ALL)
	@$(MAKE) -s move
test: IRPF90_temp/test.irp.o IRPF90_temp/test.irp.module.o $(OBJ1)
	$(FC) -o $@ IRPF90_temp/$@.irp.o IRPF90_temp/$@.irp.module.o $(OBJ1) $(LIB)
	@$(MAKE) -s move
IRPF90_temp/print.irp.o: IRPF90_temp/print.irp.module.o  IRPF90_temp/yrange.irp.module.o  IRPF90_temp/points.irp.module.o 
IRPF90_temp/points.irp.o: IRPF90_temp/points.irp.module.o  
IRPF90_temp/yrange.irp.o: IRPF90_temp/yrange.irp.module.o  IRPF90_temp/gaussian.irp.module.o  IRPF90_temp/points.irp.module.o 
IRPF90_temp/gaussian.irp.o: IRPF90_temp/gaussian.irp.module.o  IRPF90_temp/points.irp.module.o 
IRPF90_temp/test.irp.o: IRPF90_temp/test.irp.module.o  IRPF90_temp/yrange.irp.module.o  IRPF90_temp/points.irp.module.o 
IRPF90_temp/irp_touches.irp.o:  IRPF90_temp/print.irp.o IRPF90_temp/print.irp.o  IRPF90_temp/points.irp.o IRPF90_temp/points.irp.o  IRPF90_temp/yrange.irp.o IRPF90_temp/yrange.irp.o  IRPF90_temp/gaussian.irp.o IRPF90_temp/gaussian.irp.o
IRPF90_temp/%.irp.module.o: IRPF90_temp/%.irp.module.F90
	$(FC) $(FCFLAGS) -c IRPF90_temp/$*.irp.module.F90 -o IRPF90_temp/$*.irp.module.o
IRPF90_temp/%.irp.o: IRPF90_temp/%.irp.module.o IRPF90_temp/%.irp.F90
	$(FC) $(FCFLAGS) -c IRPF90_temp/$*.irp.F90 -o IRPF90_temp/$*.irp.o
IRPF90_temp/%.irp.o: IRPF90_temp/%.irp.F90
	$(FC) $(FCFLAGS) -c IRPF90_temp/$*.irp.F90 -o IRPF90_temp/$*.irp.o
IRPF90_temp/%.o: %.F90
	$(FC) $(FCFLAGS) -c $*.F90 -o IRPF90_temp/$*.o
IRPF90_temp/%.o: %.f90
	$(FC) $(FCFLAGS) -c $*.f90 -o IRPF90_temp/$*.o
IRPF90_temp/%.o: %.f
	$(FC) $(FCFLAGS) -c $*.f -o IRPF90_temp/$*.o
IRPF90_temp/%.o: %.F
	$(FC) $(FCFLAGS) -c $*.F -o IRPF90_temp/$*.o
IRPF90_temp/%.irp.F90: irpf90.make

move:
	@mv -f *.mod IRPF90_temp/ 2> /dev/null | DO_NOTHING=

clean:
	rm -rf $(EXE) $(OBJ1) $(ALL_OBJ1) $(ALL)

veryclean:
	- $(MAKE) clean

	- rm -rf IRPF90_temp/ IRPF90_man/ irpf90.make irpf90_variables dist

