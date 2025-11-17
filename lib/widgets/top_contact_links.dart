import 'package:flutter/material.dart';

import 'package:trainer_quiz/data/external_resources.dart';
import 'package:trainer_quiz/widgets/external_resource_links.dart';

class TopContactLinks extends StatelessWidget {
  const TopContactLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return const ExternalResourceLinks(
      resources: maintainerResources,
      compact: true,
      alignment: WrapAlignment.end,
      compactMaxWidth: 180,
    );
  }
}
