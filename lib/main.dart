import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'firebase_options.dart';
import 'services/firebase_service.dart';
import 'bloc/home/home_bloc.dart';
import 'bloc/home/home_event.dart';
import 'screens/home_screen.dart';
import 'screens/product_details_screen.dart';
import 'screens/empty_page.dart';
import 'screens/cards_screen.dart';
import 'utils/firebase_uploader.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await FirebaseUploader.uploadSampleData();
  } catch (e) {
    debugPrint('Failed to initialize Firebase or upload sample data: $e');
  }
  runApp(const MainApp());
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: '/home',
      routes: [
        GoRoute(
          path: '/home',
          builder: (context, state) => BlocProvider(
            create: (context) => HomeBloc(
              firebaseService: FirebaseService(),
            )..add(LoadHomeData()),
            child: const HomeScreen(),
          ),
        ),
        GoRoute(
          path: '/cards',
          builder: (context, state) => const CardsScreen(),
        ),
        GoRoute(
          path: '/pix',
          builder: (context, state) => const EmptyPage(title: 'Pix'),
        ),
        GoRoute(
          path: '/notes',
          builder: (context, state) => const EmptyPage(title: 'Notes'),
        ),
        GoRoute(
          path: '/extract',
          builder: (context, state) => const EmptyPage(title: 'Extract'),
        ),
        GoRoute(
          path: '/product/:id',
          builder: (context, state) => ProductDetailsScreen(
            productId: state.pathParameters['id']!,
          ),
        ),
      ],
    );

    return MaterialApp.router(
      title: 'Shopping App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      routerConfig: router,
      builder: (context, child) {
        ErrorWidget.builder = (FlutterErrorDetails details) {
          return Material(
            child: Container(
              color: Colors.white,
              child: Center(
                child: Text(
                  'An error occurred: ${details.exception}',
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            ),
          );
        };
        return child!;
      },
    );
  }
}
