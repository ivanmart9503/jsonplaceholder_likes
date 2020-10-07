import 'package:jsonplaceholder_likes/components/auth/presentation/pages/sign_in_page.dart';
import 'package:jsonplaceholder_likes/components/photos/presentation/pages/photos_page.dart';
import 'package:sailor/sailor.dart';

class Router {
  static final sailor = Sailor();

  static void generateRoutes() {
    sailor.addRoutes([
      SailorRoute(
        name: '/',
        builder: (context, arg, params) => SignInPage(),
      ),
      SailorRoute(
        name: '/photos',
        builder: (context, arg, params) => PhotosPage(),
      ),
    ]);
  }
}
