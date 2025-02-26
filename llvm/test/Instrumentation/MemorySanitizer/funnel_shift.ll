; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt -opaque-pointers %s -S -passes=msan 2>&1 | FileCheck %s

target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @var_funnel_i64(i64 %a64, <2 x i64> %a128, <4 x i64> %a256, <8 x i64> %a512, i64 %b64, <2 x i64> %b128, <4 x i64> %b256, <8 x i64> %b512, i64 %c64, <2 x i64> %c128, <4 x i64> %c256, <8 x i64> %c512) sanitize_memory {
; CHECK-LABEL: @var_funnel_i64(
; CHECK-NEXT:    [[TMP1:%.*]] = load i64, ptr @__msan_param_tls, align 8
; CHECK-NEXT:    [[TMP2:%.*]] = load i64, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 120) to ptr), align 8
; CHECK-NEXT:    [[TMP3:%.*]] = load i64, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 240) to ptr), align 8
; CHECK-NEXT:    [[TMP4:%.*]] = load <2 x i64>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 8) to ptr), align 8
; CHECK-NEXT:    [[TMP5:%.*]] = load <2 x i64>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 128) to ptr), align 8
; CHECK-NEXT:    [[TMP6:%.*]] = load <2 x i64>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 248) to ptr), align 8
; CHECK-NEXT:    [[TMP7:%.*]] = load <4 x i64>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 24) to ptr), align 8
; CHECK-NEXT:    [[TMP8:%.*]] = load <4 x i64>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 144) to ptr), align 8
; CHECK-NEXT:    [[TMP9:%.*]] = load <4 x i64>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 264) to ptr), align 8
; CHECK-NEXT:    [[TMP10:%.*]] = load <8 x i64>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 56) to ptr), align 8
; CHECK-NEXT:    [[TMP11:%.*]] = load <8 x i64>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 176) to ptr), align 8
; CHECK-NEXT:    [[TMP12:%.*]] = load <8 x i64>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 296) to ptr), align 8
; CHECK-NEXT:    call void @llvm.donothing()
; CHECK-NEXT:    [[TMP13:%.*]] = icmp ne i64 [[TMP3]], 0
; CHECK-NEXT:    [[TMP14:%.*]] = sext i1 [[TMP13]] to i64
; CHECK-NEXT:    [[TMP15:%.*]] = call i64 @llvm.fshl.i64(i64 [[TMP1]], i64 [[TMP2]], i64 [[C64:%.*]])
; CHECK-NEXT:    [[TMP16:%.*]] = or i64 [[TMP15]], [[TMP14]]
; CHECK-NEXT:    [[I64:%.*]] = call i64 @llvm.fshl.i64(i64 [[A64:%.*]], i64 [[B64:%.*]], i64 [[C64]])
; CHECK-NEXT:    [[TMP17:%.*]] = icmp ne <2 x i64> [[TMP6]], zeroinitializer
; CHECK-NEXT:    [[TMP18:%.*]] = sext <2 x i1> [[TMP17]] to <2 x i64>
; CHECK-NEXT:    [[TMP19:%.*]] = call <2 x i64> @llvm.fshl.v2i64(<2 x i64> [[TMP4]], <2 x i64> [[TMP5]], <2 x i64> [[C128:%.*]])
; CHECK-NEXT:    [[TMP20:%.*]] = or <2 x i64> [[TMP19]], [[TMP18]]
; CHECK-NEXT:    [[V2I64:%.*]] = call <2 x i64> @llvm.fshl.v2i64(<2 x i64> [[A128:%.*]], <2 x i64> [[B128:%.*]], <2 x i64> [[C128]])
; CHECK-NEXT:    [[TMP21:%.*]] = icmp ne <4 x i64> [[TMP9]], zeroinitializer
; CHECK-NEXT:    [[TMP22:%.*]] = sext <4 x i1> [[TMP21]] to <4 x i64>
; CHECK-NEXT:    [[TMP23:%.*]] = call <4 x i64> @llvm.fshl.v4i64(<4 x i64> [[TMP7]], <4 x i64> [[TMP8]], <4 x i64> [[C256:%.*]])
; CHECK-NEXT:    [[TMP24:%.*]] = or <4 x i64> [[TMP23]], [[TMP22]]
; CHECK-NEXT:    [[V4I64:%.*]] = call <4 x i64> @llvm.fshl.v4i64(<4 x i64> [[A256:%.*]], <4 x i64> [[B256:%.*]], <4 x i64> [[C256]])
; CHECK-NEXT:    [[TMP25:%.*]] = icmp ne <8 x i64> [[TMP12]], zeroinitializer
; CHECK-NEXT:    [[TMP26:%.*]] = sext <8 x i1> [[TMP25]] to <8 x i64>
; CHECK-NEXT:    [[TMP27:%.*]] = call <8 x i64> @llvm.fshl.v8i64(<8 x i64> [[TMP10]], <8 x i64> [[TMP11]], <8 x i64> [[C512:%.*]])
; CHECK-NEXT:    [[TMP28:%.*]] = or <8 x i64> [[TMP27]], [[TMP26]]
; CHECK-NEXT:    [[V8I64:%.*]] = call <8 x i64> @llvm.fshl.v8i64(<8 x i64> [[A512:%.*]], <8 x i64> [[B512:%.*]], <8 x i64> [[C512]])
; CHECK-NEXT:    ret void
;
  %I64    = call i64 @llvm.fshl.i64(i64 %a64, i64 %b64, i64 %c64)
  %V2I64  = call <2 x i64> @llvm.fshl.v2i64(<2 x i64> %a128, <2 x i64> %b128, <2 x i64> %c128)
  %V4I64  = call <4 x i64> @llvm.fshl.v4i64(<4 x i64> %a256, <4 x i64> %b256, <4 x i64> %c256)
  %V8I64  = call <8 x i64> @llvm.fshl.v8i64(<8 x i64> %a512, <8 x i64> %b512, <8 x i64> %c512)
  ret void
}

