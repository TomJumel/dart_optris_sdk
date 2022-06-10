import 'dart:ffi';

class FCOORD extends Struct{
  @Float()
  external double x;

  @Float()
  external double y;

  @override
  String toString() {
    return 'FCOORD{x: $x, y: $y}';
  }
}