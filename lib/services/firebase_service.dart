import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/banner_model.dart';
import '../models/category_model.dart';
import '../models/product_model.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<BannerModel>> getBanners() async {
    final snapshot =
        await _firestore.collection('banners').orderBy('order').get();

    return snapshot.docs
        .map((doc) => BannerModel.fromJson({...doc.data(), 'id': doc.id}))
        .where((banner) => banner.isActive)
        .toList();
  }

  Future<List<CategoryModel>> getCategories() async {
    final snapshot =
        await _firestore.collection('categories').orderBy('order').get();

    return snapshot.docs
        .map((doc) => CategoryModel.fromJson({...doc.data(), 'id': doc.id}))
        .where((category) => category.isActive)
        .toList();
  }

  Future<List<ProductModel>> getProducts() async {
    final snapshot = await _firestore
        .collection('products')
        .orderBy('createdAt', descending: true)
        .get();

    return snapshot.docs
        .map((doc) => ProductModel.fromJson({...doc.data(), 'id': doc.id}))
        .where((product) => product.isActive)
        .toList();
  }

  Future<List<ProductModel>> getMostPopularProducts() async {
    final snapshot = await _firestore
        .collection('products')
        .orderBy('createdAt', descending: true)
        .get();

    return snapshot.docs
        .map((doc) => ProductModel.fromJson({...doc.data(), 'id': doc.id}))
        .where((product) => product.isActive && product.isMostPopular)
        .toList();
  }
}
