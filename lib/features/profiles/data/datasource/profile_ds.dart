import 'package:foyer_demo/features/profiles/data/models/profile_model.dart';

abstract class ProfileDataSource {
  Future<List<ProfileModel>> getAllProfiles();
  Future<int> addProfile({required ProfileModel profile});
}
