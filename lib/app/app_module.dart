import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_controller.dart';
import 'app_widget.dart';
import 'pages/home/home_controller.dart';
import 'pages/home/home_page.dart';
import 'pages/login/login_controller.dart';
import 'pages/login/login_page.dart';
import 'shared/interface/pake_repository_interface.dart';
import 'shared/repository/poke_repository.dart';
import 'shared/util/value/const_url.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds {
    return [
      ///injeções de dependencia
      Bind((i) =>AppControoller() ),
      Bind((i) =>LoginController() ),
      Bind((i) =>HomeController(i.get()) ),
      Bind((i)=> Dio(BaseOptions(baseUrl: ConstURL.baseUrl))),
      Bind<IPokeRepository>((i) => PokeRepository(i.get())),
    
    ];
  }


  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => LoginPage()),
    ChildRoute('/home', child: (_, __) => HomePage()),
  ];

  
  @override
  Widget get bootstrap => AppWidget();

  //static Inject get to => Inject<AppModule>.of();
}
