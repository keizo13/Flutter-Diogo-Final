import 'package:flutter_modular/flutter_modular.dart';

import 'views/details_page.dart';

class DetailsModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, arguments) => DetailsPage(args: arguments.data.toString()),
        ),
      ];
}
