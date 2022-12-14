import 'package:flutter_modular/flutter_modular.dart';

import 'views/favorites_page.dart';

class FavoritesModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, __) => const FavoritesPage(),
        ),
      ];
}
