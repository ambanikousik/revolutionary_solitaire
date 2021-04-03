import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class ShadowText extends StatelessWidget {
  const ShadowText(this.data, {this.style}) : assert(data != null);

  final String data;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Stack(
        children: [
          Text(
            data,
            style: style.copyWith(color: Colors.orange.withOpacity(0.9)),
          ),
          BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
            child: Text(data, style: style),
          ),
        ],
      ),
    );
  }
}
