module {
  llvm.func @test_get_block_idx() {
    %0 = "hivm.intr.hivm.GET.BLOCK.IDX"() : () -> i64
    llvm.return
  }
}

// -----
module {
  llvm.func @test_get_block_num() {
    %0 = "hivm.intr.hivm.GET.BLOCK.NUM"() : () -> i64
    llvm.return
  }
}

// -----
module {
  llvm.func @test_get_sub_block_idx() {
    %0 = "hivm.intr.hivm.GET.SUBBLOCKID"() : () -> i64
    llvm.return
  }
}

// -----
module {
  llvm.func @test_get_sub_block_num() {
    %0 = "hivm.intr.hivm.GET.SUBBLOCKDIM"() : () -> i64
    llvm.return
  }
}

// -----
module {
  llvm.func @test_addrspaceattr_lowering() {
    %0 = llvm.mlir.constant(1 : index) : i64
    %1 = llvm.alloca %0 x f32 {alignment = 64 : i64} : (i64) -> !llvm.ptr<6>
    %2 = llvm.mlir.undef : !llvm.struct<(ptr<6>, ptr<6>, i64)>
    %3 = llvm.insertvalue %1, %2[0] : !llvm.struct<(ptr<6>, ptr<6>, i64)> 
    %4 = llvm.insertvalue %1, %3[1] : !llvm.struct<(ptr<6>, ptr<6>, i64)> 
    %5 = llvm.mlir.constant(0 : index) : i64
    %6 = llvm.insertvalue %5, %4[2] : !llvm.struct<(ptr<6>, ptr<6>, i64)> 
    %7 = llvm.mlir.constant(4.500000e+00 : f32) : f32
    %8 = llvm.extractvalue %6[1] : !llvm.struct<(ptr<6>, ptr<6>, i64)> 
    llvm.store %7, %8 : f32, !llvm.ptr<6>
    llvm.return
  }
}

// -----
module {
  llvm.func @test_addrspaceattr_lowering_fixbuf() {
    %0 = llvm.mlir.constant(1 : index) : i64
    %1 = llvm.alloca %0 x f32 {alignment = 64 : i64} : (i64) -> !llvm.ptr<7>
    %2 = llvm.mlir.undef : !llvm.struct<(ptr<7>, ptr<7>, i64)>
    %3 = llvm.insertvalue %1, %2[0] : !llvm.struct<(ptr<7>, ptr<7>, i64)> 
    %4 = llvm.insertvalue %1, %3[1] : !llvm.struct<(ptr<7>, ptr<7>, i64)> 
    %5 = llvm.mlir.constant(0 : index) : i64
    %6 = llvm.insertvalue %5, %4[2] : !llvm.struct<(ptr<7>, ptr<7>, i64)> 
    llvm.return
  }
}

// -----
module {
  llvm.func @test_addrspaceattr_lowering_biasbuf() {
    %0 = llvm.mlir.constant(1 : index) : i64
    %1 = llvm.alloca %0 x f32 {alignment = 64 : i64} : (i64) -> !llvm.ptr<12>
    %2 = llvm.mlir.undef : !llvm.struct<(ptr<12>, ptr<12>, i64)>
    %3 = llvm.insertvalue %1, %2[0] : !llvm.struct<(ptr<12>, ptr<12>, i64)> 
    %4 = llvm.insertvalue %1, %3[1] : !llvm.struct<(ptr<12>, ptr<12>, i64)> 
    %5 = llvm.mlir.constant(0 : index) : i64
    %6 = llvm.insertvalue %5, %4[2] : !llvm.struct<(ptr<12>, ptr<12>, i64)> 
    llvm.return
  }
}

