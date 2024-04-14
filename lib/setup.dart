import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:ranking_app/core/app/ioc/locator.dart';
import 'package:ranking_app/ui/app.dart';
import 'package:stack_trace/stack_trace.dart' as stack_trace;

void startApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  configureDependencies();

  FlutterError.onError = (details) {
    FlutterError.presentError(details);
  };

  FlutterError.demangleStackTrace = (StackTrace stack) {
    if (stack is stack_trace.Trace) return stack.vmTrace;
    if (stack is stack_trace.Chain) return stack.toTrace().vmTrace;
    return stack;
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    debugPrintStack(label: error.toString(), stackTrace: stack);
    return true;
  };

  return runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en')],
      path: 'assets/i18n',
      fallbackLocale: const Locale('en'),
      child: UncontrolledProviderScope(
        container: GetIt.I.get<ProviderContainer>(),
        child: const App(),
      ),
    ),
  );
}
