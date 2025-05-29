# Flutter Project Structure for CSE 450 Final Exam

## File Structure

```
lib/
├── main.dart
├── models/
│   ├── banner_model.dart
│   ├── category_model.dart
│   └── product_model.dart
├── services/
│   └── firebase_service.dart
├── bloc/
│   ├── home/
│   │   ├── home_bloc.dart
│   │   ├── home_event.dart
│   │   └── home_state.dart
├── screens/
│   ├── home_screen.dart          # Q1: Shopping app home
│   └── product_details_screen.dart  # Q2: Static UI
├── widgets/
│   ├── banner_carousel.dart
│   ├── category_list.dart
│   ├── product_list.dart
│   └── custom_app_bar.dart
└── utils/
    ├── colors.dart
    └── text_styles.dart
```

## Firebase Collections Structure (Q1 Only)

### 1. **banners** Collection
```json
{
  "id": "banner1",
  "imageUrl": "https://example.com/banner1.jpg",
  "title": "Summer Sale",
  "isActive": true,
  "order": 1
}
```

### 2. **categories** Collection
```json
{
  "id": "electronics",
  "name": "Electronics",
  "imageUrl": "https://example.com/electronics.jpg",
  "isActive": true,
  "order": 1
}
```

### 3. **products** Collection
```json
{
  "id": "product1",
  "name": "iPhone 15",
  "price": 999.99,
  "imageUrl": "https://example.com/iphone15.jpg",
  "categoryId": "electronics",
  "isMostPopular": true,
  "isActive": true,
  "createdAt": "timestamp"
}
```

## Key Implementation Notes

### For Q1 (Home Screen):
- Use **BlocBuilder** to listen to home state changes
- Fetch data in **HomeBloc** using **FirebaseService**
- Create separate widgets for each section (banner, categories, products)
- Use **CarouselSlider** package for banner carousel
- Use **ListView.builder** for horizontal lists

### For Q2 (Product Details Screen):
- Pure static UI with dummy data
- Use **PageView** for bank cards
- Implement **BottomNavigationBar**
- Use **Container** with **LinearGradient** for background
- Use **ListView** for transaction history
- Make entire screen scrollable with **SingleChildScrollView**

### Sample Data Structure for Collections:

#### Banners (3-5 items):
- imageUrl, title, order

#### Categories (6-8 items):
- name, imageUrl, order

#### Products (10-15 items with isMostPopular: true):
- name, price, imageUrl, categoryId, isMostPopular

## Dependencies to Add:
```yaml
dependencies:
  carousel_slider: ^4.2.1  # For banner carousel
  cached_network_image: ^3.3.0  # For image caching
```

## Bloc Events Needed:
- `LoadHomeData` - Fetch all data on screen init
- `RefreshHomeData` - Pull to refresh functionality

## Bloc States Needed:
- `HomeInitial` - Initial state
- `HomeLoading` - Loading data
- `HomeLoaded` - Data loaded successfully
- `HomeError` - Error occurred

This structure keeps it simple for student-level implementation while covering all exam requirements.
