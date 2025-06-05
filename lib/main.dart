import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heavyfreight/core/app%20routing/app_routes.dart';

void main() {
  

  runApp(MyApp(appRouter: AppRouter(), initialRoute: '/'));
}

class MyApp extends StatelessWidget {
 const MyApp({super.key, required this.appRouter, required this.initialRoute});
  final String initialRoute;
  final AppRouter appRouter;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: false,
          primaryColor: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: initialRoute,
        onGenerateRoute: (settings) =>
            appRouter.generateRoute(settings, initialRoute),
      ),
    );
    //go router
  }
}