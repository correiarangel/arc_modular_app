import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_controller.dart';
import 'app_widget.dart';
import 'module/login/login_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds {
    return [
      ///injeções de dependencia
      Bind((i) => AppControoller()),
    ];
  }

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: LoginModule()),
  ];

  @override
  Widget get bootstrap => AppWidget();

  //static Inject get to => Inject<AppModule>.of();
}