define void @var_funnel_i32(i32 %a32, <4 x i32> %a128, <8 x i32> %a256, <16 x i32> %a512, i32 %b32, <4 x i32> %b128, <8 x i32> %b256, <16 x i32> %b512, i32 %c32, <4 x i32> %c128, <8 x i32> %c256, <16 x i32> %c512) sanitize_memory {
; CHECK-LABEL: @var_funnel_i32(
; CHECK-NEXT:    [[TMP1:%.*]] = load i32, ptr @__msan_param_tls, align 8
; CHECK-NEXT:    [[TMP2:%.*]] = load i32, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 120) to ptr), align 8
; CHECK-NEXT:    [[TMP3:%.*]] = load i32, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 240) to ptr), align 8
; CHECK-NEXT:    [[TMP4:%.*]] = load <4 x i32>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 8) to ptr), align 8
; CHECK-NEXT:    [[TMP5:%.*]] = load <4 x i32>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 128) to ptr), align 8
; CHECK-NEXT:    [[TMP6:%.*]] = load <4 x i32>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 248) to ptr), align 8
; CHECK-NEXT:    [[TMP7:%.*]] = load <8 x i32>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 24) to ptr), align 8
; CHECK-NEXT:    [[TMP8:%.*]] = load <8 x i32>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 144) to ptr), align 8
; CHECK-NEXT:    [[TMP9:%.*]] = load <8 x i32>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 264) to ptr), align 8
; CHECK-NEXT:    [[TMP10:%.*]] = load <16 x i32>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 56) to ptr), align 8
; CHECK-NEXT:    [[TMP11:%.*]] = load <16 x i32>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 176) to ptr), align 8
; CHECK-NEXT:    [[TMP12:%.*]] = load <16 x i32>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 296) to ptr), align 8
; CHECK-NEXT:    call void @llvm.donothing()
; CHECK-NEXT:    [[TMP13:%.*]] = icmp ne i32 [[TMP3]], 0
; CHECK-NEXT:    [[TMP14:%.*]] = sext i1 [[TMP13]] to i32
; CHECK-NEXT:    [[TMP15:%.*]] = call i32 @llvm.fshl.i32(i32 [[TMP1]], i32 [[TMP2]], i32 [[C32:%.*]])
; CHECK-NEXT:    [[TMP16:%.*]] = or i32 [[TMP15]], [[TMP14]]
; CHECK-NEXT:    [[I32:%.*]] = call i32 @llvm.fshl.i32(i32 [[A32:%.*]], i32 [[B32:%.*]], i32 [[C32]])
; CHECK-NEXT:    [[TMP17:%.*]] = icmp ne <4 x i32> [[TMP6]], zeroinitializer
; CHECK-NEXT:    [[TMP18:%.*]] = sext <4 x i1> [[TMP17]] to <4 x i32>
; CHECK-NEXT:    [[TMP19:%.*]] = call <4 x i32> @llvm.fshl.v4i32(<4 x i32> [[TMP4]], <4 x i32> [[TMP5]], <4 x i32> [[C128:%.*]])
; CHECK-NEXT:    [[TMP20:%.*]] = or <4 x i32> [[TMP19]], [[TMP18]]
; CHECK-NEXT:    [[V2I32:%.*]] = call <4 x i32> @llvm.fshl.v4i32(<4 x i32> [[A128:%.*]], <4 x i32> [[B128:%.*]], <4 x i32> [[C128]])
; CHECK-NEXT:    [[TMP21:%.*]] = icmp ne <8 x i32> [[TMP9]], zeroinitializer
; CHECK-NEXT:    [[TMP22:%.*]] = sext <8 x i1> [[TMP21]] to <8 x i32>
; CHECK-NEXT:    [[TMP23:%.*]] = call <8 x i32> @llvm.fshl.v8i32(<8 x i32> [[TMP7]], <8 x i32> [[TMP8]], <8 x i32> [[C256:%.*]])
; CHECK-NEXT:    [[TMP24:%.*]] = or <8 x i32> [[TMP23]], [[TMP22]]
; CHECK-NEXT:    [[V4I32:%.*]] = call <8 x i32> @llvm.fshl.v8i32(<8 x i32> [[A256:%.*]], <8 x i32> [[B256:%.*]], <8 x i32> [[C256]])
; CHECK-NEXT:    [[TMP25:%.*]] = icmp ne <16 x i32> [[TMP12]], zeroinitializer
; CHECK-NEXT:    [[TMP26:%.*]] = sext <16 x i1> [[TMP25]] to <16 x i32>
; CHECK-NEXT:    [[TMP27:%.*]] = call <16 x i32> @llvm.fshl.v16i32(<16 x i32> [[TMP10]], <16 x i32> [[TMP11]], <16 x i32> [[C512:%.*]])
; CHECK-NEXT:    [[TMP28:%.*]] = or <16 x i32> [[TMP27]], [[TMP26]]
; CHECK-NEXT:    [[V8I32:%.*]] = call <16 x i32> @llvm.fshl.v16i32(<16 x i32> [[A512:%.*]], <16 x i32> [[B512:%.*]], <16 x i32> [[C512]])
; CHECK-NEXT:    ret void
;
  %I32   = call i32 @llvm.fshl.i32(i32 %a32, i32 %b32, i32 %c32)
  %V2I32 = call <4 x i32> @llvm.fshl.v4i32(<4 x i32> %a128, <4 x i32> %b128, <4 x i32> %c128)
  %V4I32 = call <8 x i32> @llvm.fshl.v8i32(<8 x i32> %a256, <8 x i32> %b256, <8 x i32> %c256)
  %V8I32 = call <16 x i32> @llvm.fshl.v16i32(<16 x i32> %a512, <16 x i32> %b512, <16 x i32> %c512)
  ret void
}

