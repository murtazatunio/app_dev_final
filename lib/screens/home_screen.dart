import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/home/home_bloc.dart';
import '../bloc/home/home_state.dart';
import '../widgets/banner_carousel.dart';
import '../widgets/category_list.dart';
import '../widgets/product_list.dart';
import '../widgets/profile_header.dart';
import '../widgets/cashback_banner.dart';
import 'package:go_router/go_router.dart';
import '../widgets/bottom_nav.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const _tabs = [
    {'icon': Icons.home, 'label': 'Home', 'route': '/home'},
    {'icon': Icons.credit_card, 'label': 'Cards', 'route': '/cards'},
    {'icon': Icons.pix, 'label': 'Pix', 'route': '/pix'},
    {'icon': Icons.note, 'label': 'Notes', 'route': '/notes'},
    {'icon': Icons.receipt_long, 'label': 'Extract', 'route': '/extract'},
  ];

  int _getCurrentIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    for (int i = 0; i < _tabs.length; i++) {
      if (location == _tabs[i]['route']) return i;
    }
    return 0;
  }

  void _onTabTapped(BuildContext context, int index) {
    final location = GoRouterState.of(context).uri.toString();
    final route = _tabs[index]['route'] as String;
    if (location != route) {
      context.go(route);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProfileHeader(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 14),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _MenuIcon(icon: Icons.card_giftcard, label: 'Earn 100%'),
                    _MenuIcon(icon: Icons.receipt_long, label: 'Tax note'),
                    _MenuIcon(icon: Icons.workspace_premium, label: 'Premium'),
                    _MenuIcon(icon: Icons.sports_esports, label: 'Challenge'),
                    _MenuIcon(icon: Icons.more_horiz, label: 'More'),
                  ],
                ),
              ),
              const CashbackBanner(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Most popular offer',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('See all'),
                    ),
                  ],
                ),
              ),
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is HomeLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is HomeError) {
                    return Center(child: Text(state.message));
                  }

                  if (state is HomeLoaded) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProductList(
                          title: '',
                          products: state.popularProducts,
                        ),
                        BannerCarousel(banners: state.banners),
                        CategoryList(categories: state.categories),
                        ProductList(
                          title: 'All Products',
                          products: state.products,
                        ),
                      ],
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

class _MenuIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  const _MenuIcon({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.pink[50],
          child: Icon(icon, color: Colors.pink, size: 24),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
