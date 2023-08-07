import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foyer_demo/core/enums/screen_status.dart';
import 'package:foyer_demo/features/locations/domain/entity/location.dart';
import 'package:foyer_demo/features/locations/presentation/cubit/location_cubit.dart';
import 'package:foyer_demo/features/locations/presentation/ui/location_input_dialog.dart';
import 'package:foyer_demo/injectable.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    getIt<LocationCubit>().fetchAllLocations();
    super.initState();
  }

  void _showLocationInputDialog(BuildContext context) async {
    Location? location = await showDialog<Location>(
      context: context,
      builder: (_) => LocationInputDialog(),
    );

    if (location != null) {
      log('Latitude: ${location.latitude}, Longitude: ${location.longitude}');
      getIt<LocationCubit>().addLocation(location);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: BlocBuilder<LocationCubit, LocationState>(
        bloc: getIt<LocationCubit>(),
        builder: (context, state) {
          return state.status == ScreenStatus.loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: state.allLocations.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                          'Latitude : ${state.allLocations[index].latitude} , Longitude : ${state.allLocations[index].longitude}'),
                    );
                  },
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showLocationInputDialog(context),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
