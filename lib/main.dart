import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foyer_demo/core/util/color_to_hex_string.dart';
import 'package:foyer_demo/features/home/presentation/ui/home_page.dart';
import 'package:foyer_demo/features/profiles/presentation/cubit/profile_cubit.dart';

import 'injectable.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      bloc: getIt<ProfileCubit>(),
      builder: (context, state) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: state.currentProfile == null
                    ? Colors.purpleAccent
                    : hexToMaterialColor(state.currentProfile!.themeColor)),
            useMaterial3: true,
          ),
          home: const MyHomePage(title: 'Foyer Demo Home Page'),
        );
      },
    );
  }
}
