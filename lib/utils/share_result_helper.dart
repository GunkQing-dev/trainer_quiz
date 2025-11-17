import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:trainer_quiz/models/playstyle.dart';

import 'share_result_helper_io.dart'
    if (dart.library.html) 'share_result_helper_web.dart'
    as share_impl;

Future<void> shareResultImage(
  Uint8List bytes,
  TrainerType dominantType,
  BuildContext context,
) {
  return share_impl.shareResultImage(bytes, dominantType, context);
}
