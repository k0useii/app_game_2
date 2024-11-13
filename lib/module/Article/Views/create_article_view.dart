import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_game_2/module/Article/Controller/article_controller.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CreateArticleView extends StatefulWidget {
  const CreateArticleView({super.key});

  @override
  _CreateArticleViewState createState() => _CreateArticleViewState();
}

class _CreateArticleViewState extends State<CreateArticleView> {
  final _articleController = Get.find<ArticleController>();
  final _titleController = TextEditingController();
  final _authorIdController = TextEditingController();
  final _categoryIdController = TextEditingController();
  final List<ContentSection> _contentSections = [];

  void _addContentSection() {
    setState(() {
      _contentSections.add(ContentSection());
    });
  }

  Future<void> _pickImage(ContentSection section) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        section.images.add(pickedFile);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tạo bài viết mới'),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _authorIdController,
              decoration: const InputDecoration(labelText: 'Author ID'),
            ),
            TextField(
              controller: _categoryIdController,
              decoration: const InputDecoration(labelText: 'Category ID'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addContentSection,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.black,
              ),
              child: const Text('Thêm nội dung'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _contentSections.length,
                itemBuilder: (context, index) {
                  final section = _contentSections[index];
                  return Column(
                    children: [
                      TextField(
                        controller: section.contentController,
                        decoration: const InputDecoration(labelText: 'Content'),
                      ),
                      ElevatedButton(
                        onPressed: () => _pickImage(section),
                        child: const Text('Chọn ảnh từ thư viện'),
                      ),
                      Wrap(
                        children: section.images.map((image) {
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Image.file(
                              File(image!.path),
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _articleController.postArticle(
                  _titleController.text,
                  _contentSections.map((section) => section.contentController.text).toList(),
                  _authorIdController.text,
                  _categoryIdController.text,
                  _contentSections.expand((section) => section.images).toList(),
                  [],
                );
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              child: const Text('Đăng bài'),
            ),
          ],
        ),
      ),
    );
  }
}

class ContentSection {
  final TextEditingController contentController = TextEditingController();
  List<XFile?> images = [];
}
