import 'package:flutter/material.dart';
import 'package:poker/presentation/new_analysis_screen/new_analysis_screen.dart';
import 'package:poker/presentation/settings_page/settings_page.dart';

import '../data/models/news_model/news_model.dart';
import '../presentation/navigation_bar_screen/navigation_bar_screen.dart';
import '../presentation/news_content_screen/news_content_screen.dart';
import '../presentation/onboarding_screen/onboarding_screen.dart';

class AppRoutes {
  static const String onboardingScreen = '/onboarding_screen';

  static const String newAnalysisScreen = '/new_analysis_screen';

  static const String newsContentScreen = '/news_content_screen';

  static const String homePage = '/home_page';

  static const String settingsPage = '/settings_page';

  static const String newsPage = '/news_page';

  static const String navigationBarScreen = '/navigation_bar_screen';

  static Map<String, WidgetBuilder> get routes => {
        onboardingScreen: OnboardingScreen.builder,
        navigationBarScreen: NavigationBarScreen.builder,

        //    travelAddScreen: (context) {
        //   dynamic arguments = null;
        //   if (ModalRoute.of(context)?.settings.arguments is TravelModel) {
        //     arguments =
        //         (ModalRoute.of(context)?.settings.arguments as TravelModel);
        //   }
        //   return TravelAddScreen.builder(context, arguments);
        // },
        //
        // historyScreen: (context) {
        //   dynamic arguments = null;
        //
        //   arguments =
        //       (ModalRoute.of(context)?.settings.arguments as List<TravelModel>);
        //
        //   return HistoryScreen.builder(context, arguments);
        // },
        // travelInfoScreen: (context) {
        //   final arguments =
        //       ModalRoute.of(context)!.settings.arguments as TravelModel;
        //   return TravelInfoScreen.builder(context, arguments);
        // },
        newsContentScreen: (context) {
          final arguments =
              ModalRoute.of(context)!.settings.arguments as NewsModel;
          return NewsContentScreen.builder(context, arguments);
        },
        settingsPage: SettingsPage.builder,
        newAnalysisScreen: NewAnalysisScreen.builder,
      };
}