define void @var_funnel_i16(i16 %a16, <8 x i16> %a128, <16 x i16> %a256, <32 x i16> %a512, i16 %b16, <8 x i16> %b128, <16 x i16> %b256, <32 x i16> %b512, i16 %c16, <8 x i16> %c128, <16 x i16> %c256, <32 x i16> %c512) sanitize_memory {
; CHECK-LABEL: @var_funnel_i16(
; CHECK-NEXT:    [[TMP1:%.*]] = load i16, ptr @__msan_param_tls, align 8
; CHECK-NEXT:    [[TMP2:%.*]] = load i16, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 120) to ptr), align 8
; CHECK-NEXT:    [[TMP3:%.*]] = load i16, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 240) to ptr), align 8
; CHECK-NEXT:    [[TMP4:%.*]] = load <8 x i16>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 8) to ptr), align 8
; CHECK-NEXT:    [[TMP5:%.*]] = load <8 x i16>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 128) to ptr), align 8
; CHECK-NEXT:    [[TMP6:%.*]] = load <8 x i16>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 248) to ptr), align 8
; CHECK-NEXT:    [[TMP7:%.*]] = load <16 x i16>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 24) to ptr), align 8
; CHECK-NEXT:    [[TMP8:%.*]] = load <16 x i16>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 144) to ptr), align 8
; CHECK-NEXT:    [[TMP9:%.*]] = load <16 x i16>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 264) to ptr), align 8
; CHECK-NEXT:    [[TMP10:%.*]] = load <32 x i16>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 56) to ptr), align 8
; CHECK-NEXT:    [[TMP11:%.*]] = load <32 x i16>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 176) to ptr), align 8
; CHECK-NEXT:    [[TMP12:%.*]] = load <32 x i16>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 296) to ptr), align 8
; CHECK-NEXT:    call void @llvm.donothing()
; CHECK-NEXT:    [[TMP13:%.*]] = icmp ne i16 [[TMP3]], 0
; CHECK-NEXT:    [[TMP14:%.*]] = sext i1 [[TMP13]] to i16
; CHECK-NEXT:    [[TMP15:%.*]] = call i16 @llvm.fshl.i16(i16 [[TMP1]], i16 [[TMP2]], i16 [[C16:%.*]])
; CHECK-NEXT:    [[TMP16:%.*]] = or i16 [[TMP15]], [[TMP14]]
; CHECK-NEXT:    [[I16:%.*]] = call i16 @llvm.fshl.i16(i16 [[A16:%.*]], i16 [[B16:%.*]], i16 [[C16]])
; CHECK-NEXT:    [[TMP17:%.*]] = icmp ne <8 x i16> [[TMP6]], zeroinitializer
; CHECK-NEXT:    [[TMP18:%.*]] = sext <8 x i1> [[TMP17]] to <8 x i16>
; CHECK-NEXT:    [[TMP19:%.*]] = call <8 x i16> @llvm.fshl.v8i16(<8 x i16> [[TMP4]], <8 x i16> [[TMP5]], <8 x i16> [[C128:%.*]])
; CHECK-NEXT:    [[TMP20:%.*]] = or <8 x i16> [[TMP19]], [[TMP18]]
; CHECK-NEXT:    [[V8I16:%.*]] = call <8 x i16> @llvm.fshl.v8i16(<8 x i16> [[A128:%.*]], <8 x i16> [[B128:%.*]], <8 x i16> [[C128]])
; CHECK-NEXT:    [[TMP21:%.*]] = icmp ne <16 x i16> [[TMP9]], zeroinitializer
; CHECK-NEXT:    [[TMP22:%.*]] = sext <16 x i1> [[TMP21]] to <16 x i16>
; CHECK-NEXT:    [[TMP23:%.*]] = call <16 x i16> @llvm.fshl.v16i16(<16 x i16> [[TMP7]], <16 x i16> [[TMP8]], <16 x i16> [[C256:%.*]])
; CHECK-NEXT:    [[TMP24:%.*]] = or <16 x i16> [[TMP23]], [[TMP22]]
; CHECK-NEXT:    [[V16I16:%.*]] = call <16 x i16> @llvm.fshl.v16i16(<16 x i16> [[A256:%.*]], <16 x i16> [[B256:%.*]], <16 x i16> [[C256]])
; CHECK-NEXT:    [[TMP25:%.*]] = icmp ne <32 x i16> [[TMP12]], zeroinitializer
; CHECK-NEXT:    [[TMP26:%.*]] = sext <32 x i1> [[TMP25]] to <32 x i16>
; CHECK-NEXT:    [[TMP27:%.*]] = call <32 x i16> @llvm.fshl.v32i16(<32 x i16> [[TMP10]], <32 x i16> [[TMP11]], <32 x i16> [[C512:%.*]])
; CHECK-NEXT:    [[TMP28:%.*]] = or <32 x i16> [[TMP27]], [[TMP26]]
; CHECK-NEXT:    [[V32I16:%.*]] = call <32 x i16> @llvm.fshl.v32i16(<32 x i16> [[A512:%.*]], <32 x i16> [[B512:%.*]], <32 x i16> [[C512]])
; CHECK-NEXT:    ret void
;
  %I16    = call i16 @llvm.fshl.i16(i16 %a16, i16 %b16, i16 %c16)
  %V8I16  = call <8 x i16> @llvm.fshl.v8i16(<8 x i16> %a128, <8 x i16> %b128, <8 x i16> %c128)
  %V16I16 = call <16 x i16> @llvm.fshl.v16i16(<16 x i16> %a256, <16 x i16> %b256, <16 x i16> %c256)
  %V32I16 = call <32 x i16> @llvm.fshl.v32i16(<32 x i16> %a512, <32 x i16> %b512, <32 x i16> %c512)
  ret void
}

