import 'package:arc_modular_app/app/app_module.dart';
import 'package:arc_modular_app/app/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() => runApp(
  ModularApp(module: AppModule(), 
  child: AppWidget())
);

