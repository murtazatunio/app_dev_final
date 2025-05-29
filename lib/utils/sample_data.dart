import 'package:cloud_firestore/cloud_firestore.dart';

class SampleData {
  static final banners = [
    {
      'imageUrl':
          'https://images.unsplash.com/photo-1607082348824-0a96f2a4b9da',
      'title': 'Summer Sale',
      'isActive': true,
      'order': 1,
    },
    {
      'imageUrl':
          'https://images.unsplash.com/photo-1607082349566-187342175e2f',
      'title': 'New Arrivals',
      'isActive': true,
      'order': 2,
    },
    {
      'imageUrl':
          'https://images.unsplash.com/photo-1607083206968-13611e3d76db',
      'title': 'Special Offers',
      'isActive': true,
      'order': 3,
    },
  ];

  static final categories = [
    {
      'name': 'Electronics',
      'imageUrl':
          'https://images.unsplash.com/photo-1498049794561-7780e7231661',
      'isActive': true,
      'order': 1,
    },
    {
      'name': 'Fashion',
      'imageUrl':
          'https://images.unsplash.com/photo-1445205170230-053b83016050',
      'isActive': true,
      'order': 2,
    },
    {
      'name': 'Home & Living',
      'imageUrl':
          'https://images.unsplash.com/photo-1484101403633-562f891dc89a',
      'isActive': true,
      'order': 3,
    },
    {
      'name': 'Sports',
      'imageUrl':
          'https://images.unsplash.com/photo-1461896836934-ffe607ba8211',
      'isActive': true,
      'order': 4,
    },
    {
      'name': 'Books',
      'imageUrl':
          'https://images.unsplash.com/photo-1495446815901-a7297e633e8d',
      'isActive': true,
      'order': 5,
    },
    {
      'name': 'Beauty',
      'imageUrl':
          'https://images.unsplash.com/photo-1522335789203-aabd1fc54bc9',
      'isActive': true,
      'order': 6,
    },
  ];

  static final products = [
    {
      'name': 'iPhone 15 Pro',
      'price': 999.99,
      'imageUrl':
          'https://images.unsplash.com/photo-1695048133142-1a20484d2569',
      'categoryId': 'Electronics',
      'isMostPopular': true,
      'isActive': true,
      'createdAt': Timestamp.now(),
    },
    {
      'name': 'Samsung Galaxy S24',
      'price': 899.99,
      'imageUrl':
          'https://images.unsplash.com/photo-1610945415295-d9bbf067e59c',
      'categoryId': 'Electronics',
      'isMostPopular': true,
      'isActive': true,
      'createdAt': Timestamp.now(),
    },
    {
      'name': 'Nike Air Max',
      'price': 129.99,
      'imageUrl': 'https://images.unsplash.com/photo-1542291026-7eec264c27ff',
      'categoryId': 'Fashion',
      'isMostPopular': true,
      'isActive': true,
      'createdAt': Timestamp.now(),
    },
    {
      'name': 'Smart Watch',
      'price': 199.99,
      'imageUrl':
          'https://images.unsplash.com/photo-1579586337278-3befd40fd17a',
      'categoryId': 'Electronics',
      'isMostPopular': false,
      'isActive': true,
      'createdAt': Timestamp.now(),
    },
    {
      'name': 'Wireless Earbuds',
      'price': 79.99,
      'imageUrl':
          'https://images.unsplash.com/photo-1606220588913-b3aacb4d2f46',
      'categoryId': 'Electronics',
      'isMostPopular': true,
      'isActive': true,
      'createdAt': Timestamp.now(),
    },
    {
      'name': 'Designer Handbag',
      'price': 299.99,
      'imageUrl':
          'https://images.unsplash.com/photo-1584917865442-de89df76afd3',
      'categoryId': 'Fashion',
      'isMostPopular': false,
      'isActive': true,
      'createdAt': Timestamp.now(),
    },
    {
      'name': 'Smart Home Speaker',
      'price': 149.99,
      'imageUrl':
          'https://images.unsplash.com/photo-1589003077984-894e133dabab',
      'categoryId': 'Home & Living',
      'isMostPopular': true,
      'isActive': true,
      'createdAt': Timestamp.now(),
    },
    {
      'name': 'Yoga Mat',
      'price': 29.99,
      'imageUrl':
          'https://images.unsplash.com/photo-1592432678016-e910b452f9a2',
      'categoryId': 'Sports',
      'isMostPopular': false,
      'isActive': true,
      'createdAt': Timestamp.now(),
    },
    {
      'name': 'Bestselling Novel',
      'price': 19.99,
      'imageUrl': 'https://images.unsplash.com/photo-1544947950-fa07a98d237f',
      'categoryId': 'Books',
      'isMostPopular': true,
      'isActive': true,
      'createdAt': Timestamp.now(),
    },
    {
      'name': 'Skincare Set',
      'price': 89.99,
      'imageUrl':
          'https://images.unsplash.com/photo-1571781926291-c477ebfd024b',
      'categoryId': 'Beauty',
      'isMostPopular': true,
      'isActive': true,
      'createdAt': Timestamp.now(),
    },
  ];
}
