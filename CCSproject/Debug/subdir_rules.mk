################################################################################
# Automatically-generated file. Do not edit!
################################################################################

SHELL = cmd.exe

# Each subdirectory must supply rules for building sources it contributes
Mpy.obj: ../Mpy.asm $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C6000 Compiler'
	"C:/ti/02 - Push compiler 7.x/c6000_7.4.20/bin/cl6x" -mv6700 --abi=coffabi -g --include_path="C:/Users/danae/Documents/Session S5/APP2/s5app2/CCSproject" --include_path="C:/ti/ccsv7/ccs_base/C6xCSL/include" --include_path="C:/ti/dsk6713/include" --include_path="C:/ti/02 - Push compiler 7.x/c6000_7.4.20/include" --define=CHIP_6713 --diag_warning=225 --diag_wrap=off --display_error_number --mem_model:const=far --mem_model:data=far --preproc_with_compile --preproc_dependency="Mpy.d" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

div.obj: ../div.asm $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C6000 Compiler'
	"C:/ti/02 - Push compiler 7.x/c6000_7.4.20/bin/cl6x" -mv6700 --abi=coffabi -g --include_path="C:/Users/danae/Documents/Session S5/APP2/s5app2/CCSproject" --include_path="C:/ti/ccsv7/ccs_base/C6xCSL/include" --include_path="C:/ti/dsk6713/include" --include_path="C:/ti/02 - Push compiler 7.x/c6000_7.4.20/include" --define=CHIP_6713 --diag_warning=225 --diag_wrap=off --display_error_number --mem_model:const=far --mem_model:data=far --preproc_with_compile --preproc_dependency="div.d" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

fonctionHugo.obj: ../fonctionHugo.asm $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C6000 Compiler'
	"C:/ti/02 - Push compiler 7.x/c6000_7.4.20/bin/cl6x" -mv6700 --abi=coffabi -g --include_path="C:/Users/danae/Documents/Session S5/APP2/s5app2/CCSproject" --include_path="C:/ti/ccsv7/ccs_base/C6xCSL/include" --include_path="C:/ti/dsk6713/include" --include_path="C:/ti/02 - Push compiler 7.x/c6000_7.4.20/include" --define=CHIP_6713 --diag_warning=225 --diag_wrap=off --display_error_number --mem_model:const=far --mem_model:data=far --preproc_with_compile --preproc_dependency="fonctionHugo.d" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

liste.obj: ../liste.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C6000 Compiler'
	"C:/ti/02 - Push compiler 7.x/c6000_7.4.20/bin/cl6x" -mv6700 --abi=coffabi -g --include_path="C:/Users/danae/Documents/Session S5/APP2/s5app2/CCSproject" --include_path="C:/ti/ccsv7/ccs_base/C6xCSL/include" --include_path="C:/ti/dsk6713/include" --include_path="C:/ti/02 - Push compiler 7.x/c6000_7.4.20/include" --define=CHIP_6713 --diag_warning=225 --diag_wrap=off --display_error_number --mem_model:const=far --mem_model:data=far --preproc_with_compile --preproc_dependency="liste.d" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

main.obj: ../main.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C6000 Compiler'
	"C:/ti/02 - Push compiler 7.x/c6000_7.4.20/bin/cl6x" -mv6700 --abi=coffabi -g --include_path="C:/Users/danae/Documents/Session S5/APP2/s5app2/CCSproject" --include_path="C:/ti/ccsv7/ccs_base/C6xCSL/include" --include_path="C:/ti/dsk6713/include" --include_path="C:/ti/02 - Push compiler 7.x/c6000_7.4.20/include" --define=CHIP_6713 --diag_warning=225 --diag_wrap=off --display_error_number --mem_model:const=far --mem_model:data=far --preproc_with_compile --preproc_dependency="main.d" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

operande.obj: ../operande.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C6000 Compiler'
	"C:/ti/02 - Push compiler 7.x/c6000_7.4.20/bin/cl6x" -mv6700 --abi=coffabi -g --include_path="C:/Users/danae/Documents/Session S5/APP2/s5app2/CCSproject" --include_path="C:/ti/ccsv7/ccs_base/C6xCSL/include" --include_path="C:/ti/dsk6713/include" --include_path="C:/ti/02 - Push compiler 7.x/c6000_7.4.20/include" --define=CHIP_6713 --diag_warning=225 --diag_wrap=off --display_error_number --mem_model:const=far --mem_model:data=far --preproc_with_compile --preproc_dependency="operande.d" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

sub.obj: ../sub.asm $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C6000 Compiler'
	"C:/ti/02 - Push compiler 7.x/c6000_7.4.20/bin/cl6x" -mv6700 --abi=coffabi -g --include_path="C:/Users/danae/Documents/Session S5/APP2/s5app2/CCSproject" --include_path="C:/ti/ccsv7/ccs_base/C6xCSL/include" --include_path="C:/ti/dsk6713/include" --include_path="C:/ti/02 - Push compiler 7.x/c6000_7.4.20/include" --define=CHIP_6713 --diag_warning=225 --diag_wrap=off --display_error_number --mem_model:const=far --mem_model:data=far --preproc_with_compile --preproc_dependency="sub.d" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '


