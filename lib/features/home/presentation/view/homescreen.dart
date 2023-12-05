import 'package:al_quran_el_karim/core/resources/color_manager.dart';
import 'package:al_quran_el_karim/core/resources/constants_manager.dart';
import 'package:al_quran_el_karim/core/utliz/routers.dart';
import 'package:al_quran_el_karim/core/utliz/stayles.dart';
import 'package:al_quran_el_karim/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/custom/indexcreator.dart';
import 'widgets/drawerbuilder.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Go to bookmark',
        child: Icon(
          Icons.bookmark,
          color: ColorManager.primary,
        ),
        backgroundColor: ColorManager.white,
        onPressed: () async {
          AppConstants.fabIsClicked = true;
          if (await AppConstants.readBookmark() == true) {
            print("work");
            GoRouter.of(context).push(MyRoute.kSuraBookMarkView);
            
          }
        },
      ),
      appBar: AppBar(
        title: Text(
          S.of(context).appbartitle,
          style: Styles.textStyle28,
        ),
      ),
      body: FutureBuilder(
        future: AppConstants.readJson(),
        builder: (
          BuildContext context,
          AsyncSnapshot snapshot,
        ) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text(
                'Error',
                style: Styles.textStyle20.copyWith(color: ColorManager.error),
              );
            } else if (snapshot.hasData) {
              return indexCreator(snapshot.data, context);
            } else {
              return const Text('Empty data');
            }
          } else {
            return Text('State: ${snapshot.connectionState}');
          }
        },
      ),
    );
  }
}
