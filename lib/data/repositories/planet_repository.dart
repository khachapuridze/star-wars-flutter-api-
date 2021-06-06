import 'package:dio/dio.dart';
import 'package:flutter_learning/data/models/planet.dart';

class PlanetRepository {
  Map<String, Planet> planet = {};
  Dio dio = Dio();
  Future<Map<String, Planet>>? fetchHomePlanet(String homeworld) async {
    var response = await dio.get(homeworld);
    if (response.statusCode == 200) {
      planet = Planet.fromJson(response.data) as Map<String, Planet>;
      return planet;
    }
    return planet;
  }
}
