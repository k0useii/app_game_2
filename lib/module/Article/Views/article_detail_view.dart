import 'package:flutter/material.dart';
import 'package:app_game_2/models/artilesModel.dart';

class ArticleDetailView extends StatelessWidget {
  final Data article;

  const ArticleDetailView({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Articles',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            letterSpacing: 1.5,
          ),
        ),
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Image.asset(
            'assets/images/90-no-slogan.png',
            height: 40,
            width: 40,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                article.title ?? 'No Title',
                style: const TextStyle(
                  fontSize: 28, // Larger title font size
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'By: ${article.author?.username ?? 'Unknown Author'}',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Category: ${article.category?.name ?? 'No Category'}',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Tags: ${article.tags?.map((tag) => tag.name).join(', ') ?? 'No Tags'}',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.blueGrey,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Published: ${article.isPublished == true ? 'Yes' : 'No'}',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.blueGrey,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Views: ${article.views}',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.blueGrey,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Published At: ${article.publishedAt}',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.blueGrey,
                ),
              ),
              const SizedBox(height: 24),
              for (int i = 0; i < (article.content?.length ?? 0); i++) ...[
                Text(
                  article.content![i],
                  style: const TextStyle(
                    fontSize: 18,
                    height: 1.5, // Line height for better readability
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 16),
                if (article.images != null && i < article.images!.length)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      article.images![i],
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                const SizedBox(height: 24),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
