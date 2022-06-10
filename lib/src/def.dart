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

//--------------------------------------------
//// IPC events (polling mode)
// #define IPC_EVENT_INIT_COMPLETED	0x0001
// #define IPC_EVENT_SERVER_STOPPED	0x0002
// #define IPC_EVENT_CONFIG_CHANGED	0x0004
// #define IPC_EVENT_FILE_CMD_READY	0x0008
// #define IPC_EVENT_FRAME_INIT		0x0010
// #define IPC_EVENT_VIS_FRAME_INIT	0x0020
// #define IPC_EVENT_NEW_NMEA_STRING	0x0040
// #define IPC_EVENT_FILE_COMMAND  	0x0080
// #define IPC_EVENT_PLAY_METADATA	    0x0100
// #define IPC_EVENT_LSSLIT_CENTER	    0x0200
// #define IPC_EVENT_NEW_RAWFILESTATE  0x0400
// #define IPC_EVENT_AREAS_INIT		0x0800

class IPCEvent {
  static final int IPC_EVENT_INIT_COMPLETED = 0x0001;
  static final int IPC_EVENT_SERVER_STOPPED = 0x0002;
  static final int IPC_EVENT_CONFIG_CHANGED = 0x0004;
  static final int IPC_EVENT_FILE_CMD_READY = 0x0008;
  static final int IPC_EVENT_FRAME_INIT = 0x0010;
  static final int IPC_EVENT_VIS_FRAME_INIT = 0x0020;
  static final int IPC_EVENT_NEW_NMEA_STRING = 0x0040;
  static final int IPC_EVENT_FILE_COMMAND = 0x0080;
  static final int IPC_EVENT_PLAY_METADATA = 0x0100;
  static final int IPC_EVENT_LSSLIT_CENTER = 0x0200;
  static final int IPC_EVENT_NEW_RAWFILESTATE = 0x0400;
  static final int IPC_EVENT_AREAS_INIT = 0x0800;
}
