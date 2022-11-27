import 'package:flutter_modular/flutter_modular.dart';

import 'controllers/favorites_controller.dart';
import 'views/favorites_page.dart';

class FavoritesModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => FavoritesController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, __) => const FavoritesPage(),
        ),
      ];
}
