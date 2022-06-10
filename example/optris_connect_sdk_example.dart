import 'package:optris_connect_sdk/optris_connect_sdk.dart';

int main() {
  bool connected = false;
  OptrisConnect c = OptrisConnect(index: 0, isX64: true);
  print("[Main] Starting communication with Optris Connect");
  if (!c.init()) {
    print("[Main] Initialisation failed");
    return -1;
  }
  if (!c.run()) {
    print("[Main] Run failed");
    return -1;
  }
  int state = c.getICPState(true);
  if (state & IPCEvent.IPC_EVENT_SERVER_STOPPED != 0) {
    connected = false;
    return 0;
  }
  if (!connected && (state & IPCEvent.IPC_EVENT_INIT_COMPLETED != 0)) {
    connected = true;
  }
  FrameConfiguration? f = c.tryFrameConfig();
  if ((state & IPCEvent.IPC_EVENT_FRAME_INIT != 0) && (f != null)) {
    if(c.available()){
      IRImage? frame = c.getFrame();
      // Do something with the frame
      if(frame != null){
        MaxMinPair pair =  frame.coldHot();
      }
    }
    c.imagerProcessMessage();
  }
  return 0;
}
