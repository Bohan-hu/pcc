# README

Before each run, please make sure to source `0_env.sh`.

We use llvm @ `6c59f0e1b0fb56c909ad7c9aad4bde37dc006ae0`

## Compile LLVM and MLIR Libraries

Before compiling LLVM, the project structure is as follows.

```
.
├── 0_env.sh
├── 1_build_install_llvm.sh
├── llvm
│   └── llvm-project # LLVM source project
├── mlir             # Out-of-tree MLIR project (PCC-opt, PCC-translate...)
│   └── ......
└── README.md
```

For the first-time run, you should run: `source 1_build_install_llvm.sh` to build llvm and mlir, as well as installing the headers.

After that, the structure of the repo is as follows:

```
.
├── 0_env.sh
├── 1_build_install_llvm.sh
├── env.sh
├── llvm
│   ├── llvm-build   # Out-of-tree build directory of llvm-project
│   ├── llvm-install # Install directory of llvm, 
│   └── llvm-project # LLVM source project
├── mlir             # Out-of-tree MLIR project (PCC-opt, PCC-translate...)
│   └── ......
└── README.md
```


After that, you are all done with environment setting up.

## Compile MLIR Tools

Go into `mlir` directory, run

```sh
mkdir build && cd build
cmake -G Ninja .. -DMLIR_DIR=$LLVM_INSTALL_PREFIX/lib/cmake/mlir -DLLVM_EXTERNAL_LIT=$LLVM_BUILD_DIR/bin/llvm-lit -DLLVM_PROJECT_SOURCE_DIR=$LLVM_PROJECT_SOURCE_DIR -DMLIR_ENABLE_BINDINGS_PYTHON=1
cmake --build . --target check-fiona
```
