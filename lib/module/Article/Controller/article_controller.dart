// 📦 Package imports:
import 'package:dio/dio.dart';
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:app_game_2/models/artilesModel.dart';
import 'package:app_game_2/service/API/ApiException.dart';
import 'package:app_game_2/service/Article/article_service.dart';
import 'package:image_picker/image_picker.dart';

class ArticleController extends GetxController {
  final ArticleService _articleService = Get.find<ArticleService>();

  var articleList = <Data>[].obs;
  var status = RxStatus.empty().obs;

  @override
  void onInit() {
    super.onInit();
    getArticle();
  }

  void getArticle() async {
    status.value = RxStatus.loading();
    try {
      final response = await _articleService.getArticle();
      if (response.statusCode == 200) {
        final articles = Articles.fromJson(response.data);
        articleList.assignAll(articles.data ?? []);
        print('Response data: ${response.data}');
        print('Article list: $articleList');
        status.value = RxStatus.success();
      } else {
        status.value = RxStatus.error('Failed to load articles');
      }
    } catch (e) {
      status.value = RxStatus.error('Failed to load articles');
    }
  }

  void postArticle(String title, List<String> content, String authorId, String categoryId, List<XFile?> images, List<String> videos) async {
    status.value = RxStatus.loading();
    try {
      final response = await _articleService.addArticle(title, content, authorId, categoryId, images, videos);
      if (response.statusCode == 201) {
        print('Article posted successfully: ${response.data}');
        getArticle();
        status.value = RxStatus.success();
      } else {
        status.value = RxStatus.error('Failed to post article');
      }
    } catch (e) {
      status.value = RxStatus.error('Failed to post article');
    }
  }
}