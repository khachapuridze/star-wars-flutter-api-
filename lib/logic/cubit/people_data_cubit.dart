import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_learning/data/models/people.dart';
import 'package:flutter_learning/data/repositories/people_repositoriy.dart';
import 'package:meta/meta.dart';

part 'people_data_state.dart';

class PeopleDataCubit extends Cubit<PeopleDataState> {
  PeopleDataCubit() : super(PeopleDataInitial());
  var peopleRepo = PeopleRepository();
  Future<void> fetchPeople() async {
    try {
      var list = await peopleRepo.fetchPeople();
      emit(PeopleDataLoaded(peopleList: list!));
    } catch (e) {
      emit(PeopleDataError(errorMessage: e.toString()));
    }
  }
}
