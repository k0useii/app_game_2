// 🐦 Flutter imports:

// 📦 Package imports:
import 'package:app_game_2/service/Article/article_service.dart';
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:app_game_2/module/Article/Controller/article_controller.dart';

class ArticleBingding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ArticleService>(() => ArticleService());
    Get.lazyPut<ArticleController>(() => ArticleController());
  }
}