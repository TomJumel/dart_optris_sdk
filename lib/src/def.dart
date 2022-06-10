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