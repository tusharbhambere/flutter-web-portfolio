import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kamranbekirovcom_website/domain/showcase_app.dart';
import 'package:kamranbekirovcom_website/screens/landing_screen.dart';
import 'package:kamranbekirovcom_website/widgets/external_link_button.dart';

class ShowcaseAppItem extends StatelessWidget {
  final ShowcaseApp app;

  const ShowcaseAppItem(
    this.app, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 5,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8.0),
          topRight: Radius.circular(8.0),
          bottomLeft: Radius.circular(4.0),
          bottomRight: Radius.circular(4.0),
        ),
        child: Container(
          color: cardColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              app.isNetworkImage ? Image.network(app.image) : Image.asset(app.image),
              Container(
                height: 201.0,
                padding: const EdgeInsets.all(24.0).copyWith(bottom: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      app.name,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        letterSpacing: 1.4,
                      ),
                    ),
                    const Divider(
                      color: dividerColor,
                      thickness: 1.5,
                      height: 32.0,
                    ),
                    if (app.playStoreURL != null) ...[
                      ExternalLinkButton(
                        url: app.playStoreURL!,
                        iconData: FontAwesomeIcons.googlePlay,
                        label: 'Play Store',
                      ),
                      const SizedBox(height: 8.0),
                    ],
                    if (app.appStoreURL != null) ...[
                      ExternalLinkButton(
                        url: app.appStoreURL!,
                        iconData: FontAwesomeIcons.appStoreIos,
                        label: 'App Store',
                      ),
                      const SizedBox(height: 8.0),
                    ],
                    if (app.githubURL != null)
                      ExternalLinkButton(
                        url: app.githubURL!,
                        iconData: FontAwesomeIcons.squareGithub,
                        label: 'GitHub',
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}