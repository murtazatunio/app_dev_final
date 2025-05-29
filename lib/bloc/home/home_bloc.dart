import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/firebase_service.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final FirebaseService _firebaseService;

  HomeBloc({required FirebaseService firebaseService})
      : _firebaseService = firebaseService,
        super(HomeInitial()) {
    on<LoadHomeData>(_onLoadHomeData);
    on<RefreshHomeData>(_onRefreshHomeData);
  }

  Future<void> _onLoadHomeData(
    LoadHomeData event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(HomeLoading());

      final banners = await _firebaseService.getBanners();
      final categories = await _firebaseService.getCategories();
      final products = await _firebaseService.getProducts();
      final popularProducts = await _firebaseService.getMostPopularProducts();

      emit(HomeLoaded(
        banners: banners,
        categories: categories,
        products: products,
        popularProducts: popularProducts,
      ));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  Future<void> _onRefreshHomeData(
    RefreshHomeData event,
    Emitter<HomeState> emit,
  ) async {
    try {
      final banners = await _firebaseService.getBanners();
      final categories = await _firebaseService.getCategories();
      final products = await _firebaseService.getProducts();
      final popularProducts = await _firebaseService.getMostPopularProducts();

      emit(HomeLoaded(
        banners: banners,
        categories: categories,
        products: products,
        popularProducts: popularProducts,
      ));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
