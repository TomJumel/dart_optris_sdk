import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';

import 'package:ffi/ffi.dart';

import 'def.dart';
import 'error.dart';
import 'models/frame_configuration.dart';
import 'models/ir_image.dart';
import 'structs/frame_metadata_2.dart';

class OptrisConnect {
  final int index;
  FrameConfiguration? frameConfiguration;
  late final DynamicLibrary dl;

  bool isX64;

  OptrisConnect({required this.index, required this.isX64, String? path}) {
    if (path != null) {
      dl = DynamicLibrary.open(path);
    } else {
      if (isX64) {
        dl = DynamicLibrary.open(Platform.script
            .resolve("ImagerIPC2x64.dll")
            .toFilePath(windows: true));
      } else {
        dl = DynamicLibrary.open(Platform.script
            .resolve("ImagerIPC2.dll")
            .toFilePath(windows: true));
      }
    }
    _bindLibrary();
  }

  bool init() => Error.convert(_lInit(index)) == Error.NO_ERROR;

  bool run() => Error.convert(_lRun(index)) == Error.NO_ERROR;

  bool release() => Error.convert(_lRelease(index)) == Error.NO_ERROR;

  bool renewFlag() => Error.convert(_lRenewFlag(index)) == Error.NO_ERROR;

  int frameQueue() => _lGetFrameQueue(index);

  double getAmbientTemp() => _lGetAmbientTemp(index);

  double getTempTarget() => _lGetTempTarget(index);

  double getHumidity() => _lGetHumidity(index);

  bool available() => frameQueue() > 0;

  int getICPState([bool reset = false]) {
    return _lGetIPCState(index, reset);
  }

  int imagerProcessMessage() => _lImagerIPCProcessMessages(index);

  FrameConfiguration frameConfig() {
    Pointer<Uint32> w = calloc();
    Pointer<Uint32> h = calloc();
    Pointer<Uint32> d = calloc();
    final res = Error.convert(_lGetFrameConfig(index, w, h, d));
    if (res == Error.NO_ERROR) {
      return frameConfiguration = FrameConfiguration(w.value, h.value, d.value);
    }
    throw res;
  }

  int getMetadataFrameSize() {
    Pointer<Uint32> size = calloc();
    final res = Error.convert(_lGetFrameMetadataSize(index, size));
    if (res == Error.NO_ERROR) {
      return size.value;
    }
    return res.error;
  }

  IRImage? getFrame() {
    FrameConfiguration? configuration = tryFrameConfig();
    if (configuration == null) return null;
    Pointer<Uint8> imgData = malloc(configuration.getSize());
    int value = getMetadataFrameSize();
    Pointer<Uint8> metadata = malloc(value);
    final res = Error.convert(_lGetFrame(
        index, 0, imgData, configuration.getSize(), metadata, value));
    if (res != Error.NO_ERROR) return null;
    FrameMetadata2 frameMetadata2 = metadata.cast<FrameMetadata2>().ref;
    Uint16List imgDataList =
        imgData.asTypedList(configuration.getSize()).buffer.asUint16List();
    return IRImage(imgDataList, frameMetadata2, configuration);
  }

  FrameConfiguration? tryFrameConfig() {
    try {
      return frameConfig();
    } catch (_) {}
    return null;
  }

  late f_init _lInit;
  late f_init _lRun;
  late f_init _lRelease;
  late f_init _lGetFrameQueue;
  late f_init _lRenewFlag;
  late f_frameConfig _lGetFrameConfig;
  late f_getTemp _lGetAmbientTemp;
  late f_getTemp _lGetTempTarget;
  late f_getTemp _lGetHumidity;
  late f_getIPCState _lGetIPCState;
  late f_init _lImagerIPCProcessMessages;
  late f_getFrameMetadataSize _lGetFrameMetadataSize;
  late f_getFrame2 _lGetFrame;

  void _bindLibrary() {
    _lInit = dl.lookupFunction<f_init_raw, f_init>("InitImagerIPC");
    _lRun = dl.lookupFunction<f_init_raw, f_init>("RunImagerIPC");
    _lRenewFlag = dl.lookupFunction<f_init_raw, f_init>("RenewFlag");
    _lRelease = dl.lookupFunction<f_init_raw, f_init>("ReleaseImagerIPC");
    _lImagerIPCProcessMessages =
        dl.lookupFunction<f_init_raw, f_init>("ImagerIPCProcessMessages");
    _lGetFrameQueue = dl.lookupFunction<f_init16_raw, f_init>("GetFrameQueue");
    _lGetAmbientTemp =
        dl.lookupFunction<f_getTemp_raw, f_getTemp>("GetTempBox");
    _lGetTempTarget =
        dl.lookupFunction<f_getTemp_raw, f_getTemp>("GetTempTarget");
    _lGetHumidity = dl.lookupFunction<f_getTemp_raw, f_getTemp>("GetHumidity");
    _lGetFrameConfig =
        dl.lookupFunction<f_frameConfig_raw, f_frameConfig>("GetFrameConfig");
    _lGetIPCState =
        dl.lookupFunction<f_getIPCState_raw, f_getIPCState>("GetIPCState");
    _lGetFrameMetadataSize =
        dl.lookupFunction<f_getFrameMetadataSize_raw, f_getFrameMetadataSize>(
            "GetFrameMetadataSize");
    _lGetFrame = dl.lookupFunction<f_getFrame2_raw, f_getFrame2>("GetFrame2");
  }
}
