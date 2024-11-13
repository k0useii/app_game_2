class Articles {
  String? message;
  int? currentPage;
  int? totalPages;
  int? total;
  List<Data>? data;

  Articles(
      {this.message, this.currentPage, this.totalPages, this.total, this.data});

  Articles.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    currentPage = json['currentPage'];
    totalPages = json['totalPages'];
    total = json['total'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['currentPage'] = currentPage;
    data['totalPages'] = totalPages;
    data['total'] = total;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? title;
  List<String>? content;
  Author? author;
  Category? category;
  List<Tags>? tags;
  bool? isPublished;
  List<String>? images;
  List<String>? videos;
  List<Comments>? comments;
  int? views;
  String? publishedAt;
  int? iV;

  Data(
      {this.sId,
      this.title,
      this.content,
      this.author,
      this.category,
      this.tags,
      this.isPublished,
      this.images,
      this.videos,
      this.comments,
      this.views,
      this.publishedAt,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    content = json['content'].cast<String>();
    author =
        json['author'] != null ? Author.fromJson(json['author']) : null;
    category = json['category'] != null
        ? Category.fromJson(json['category'])
        : null;
    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags!.add(Tags.fromJson(v));
      });
    }
    isPublished = json['isPublished'];
    images = json['images'].cast<String>();
    videos = json['videos'].cast<String>();
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(Comments.fromJson(v));
      });
    }
    views = json['views'];
    publishedAt = json['publishedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['content'] = content;
    if (author != null) {
      data['author'] = author!.toJson();
    }
    if (category != null) {
      data['category'] = category!.toJson();
    }
    if (tags != null) {
      data['tags'] = tags!.map((v) => v.toJson()).toList();
    }
    data['isPublished'] = isPublished;
    data['images'] = images;
    data['videos'] = videos;
    if (comments != null) {
      data['comments'] = comments!.map((v) => v.toJson()).toList();
    }
    data['views'] = views;
    data['publishedAt'] = publishedAt;
    data['__v'] = iV;
    return data;
  }
}

class Author {
  String? sId;
  String? username;

  Author({this.sId, this.username});

  Author.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['username'] = username;
    return data;
  }
}

class Category {
  String? sId;
  String? name;

  Category({this.sId, this.name});

  Category.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    return data;
  }
}

class Comments {
  String? sId;
  Author? user;
  String? content;
  String? createdAt;

  Comments({this.sId, this.user, this.content, this.createdAt});

  Comments.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'] != null ? Author.fromJson(json['user']) : null;
    content = json['content'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['content'] = content;
    data['createdAt'] = createdAt;
    return data;
  }
}

class Tags {
  String? sId;
  String? name;

  Tags({this.sId, this.name});

  Tags.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    return data;
  }
}