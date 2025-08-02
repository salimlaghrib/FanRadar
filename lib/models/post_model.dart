// lib/models/post_model.dart
class PostModel {
  final String? id;
  final String content;
  final String authorId;
  final String authorName;
  final String? authorProfileImage;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final List<String> imageUrls;
  final String? videoUrl;
  final PostType type;
  final String? category;
  final int likesCount;
  final int commentsCount;
  final int sharesCount;
  final bool isLiked;
  final bool isBookmarked;
  final List<String> tags;
  final String? location;
  final bool isVerified;

  PostModel({
    this.id,
    required this.content,
    required this.authorId,
    required this.authorName,
    this.authorProfileImage,
    required this.createdAt,
    this.updatedAt,
    this.imageUrls = const [],
    this.videoUrl,
    this.type = PostType.text,
    this.category,
    this.likesCount = 0,
    this.commentsCount = 0,
    this.sharesCount = 0,
    this.isLiked = false,
    this.isBookmarked = false,
    this.tags = const [],
    this.location,
    this.isVerified = false,
  });

  // Convert from JSON
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      content: json['content'],
      authorId: json['author_id'],
      authorName: json['author_name'],
      authorProfileImage: json['author_profile_image'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: json['updated_at'] != null 
          ? DateTime.parse(json['updated_at']) 
          : null,
      imageUrls: List<String>.from(json['image_urls'] ?? []),
      videoUrl: json['video_url'],
      type: PostType.values.firstWhere(
        (e) => e.toString().split('.').last == json['type'],
        orElse: () => PostType.text,
      ),
      category: json['category'],
      likesCount: json['likes_count'] ?? 0,
      commentsCount: json['comments_count'] ?? 0,
      sharesCount: json['shares_count'] ?? 0,
      isLiked: json['is_liked'] ?? false,
      isBookmarked: json['is_bookmarked'] ?? false,
      tags: List<String>.from(json['tags'] ?? []),
      location: json['location'],
      isVerified: json['is_verified'] ?? false,
    );
  }

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'content': content,
      'author_id': authorId,
      'author_name': authorName,
      'author_profile_image': authorProfileImage,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'image_urls': imageUrls,
      'video_url': videoUrl,
      'type': type.toString().split('.').last,
      'category': category,
      'likes_count': likesCount,
      'comments_count': commentsCount,
      'shares_count': sharesCount,
      'is_liked': isLiked,
      'is_bookmarked': isBookmarked,
      'tags': tags,
      'location': location,
      'is_verified': isVerified,
    };
  }

  // Copy with
  PostModel copyWith({
    String? id,
    String? content,
    String? authorId,
    String? authorName,
    String? authorProfileImage,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<String>? imageUrls,
    String? videoUrl,
    PostType? type,
    String? category,
    int? likesCount,
    int? commentsCount,
    int? sharesCount,
    bool? isLiked,
    bool? isBookmarked,
    List<String>? tags,
    String? location,
    bool? isVerified,
  }) {
    return PostModel(
      id: id ?? this.id,
      content: content ?? this.content,
      authorId: authorId ?? this.authorId,
      authorName: authorName ?? this.authorName,
      authorProfileImage: authorProfileImage ?? this.authorProfileImage,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      imageUrls: imageUrls ?? this.imageUrls,
      videoUrl: videoUrl ?? this.videoUrl,
      type: type ?? this.type,
      category: category ?? this.category,
      likesCount: likesCount ?? this.likesCount,
      commentsCount: commentsCount ?? this.commentsCount,
      sharesCount: sharesCount ?? this.sharesCount,
      isLiked: isLiked ?? this.isLiked,
      isBookmarked: isBookmarked ?? this.isBookmarked,
      tags: tags ?? this.tags,
      location: location ?? this.location,
      isVerified: isVerified ?? this.isVerified,
    );
  }

  @override
  String toString() {
    return 'PostModel(id: $id, authorName: $authorName, type: $type, likesCount: $likesCount)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PostModel &&
        other.id == id &&
        other.content == content &&
        other.authorId == authorId &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        content.hashCode ^
        authorId.hashCode ^
        createdAt.hashCode;
  }
}

// Énumération pour les types de posts
enum PostType {
  text,
  image,
  video,
  poll,
  news,
  event,
}

// Extension pour les types de posts
extension PostTypeExtension on PostType {
  String get displayName {
    switch (this) {
      case PostType.text:
        return 'Texte';
      case PostType.image:
        return 'Image';
      case PostType.video:
        return 'Vidéo';
      case PostType.poll:
        return 'Sondage';
      case PostType.news:
        return 'Actualité';
      case PostType.event:
        return 'Événement';
    }
  }

  String get icon {
    switch (this) {
      case PostType.text:
        return '📝';
      case PostType.image:
        return '📷';
      case PostType.video:
        return '🎥';
      case PostType.poll:
        return '📊';
      case PostType.news:
        return '📰';
      case PostType.event:
        return '📅';
    }
  }
}
