// 📦 Package imports:
import 'package:dio/dio.dart';

// 🌎 Project imports:
import 'package:app_game_2/service/API/ApiService.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class ArticleService {
  final ApiService _apiService = ApiService(Dio());

  Future<Response<dynamic>> getArticle() async {
    try {
      final response = await _apiService.get('/api/article/get');
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response<dynamic>> addArticle(String title, List<String> content, String authorId, String categoryId, List<XFile?> images, List<String> videos) async {
    try {
      List<MultipartFile> imageFiles = [];
      for (var image in images) {
        if (image != null) {
          imageFiles.add(await MultipartFile.fromFile(image.path, filename: image.name));
        }
      }

      FormData formData = FormData.fromMap({
        'title': title,
        'content': content,
        'author': authorId,
        'category': categoryId,
        'videos': videos,
        'isPublished': false,
        'images': imageFiles,
      });

      final response = await _apiService.post('/api/article/post', data: formData);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response<dynamic>> removeFromArticle(String productId) async {
    try {
      final response = await _apiService
          .delete('/article/remove', data: {'productId': productId});
      return response;
    } catch (e) {
      rethrow;
    }
  }
}