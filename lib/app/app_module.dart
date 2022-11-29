import 'package:app_test/app/modules/splash/splash_module.dart';
import 'package:app_test/app/repositories/home/home_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/configs/env_config.dart';
import 'modules/details/details_module.dart';
import 'modules/favorites/favorites_module.dart';
import 'modules/home/home_module.dart';
import 'repositories/http/http.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => Dio(BaseOptions(baseUrl: EnvConfig.baseUrl))),
        Bind.factory((i) => Http(dio: i.get())),
        Bind.factory((i) => HomeRepository(http: i.get())),
        // Bind.singleton((i) => UserModel()),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute("/", module: SplashModule()),
        ModuleRoute("/home", module: HomeModule()),
        ModuleRoute("/favorites", module: FavoritesModule()),
        ModuleRoute("/details", module: DetailsModule()),
      ];
}
