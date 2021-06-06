import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learning/logic/cubit/planet_data_cubit.dart';

class PlanetScreen extends StatelessWidget {
  const PlanetScreen({Key? key, required this.planetUrl}) : super(key: key);

  final String? planetUrl;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('planet'),
      ),
      body: BlocConsumer<PlanetDataCubit, PlanetDataState>(
        listener: (context, state) {
          if (state is PlanetDataError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.errorMessage!)));
          }
        },
        builder: (context, state) {
          if (state is PlanetDataInitial) {
            BlocProvider.of<PlanetDataCubit>(context)
                .fetchPlanet(planetUrl.toString());
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PlanetDataLoaded) {
            return Container(
              child: Text('planetName: ${state.planet['name'].toString()}'),
            );
          } else {
            return Center(
              child: Text('oops something wrong !!!'),
            );
          }
        },
      ),
    );
  }
}