define void @var_funnel_i8(i8 %a8, <16 x i8> %a128, <32 x i8> %a256, <64 x i8> %a512, i8 %b8, <16 x i8> %b128, <32 x i8> %b256, <64 x i8> %b512, i8 %c8, <16 x i8> %c128, <32 x i8> %c256, <64 x i8> %c512) sanitize_memory {
; CHECK-LABEL: @var_funnel_i8(
; CHECK-NEXT:    [[TMP1:%.*]] = load i8, ptr @__msan_param_tls, align 8
; CHECK-NEXT:    [[TMP2:%.*]] = load i8, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 120) to ptr), align 8
; CHECK-NEXT:    [[TMP3:%.*]] = load i8, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 240) to ptr), align 8
; CHECK-NEXT:    [[TMP4:%.*]] = load <16 x i8>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 8) to ptr), align 8
; CHECK-NEXT:    [[TMP5:%.*]] = load <16 x i8>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 128) to ptr), align 8
; CHECK-NEXT:    [[TMP6:%.*]] = load <16 x i8>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 248) to ptr), align 8
; CHECK-NEXT:    [[TMP7:%.*]] = load <32 x i8>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 24) to ptr), align 8
; CHECK-NEXT:    [[TMP8:%.*]] = load <32 x i8>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 144) to ptr), align 8
; CHECK-NEXT:    [[TMP9:%.*]] = load <32 x i8>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 264) to ptr), align 8
; CHECK-NEXT:    [[TMP10:%.*]] = load <64 x i8>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 56) to ptr), align 8
; CHECK-NEXT:    [[TMP11:%.*]] = load <64 x i8>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 176) to ptr), align 8
; CHECK-NEXT:    [[TMP12:%.*]] = load <64 x i8>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 296) to ptr), align 8
; CHECK-NEXT:    call void @llvm.donothing()
; CHECK-NEXT:    [[TMP13:%.*]] = icmp ne i8 [[TMP3]], 0
; CHECK-NEXT:    [[TMP14:%.*]] = sext i1 [[TMP13]] to i8
; CHECK-NEXT:    [[TMP15:%.*]] = call i8 @llvm.fshl.i8(i8 [[TMP1]], i8 [[TMP2]], i8 [[C8:%.*]])
; CHECK-NEXT:    [[TMP16:%.*]] = or i8 [[TMP15]], [[TMP14]]
; CHECK-NEXT:    [[I8:%.*]] = call i8 @llvm.fshl.i8(i8 [[A8:%.*]], i8 [[B8:%.*]], i8 [[C8]])
; CHECK-NEXT:    [[TMP17:%.*]] = icmp ne <16 x i8> [[TMP6]], zeroinitializer
; CHECK-NEXT:    [[TMP18:%.*]] = sext <16 x i1> [[TMP17]] to <16 x i8>
; CHECK-NEXT:    [[TMP19:%.*]] = call <16 x i8> @llvm.fshl.v16i8(<16 x i8> [[TMP4]], <16 x i8> [[TMP5]], <16 x i8> [[C128:%.*]])
; CHECK-NEXT:    [[TMP20:%.*]] = or <16 x i8> [[TMP19]], [[TMP18]]
; CHECK-NEXT:    [[V16I8:%.*]] = call <16 x i8> @llvm.fshl.v16i8(<16 x i8> [[A128:%.*]], <16 x i8> [[B128:%.*]], <16 x i8> [[C128]])
; CHECK-NEXT:    [[TMP21:%.*]] = icmp ne <32 x i8> [[TMP9]], zeroinitializer
; CHECK-NEXT:    [[TMP22:%.*]] = sext <32 x i1> [[TMP21]] to <32 x i8>
; CHECK-NEXT:    [[TMP23:%.*]] = call <32 x i8> @llvm.fshl.v32i8(<32 x i8> [[TMP7]], <32 x i8> [[TMP8]], <32 x i8> [[C256:%.*]])
; CHECK-NEXT:    [[TMP24:%.*]] = or <32 x i8> [[TMP23]], [[TMP22]]
; CHECK-NEXT:    [[V32I8:%.*]] = call <32 x i8> @llvm.fshl.v32i8(<32 x i8> [[A256:%.*]], <32 x i8> [[B256:%.*]], <32 x i8> [[C256]])
; CHECK-NEXT:    [[TMP25:%.*]] = icmp ne <64 x i8> [[TMP12]], zeroinitializer
; CHECK-NEXT:    [[TMP26:%.*]] = sext <64 x i1> [[TMP25]] to <64 x i8>
; CHECK-NEXT:    [[TMP27:%.*]] = call <64 x i8> @llvm.fshl.v64i8(<64 x i8> [[TMP10]], <64 x i8> [[TMP11]], <64 x i8> [[C512:%.*]])
; CHECK-NEXT:    [[TMP28:%.*]] = or <64 x i8> [[TMP27]], [[TMP26]]
; CHECK-NEXT:    [[V64I8:%.*]] = call <64 x i8> @llvm.fshl.v64i8(<64 x i8> [[A512:%.*]], <64 x i8> [[B512:%.*]], <64 x i8> [[C512]])
; CHECK-NEXT:    ret void
;
  %I8    = call i8 @llvm.fshl.i8(i8 %a8, i8 %b8, i8 %c8)
  %V16I8 = call <16 x i8> @llvm.fshl.v16i8(<16 x i8> %a128, <16 x i8> %b128, <16 x i8> %c128)
  %V32I8 = call <32 x i8> @llvm.fshl.v32i8(<32 x i8> %a256, <32 x i8> %b256, <32 x i8> %c256)
  %V64I8 = call <64 x i8> @llvm.fshl.v64i8(<64 x i8> %a512, <64 x i8> %b512, <64 x i8> %c512)
  ret void
}

