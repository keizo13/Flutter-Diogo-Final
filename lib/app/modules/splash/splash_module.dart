import 'package:app_test/app/modules/home/views/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, __) => const HomePage(),
        ),
      ];
}
