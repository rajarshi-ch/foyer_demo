import 'package:foyer_demo/features/locations/domain/entity/location.dart';
import 'package:foyer_demo/features/profiles/domain/entity/profile_entity.dart';

const int kDefaultProfileId = 0;
const String kLocationsTableName = "locations";
const String kProfilesTableName = "profiles";

const Location kInitialLocation =
    Location(latitude: 0, longitude: 0, profileId: 0, id: 0);
const ProfileEntity kInitialProfile =
    ProfileEntity(id: 0, themeColor: "#2196F3", textSize: 24);
