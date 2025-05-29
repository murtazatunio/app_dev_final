import 'package:cloud_firestore/cloud_firestore.dart';
import 'sample_data.dart';

class FirebaseUploader {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future<void> uploadSampleData() async {
    try {
      for (var banner in SampleData.banners) {
        await _firestore.collection('banners').add(banner);
      }
      print('Banners uploaded successfully');

      for (var category in SampleData.categories) {
        await _firestore.collection('categories').add(category);
      }
      print('Categories uploaded successfully');

      for (var product in SampleData.products) {
        await _firestore.collection('products').add(product);
      }
      print('Products uploaded successfully');

      print('All sample data uploaded successfully!');
    } catch (e) {
      print('Error uploading sample data: $e');
    }
  }
}
