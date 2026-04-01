import 'package:go_router/go_router.dart';
import 'package:loginflutterteste/widgets/cadastro_page.dart';
import 'package:loginflutterteste/features/pages/feed_page.dart';
import 'package:loginflutterteste/features/pages/login_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(path: '/login',
    builder: (context, state) => LoginPage()
    ),
    GoRoute(path: '/feed',
    builder: (context, state) => FeedPage()
    ),
    GoRoute(path: '/cadastro',
    builder: (context, state) => CadastroPage(),)
  ]);