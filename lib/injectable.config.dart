// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'core/database/database.dart' as _i3;
import 'features/locations/data/datasource/local_location_ds.dart' as _i5;
import 'features/locations/data/datasource/location_ds.dart' as _i4;
import 'features/locations/data/repository_impl/location_repo_impl.dart' as _i7;
import 'features/locations/domain/repository/location_repo.dart' as _i6;
import 'features/locations/presentation/cubit/location_cubit.dart' as _i9;
import 'features/profiles/presentation/bloc/profile/cubit/profile_cubit.dart'
    as _i8;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.DatabaseHelper>(() => _i3.DatabaseHelper());
    gh.lazySingleton<_i4.LocationDataSource>(
        () => _i5.LocalLocationDataSource(gh<_i3.DatabaseHelper>()));
    gh.lazySingleton<_i6.LocationRepository>(
        () => _i7.LocationRepositoryImpl(gh<_i4.LocationDataSource>()));
    gh.lazySingleton<_i8.ProfileCubit>(() => _i8.ProfileCubit());
    gh.lazySingleton<_i9.LocationCubit>(
        () => _i9.LocationCubit(repository: gh<_i6.LocationRepository>()));
    return this;
  }
}
