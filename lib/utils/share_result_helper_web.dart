import 'dart:typed_data';
// ignore: avoid_web_libraries_in_flutter, deprecated_member_use
import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:trainer_quiz/models/playstyle.dart';

Future<void> shareResultImage(
  Uint8List bytes,
  TrainerType _,
  BuildContext __,
) async {
  final blob = html.Blob([bytes], 'image/png');
  final url = html.Url.createObjectUrlFromBlob(blob);
  html.AnchorElement(href: url)
    ..download = 'trainer_results.png'
    ..click();
  html.Url.revokeObjectUrl(url);
}
