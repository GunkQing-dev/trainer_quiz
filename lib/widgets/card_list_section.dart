import 'package:flutter/material.dart';

class CardListSection extends StatelessWidget {
  const CardListSection({
    super.key,
    required this.title,
    required this.items,
    required this.icon,
    required this.iconColor,
  });

  final String title;
  final List<String> items;
  final IconData icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        ...items.map(
          (item) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(icon, size: 20, color: iconColor),
                const SizedBox(width: 8),
                Expanded(child: Text(item, style: theme.textTheme.titleMedium)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
