mkdir -p ./llvm/llvm-build
mkdir -p ./llvm/llvm-install
cmake -S llvm/llvm-project/llvm -B llvm/llvm-build -G Ninja \
    -DLLVM_ENABLE_PROJECTS=mlir \
    -DLLVM_BUILD_EXAMPLES=ON \
    -DLLVM_TARGETS_TO_BUILD="Native;RISCV" \
    -DCMAKE_BUILD_TYPE=Release \
    -DLLVM_ENABLE_ASSERTIONS=ON \
    -DLLVM_INSTALL_UTILS=ON \
    -DCMAKE_INSTALL_PREFIX=$LLVM_INSTALL_PREFIX
ninja -C llvm/llvm-build install
