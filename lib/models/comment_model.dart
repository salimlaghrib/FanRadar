// lib/models/comment_model.dart
class CommentModel {
  final String? id;
  final String content;
  final String authorId;
  final String authorName;
  final String? authorProfileImage;
  final String postId;
  final String? parentCommentId; // Pour les réponses aux commentaires
  final DateTime createdAt;
  final DateTime? updatedAt;
  final int likesCount;
  final bool isLiked;
  final bool isVerified;
  final List<CommentModel> replies; // Commentaires enfants

  CommentModel({
    this.id,
    required this.content,
    required this.authorId,
    required this.authorName,
    this.authorProfileImage,
    required this.postId,
    this.parentCommentId,
    required this.createdAt,
    this.updatedAt,
    this.likesCount = 0,
    this.isLiked = false,
    this.isVerified = false,
    this.replies = const [],
  });

  // Convert from JSON
  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json['id'],
      content: json['content'],
      authorId: json['author_id'],
      authorName: json['author_name'],
      authorProfileImage: json['author_profile_image'],
      postId: json['post_id'],
      parentCommentId: json['parent_comment_id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: json['updated_at'] != null 
          ? DateTime.parse(json['updated_at']) 
          : null,
      likesCount: json['likes_count'] ?? 0,
      isLiked: json['is_liked'] ?? false,
      isVerified: json['is_verified'] ?? false,
      replies: (json['replies'] as List<dynamic>?)
          ?.map((reply) => CommentModel.fromJson(reply))
          .toList() ?? [],
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
      'post_id': postId,
      'parent_comment_id': parentCommentId,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'likes_count': likesCount,
      'is_liked': isLiked,
      'is_verified': isVerified,
      'replies': replies.map((reply) => reply.toJson()).toList(),
    };
  }

  // Copy with
  CommentModel copyWith({
    String? id,
    String? content,
    String? authorId,
    String? authorName,
    String? authorProfileImage,
    String? postId,
    String? parentCommentId,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? likesCount,
    bool? isLiked,
    bool? isVerified,
    List<CommentModel>? replies,
  }) {
    return CommentModel(
      id: id ?? this.id,
      content: content ?? this.content,
      authorId: authorId ?? this.authorId,
      authorName: authorName ?? this.authorName,
      authorProfileImage: authorProfileImage ?? this.authorProfileImage,
      postId: postId ?? this.postId,
      parentCommentId: parentCommentId ?? this.parentCommentId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      likesCount: likesCount ?? this.likesCount,
      isLiked: isLiked ?? this.isLiked,
      isVerified: isVerified ?? this.isVerified,
      replies: replies ?? this.replies,
    );
  }

  @override
  String toString() {
    return 'CommentModel(id: $id, authorName: $authorName, likesCount: $likesCount)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CommentModel &&
        other.id == id &&
        other.content == content &&
        other.authorId == authorId &&
        other.postId == postId &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        content.hashCode ^
        authorId.hashCode ^
        postId.hashCode ^
        createdAt.hashCode;
  }
}
