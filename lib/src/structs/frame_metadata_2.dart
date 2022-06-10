//struct FrameMetadata2
// {
//     unsigned short Size;	// size of this structure
//     unsigned int Counter;	// frame counter
//     unsigned int CounterHW;	// frame counter hardware
//     long long Timestamp;	// time stamp in UNITS (10000000 per second)
//     long long TimestampMedia;
//     TFlagState FlagState;
//     BOOL IsSameFrame;	 // Part of T#153,  is true if we have the same CounterHW and nothing changed in between since last time
//     float TempChip;
//     float TempFlag;
//     float TempBox;
//     float TempOptics;
//     unsigned short LensPosition; // Lens position
//     FCOORD HotSpot;     // Hot spot position
//     FCOORD ColdSpot;    // Cold spot position
//
//     WORD PIFnDI;        // PIF DI (digital input) number of inputs
//     DWORD PIFDI;        // PIF DI (digital input), bit field
//     WORD PIFnAI;        // PIF AI (analog input) number of inputs
//     WORD PIFAI[1];       // PIF AI (analog input) flexible array
// };

import 'dart:ffi';

import 'f_coord.dart';

class FrameMetadata2 extends Struct {
  @Uint8()
  external int Size;
  @Uint16()
  external int Counter;
  @Uint16()
  external int CounterHW;
  @Int64()
  external int Timestamp;
  @Int64()
  external int TimestampMedia;
  @Int32()
  external int FlagState;
  @Bool()
  external bool IsSameFrame;
  @Float()
  external double TempChip;
  @Float()
  external double TempFlag;
  @Float()
  external double TempBox;
  @Float()
  external double TempOptics;
  @Uint8()
  external int LensPosition;
  external FCOORD HotSpot;
  external FCOORD ColdSpot;

  @Uint8()
  external int PIFnDI;
  @Uint16()
  external int PIFDI;
  @Uint8()
  external int PIFnAI;
  @Uint8()
  external int PIFAI;

  @override
  String toString() {
    return 'FrameMetadata2{Size: $Size, Counter: $Counter, CounterHW: $CounterHW, Timestamp: $Timestamp, TimestampMedia: $TimestampMedia, FlagState: $FlagState, IsSameFrame: $IsSameFrame, TempChip: $TempChip, TempFlag: $TempFlag, TempBox: $TempBox, TempOptics: $TempOptics, LensPosition: $LensPosition, HotSpot: $HotSpot, ColdSpot: $ColdSpot, PIFnDI: $PIFnDI, PIFDI: $PIFDI, PIFnAI: $PIFnAI, PIFAI: $PIFAI}';
  }
}