define void @var_rotate_i64(i64 %a64, <2 x i64> %a128, <4 x i64> %a256, <8 x i64> %a512, i64 %c64, <2 x i64> %c128, <4 x i64> %c256, <8 x i64> %c512) sanitize_memory {
; CHECK-LABEL: @var_rotate_i64(
; CHECK-NEXT:    [[TMP1:%.*]] = load i64, ptr @__msan_param_tls, align 8
; CHECK-NEXT:    [[TMP2:%.*]] = load i64, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 120) to ptr), align 8
; CHECK-NEXT:    [[TMP3:%.*]] = load <2 x i64>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 8) to ptr), align 8
; CHECK-NEXT:    [[TMP4:%.*]] = load <2 x i64>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 128) to ptr), align 8
; CHECK-NEXT:    [[TMP5:%.*]] = load <4 x i64>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 24) to ptr), align 8
; CHECK-NEXT:    [[TMP6:%.*]] = load <4 x i64>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 144) to ptr), align 8
; CHECK-NEXT:    [[TMP7:%.*]] = load <8 x i64>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 56) to ptr), align 8
; CHECK-NEXT:    [[TMP8:%.*]] = load <8 x i64>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 176) to ptr), align 8
; CHECK-NEXT:    call void @llvm.donothing()
; CHECK-NEXT:    [[TMP9:%.*]] = icmp ne i64 [[TMP2]], 0
; CHECK-NEXT:    [[TMP10:%.*]] = sext i1 [[TMP9]] to i64
; CHECK-NEXT:    [[TMP11:%.*]] = call i64 @llvm.fshl.i64(i64 [[TMP1]], i64 [[TMP1]], i64 [[C64:%.*]])
; CHECK-NEXT:    [[TMP12:%.*]] = or i64 [[TMP11]], [[TMP10]]
; CHECK-NEXT:    [[I64:%.*]] = call i64 @llvm.fshl.i64(i64 [[A64:%.*]], i64 [[A64]], i64 [[C64]])
; CHECK-NEXT:    [[TMP13:%.*]] = icmp ne <2 x i64> [[TMP4]], zeroinitializer
; CHECK-NEXT:    [[TMP14:%.*]] = sext <2 x i1> [[TMP13]] to <2 x i64>
; CHECK-NEXT:    [[TMP15:%.*]] = call <2 x i64> @llvm.fshl.v2i64(<2 x i64> [[TMP3]], <2 x i64> [[TMP3]], <2 x i64> [[C128:%.*]])
; CHECK-NEXT:    [[TMP16:%.*]] = or <2 x i64> [[TMP15]], [[TMP14]]
; CHECK-NEXT:    [[V2I64:%.*]] = call <2 x i64> @llvm.fshl.v2i64(<2 x i64> [[A128:%.*]], <2 x i64> [[A128]], <2 x i64> [[C128]])
; CHECK-NEXT:    [[TMP17:%.*]] = icmp ne <4 x i64> [[TMP6]], zeroinitializer
; CHECK-NEXT:    [[TMP18:%.*]] = sext <4 x i1> [[TMP17]] to <4 x i64>
; CHECK-NEXT:    [[TMP19:%.*]] = call <4 x i64> @llvm.fshl.v4i64(<4 x i64> [[TMP5]], <4 x i64> [[TMP5]], <4 x i64> [[C256:%.*]])
; CHECK-NEXT:    [[TMP20:%.*]] = or <4 x i64> [[TMP19]], [[TMP18]]
; CHECK-NEXT:    [[V4I64:%.*]] = call <4 x i64> @llvm.fshl.v4i64(<4 x i64> [[A256:%.*]], <4 x i64> [[A256]], <4 x i64> [[C256]])
; CHECK-NEXT:    [[TMP21:%.*]] = icmp ne <8 x i64> [[TMP8]], zeroinitializer
; CHECK-NEXT:    [[TMP22:%.*]] = sext <8 x i1> [[TMP21]] to <8 x i64>
; CHECK-NEXT:    [[TMP23:%.*]] = call <8 x i64> @llvm.fshl.v8i64(<8 x i64> [[TMP7]], <8 x i64> [[TMP7]], <8 x i64> [[C512:%.*]])
; CHECK-NEXT:    [[TMP24:%.*]] = or <8 x i64> [[TMP23]], [[TMP22]]
; CHECK-NEXT:    [[V8I64:%.*]] = call <8 x i64> @llvm.fshl.v8i64(<8 x i64> [[A512:%.*]], <8 x i64> [[A512]], <8 x i64> [[C512]])
; CHECK-NEXT:    ret void
;
  %I64    = call i64 @llvm.fshl.i64(i64 %a64, i64 %a64, i64 %c64)
  %V2I64  = call <2 x i64> @llvm.fshl.v2i64(<2 x i64> %a128, <2 x i64> %a128, <2 x i64> %c128)
  %V4I64  = call <4 x i64> @llvm.fshl.v4i64(<4 x i64> %a256, <4 x i64> %a256, <4 x i64> %c256)
  %V8I64  = call <8 x i64> @llvm.fshl.v8i64(<8 x i64> %a512, <8 x i64> %a512, <8 x i64> %c512)
  ret void
}

