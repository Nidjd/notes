import 'package:go_router/go_router.dart';
import 'package:notes/features/auth/presentation/views/sign_in.dart';
import 'package:notes/features/auth/presentation/views/sign_up.dart';
import 'package:notes/features/home/presentaion/views/home_page.dart';
import 'package:notes/features/splash_screen/presentation/views/splash_screen.dart';

abstract class AppRouter {
  
  static const  kHomeRoute = '/home-screen';
  static const  kSignUpRoute = '/signUp-screen';
  static const  kSignInRoute = '/signIn-screen';
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
      GoRoute(
        path: kSignInRoute,
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        path: kSignUpRoute,
        builder: (context, state) => const SignUpScreen(),
      ),
    ],
  );
}
