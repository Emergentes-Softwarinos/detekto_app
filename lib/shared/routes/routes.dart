import 'package:detekto_app/home/screens/home_screen.dart';
import 'package:go_router/go_router.dart';

final routes = GoRouter(initialLocation: '/home', routes: <GoRoute>[
  GoRoute(
    path: "/home",
    name: "home_screen",
    builder: (context, state) => const HomeScreen(),
  )
]);
