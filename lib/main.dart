import 'package:flutter/material.dart';
import 'package:task_tracker/core/app_export.dart';
import 'package:task_tracker/core/utils/initial_bindings.dart';
import 'package:task_tracker/presentation/splash_screen/view/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        title: 'Task Tracker',
        debugShowCheckedModeBanner: false,
        theme: theme,
        initialBinding: InitialBindings(),
        initialRoute: AppRoutes.initialRoute,
        getPages: AppRoutes.pages,
        home: Builder(builder: (context) {
          return const SplashScreen();
        }),
      );
    });
  }
}
