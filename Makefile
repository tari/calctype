#---------------------------------------------------------------------------------
# Clear the implicit built in rules
#---------------------------------------------------------------------------------
.SUFFIXES:

ifeq ($(strip $(FXCGSDK)),)
$(error FXCGSDK must point to a PrizmSDK directory)
endif

include $(FXCGSDK)/toolchain/prizm_rules

DEPSDIR := $(CURDIR)

CFLAGS := $(MACHDEP) -I. -I$(LIBFXCG_INC) \
	-Os -Wall -funroll-loops -fno-trapping-math -fno-trapv -Wno-switch -std=c99

libcalctype.a: src/calctype.o src/calctype_prizm.o
