import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:app_test/app/app_module.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization/src/localization.dart';
import 'package:easy_localization/src/translations.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modular_test/modular_test.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  const translationFileJson = 'assets/translations/pt-BR.json';
  const envFile = '.env.test';

  setUpAll(() async {
    dotenv.testLoad(fileInput: File(envFile).readAsStringSync());

    final translationFile = await File(translationFileJson).readAsString();
    final translations = jsonDecode(translationFile) as Map<String, dynamic>;

    await EasyLocalization.ensureInitialized();

    Localization.load(
      const Locale('pt', 'BR'),
      translations: Translations(translations),
    );

    initModule(AppModule());
  });

  TestWidgetsFlutterBinding.ensureInitialized();

  await testMain();
}
