import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:trainer_quiz/data/quiz_data.dart';
import 'package:trainer_quiz/models/playstyle.dart';

Future<void> shareResultImage(
  Uint8List bytes,
  TrainerType dominantType,
  BuildContext context,
) async {
  final tempDir = await getTemporaryDirectory();
  final file = File('${tempDir.path}/trainer_results.png');
  await file.writeAsBytes(bytes);

  final info = playstyleLibrary[dominantType];
  final caption = info == null
      ? 'Check out my results from the Find Your Trainer Type quiz!'
      : 'I matched ${info.title} on Find Your Trainer Type. Discover yours at https://github.com/QuervoDev/trainer_quiz';

  await Share.shareXFiles([XFile(file.path)], text: caption);
}
