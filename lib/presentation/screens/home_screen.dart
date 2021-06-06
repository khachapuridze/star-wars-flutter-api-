import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learning/logic/cubit/people_data_cubit.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('test app'),
        ),
        body: BlocConsumer<PeopleDataCubit, PeopleDataState>(
            listener: (context, state) {
          if (state is PeopleDataError)
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.errorMessage!)));
          // do stuff here based on BlocA's state
        }, builder: (context, state) {
          if (state is PeopleDataInitial) {
            BlocProvider.of<PeopleDataCubit>(context).fetchPeople();
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PeopleDataLoaded) {
            return ListView.builder(
              itemBuilder: (context, index) {
                var person = state.peopleList[index];
                return ListTile(
                  onTap: () => Navigator.of(context).pushNamed('/home-planet',
                      arguments: person.homeworld.toString()),
                  title: Text(person.name!),
                  subtitle: Text('height: ${person.height!} cm'),
                );
              },
              itemCount: state.peopleList.length,
            );
          } else {
            return Container(
              child: Text('oops'),
            );
          }

          // return widget here based on BlocA's state
        }));
  }
}
