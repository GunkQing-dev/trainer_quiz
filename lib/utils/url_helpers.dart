import 'package:url_launcher/url_launcher.dart';

Future<void> launchExternalUrl(String url) async {
  final uri = Uri.parse(url);
  await launchUrl(
    uri,
    mode: LaunchMode.externalApplication,
    webOnlyWindowName: '_blank',
  );
}
