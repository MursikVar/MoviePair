

import 'package:flutter/material.dart';

class TextStyleUserInfo {
  TextStyle discriptionText() {
    return TextStyle(
      color: Color(0xFF9ca3b2),
      fontSize: 12,
      fontWeight: FontWeight.w500,
    );
  }

  TextStyle userInfoText(double _fontSize) {
    return TextStyle(
      color: Color(0xFFf5f5f7),
      fontWeight: FontWeight.bold,
      fontSize: _fontSize,
    );
  }
}
