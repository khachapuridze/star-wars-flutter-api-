import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learning/logic/cubit/people_data_cubit.dart';
import 'package:flutter_learning/logic/cubit/planet_data_cubit.dart';
import 'package:flutter_learning/presentation/router/app_routers.dart';
import 'package:flutter_learning/utilities/app_bloc_observer.dart';

void main() {
  Bloc.observer = AppBlockObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PeopleDataCubit>(create: (context) => PeopleDataCubit()),
        BlocProvider<PlanetDataCubit>(create: (context) => PlanetDataCubit())
      ],
      child: MaterialApp(
        title: 'learning rest api',
        onGenerateRoute: AppRouter().onGenerateRoute,
      ),
    );
  }
}
