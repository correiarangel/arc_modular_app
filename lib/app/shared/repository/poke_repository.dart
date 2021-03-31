import 'package:arc_modular_app/app/shared/interface/pake_repository_interface.dart';
import 'package:arc_modular_app/app/shared/model/pokemon_model.dart';
import 'package:dio/dio.dart';

class PokeRepository implements IPokeRepository {
  final Dio dio;

  PokeRepository(this.dio);

  @override
  Future<List<PokemonModel>> getAllPokemons() async {
    var response = await dio.get('/pokemon/');
    List<PokemonModel> listPokes = [];
    var listpok = response.data['results'] as List;
    
    for (var json in listpok) {
      PokemonModel pokModel = PokemonModel(nome: json['name']);
      listPokes.add(pokModel);
    }
    return listPokes;
  }
}
