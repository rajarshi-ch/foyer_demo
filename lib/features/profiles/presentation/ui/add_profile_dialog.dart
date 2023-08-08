import 'package:flutter/material.dart';
import 'package:foyer_demo/core/util/color_to_hex_string.dart';
import 'package:foyer_demo/features/common/presentation/ui/color_picker_circle.dart';
import 'package:foyer_demo/features/common/presentation/ui/wide_fab.dart';
import 'package:foyer_demo/features/profiles/domain/entity/profile_entity.dart';
import 'package:foyer_demo/features/profiles/presentation/cubit/profile_cubit.dart';
import 'package:foyer_demo/injectable.dart';

class AddProfileDialog extends StatefulWidget {
  const AddProfileDialog({super.key});

  @override
  State<AddProfileDialog> createState() => _AddProfileDialogState();
}

class _AddProfileDialogState extends State<AddProfileDialog> {
  String walletColor = 'ffffff';
  int currentIndex = 0;
  double _textSize = 20.0;
  List<Color> colorList = [
    Colors.red,
    Colors.blue,
    Colors.teal,
    Colors.yellow,
    Colors.teal,
    Colors.yellow,
  ];

  @override
  void initState() {
    super.initState();
  }

  bool checkDuplicateProfile() {
    final currentState = getIt<ProfileCubit>().state;
    final newProfile = ProfileEntity(
        themeColor: materialColorToHex(colorList[currentIndex]),
        textSize: _textSize);

    bool isDuplicate = currentState.allProfilesList.any(
      (profile) => profile.equalsExceptId(newProfile),
    );

    return isDuplicate;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        color: Colors.black,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 32,
        horizontal: 14,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'ASSIGN A PROFILE',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 24),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    child: Center(
                      child: Text(
                        'Font Size : $_textSize',
                        style: TextStyle(
                          fontSize: _textSize,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Slider(
                    value: _textSize,
                    min: 10.0,
                    max: 40.0,
                    divisions: 30,
                    onChanged: (newValue) {
                      setState(() {
                        _textSize = newValue;
                      });
                    },
                  ),
                ],
              ),
              Text(
                'Select a theme color :',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 150,
                child: GridView.builder(
                  itemCount: colorList.length,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      child: ColorPickerCircle(
                          color: colorList[index],
                          isSelected: currentIndex == index ? true : false),
                    );
                  },
                ),
              ),
            ],
          ),
          if (checkDuplicateProfile())
            Text(
              'Duplicate Profile Exists',
              style: TextStyle(
                color: Colors.red,
                fontSize: 16,
                fontFamily: 'SF Pro Text',
              ),
            ),
          WideFab(
            label: "Save & Assign",
            isEnabled: !checkDuplicateProfile(),
            onPressed: () {
              Navigator.of(context).pop(ProfileEntity(
                  themeColor: materialColorToHex(colorList[currentIndex]),
                  textSize: _textSize));
            },
          )
        ],
      ),
    );
  }
}

Future<ProfileEntity?> showAddProfileDialog(BuildContext context) async {
  return showModalBottomSheet<ProfileEntity>(
    context: context,
    isScrollControlled: true,
    isDismissible: false,
    builder: (BuildContext context) {
      return Wrap(
        children: [AddProfileDialog()],
      );
    },
  );
}
