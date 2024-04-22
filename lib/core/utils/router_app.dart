import 'package:go_router/go_router.dart';
import 'package:notes/features/home/presentaion/views/home_page.dart';
import 'package:notes/features/splash_screen/presentation/views/splash_screen.dart';

abstract class AppRouter {
  
  static const  kHomeRoute = '/home-screen';
 static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: kHomeRoute,
        builder: (context, state) => const HomePage(),
      ),
    ],
  );
}