define void @var_rotate_i32(i32 %a32, <4 x i32> %a128, <8 x i32> %a256, <16 x i32> %a512, i32 %c32, <4 x i32> %c128, <8 x i32> %c256, <16 x i32> %c512) sanitize_memory {
; CHECK-LABEL: @var_rotate_i32(
; CHECK-NEXT:    [[TMP1:%.*]] = load i32, ptr @__msan_param_tls, align 8
; CHECK-NEXT:    [[TMP2:%.*]] = load i32, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 120) to ptr), align 8
; CHECK-NEXT:    [[TMP3:%.*]] = load <4 x i32>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 8) to ptr), align 8
; CHECK-NEXT:    [[TMP4:%.*]] = load <4 x i32>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 128) to ptr), align 8
; CHECK-NEXT:    [[TMP5:%.*]] = load <8 x i32>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 24) to ptr), align 8
; CHECK-NEXT:    [[TMP6:%.*]] = load <8 x i32>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 144) to ptr), align 8
; CHECK-NEXT:    [[TMP7:%.*]] = load <16 x i32>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 56) to ptr), align 8
; CHECK-NEXT:    [[TMP8:%.*]] = load <16 x i32>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 176) to ptr), align 8
; CHECK-NEXT:    call void @llvm.donothing()
; CHECK-NEXT:    [[TMP9:%.*]] = icmp ne i32 [[TMP2]], 0
; CHECK-NEXT:    [[TMP10:%.*]] = sext i1 [[TMP9]] to i32
; CHECK-NEXT:    [[TMP11:%.*]] = call i32 @llvm.fshl.i32(i32 [[TMP1]], i32 [[TMP1]], i32 [[C32:%.*]])
; CHECK-NEXT:    [[TMP12:%.*]] = or i32 [[TMP11]], [[TMP10]]
; CHECK-NEXT:    [[I32:%.*]] = call i32 @llvm.fshl.i32(i32 [[A32:%.*]], i32 [[A32]], i32 [[C32]])
; CHECK-NEXT:    [[TMP13:%.*]] = icmp ne <4 x i32> [[TMP4]], zeroinitializer
; CHECK-NEXT:    [[TMP14:%.*]] = sext <4 x i1> [[TMP13]] to <4 x i32>
; CHECK-NEXT:    [[TMP15:%.*]] = call <4 x i32> @llvm.fshl.v4i32(<4 x i32> [[TMP3]], <4 x i32> [[TMP3]], <4 x i32> [[C128:%.*]])
; CHECK-NEXT:    [[TMP16:%.*]] = or <4 x i32> [[TMP15]], [[TMP14]]
; CHECK-NEXT:    [[V2I32:%.*]] = call <4 x i32> @llvm.fshl.v4i32(<4 x i32> [[A128:%.*]], <4 x i32> [[A128]], <4 x i32> [[C128]])
; CHECK-NEXT:    [[TMP17:%.*]] = icmp ne <8 x i32> [[TMP6]], zeroinitializer
; CHECK-NEXT:    [[TMP18:%.*]] = sext <8 x i1> [[TMP17]] to <8 x i32>
; CHECK-NEXT:    [[TMP19:%.*]] = call <8 x i32> @llvm.fshl.v8i32(<8 x i32> [[TMP5]], <8 x i32> [[TMP5]], <8 x i32> [[C256:%.*]])
; CHECK-NEXT:    [[TMP20:%.*]] = or <8 x i32> [[TMP19]], [[TMP18]]
; CHECK-NEXT:    [[V4I32:%.*]] = call <8 x i32> @llvm.fshl.v8i32(<8 x i32> [[A256:%.*]], <8 x i32> [[A256]], <8 x i32> [[C256]])
; CHECK-NEXT:    [[TMP21:%.*]] = icmp ne <16 x i32> [[TMP8]], zeroinitializer
; CHECK-NEXT:    [[TMP22:%.*]] = sext <16 x i1> [[TMP21]] to <16 x i32>
; CHECK-NEXT:    [[TMP23:%.*]] = call <16 x i32> @llvm.fshl.v16i32(<16 x i32> [[TMP7]], <16 x i32> [[TMP7]], <16 x i32> [[C512:%.*]])
; CHECK-NEXT:    [[TMP24:%.*]] = or <16 x i32> [[TMP23]], [[TMP22]]
; CHECK-NEXT:    [[V8I32:%.*]] = call <16 x i32> @llvm.fshl.v16i32(<16 x i32> [[A512:%.*]], <16 x i32> [[A512]], <16 x i32> [[C512]])
; CHECK-NEXT:    ret void
;
  %I32   = call i32 @llvm.fshl.i32(i32 %a32, i32 %a32, i32 %c32)
  %V2I32 = call <4 x i32> @llvm.fshl.v4i32(<4 x i32> %a128, <4 x i32> %a128, <4 x i32> %c128)
  %V4I32 = call <8 x i32> @llvm.fshl.v8i32(<8 x i32> %a256, <8 x i32> %a256, <8 x i32> %c256)
  %V8I32 = call <16 x i32> @llvm.fshl.v16i32(<16 x i32> %a512, <16 x i32> %a512, <16 x i32> %c512)
  ret void
}

