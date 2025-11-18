import 'package:flutter/material.dart';

class ExternalResource {
  const ExternalResource({
    required this.label,
    required this.url,
    required this.assetPath,
    required this.color,
    this.subtitle,
    this.cta,
    this.tintIcon = true,
  });

  final String label;
  final String? subtitle;
  final String url;
  final String assetPath;
  final Color color;
  final String? cta;
  final bool tintIcon;
}

const ExternalResource gunkTwitter = ExternalResource(
  label: '@GunkQing',
  subtitle: 'X (Twitter)',
  url: 'https://x.com/GunkQing',
  assetPath: 'assets/icons/x_logo.svg',
  color: Color(0xFF1DA1F2),
);

const ExternalResource gunkGithub = ExternalResource(
  label: 'GunkQing-dev',
  subtitle: 'GitHub',
  url: 'https://github.com/GunkQing-dev',
  assetPath: 'assets/icons/github_logo.svg',
  color: Color(0xFF2B3137),
);

const ExternalResource darshTwitter = ExternalResource(
  label: '@DarkTypeDarsh',
  subtitle: 'X (Twitter)',
  url: 'https://x.com/DarkTypeDarsh',
  assetPath: 'assets/icons/x_logo.svg',
  color: Color(0xFF000000),
);

const ExternalResource darshYoutube = ExternalResource(
  label: '@darktypedarsh',
  subtitle: 'YouTube channel',
  url: 'https://www.youtube.com/@darktypedarsh?si=mKzB6XS2E3YiA0tR',
  assetPath: 'assets/icons/youtube_logo.svg',
  color: Color(0xFFFF0000),
  tintIcon: false,
);

const ExternalResource darshVideo = ExternalResource(
  label: 'Trainer Type Deep Dive',
  subtitle: 'Full video breakdown',
  url: 'https://www.youtube.com/watch?v=g_QRaxbye1M&t=934s',
  assetPath: 'assets/icons/youtube_logo.svg',
  color: Color(0xFFFF4D4F),
  cta: 'Watch',
  tintIcon: false,
);

const List<ExternalResource> maintainerResources = [gunkTwitter, gunkGithub];
const List<ExternalResource> darshIntroResources = [darshTwitter, darshYoutube];
const List<ExternalResource> darshFullResources = [
  darshTwitter,
  darshYoutube,
  darshVideo,
];
