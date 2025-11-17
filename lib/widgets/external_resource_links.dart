import 'package:flutter/material.dart';

import 'package:trainer_quiz/data/external_resources.dart';
import 'package:trainer_quiz/widgets/external_resource_button.dart';

class ExternalResourceLinks extends StatelessWidget {
  const ExternalResourceLinks({
    super.key,
    required this.resources,
    this.title,
    this.compact = false,
    this.alignment = WrapAlignment.start,
    this.maxItemWidth = 260,
    this.compactMaxWidth = 200,
  });

  final List<ExternalResource> resources;
  final String? title;
  final bool compact;
  final WrapAlignment alignment;
  final double maxItemWidth;
  final double compactMaxWidth;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Text(
            title!,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
        ],
        Wrap(
          alignment: alignment,
          spacing: compact ? 8 : 12,
          runSpacing: compact ? 0 : 12,
          children: resources
              .map(
                (resource) => ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: compact ? compactMaxWidth : maxItemWidth,
                  ),
                  child: ExternalResourceButton(
                    resource: resource,
                    compact: compact,
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