// -----
module {
  module {
    llvm.func private @dummy_func(%arg0: !llvm.ptr<1>, %arg1: !llvm.ptr<1>, %arg2: i64, %arg3: i64, %arg4: i64, %arg5: i64, %arg6: i64, %arg7: !llvm.ptr<2>, %arg8: !llvm.ptr<2>, %arg9: i64, %arg10: i64, %arg11: i64, %arg12: i64, %arg13: i64, %arg14: i64, %arg15: i64, %arg16: i64, %arg17: i64) attributes {llvm.emit_c_interface, sym_visibility = "private"} {
      %0 = llvm.mlir.undef : !llvm.struct<(ptr<1>, ptr<1>, i64, array<2 x i64>, array<2 x i64>)>
      %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr<1>, ptr<1>, i64, array<2 x i64>, array<2 x i64>)> 
      %2 = llvm.insertvalue %arg1, %1[1] : !llvm.struct<(ptr<1>, ptr<1>, i64, array<2 x i64>, array<2 x i64>)> 
      %3 = llvm.insertvalue %arg2, %2[2] : !llvm.struct<(ptr<1>, ptr<1>, i64, array<2 x i64>, array<2 x i64>)> 
      %4 = llvm.insertvalue %arg3, %3[3, 0] : !llvm.struct<(ptr<1>, ptr<1>, i64, array<2 x i64>, array<2 x i64>)> 
      %5 = llvm.insertvalue %arg5, %4[4, 0] : !llvm.struct<(ptr<1>, ptr<1>, i64, array<2 x i64>, array<2 x i64>)> 
      %6 = llvm.insertvalue %arg4, %5[3, 1] : !llvm.struct<(ptr<1>, ptr<1>, i64, array<2 x i64>, array<2 x i64>)> 
      %7 = llvm.insertvalue %arg6, %6[4, 1] : !llvm.struct<(ptr<1>, ptr<1>, i64, array<2 x i64>, array<2 x i64>)> 
      %8 = llvm.mlir.constant(1 : index) : i64
      %9 = llvm.alloca %8 x !llvm.struct<(ptr<1>, ptr<1>, i64, array<2 x i64>, array<2 x i64>)> : (i64) -> !llvm.ptr
      llvm.store %7, %9 : !llvm.struct<(ptr<1>, ptr<1>, i64, array<2 x i64>, array<2 x i64>)>, !llvm.ptr
      %10 = llvm.mlir.undef : !llvm.struct<(ptr<2>, ptr<2>, i64, array<4 x i64>, array<4 x i64>)>
      %11 = llvm.insertvalue %arg7, %10[0] : !llvm.struct<(ptr<2>, ptr<2>, i64, array<4 x i64>, array<4 x i64>)> 
      %12 = llvm.insertvalue %arg8, %11[1] : !llvm.struct<(ptr<2>, ptr<2>, i64, array<4 x i64>, array<4 x i64>)> 
      %13 = llvm.insertvalue %arg9, %12[2] : !llvm.struct<(ptr<2>, ptr<2>, i64, array<4 x i64>, array<4 x i64>)> 
      %14 = llvm.insertvalue %arg10, %13[3, 0] : !llvm.struct<(ptr<2>, ptr<2>, i64, array<4 x i64>, array<4 x i64>)> 
      %15 = llvm.insertvalue %arg14, %14[4, 0] : !llvm.struct<(ptr<2>, ptr<2>, i64, array<4 x i64>, array<4 x i64>)> 
      %16 = llvm.insertvalue %arg11, %15[3, 1] : !llvm.struct<(ptr<2>, ptr<2>, i64, array<4 x i64>, array<4 x i64>)> 
      %17 = llvm.insertvalue %arg15, %16[4, 1] : !llvm.struct<(ptr<2>, ptr<2>, i64, array<4 x i64>, array<4 x i64>)> 
      %18 = llvm.insertvalue %arg12, %17[3, 2] : !llvm.struct<(ptr<2>, ptr<2>, i64, array<4 x i64>, array<4 x i64>)> 
      %19 = llvm.insertvalue %arg16, %18[4, 2] : !llvm.struct<(ptr<2>, ptr<2>, i64, array<4 x i64>, array<4 x i64>)> 
      %20 = llvm.insertvalue %arg13, %19[3, 3] : !llvm.struct<(ptr<2>, ptr<2>, i64, array<4 x i64>, array<4 x i64>)> 
      %21 = llvm.insertvalue %arg17, %20[4, 3] : !llvm.struct<(ptr<2>, ptr<2>, i64, array<4 x i64>, array<4 x i64>)> 
      %22 = llvm.mlir.constant(1 : index) : i64
      %23 = llvm.alloca %22 x !llvm.struct<(ptr<2>, ptr<2>, i64, array<4 x i64>, array<4 x i64>)> : (i64) -> !llvm.ptr
      llvm.store %21, %23 : !llvm.struct<(ptr<2>, ptr<2>, i64, array<4 x i64>, array<4 x i64>)>, !llvm.ptr
      llvm.call @_mlir_ciface_dummy_func(%9, %23) : (!llvm.ptr, !llvm.ptr) -> ()
      llvm.return
    }
    llvm.func @_mlir_ciface_dummy_func(!llvm.ptr, !llvm.ptr) attributes {llvm.emit_c_interface, sym_visibility = "private"}
    llvm.func @main(%arg0: i1) {
      %0 = llvm.mlir.constant(8 : index) : i64
      %1 = llvm.mlir.constant(8 : index) : i64
      %2 = llvm.mlir.constant(16 : index) : i64
      %3 = llvm.mlir.constant(16 : index) : i64
      %4 = llvm.mlir.constant(1 : index) : i64
      %5 = llvm.mlir.constant(256 : index) : i64
      %6 = llvm.mlir.constant(2048 : index) : i64
      %7 = llvm.mlir.constant(16384 : index) : i64
      %8 = llvm.alloca %7 x f16 {alignment = 64 : i64} : (i64) -> !llvm.ptr<2>
      %9 = llvm.mlir.undef : !llvm.struct<(ptr<2>, ptr<2>, i64, array<4 x i64>, array<4 x i64>)>
      %10 = llvm.insertvalue %8, %9[0] : !llvm.struct<(ptr<2>, ptr<2>, i64, array<4 x i64>, array<4 x i64>)> 
      %11 = llvm.insertvalue %8, %10[1] : !llvm.struct<(ptr<2>, ptr<2>, i64, array<4 x i64>, array<4 x i64>)> 
      %12 = llvm.mlir.constant(0 : index) : i64
      %13 = llvm.insertvalue %12, %11[2] : !llvm.struct<(ptr<2>, ptr<2>, i64, array<4 x i64>, array<4 x i64>)> 
      %14 = llvm.insertvalue %0, %13[3, 0] : !llvm.struct<(ptr<2>, ptr<2>, i64, array<4 x i64>, array<4 x i64>)> 
      %15 = llvm.insertvalue %1, %14[3, 1] : !llvm.struct<(ptr<2>, ptr<2>, i64, array<4 x i64>, array<4 x i64>)> 
      %16 = llvm.insertvalue %2, %15[3, 2] : !llvm.struct<(ptr<2>, ptr<2>, i64, array<4 x i64>, array<4 x i64>)> 
      %17 = llvm.insertvalue %3, %16[3, 3] : !llvm.struct<(ptr<2>, ptr<2>, i64, array<4 x i64>, array<4 x i64>)> 
      %18 = llvm.insertvalue %6, %17[4, 0] : !llvm.struct<(ptr<2>, ptr<2>, i64, array<4 x i64>, array<4 x i64>)> 
      %19 = llvm.insertvalue %5, %18[4, 1] : !llvm.struct<(ptr<2>, ptr<2>, i64, array<4 x i64>, array<4 x i64>)> 
      %20 = llvm.insertvalue %3, %19[4, 2] : !llvm.struct<(ptr<2>, ptr<2>, i64, array<4 x i64>, array<4 x i64>)> 
      %21 = llvm.insertvalue %4, %20[4, 3] : !llvm.struct<(ptr<2>, ptr<2>, i64, array<4 x i64>, array<4 x i64>)> 
      %22 = llvm.mlir.constant(8 : index) : i64
      %23 = llvm.mlir.constant(8 : index) : i64
      %24 = llvm.mlir.constant(16 : index) : i64
      %25 = llvm.mlir.constant(16 : index) : i64
      %26 = llvm.mlir.constant(1 : index) : i64
      %27 = llvm.mlir.constant(256 : index) : i64
      %28 = llvm.mlir.constant(2048 : index) : i64
      %29 = llvm.mlir.constant(16384 : index) : i64
      %30 = llvm.alloca %29 x f16 {alignment = 64 : i64} : (i64) -> !llvm.ptr<2>
      %31 = llvm.mlir.undef : !llvm.struct<(ptr<2>, ptr<2>, i64, array<4 x i64>, array<4 x i64>)>
      %32 = llvm.insertvalue %30, %31[0] : !llvm.struct<(ptr<2>, ptr<2>, i64, array<4 x i64>, array<4 x i64>)> 
      %33 = llvm.insertvalue %30, %32[1] : !llvm.struct<(ptr<2>, ptr<2>, i64, array<4 x i64>, array<4 x i64>)> 
      %34 = llvm.mlir.constant(0 : index) : i64
      %35 = llvm.insertvalue %34, %33[2] : !llvm.struct<(ptr<2>, ptr<2>, i64, array<4 x i64>, array<4 x i64>)> 
      %36 = llvm.insertvalue %22, %35[3, 0] : !llvm.struct<(ptr<2>, ptr<2>, i64, array<4 x i64>, array<4 x i64>)> 
      %37 = llvm.insertvalue %23, %36[3, 1] : !llvm.struct<(ptr<2>, ptr<2>, i64, array<4 x i64>, array<4 x i64>)> 
      %38 = llvm.insertvalue %24, %37[3, 2] : !llvm.struct<(ptr<2>, ptr<2>, i64, array<4 x i64>, array<4 x i64>)> 
      %39 = llvm.insertvalue %25, %38[3, 3] : !llvm.struct<(ptr<2>, ptr<2>, i64, array<4 x i64>, array<4 x i64>)> 
      %40 = llvm.insertvalue %28, %39[4, 0] : !llvm.struct<(ptr<2>, ptr<2>, i64, array<4 x i64>, array<4 x i64>)> 
      %41 = llvm.insertvalue %27, %40[4, 1] : !llvm.struct<(ptr<2>, ptr<2>, i64, array<4 x i64>, array<4 x i64>)> 
      %42 = llvm.insertvalue %25, %41[4, 2] : !llvm.struct<(ptr<2>, ptr<2>, i64, array<4 x i64>, array<4 x i64>)> 
      %43 = llvm.insertvalue %26, %42[4, 3] : !llvm.struct<(ptr<2>, ptr<2>, i64, array<4 x i64>, array<4 x i64>)> 
      %44 = llvm.select %arg0, %21, %43 : i1, !llvm.struct<(ptr<2>, ptr<2>, i64, array<4 x i64>, array<4 x i64>)>
      llvm.br ^bb1(%21 : !llvm.struct<(ptr<2>, ptr<2>, i64, array<4 x i64>, array<4 x i64>)>)
    ^bb1(%45: !llvm.struct<(ptr<2>, ptr<2>, i64, array<4 x i64>, array<4 x i64>)>):  // pred: ^bb0
      llvm.return
    }
  }
  llvm.func @test_dyn_set_flag(%arg0: i64) {
    "hivm.intr.hivm.SET.FLAG.REG"(%arg0) <{set_pipe = 3 : i64, wait_pipe = 2 : i64}> : (i64) -> ()
    llvm.return
  }
  llvm.func @test_dyn_wait_flag(%arg0: i64) {
    "hivm.intr.hivm.WAIT.FLAG.REG"(%arg0) <{set_pipe = 3 : i64, wait_pipe = 2 : i64}> : (i64) -> ()
    llvm.return
  }
  llvm.func @test_const_set_flag() {
    "hivm.intr.hivm.SET.FLAG.IMM"() <{event_id = 0 : i64, set_pipe = 3 : i64, wait_pipe = 2 : i64}> : () -> ()
    %0 = llvm.mlir.constant(1 : i64) : i64
    "hivm.intr.hivm.SET.FLAG.IMM"() <{event_id = 1 : i64, set_pipe = 3 : i64, wait_pipe = 2 : i64}> : () -> ()
    llvm.return
  }
  llvm.func @test_const_wait_flag() {
    "hivm.intr.hivm.WAIT.FLAG.IMM"() <{event_id = 0 : i64, set_pipe = 3 : i64, wait_pipe = 2 : i64}> : () -> ()
    %0 = llvm.mlir.constant(1 : i64) : i64
    "hivm.intr.hivm.WAIT.FLAG.IMM"() <{event_id = 1 : i64, set_pipe = 3 : i64, wait_pipe = 2 : i64}> : () -> ()
    llvm.return
  }
  llvm.func @test_pipe_barrier() {
    "hivm.intr.hivm.BARRIER"() <{pipe = 6 : i64}> : () -> ()
    llvm.return
  }
  llvm.func @test_sync_block_set() {
    %0 = llvm.mlir.constant(0 : i64) : i64
    %1 = llvm.mlir.constant(289 : i64) : i64
    "hivm.intr.hivm.SET.CROSS.CORE"(%1) <{pipe = 10 : i64}> : (i64) -> ()
    llvm.return
  }
  llvm.func @test_set_ffts_base_addr() {
    %0 = llvm.mlir.constant(0 : i64) : i64
    "hivm.intr.hivm.SET.FFTS.BASE.ADDR"(%0) : (i64) -> ()
    llvm.return
  }
  llvm.func @test_sync_block_wait() {
    %0 = llvm.mlir.constant(1 : i64) : i64
    "hivm.intr.hivm.WAIT.FLAG.DEV.REG"(%0) : (i64) -> ()
    llvm.return
  }
  llvm.func @test_set_mask_norm() {
    %0 = "hivm.intr.hivm.GET.CTRL"() : () -> i64
    %1 = llvm.mlir.constant(56 : i64) : i64
    %2 = "hivm.intr.hivm.SBITSET0"(%0, %1) : (i64, i64) -> i64
    "hivm.intr.hivm.SET.CTRL"(%2) : (i64) -> ()
    llvm.return
  }
  llvm.func @test_dcci() {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.mlir.constant(2 : i64) : i64
    %2 = llvm.mlir.constant(0 : i64) : i64
    %3 = llvm.inttoptr %2 : i64 to !llvm.ptr<1>
    %4 = llvm.mlir.undef : !llvm.struct<(ptr<1>, ptr<1>, i64)>
    %5 = llvm.insertvalue %3, %4[0] : !llvm.struct<(ptr<1>, ptr<1>, i64)> 
    %6 = llvm.insertvalue %3, %5[1] : !llvm.struct<(ptr<1>, ptr<1>, i64)> 
    %7 = llvm.mlir.constant(0 : index) : i64
    %8 = llvm.insertvalue %7, %6[2] : !llvm.struct<(ptr<1>, ptr<1>, i64)> 
    %9 = llvm.extractvalue %8[1] : !llvm.struct<(ptr<1>, ptr<1>, i64)> 
    "hivm.intr.hivm.DCCI.DST"(%9, %0, %1) : (!llvm.ptr<1>, i64, i64) -> ()
    llvm.return
  }
}

