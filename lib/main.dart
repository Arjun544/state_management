import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomePage(),
    );
  }
}

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await homeController.configureLocalTimeZone();
//   runApp(
//     GetMaterialApp(
//       home: HomePage(),
//     ),
//   );
// }
