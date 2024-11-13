import 'package:app_game_2/Routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:app_game_2/service/Article/article_service.dart';
import 'package:get/get.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'TechShop',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      getPages: AppPages.routes,
      initialRoute: Routes.ARTICLE,
    );
  }
}