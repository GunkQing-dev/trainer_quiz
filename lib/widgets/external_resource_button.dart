import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:trainer_quiz/data/external_resources.dart';
import 'package:trainer_quiz/utils/url_helpers.dart';

class ExternalResourceButton extends StatelessWidget {
  const ExternalResourceButton({
    super.key,
    required this.resource,
    this.compact = false,
  });

  final ExternalResource resource;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = Colors.white;
    final iconSize = compact ? 18.0 : 28.0;
    final icon = SvgPicture.asset(
      resource.assetPath,
      width: iconSize,
      height: iconSize,
      colorFilter: resource.tintIcon
          ? const ColorFilter.mode(Colors.white, BlendMode.srcIn)
          : null,
    );

    final padding = compact
        ? const EdgeInsets.symmetric(horizontal: 14, vertical: 12)
        : const EdgeInsets.symmetric(horizontal: 18, vertical: 16);
    final borderRadius = compact
        ? BorderRadius.circular(999)
        : BorderRadius.circular(16);

    final labelStyle = compact
        ? theme.textTheme.titleSmall?.copyWith(
            color: textColor,
            fontWeight: FontWeight.bold,
          )
        : theme.textTheme.titleMedium?.copyWith(
            color: textColor,
            fontWeight: FontWeight.bold,
          );

    return FilledButton(
      onPressed: () => launchExternalUrl(resource.url),
      style: FilledButton.styleFrom(
        backgroundColor: resource.color,
        foregroundColor: textColor,
        padding: padding,
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
        minimumSize: compact ? const Size(0, 0) : null,
      ),
      child: Row(
        mainAxisSize: compact ? MainAxisSize.min : MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon,
          SizedBox(width: compact ? 8 : 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(resource.label, style: labelStyle),
                if (!compact && resource.subtitle != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(
                      resource.subtitle!,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: textColor.withValues(alpha: 0.8),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          if (!compact && resource.cta != null)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(999),
              ),
              child: Text(
                resource.cta!,
                style: theme.textTheme.labelLarge?.copyWith(color: textColor),
              ),
            ),
        ],
      ),
    );
  }
}
