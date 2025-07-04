import 'package:detekto_app/home/screens/home_screen.dart';
import 'package:detekto_app/iam/screens/sign_in_screen.dart';
import 'package:detekto_app/iam/screens/sign_up_screen.dart';
import 'package:detekto_app/main_screen.dart';
import 'package:detekto_app/profile/screens/profile_screen.dart';
import 'package:go_router/go_router.dart';

final routes = GoRouter(
  initialLocation: '/sign-in', // o '/home' si ya iniciaste sesión
  routes: [
    /// Rutas públicas (fuera del Shell)
    GoRoute(
      path: '/sign-in',
      builder: (context, state) => const SignInScreen(),
    ),
    GoRoute(
      path: '/sign-up',
      builder: (context, state) => const SignUpScreen(),
    ),

    /// Rutas protegidas o con navegación persistente
    ShellRoute(
      builder: (context, state, child) => MainScreen(child: child),
      routes: [
        GoRoute(
          path: '/home',
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfileScreen(),
        ),
        // Aquí puedes agregar /cart, /store, etc.
      ],
    ),
  ],
);
