import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:trainer_quiz/data/external_resources.dart';
import 'package:trainer_quiz/utils/url_helpers.dart';

class TopContactLinks extends StatelessWidget {
  const TopContactLinks({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final borderColor = theme.colorScheme.outline.withOpacity(0.4);

    return Wrap(
      alignment: WrapAlignment.end,
      spacing: 12,
      runSpacing: 8,
      children: maintainerResources.map((resource) {
        final icon = SvgPicture.asset(
          resource.assetPath,
          width: 20,
          height: 20,
          colorFilter: resource.tintIcon
              ? const ColorFilter.mode(Colors.white, BlendMode.srcIn)
              : null,
        );

        return Tooltip(
          message: resource.subtitle ?? resource.label,
          child: Material(
            color: resource.color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(999),
              side: BorderSide(color: borderColor),
            ),
            child: InkWell(
              onTap: () => launchExternalUrl(resource.url),
              borderRadius: BorderRadius.circular(999),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: icon,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
