BUILD_DIR       = build

# CMake Generators
CMAKE_GEN_UNIX = Unix Makefiles

NUM_JOBS = $(if $(ENV_NUM_PARALLEL_JOBS),$(ENV_NUM_PARALLEL_JOBS),$(NUMBER_OF_PROCESSORS))

# First target = default target (make without arguments => make build all for the moment)
# Default builds
build: build-deviceF4Dbg build-deviceF4Rel build-simDbg

# Default config
config: config-deviceF4Dbg

# Default clean targets
.PHONY: clean
clean:
	rm -rf build
.NOTPARALLEL: clean

config-deviceF4Dbg: $(BUILD_DIR)/deviceF4Dbg/Makefile
$(BUILD_DIR)/deviceF4Dbg/Makefile:
	mkdir -p $(BUILD_DIR)/deviceF4Dbg
	cmake -H. -B$(BUILD_DIR)/deviceF4Dbg -G "$(CMAKE_GEN_UNIX)" -DCMAKE_BUILD_TYPE:STRING=debug -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_VERBOSE_MAKEFILE=ON -DAPPLICATION:STRING=DEVICE_F4_DEBUG

.NOTPARALLEL: config-deviceF4Dbg
build-deviceF4Dbg: config-deviceF4Dbg
	cd $(BUILD_DIR)/deviceF4Dbg && $(MAKE) -j$(NUM_JOBS)
	
clean-deviceF4Dbg:
	rm -rf $(BUILD_DIR)/deviceF4Dbg
	
config-deviceF4Rel: $(BUILD_DIR)/deviceF4Rel/Makefile
$(BUILD_DIR)/deviceF4Rel/Makefile:
	mkdir -p $(BUILD_DIR)/deviceF4Rel
	cmake -H. -B$(BUILD_DIR)/deviceF4Rel -G "$(CMAKE_GEN_UNIX)" -DCMAKE_BUILD_TYPE:STRING=release -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_VERBOSE_MAKEFILE=ON -DAPPLICATION:STRING=DEVICE_F4_RELEASE

.NOTPARALLEL: config-deviceF4Rel
build-deviceF4Rel: config-deviceF4Rel
	cd $(BUILD_DIR)/deviceF4Rel && $(MAKE) -j$(NUM_JOBS)
	
clean-deviceF4Rel:
	rm -rf $(BUILD_DIR)/deviceF4Rel
	
config-simDbg: $(BUILD_DIR)/simDbg/Makefile
$(BUILD_DIR)/simDbg/Makefile:
	mkdir -p $(BUILD_DIR)/simDbg
	cmake -H. -B$(BUILD_DIR)/simDbg -G "$(CMAKE_GEN_UNIX)" -DCMAKE_BUILD_TYPE:STRING=debug -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_VERBOSE_MAKEFILE=ON -DAPPLICATION:STRING=WINDOWS

.NOTPARALLEL: config-simDbg
build-simDbg: config-simDbg
	cd $(BUILD_DIR)/simDbg && $(MAKE) -j$(NUM_JOBS)
	
clean-simDbg:
	rm -rf $(BUILD_DIR)/simDbg	
	
config-unittest: build/unittest/Makefile
build/unittest/Makefile:
	mkdir -p build/unittest
	cmake -H. -B$(BUILD_DIR)/unittest -G "$(CMAKE_GEN_UNIX)" -DCMAKE_BUILD_TYPE:STRING=debug -DUNITTEST:BOOL=True -Dgtest_force_shared_crt=1 -DAPPLICATION:STRING=WINDOWS
	
.NOTPARALLEL: config-unittest
build-unittest: config-unittest
	cd build/unittest && $(MAKE) $(ARG)

run-unittest: build-unittest
	$(call RUN_UNITTEST,build/unittest)

clean-unittest:
	rm -rf build/unittest

# Macro to run one or all ctest unittests
define RUN_UNITTEST
	$(if $(ARG), cd $(1) && ctest -R _UnitTest -V -R $(ARG), cd $(1) && ctest -R _UnitTest --timeout 240)
endef