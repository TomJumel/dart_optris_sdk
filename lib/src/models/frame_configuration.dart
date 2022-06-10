class FrameConfiguration {
  final int width, height, depth;

  FrameConfiguration(this.width, this.height, this.depth);

  int getSize() => width * height * depth;

  @override
  String toString() {
    return 'FrameConfiguration{width: $width, height: $height, depth: $depth}';
  }
}
