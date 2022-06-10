import 'package:optris_connect_sdk/optris_connect_sdk.dart';
import 'package:test/test.dart';

const bool isX64 = true;
const int index = 0;

void main() {
  OptrisConnect optrisConnect = OptrisConnect(index: index, isX64: isX64,path: "c://");
  test("Connection test", () {
    expect(optrisConnect.init(), isTrue);
    expect(optrisConnect.run(), isTrue);
    expect(optrisConnect.release(), isTrue);
  });
}
