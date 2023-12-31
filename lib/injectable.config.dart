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
import 'features/locations/presentation/cubit/location_cubit.dart' as _i12;
import 'features/profiles/data/datasource/local_profile_ds.dart' as _i9;
import 'features/profiles/data/datasource/profile_ds.dart' as _i8;
import 'features/profiles/data/repository_impl/profile_repository_impl.dart'
    as _i11;
import 'features/profiles/domain/repository/profile_repository.dart' as _i10;
import 'features/profiles/presentation/cubit/profile_cubit.dart' as _i13;

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
    gh.lazySingleton<_i8.ProfileDataSource>(
        () => _i9.LocalProfileDataSource(gh<_i3.DatabaseHelper>()));
    gh.lazySingleton<_i10.ProfileRepository>(
        () => _i11.ProfileRepositoryImpl(gh<_i8.ProfileDataSource>()));
    gh.lazySingleton<_i12.LocationCubit>(
        () => _i12.LocationCubit(repository: gh<_i6.LocationRepository>()));
    gh.lazySingleton<_i13.ProfileCubit>(
        () => _i13.ProfileCubit(repository: gh<_i10.ProfileRepository>()));
    return this;
  }
}
