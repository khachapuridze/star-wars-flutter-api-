import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_learning/data/models/planet.dart';
import 'package:flutter_learning/data/repositories/planet_repository.dart';
import 'package:meta/meta.dart';

part 'planet_data_state.dart';

class PlanetDataCubit extends Cubit<PlanetDataState> {
  PlanetDataCubit() : super(PlanetDataInitial());

  var planetRepo = PlanetRepository();
  Future<void> fetchPlanet(String homePlanet) async {
    try {
      var planet = await planetRepo.fetchHomePlanet(homePlanet);
      emit(PlanetDataLoaded(planet: planet!));
    } catch (e) {
      emit(PlanetDataError(errorMessage: e.toString()));
    }
  }
}
