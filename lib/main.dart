import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'core/routes/route.dart';

Future<void> main() async {
  runZonedGuarded(() async {
    await SentryFlutter.init((options) {
      options.debug = true;

      options.dsn =
          'https://88831a235eefd837628316b505fc66ca@o4506314341023744.ingest.us.sentry.io/4507453403889664';
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = 1.0;
      options.tracesSampler = (samplingContext) {
        // Always sample traces for transactions that resulted in an error or
        // were very slow (customise this to your needs)
        if (samplingContext.transactionContext.operation == 'error') {
          return 1.0;
        }
        // Use the default sampling decision for all other transactions
        return null;
      };
      // The sampling rate for profiling is relative to tracesSampleRate
      // Setting to 1.0 will profile 100% of sampled transactions:
      options.profilesSampleRate = 1.0;
    }, appRunner: () => runApp(const MyApp()));
  }, (error, stackTrace) async {
    await Sentry.captureException(
      error,
      stackTrace: stackTrace,
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff92A3FD)),
        useMaterial3: true,
      ),
      routeInformationParser: AppRouter.router.routeInformationParser,
      routeInformationProvider: AppRouter.router.routeInformationProvider,
      routerDelegate: AppRouter.router.routerDelegate,
    );
  }
}
