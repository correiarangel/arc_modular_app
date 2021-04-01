import 'package:arc_modular_app/app/module/login/login_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/util/value/const_url.dart';
import '../home/home_controller.dart';
import '../home/home_page.dart';
import '../home/interface/pake_repository_interface.dart';
import '../home/repository/poke_repository.dart';
import 'login_controller.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
      Bind((i) =>LoginController() ),
      Bind((i) =>HomeController(i.get()) ),
      Bind((i)=> Dio(BaseOptions(baseUrl: ConstURL.baseUrl))),
      Bind<IPokeRepository>((i) => PokeRepository(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => LoginPage()),
    ChildRoute('/home', child: (_, args) => HomePage()),
  ];


}