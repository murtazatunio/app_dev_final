class BannerModel {
  final String id;
  final String imageUrl;
  final String title;
  final bool isActive;
  final int order;

  BannerModel({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.isActive,
    required this.order,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'] as String,
      imageUrl: json['imageUrl'] as String,
      title: json['title'] as String,
      isActive: json['isActive'] as bool,
      order: json['order'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'imageUrl': imageUrl,
      'title': title,
      'isActive': isActive,
      'order': order,
    };
  }
}
