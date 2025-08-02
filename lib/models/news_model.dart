// lib/models/news_model.dart
class NewsModel {
  final String? id;
  final String title;
  final String content;
  final String? summary;
  final String category;
  final String? imageUrl;
  final String? authorId;
  final String? authorName;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final bool isPublished;
  final int viewsCount;
  final int likesCount;
  final int commentsCount;
  final List<String> tags;
  final String? sourceUrl;

  NewsModel({
    this.id,
    required this.title,
    required this.content,
    this.summary,
    required this.category,
    this.imageUrl,
    this.authorId,
    this.authorName,
    required this.createdAt,
    this.updatedAt,
    this.isPublished = false,
    this.viewsCount = 0,
    this.likesCount = 0,
    this.commentsCount = 0,
    this.tags = const [],
    this.sourceUrl,
  });

  // Convert from JSON
  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      summary: json['summary'],
      category: json['category'],
      imageUrl: json['image_url'],
      authorId: json['author_id'],
      authorName: json['author_name'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: json['updated_at'] != null 
          ? DateTime.parse(json['updated_at']) 
          : null,
      isPublished: json['is_published'] ?? false,
      viewsCount: json['views_count'] ?? 0,
      likesCount: json['likes_count'] ?? 0,
      commentsCount: json['comments_count'] ?? 0,
      tags: List<String>.from(json['tags'] ?? []),
      sourceUrl: json['source_url'],
    );
  }

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'summary': summary,
      'category': category,
      'image_url': imageUrl,
      'author_id': authorId,
      'author_name': authorName,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'is_published': isPublished,
      'views_count': viewsCount,
      'likes_count': likesCount,
      'comments_count': commentsCount,
      'tags': tags,
      'source_url': sourceUrl,
    };
  }

  // Copy with
  NewsModel copyWith({
    String? id,
    String? title,
    String? content,
    String? summary,
    String? category,
    String? imageUrl,
    String? authorId,
    String? authorName,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isPublished,
    int? viewsCount,
    int? likesCount,
    int? commentsCount,
    List<String>? tags,
    String? sourceUrl,
  }) {
    return NewsModel(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      summary: summary ?? this.summary,
      category: category ?? this.category,
      imageUrl: imageUrl ?? this.imageUrl,
      authorId: authorId ?? this.authorId,
      authorName: authorName ?? this.authorName,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isPublished: isPublished ?? this.isPublished,
      viewsCount: viewsCount ?? this.viewsCount,
      likesCount: likesCount ?? this.likesCount,
      commentsCount: commentsCount ?? this.commentsCount,
      tags: tags ?? this.tags,
      sourceUrl: sourceUrl ?? this.sourceUrl,
    );
  }

  @override
  String toString() {
    return 'NewsModel(id: $id, title: $title, category: $category, isPublished: $isPublished)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is NewsModel &&
        other.id == id &&
        other.title == title &&
        other.content == content &&
        other.category == category &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        content.hashCode ^
        category.hashCode ^
        createdAt.hashCode;
  }
}
