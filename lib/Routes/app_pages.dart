// ignore_for_file: constant_identifier_names

// 📦 Package imports:
import 'package:app_game_2/module/Article/Bingding/article_bingding.dart';
import 'package:app_game_2/module/Article/Views/article_view.dart';
import 'package:get/get.dart';

// 🌎 Project imports:

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.DASHBOARD;

  static final routes = [
    GetPage(
      name: _Paths.ARTICLE,
      page: () => const ArticleView(),
      binding: ArticleBingding(),
    ),
  ];
}