define void @var_rotate_i16(i16 %a16, <8 x i16> %a128, <16 x i16> %a256, <32 x i16> %a512, i16 %c16, <8 x i16> %c128, <16 x i16> %c256, <32 x i16> %c512) sanitize_memory {
; CHECK-LABEL: @var_rotate_i16(
; CHECK-NEXT:    [[TMP1:%.*]] = load i16, ptr @__msan_param_tls, align 8
; CHECK-NEXT:    [[TMP2:%.*]] = load i16, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 120) to ptr), align 8
; CHECK-NEXT:    [[TMP3:%.*]] = load <8 x i16>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 8) to ptr), align 8
; CHECK-NEXT:    [[TMP4:%.*]] = load <8 x i16>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 128) to ptr), align 8
; CHECK-NEXT:    [[TMP5:%.*]] = load <16 x i16>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 24) to ptr), align 8
; CHECK-NEXT:    [[TMP6:%.*]] = load <16 x i16>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 144) to ptr), align 8
; CHECK-NEXT:    [[TMP7:%.*]] = load <32 x i16>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 56) to ptr), align 8
; CHECK-NEXT:    [[TMP8:%.*]] = load <32 x i16>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 176) to ptr), align 8
; CHECK-NEXT:    call void @llvm.donothing()
; CHECK-NEXT:    [[TMP9:%.*]] = icmp ne i16 [[TMP2]], 0
; CHECK-NEXT:    [[TMP10:%.*]] = sext i1 [[TMP9]] to i16
; CHECK-NEXT:    [[TMP11:%.*]] = call i16 @llvm.fshl.i16(i16 [[TMP1]], i16 [[TMP1]], i16 [[C16:%.*]])
; CHECK-NEXT:    [[TMP12:%.*]] = or i16 [[TMP11]], [[TMP10]]
; CHECK-NEXT:    [[I16:%.*]] = call i16 @llvm.fshl.i16(i16 [[A16:%.*]], i16 [[A16]], i16 [[C16]])
; CHECK-NEXT:    [[TMP13:%.*]] = icmp ne <8 x i16> [[TMP4]], zeroinitializer
; CHECK-NEXT:    [[TMP14:%.*]] = sext <8 x i1> [[TMP13]] to <8 x i16>
; CHECK-NEXT:    [[TMP15:%.*]] = call <8 x i16> @llvm.fshl.v8i16(<8 x i16> [[TMP3]], <8 x i16> [[TMP3]], <8 x i16> [[C128:%.*]])
; CHECK-NEXT:    [[TMP16:%.*]] = or <8 x i16> [[TMP15]], [[TMP14]]
; CHECK-NEXT:    [[V8I16:%.*]] = call <8 x i16> @llvm.fshl.v8i16(<8 x i16> [[A128:%.*]], <8 x i16> [[A128]], <8 x i16> [[C128]])
; CHECK-NEXT:    [[TMP17:%.*]] = icmp ne <16 x i16> [[TMP6]], zeroinitializer
; CHECK-NEXT:    [[TMP18:%.*]] = sext <16 x i1> [[TMP17]] to <16 x i16>
; CHECK-NEXT:    [[TMP19:%.*]] = call <16 x i16> @llvm.fshl.v16i16(<16 x i16> [[TMP5]], <16 x i16> [[TMP5]], <16 x i16> [[C256:%.*]])
; CHECK-NEXT:    [[TMP20:%.*]] = or <16 x i16> [[TMP19]], [[TMP18]]
; CHECK-NEXT:    [[V16I16:%.*]] = call <16 x i16> @llvm.fshl.v16i16(<16 x i16> [[A256:%.*]], <16 x i16> [[A256]], <16 x i16> [[C256]])
; CHECK-NEXT:    [[TMP21:%.*]] = icmp ne <32 x i16> [[TMP8]], zeroinitializer
; CHECK-NEXT:    [[TMP22:%.*]] = sext <32 x i1> [[TMP21]] to <32 x i16>
; CHECK-NEXT:    [[TMP23:%.*]] = call <32 x i16> @llvm.fshl.v32i16(<32 x i16> [[TMP7]], <32 x i16> [[TMP7]], <32 x i16> [[C512:%.*]])
; CHECK-NEXT:    [[TMP24:%.*]] = or <32 x i16> [[TMP23]], [[TMP22]]
; CHECK-NEXT:    [[V32I16:%.*]] = call <32 x i16> @llvm.fshl.v32i16(<32 x i16> [[A512:%.*]], <32 x i16> [[A512]], <32 x i16> [[C512]])
; CHECK-NEXT:    ret void
;
  %I16    = call i16 @llvm.fshl.i16(i16 %a16, i16 %a16, i16 %c16)
  %V8I16  = call <8 x i16> @llvm.fshl.v8i16(<8 x i16> %a128, <8 x i16> %a128, <8 x i16> %c128)
  %V16I16 = call <16 x i16> @llvm.fshl.v16i16(<16 x i16> %a256, <16 x i16> %a256, <16 x i16> %c256)
  %V32I16 = call <32 x i16> @llvm.fshl.v32i16(<32 x i16> %a512, <32 x i16> %a512, <32 x i16> %c512)
  ret void
}

define void @var_rotate_i8(i8 %a8, <16 x i8> %a128, <32 x i8> %a256, <64 x i8> %a512, i8 %c8, <16 x i8> %c128, <32 x i8> %c256, <64 x i8> %c512) sanitize_memory {
; CHECK-LABEL: @var_rotate_i8(
; CHECK-NEXT:    [[TMP1:%.*]] = load i8, ptr @__msan_param_tls, align 8
; CHECK-NEXT:    [[TMP2:%.*]] = load i8, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 120) to ptr), align 8
; CHECK-NEXT:    [[TMP3:%.*]] = load <16 x i8>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 8) to ptr), align 8
; CHECK-NEXT:    [[TMP4:%.*]] = load <16 x i8>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 128) to ptr), align 8
; CHECK-NEXT:    [[TMP5:%.*]] = load <32 x i8>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 24) to ptr), align 8
; CHECK-NEXT:    [[TMP6:%.*]] = load <32 x i8>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 144) to ptr), align 8
; CHECK-NEXT:    [[TMP7:%.*]] = load <64 x i8>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 56) to ptr), align 8
; CHECK-NEXT:    [[TMP8:%.*]] = load <64 x i8>, ptr inttoptr (i64 add (i64 ptrtoint (ptr @__msan_param_tls to i64), i64 176) to ptr), align 8
; CHECK-NEXT:    call void @llvm.donothing()
; CHECK-NEXT:    [[TMP9:%.*]] = icmp ne i8 [[TMP2]], 0
; CHECK-NEXT:    [[TMP10:%.*]] = sext i1 [[TMP9]] to i8
; CHECK-NEXT:    [[TMP11:%.*]] = call i8 @llvm.fshl.i8(i8 [[TMP1]], i8 [[TMP1]], i8 [[C8:%.*]])
; CHECK-NEXT:    [[TMP12:%.*]] = or i8 [[TMP11]], [[TMP10]]
; CHECK-NEXT:    [[I8:%.*]] = call i8 @llvm.fshl.i8(i8 [[A8:%.*]], i8 [[A8]], i8 [[C8]])
; CHECK-NEXT:    [[TMP13:%.*]] = icmp ne <16 x i8> [[TMP4]], zeroinitializer
; CHECK-NEXT:    [[TMP14:%.*]] = sext <16 x i1> [[TMP13]] to <16 x i8>
; CHECK-NEXT:    [[TMP15:%.*]] = call <16 x i8> @llvm.fshl.v16i8(<16 x i8> [[TMP3]], <16 x i8> [[TMP3]], <16 x i8> [[C128:%.*]])
; CHECK-NEXT:    [[TMP16:%.*]] = or <16 x i8> [[TMP15]], [[TMP14]]
; CHECK-NEXT:    [[V16I8:%.*]] = call <16 x i8> @llvm.fshl.v16i8(<16 x i8> [[A128:%.*]], <16 x i8> [[A128]], <16 x i8> [[C128]])
; CHECK-NEXT:    [[TMP17:%.*]] = icmp ne <32 x i8> [[TMP6]], zeroinitializer
; CHECK-NEXT:    [[TMP18:%.*]] = sext <32 x i1> [[TMP17]] to <32 x i8>
; CHECK-NEXT:    [[TMP19:%.*]] = call <32 x i8> @llvm.fshl.v32i8(<32 x i8> [[TMP5]], <32 x i8> [[TMP5]], <32 x i8> [[C256:%.*]])
; CHECK-NEXT:    [[TMP20:%.*]] = or <32 x i8> [[TMP19]], [[TMP18]]
; CHECK-NEXT:    [[V32I8:%.*]] = call <32 x i8> @llvm.fshl.v32i8(<32 x i8> [[A256:%.*]], <32 x i8> [[A256]], <32 x i8> [[C256]])
; CHECK-NEXT:    [[TMP21:%.*]] = icmp ne <64 x i8> [[TMP8]], zeroinitializer
; CHECK-NEXT:    [[TMP22:%.*]] = sext <64 x i1> [[TMP21]] to <64 x i8>
; CHECK-NEXT:    [[TMP23:%.*]] = call <64 x i8> @llvm.fshl.v64i8(<64 x i8> [[TMP7]], <64 x i8> [[TMP7]], <64 x i8> [[C512:%.*]])
; CHECK-NEXT:    [[TMP24:%.*]] = or <64 x i8> [[TMP23]], [[TMP22]]
; CHECK-NEXT:    [[V64I8:%.*]] = call <64 x i8> @llvm.fshl.v64i8(<64 x i8> [[A512:%.*]], <64 x i8> [[A512]], <64 x i8> [[C512]])
; CHECK-NEXT:    ret void
;
  %I8    = call i8 @llvm.fshl.i8(i8 %a8, i8 %a8, i8 %c8)
  %V16I8 = call <16 x i8> @llvm.fshl.v16i8(<16 x i8> %a128, <16 x i8> %a128, <16 x i8> %c128)
  %V32I8 = call <32 x i8> @llvm.fshl.v32i8(<32 x i8> %a256, <32 x i8> %a256, <32 x i8> %c256)
  %V64I8 = call <64 x i8> @llvm.fshl.v64i8(<64 x i8> %a512, <64 x i8> %a512, <64 x i8> %c512)
  ret void
}


