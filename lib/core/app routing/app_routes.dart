import 'package:flutter/material.dart';
import 'package:heavyfreight/features/Auth/view/login_screen.dart';
import 'package:heavyfreight/features/Package/view/delivery_info.dart';
import 'package:heavyfreight/features/Package/view/package_form.dart';
import 'package:heavyfreight/features/Package/view/track_delivery.dart';

class AppRouter {

  final rootNavigatorKey = GlobalKey<NavigatorState>();
 Route? generateRoute(RouteSettings settings, String initialRoute) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/package_form':
        return MaterialPageRoute(builder: (_) => const PackageForm());
      case '/delivery_info':
        return MaterialPageRoute(builder: (_) => const DeliveryInfo());
      case '/track_delivery':
        return MaterialPageRoute(builder: (_) => const TrackDelivery());
      default:
        return null; // or a default route
    }
  }
  
}