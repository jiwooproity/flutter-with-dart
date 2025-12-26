import 'package:go_router/go_router.dart';

// Views
import 'package:audio_visualizer/features/home/views/home_view.dart';

class Paths {
  static final home = "/home";
}

class MyRouter {
  static final GoRouter router = GoRouter(
    initialLocation: Paths.home,
    routes: [
      GoRoute(
        path: Paths.home,
        builder: (context, state) {
          return const HomeView();
        },
      ),
    ],
  );
}
