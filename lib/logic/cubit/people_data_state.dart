part of 'people_data_cubit.dart';

@immutable
abstract class PeopleDataState extends Equatable {
  const PeopleDataState();

  get peopleList => null;
}

class PeopleDataInitial extends PeopleDataState {
  @override
  List<Object?> get props => [];
}

class PeopleDataLoaded extends PeopleDataState {
  final List<People> peopleList;
  PeopleDataLoaded({required this.peopleList});
  @override
  List<Object?> get props => [peopleList];
}

class PeopleDataError extends PeopleDataState {
  final String? errorMessage;
  PeopleDataError({required this.errorMessage});
  @override
  List<Object?> get props => [];
}
