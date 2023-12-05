import 'package:al_quran_el_karim/core/utliz/routers.dart';
import 'package:al_quran_el_karim/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/resources/constants_manager.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: [
                Expanded(
                  child: SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.35,
                      height: MediaQuery.sizeOf(context).height * 0.3,
                      child: Lottie.asset("asset/animation/drawer.json")),
                ),
                Text(
                  S.of(context).ALQuran,
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
            ),
            title: Text(
              S.of(context).setting,
            ),
            onTap: () {
              GoRouter.of(context).pop();
              GoRouter.of(context).push(MyRoute.kSettingView);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.share,
            ),
            title: Text(
              S.of(context).Share,
            ),
            onTap: () {
              Share.share('''*Quran app*\n
Thanks for using My App \n 
It is developed By Hossam Ali''');
              GoRouter.of(context).pop();
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.rate_review,
            ),
            title: Text(
              S.of(context).Rate,
            ),
            onTap: () async {
              if (!await launchUrl(AppConstants.quranAppurl,
                  mode: LaunchMode.externalApplication)) {
                throw 'Could not launch $AppConstants.quranAppurl';
              }
            },
          ),
        ],
      ),
    );
  }
}
