default: clean project

# MAKEFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
# MAKEFILE_DIR := $(dir $(MAKEFILE_PATH))
MAKEFILE_DIR := $(CURDIR)
WORK_PATH=$(MAKEFILE_DIR)
# 100MHz or 200MHz
CLK_FREQ:=50MHz
MEM_MODE:=bram
CORE_NUM:=4
#-----------------------------------------
#Project generation-----------------------
#------------------------------------------
VIVADO = vivado
TOP_NAME = cb_$(MEM_MODE)_fpga
project_name = $(TOP_NAME)_$(CLK_FREQ)

project:
	$(VIVADO) -mode batch  -source ./tcl/$(TOP_NAME).tcl -tclargs $(TOP_NAME) $(CLK_FREQ) $(CORE_NUM)
gui: 
	$(VIVADO) -mode gui  -source ./tcl/$(TOP_NAME).tcl -tclargs $(TOP_NAME) $(CLK_FREQ) $(CORE_NUM)
.PHONY: project


#------------------------------------------------------------------------------------------
curr_date=$(shell LC_TIME=C date +'%Y%m%d_%p%H')
bitstream_name=$(project_name)_$(curr_date)
copybit:
	@mkdir -p ./bitstream/$(bitstream_name)
	@cp -r ./project/$(project_name)/$(project_name).runs/impl_1/$(TOP_NAME).bit ./bitstream/$(bitstream_name)
	@cp -r ./project/$(project_name)/$(project_name).runs/impl_1/$(TOP_NAME).ltx ./bitstream/$(bitstream_name)
	@cd ./bitstream && \
		zip -r $(bitstream_name).zip $(bitstream_name) && \
		rm -rf $(bitstream_name) && cd -

clean:
	rm -rf $(junk) simv* csrc *.key DVE* *.h *.a *.daidir *.log *.jou *.str   
	
	rm -rf ./project/$(project_name) .Xil
	rm -rf $(junk) simv* csrc *.key DVE* *.h *.a *.daidir *.log *.jou   
.PHONY: default all debug clean copybit
