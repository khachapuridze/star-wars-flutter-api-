import 'package:dio/dio.dart';
import 'package:flutter_learning/data/models/people.dart';

class PeopleRepository {
  List<People> peopleList = [];
  Dio dio = Dio();
  Future<List<People>>? fetchPeople() async {
    final response = await dio.get('https://swapi.dev/api/people/');
    if (response.statusCode == 200) {
      print(response.data['results']);
      response.data['results'].forEach((person) {
        var personModel = People.fromJson(person);
        peopleList.add(personModel);
        return peopleList;
      });
    }
    return peopleList;
  }
}
