import 'dart:ffi';

import 'structs/frame_metadata_2.dart';

typedef f_init_raw = Int32 Function(Int16);
typedef f_init16_raw = Int16 Function(Int16);
typedef f_frameConfig_raw = Int32 Function(
  Uint16,
  Pointer<Uint32> width,
  Pointer<Uint32> height,
  Pointer<Uint32> depth,
);
typedef f_frameConfig = int Function(
  int,
  Pointer<Uint32> width,
  Pointer<Uint32> height,
  Pointer<Uint32> depth,
);
typedef f_init = int Function(int);

typedef f_getTemp_raw = Float Function(Int16);
typedef f_getTemp = double Function(int);

typedef f_getIPCState_raw = Uint8 Function(Int16, Bool);
typedef f_getIPCState = int Function(int, bool);

typedef f_getFrameMetadataSize_raw = Int64 Function(Int16, Pointer<Uint32>);
typedef f_getFrameMetadataSize = int Function(int, Pointer<Uint32>);

typedef f_getFrame2_raw = Int32 Function(
  Int16,
  Int16,
  Pointer<Uint8>,
  Uint32,
  Pointer<Uint8>,
  Uint32,
);
typedef f_getFrame2 = int Function(
  int,
  int,
  Pointer<Uint8>,
  int,
  Pointer<Uint8>,
  int,
);
