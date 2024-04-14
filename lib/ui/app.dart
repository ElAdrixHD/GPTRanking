import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ranking_app/ui/common_components/theme/custom_theme.dart';
import 'package:ranking_app/ui/features/home/views/home_view.dart';
import 'package:ranking_app/ui/i18n/locale_keys.g.dart';
import 'package:reactive_forms/reactive_forms.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ReactiveFormConfig(
      validationMessages: {
        ValidationMessage.required: (_) => LocaleKeys.errors_form_required.tr(),
      },
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: appThemeData,
        scaffoldMessengerKey: GetIt.I.get<GlobalKey<ScaffoldMessengerState>>(),
        home: const HomeView(),
      ),
    );
  }
}
