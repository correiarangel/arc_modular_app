import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Observer(
        builder: (context) {
          if (homeController.pokemons.error != null) {
            return Center(
                child: TextButton.icon(
              autofocus: true,
              icon: Icon(Icons.refresh),
              label: Text(
                "Ops! Algo errado; Click p/ Recarregar !",
                style: TextStyle(color: Colors.red[600], fontSize: 18.0),
              ),
              onPressed: () {
                homeController.fetchPokemons();
              },
            ));
          } else if (homeController.pokemons.value == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            var listPoks = homeController.pokemons.value;
            return ListView.builder(
              itemCount: listPoks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(listPoks[index].nome),
                );
              },
            );
          }
        },
      ),
    );
  }
}
