CC = gcc
DLLTOOL = dlltool
IKAC = ikac

SRC_DIR = src
DEF_DIR = defs
BUILD_DIR = build

DEF_FILE = $(DEF_DIR)/tier0.def
LIB_FILE = $(BUILD_DIR)/libtier0.a
SRC_FILE = $(SRC_DIR)/root.ika
ASM_FILE = $(BUILD_DIR)/ika_plugin.s
OUT_DLL  = $(BUILD_DIR)/ika_plugin.dll

IKA_SOURCES := $(wildcard $(SRC_DIR)/*.ika)

all: $(OUT_DLL)

$(BUILD_DIR):
	@if not exist "$(BUILD_DIR)" mkdir "$(BUILD_DIR)"

$(LIB_FILE): $(DEF_FILE) | $(BUILD_DIR)
	$(DLLTOOL) -d $< -l $@

$(ASM_FILE): $(IKA_SOURCES) | $(BUILD_DIR)
	$(IKAC) -eDllMain -S -o $@ $(SRC_FILE)

$(OUT_DLL): $(ASM_FILE) $(LIB_FILE)
	$(CC) -shared -m32 -o $@ $^ -lPsapi

clean:
	del /q $(BUILD_DIR)\*

.PHONY: all clean
