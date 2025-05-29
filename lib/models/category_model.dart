class CategoryModel {
  final String id;
  final String name;
  final String imageUrl;
  final bool isActive;
  final int order;

  CategoryModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.isActive,
    required this.order,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] as String,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      isActive: json['isActive'] as bool,
      order: json['order'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'isActive': isActive,
      'order': order,
    };
  }
}
