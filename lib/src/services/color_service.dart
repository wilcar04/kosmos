import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class ColorService {
  Future<Color?> getDominantColor(String imageUrl) async {
    final imageProvider = NetworkImage(imageUrl);

    final PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(
      imageProvider,
      size: const Size(200, 200), // limit size for performance
    );

    return paletteGenerator.dominantColor?.color;
  }
}