// -----
module {
  llvm.func @test_bitcast_f32_i32_memref(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: i64, %arg3: i64, %arg4: i64) -> !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %2 = llvm.insertvalue %arg1, %1[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %3 = llvm.insertvalue %arg2, %2[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %4 = llvm.insertvalue %arg3, %3[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %5 = llvm.insertvalue %arg4, %4[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %6 = builtin.unrealized_conversion_cast %5 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> to memref<6xi32>
    %7 = builtin.unrealized_conversion_cast %6 : memref<6xi32> to !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %8 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %9 = llvm.extractvalue %7[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %10 = llvm.extractvalue %7[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %11 = llvm.insertvalue %9, %8[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %12 = llvm.insertvalue %10, %11[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %13 = llvm.extractvalue %7[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %14 = llvm.insertvalue %13, %12[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %15 = llvm.extractvalue %7[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %16 = llvm.extractvalue %7[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %17 = llvm.insertvalue %15, %14[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %18 = llvm.insertvalue %16, %17[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.return %18 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
  }
  llvm.func @test_set_ctrl() {
    %0 = "hivm.intr.hivm.GET.CTRL"() : () -> i64
    %1 = llvm.mlir.constant(60 : i64) : i64
    %2 = "hivm.intr.hivm.SBITSET0"(%0, %1) : (i64, i64) -> i64
    "hivm.intr.hivm.SET.CTRL"(%2) : (i64) -> ()
    llvm.return
  }
}

// -----
module attributes {hacc.target = #hacc.target<"Ascend950PR_9589">, hivm.module_core_type = #hivm.module_core_type<MIX>} {
  llvm.func @test_sync_block_set_intra_cube() {
    "hivm.intr.hivm.SET.INTRA.BLOCKI.mode"() <{pipe = 10 : i64, sync_id = 17 : i64}> : () -> ()
    "hivm.intr.hivm.SET.INTRA.BLOCKI.mode"() <{pipe = 10 : i64, sync_id = 1 : i64}> : () -> ()
    llvm.return
  }
}

// -----
module attributes {hacc.target = #hacc.target<"Ascend950PR_9589">, hivm.module_core_type = #hivm.module_core_type<MIX>} {
  llvm.func @test_sync_block_set_intra_vector() {
    "hivm.intr.hivm.SET.INTRA.BLOCKI.mode"() <{pipe = 1 : i64, sync_id = 1 : i64}> : () -> ()
    llvm.return
  }
}

// -----
module attributes {hacc.target = #hacc.target<"Ascend950PR_9589">, hivm.module_core_type = #hivm.module_core_type<MIX>} {
  llvm.func @test_sync_block_set_inter_cube() {
    %0 = llvm.mlir.constant(257 : i64) : i64
    "hivm.intr.hivm.SET.CROSS.CORE"(%0) <{pipe = 10 : i64}> : (i64) -> ()
    llvm.return
  }
}

// -----
module attributes {hacc.target = #hacc.target<"Ascend950PR_9589">, hivm.module_core_type = #hivm.module_core_type<MIX>} {
  llvm.func @test_sync_block_set_inter_vector() {
    %0 = llvm.mlir.constant(257 : i64) : i64
    "hivm.intr.hivm.SET.CROSS.CORE"(%0) <{pipe = 1 : i64}> : (i64) -> ()
    llvm.return
  }
}

// -----
module attributes {hacc.target = #hacc.target<"Ascend950PR_9589">, hivm.module_core_type = #hivm.module_core_type<MIX>} {
  llvm.func @test_sync_block_wait_intra_cube() {
    "hivm.intr.hivm.WAIT.INTRA.BLOCKI.mode"() <{pipe = 0 : i64, sync_id = 17 : i64}> : () -> ()
    "hivm.intr.hivm.WAIT.INTRA.BLOCKI.mode"() <{pipe = 0 : i64, sync_id = 1 : i64}> : () -> ()
    llvm.return
  }
}

// -----
module attributes {hacc.target = #hacc.target<"Ascend950PR_9589">, hivm.module_core_type = #hivm.module_core_type<MIX>} {
  llvm.func @test_sync_block_wait_intra_vector() {
    "hivm.intr.hivm.WAIT.INTRA.BLOCKI.mode"() <{pipe = 0 : i64, sync_id = 1 : i64}> : () -> ()
    llvm.return
  }
}

// -----
module attributes {hacc.target = #hacc.target<"Ascend950PR_9589">, hivm.module_core_type = #hivm.module_core_type<MIX>} {
  llvm.func @test_sync_block_wait_inter_cube() {
    "hivm.intr.hivm.WAIT.FLAG.DEV.PIPE.IMM"() <{flag_id = 1 : i64, pipe = 0 : i64}> : () -> ()
    llvm.return
  }
}

// -----
module attributes {hacc.target = #hacc.target<"Ascend950PR_9589">, hivm.module_core_type = #hivm.module_core_type<MIX>} {
  llvm.func @test_sync_block_wait_inter_vector() {
    "hivm.intr.hivm.WAIT.FLAG.DEV.PIPE.IMM"() <{flag_id = 1 : i64, pipe = 0 : i64}> : () -> ()
    llvm.return
  }
}

// -----
module attributes {hacc.target = #hacc.target<"Ascend950PR_9589">, hivm.module_core_type = #hivm.module_core_type<MIX>} {
  llvm.func @test_sync_block_set_intra_cube_reg(%arg0: i64) {
    %0 = llvm.mlir.constant(16 : i64) : i64
    %1 = llvm.add %arg0, %0 : i64
    "hivm.intr.hivm.SET.INTRA.BLOCK.mode"(%1) <{pipe = 10 : i64}> : (i64) -> ()
    "hivm.intr.hivm.SET.INTRA.BLOCK.mode"(%arg0) <{pipe = 10 : i64}> : (i64) -> ()
    llvm.return
  }
}

// -----
module attributes {hacc.target = #hacc.target<"Ascend950PR_9589">, hivm.module_core_type = #hivm.module_core_type<MIX>} {
  llvm.func @test_sync_block_set_intra_vector_reg(%arg0: i64) {
    "hivm.intr.hivm.SET.INTRA.BLOCK.mode"(%arg0) <{pipe = 1 : i64}> : (i64) -> ()
    llvm.return
  }
}

// -----
module attributes {hacc.target = #hacc.target<"Ascend950PR_9589">, hivm.module_core_type = #hivm.module_core_type<MIX>} {
  llvm.func @test_sync_block_wait_intra_cube_reg(%arg0: i64) {
    %0 = llvm.mlir.constant(16 : i64) : i64
    %1 = llvm.add %arg0, %0 : i64
    "hivm.intr.hivm.WAIT.INTRA.BLOCK.mode"(%1) <{pipe = 0 : i64}> : (i64) -> ()
    "hivm.intr.hivm.WAIT.INTRA.BLOCK.mode"(%arg0) <{pipe = 0 : i64}> : (i64) -> ()
    llvm.return
  }
}

// -----
module attributes {hacc.target = #hacc.target<"Ascend950PR_9589">, hivm.module_core_type = #hivm.module_core_type<MIX>} {
  llvm.func @test_sync_block_wait_intra_vector_reg(%arg0: i64) {
    "hivm.intr.hivm.WAIT.INTRA.BLOCK.mode"(%arg0) <{pipe = 0 : i64}> : (i64) -> ()
    llvm.return
  }
}

// -----
module attributes {hacc.target = #hacc.target<"Ascend950PR_9589">, hivm.module_core_type = #hivm.module_core_type<MIX>} {
  llvm.func @test_sync_block_wait_inter_vector_reg(%arg0: i64) {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.mlir.constant(8 : i64) : i64
    %2 = llvm.shl %arg0, %1 : i64
    %3 = llvm.or %2, %0  : i64
    "hivm.intr.hivm.SET.CROSS.CORE"(%3) <{pipe = 1 : i64}> : (i64) -> ()
    llvm.return
  }
}

// -----
module {
  llvm.func @use(!llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64) attributes {sym_visibility = "private"}
  llvm.func @fold_marked(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: i64, %arg3: i64, %arg4: i64, %arg5: i64, %arg6: i64) {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %2 = llvm.insertvalue %arg1, %1[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %3 = llvm.insertvalue %arg2, %2[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %4 = llvm.insertvalue %arg3, %3[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %5 = llvm.insertvalue %arg5, %4[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %6 = llvm.insertvalue %arg4, %5[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %7 = llvm.insertvalue %arg6, %6[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %8 = builtin.unrealized_conversion_cast %7 : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> to memref<32x128xf32, strided<[128, 1], offset: ?>>
    %9 = builtin.unrealized_conversion_cast %8 : memref<32x128xf32, strided<[128, 1], offset: ?>> to !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %10 = llvm.extractvalue %9[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %11 = llvm.extractvalue %9[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %12 = llvm.extractvalue %9[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %13 = llvm.getelementptr %10[%12] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %14 = llvm.getelementptr %11[%12] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %15 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %16 = llvm.insertvalue %13, %15[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %17 = llvm.insertvalue %14, %16[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %18 = llvm.mlir.constant(0 : index) : i64
    %19 = llvm.insertvalue %18, %17[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %20 = llvm.extractvalue %9[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %21 = llvm.insertvalue %20, %19[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %22 = llvm.extractvalue %9[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %23 = llvm.insertvalue %22, %21[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %24 = llvm.extractvalue %9[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %25 = llvm.insertvalue %24, %23[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %26 = llvm.extractvalue %9[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %27 = llvm.insertvalue %26, %25[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %28 = llvm.extractvalue %27[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %29 = llvm.extractvalue %27[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %30 = llvm.extractvalue %27[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %31 = llvm.extractvalue %27[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %32 = llvm.extractvalue %27[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %33 = llvm.extractvalue %27[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %34 = llvm.extractvalue %27[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @use(%28, %29, %30, %31, %32, %33, %34) : (!llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64) -> ()
    llvm.return
  }
}

// -----
module {
  llvm.func @use(!llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64) attributes {sym_visibility = "private"}
  llvm.func @no_fold_unmarked(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: i64, %arg3: i64, %arg4: i64, %arg5: i64, %arg6: i64) {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %2 = llvm.insertvalue %arg1, %1[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %3 = llvm.insertvalue %arg2, %2[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %4 = llvm.insertvalue %arg3, %3[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %5 = llvm.insertvalue %arg5, %4[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %6 = llvm.insertvalue %arg4, %5[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %7 = llvm.insertvalue %arg6, %6[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %8 = builtin.unrealized_conversion_cast %7 : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> to memref<32x128xf32, strided<[128, 1], offset: ?>>
    %9 = builtin.unrealized_conversion_cast %8 : memref<32x128xf32, strided<[128, 1], offset: ?>> to !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %10 = llvm.extractvalue %9[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %11 = llvm.extractvalue %9[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %12 = llvm.extractvalue %9[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %13 = llvm.extractvalue %9[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %14 = llvm.extractvalue %9[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %15 = llvm.extractvalue %9[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %16 = llvm.extractvalue %9[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @use(%10, %11, %12, %13, %14, %15, %16) : (!llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64) -> ()
    llvm.return
  }
}

// -----
module {
  llvm.func @test_ssbuf_to_llvm(%arg0: i64) attributes {hivm.func_core_type = #hivm.func_core_type<AIV>} {
    %0 = llvm.inttoptr %arg0 : i64 to !llvm.ptr<11>
    %1 = llvm.mlir.constant(1 : index) : i64
    %2 = llvm.mlir.zero : !llvm.ptr
    %3 = llvm.getelementptr %2[%1] : (!llvm.ptr, i64) -> !llvm.ptr, i8
    %4 = llvm.ptrtoint %3 : !llvm.ptr to i64
    %5 = llvm.mlir.undef : !llvm.struct<(ptr<11>, ptr<11>, i64)>
    %6 = llvm.insertvalue %0, %5[0] : !llvm.struct<(ptr<11>, ptr<11>, i64)> 
    %7 = llvm.insertvalue %0, %6[1] : !llvm.struct<(ptr<11>, ptr<11>, i64)> 
    %8 = llvm.mlir.constant(0 : index) : i64
    %9 = llvm.insertvalue %8, %7[2] : !llvm.struct<(ptr<11>, ptr<11>, i64)> 
    %10 = llvm.extractvalue %9[1] : !llvm.struct<(ptr<11>, ptr<11>, i64)> 
    %11 = llvm.load volatile %10 : !llvm.ptr<11> -> i8
    annotation.mark %11 : i8
    %12 = llvm.mlir.constant(0 : i8) : i8
    %13 = llvm.icmp "sgt" %11, %12 : i8
    llvm.cond_br %13, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    %14 = llvm.mlir.constant(1 : i8) : i8
    %15 = llvm.sub %11, %14 : i8
    %16 = llvm.extractvalue %9[1] : !llvm.struct<(ptr<11>, ptr<11>, i64)> 
    llvm.store volatile %15, %16 : i8, !llvm.ptr<11>
    llvm.br ^bb2
  ^bb2:  // 2 preds: ^bb0, ^bb1
    llvm.return
  }
}

