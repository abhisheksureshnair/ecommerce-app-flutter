import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/theme/app_theme.dart';
import 'core/routes/app_pages.dart';
import 'core/routes/app_routes.dart';
import 'core/bindings/initial_binding.dart';

void main() {
  runApp(const LuxentiaApp());
}

class LuxentiaApp extends StatelessWidget {
  const LuxentiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Luxentia Obsidian',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      initialRoute: kIsWeb ? AppRoutes.MAIN : AppRoutes.ONBOARDING,
      initialBinding: InitialBinding(),
      getPages: AppPages.pages,
    );
  }
}

