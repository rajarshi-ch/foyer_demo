import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'location_state.dart';

@LazySingleton()
class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationInitial());
}
