import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'playstyle.freezed.dart';

enum TrainerType { general, gambler, architect, flowPlayer }

@freezed
sealed class PlaystyleInfo with _$PlaystyleInfo {
  const PlaystyleInfo._();

  const factory PlaystyleInfo({
    required String title,
    required String subtitle,
    required List<String> strengths,
    required List<String> weaknesses,
    required String growthTip,
  }) = _PlaystyleInfo;
}

extension TrainerTypeX on TrainerType {
  String get label {
    switch (this) {
      case TrainerType.general:
        return 'The General';
      case TrainerType.gambler:
        return 'The Gambler';
      case TrainerType.architect:
        return 'The Architect';
      case TrainerType.flowPlayer:
        return 'The Flow Player';
    }
  }

  String get tagline {
    switch (this) {
      case TrainerType.general:
        return 'Aggressive & Planned';
      case TrainerType.gambler:
        return 'Aggressive & Flexible';
      case TrainerType.architect:
        return 'Passive & Planned';
      case TrainerType.flowPlayer:
        return 'Passive & Flexible';
    }
  }

  Color get accentColor {
    switch (this) {
      case TrainerType.general:
        return const Color(0xFFFF4D4F);
      case TrainerType.gambler:
        return const Color(0xFFFFC107);
      case TrainerType.architect:
        return const Color(0xFF4DA3FF);
      case TrainerType.flowPlayer:
        return const Color(0xFF4CAF50);
    }
  }
}