declare i64 @llvm.fshl.i64(i64, i64, i64)
declare i32 @llvm.fshl.i32(i32, i32, i32)
declare i16 @llvm.fshl.i16(i16, i16, i16)
declare i8  @llvm.fshl.i8 (i8,  i8,  i8)

declare <2 x i64>  @llvm.fshl.v2i64(<2 x i64>, <2 x i64>, <2 x i64>)
declare <4 x i32>  @llvm.fshl.v4i32(<4 x i32>, <4 x i32>, <4 x i32>)
declare <8 x i16>  @llvm.fshl.v8i16(<8 x i16>, <8 x i16>, <8 x i16>)
declare <16 x i8>  @llvm.fshl.v16i8(<16 x i8>, <16 x i8>, <16 x i8>)

declare <4 x i64>  @llvm.fshl.v4i64(<4 x i64>, <4 x i64>, <4 x i64>)
declare <8 x i32>  @llvm.fshl.v8i32(<8 x i32>, <8 x i32>, <8 x i32>)
declare <16 x i16> @llvm.fshl.v16i16(<16 x i16>, <16 x i16>, <16 x i16>)
declare <32 x i8>  @llvm.fshl.v32i8(<32 x i8>, <32 x i8>, <32 x i8>)

declare <8 x i64>  @llvm.fshl.v8i64(<8 x i64>, <8 x i64>, <8 x i64>)
declare <16 x i32> @llvm.fshl.v16i32(<16 x i32>, <16 x i32>, <16 x i32>)
declare <32 x i16> @llvm.fshl.v32i16(<32 x i16>, <32 x i16>, <32 x i16>)
declare <64 x i8>  @llvm.fshl.v64i8(<64 x i8>, <64 x i8>, <64 x i8>)


declare i64 @llvm.fshr.i64(i64, i64, i64)
declare i32 @llvm.fshr.i32(i32, i32, i32)
declare i16 @llvm.fshr.i16(i16, i16, i16)
declare i8  @llvm.fshr.i8 (i8,  i8,  i8)

declare <2 x i64>  @llvm.fshr.v2i64(<2 x i64>, <2 x i64>, <2 x i64>)
declare <4 x i32>  @llvm.fshr.v4i32(<4 x i32>, <4 x i32>, <4 x i32>)
declare <8 x i16>  @llvm.fshr.v8i16(<8 x i16>, <8 x i16>, <8 x i16>)
declare <16 x i8>  @llvm.fshr.v16i8(<16 x i8>, <16 x i8>, <16 x i8>)

declare <4 x i64>  @llvm.fshr.v4i64(<4 x i64>, <4 x i64>, <4 x i64>)
declare <8 x i32>  @llvm.fshr.v8i32(<8 x i32>, <8 x i32>, <8 x i32>)
declare <16 x i16> @llvm.fshr.v16i16(<16 x i16>, <16 x i16>, <16 x i16>)
declare <32 x i8>  @llvm.fshr.v32i8(<32 x i8>, <32 x i8>, <32 x i8>)

declare <8 x i64>  @llvm.fshr.v8i64(<8 x i64>, <8 x i64>, <8 x i64>)
declare <16 x i32> @llvm.fshr.v16i32(<16 x i32>, <16 x i32>, <16 x i32>)
declare <32 x i16> @llvm.fshr.v32i16(<32 x i16>, <32 x i16>, <32 x i16>)
declare <64 x i8>  @llvm.fshr.v64i8(<64 x i8>, <64 x i8>, <64 x i8>)
