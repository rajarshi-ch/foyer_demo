import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foyer_demo/core/util/color_to_hex_string.dart';
import 'package:foyer_demo/features/locations/domain/entity/location.dart';
import 'package:foyer_demo/features/profiles/presentation/cubit/profile_cubit.dart';
import 'package:foyer_demo/injectable.dart';

class LocationCard extends StatelessWidget {
  const LocationCard({super.key, required this.location});

  final Location location;

  @override
  Widget build(BuildContext context) {
    log('${hexToMaterialColor(getIt<ProfileCubit>().state.allProfilesMap[location.profileId]!.themeColor)}');
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          getIt<ProfileCubit>().selectLocation(location);
        },
        child: Container(
          height: 84,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          decoration: ShapeDecoration(
            color: Color(0xFF212530),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 52,
                      height: 52,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 0.50, color: Colors.white),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        color: hexToMaterialColor(getIt<ProfileCubit>()
                            .state
                            .allProfilesMap[location.profileId]!
                            .themeColor),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${location.latitude} , ${location.longitude}',
                            style: TextStyle(
                              color: Color(0xFFA7ACCA),
                              fontSize: 16,
                              fontFamily: 'SF Pro Text',
                              fontWeight: FontWeight.w400,
                              height: 1.38,
                              letterSpacing: -0.30,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            getIt<ProfileCubit>()
                                .state
                                .allProfilesMap[location.profileId]!
                                .themeColor,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'SF Pro Text',
                              fontWeight: FontWeight.w700,
                              height: 1.33,
                              letterSpacing: -0.30,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
