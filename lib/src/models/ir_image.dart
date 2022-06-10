import 'dart:math';

import 'dart:typed_data';

import '../structs/frame_metadata_2.dart';
import 'frame_configuration.dart';

class IRImage {
  final Uint16List image;
  final FrameMetadata2 metadata;
  final FrameConfiguration frameConfiguration;

  const IRImage(this.image, this.metadata, this.frameConfiguration);

  int getPixel(int x, int y) {
    return image[y * frameConfiguration.width + x];
  }

  MaxMinPair coldHot() {
    double mini = -1000, maxi = 0;
    for (int x = 0; x < frameConfiguration.width; x++) {
      for (int y = 0; y < frameConfiguration.height; y++) {
        int currPixel = image[(y * frameConfiguration.width) + x];
        double pixelTemp = (currPixel - 1000) / 10;
        if (mini == -1000) {
          mini = pixelTemp;
        }
        mini = min(mini, pixelTemp);
        maxi = max(maxi, pixelTemp);
      }
    }
    return MaxMinPair(max: maxi, min: mini);
  }
}

class MaxMinPair {
  final double max, min;

  MaxMinPair({required this.max, required this.min});
}