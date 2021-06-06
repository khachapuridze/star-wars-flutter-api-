part of 'planet_data_cubit.dart';

@immutable
abstract class PlanetDataState extends Equatable {
  const PlanetDataState();

  get planet => null;
}

class PlanetDataInitial extends PlanetDataState {
  @override
  List<Object?> get props => [];
}

class PlanetDataLoaded extends PlanetDataState {
  final Map<String, Planet> planet;
  PlanetDataLoaded({required this.planet});
  @override
  List<Object?> get props => [planet];
}

class PlanetDataError extends PlanetDataState {
  final String? errorMessage;
  PlanetDataError({required this.errorMessage});
  @override
  List<Object?> get props => [];
}
