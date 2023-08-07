import 'package:flutter/material.dart';
import 'package:foyer_demo/features/common/presentation/ui/color_picker_circle.dart';

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

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        color: Color(0xff181b24),
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
          Text(
            'Select a font size :',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
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
                        'Sample Text',
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
                          walletColor = colorList[currentIndex]
                              .toString()
                              .substring(
                                  colorList[currentIndex]
                                          .toString()
                                          .indexOf('0x') +
                                      4,
                                  colorList[currentIndex].toString().length -
                                      1);
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
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // LeadingIconTextButton(
              //   label: '트래킹 해제',
              //   horizontalPadding: .0,
              //   verticalPadding: .0,
              //   backgroundColor: ColorUtils.O212530,
              //   onPressed: () {
              //     getIt<FollowingWalletCubit>().deleteFollowingTrackWallet(
              //         walletID: widget.followingWalletModel.walletId!);
              //   },
              //   labelTextStyle: TextStyle(
              //     color: ColorUtils.Off3434,
              //     fontSize: 18 * ffem,
              //     fontWeight: FontWeight.w700,
              //   ),
              // ),
              // const SizedBox(height: 24),
              // TextButton(
              //   onPressed: () => context.navigator.pop(),
              //   style: TextButton.styleFrom(
              //     minimumSize: Size.zero,
              //     padding: EdgeInsets.zero,
              //     tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              //   ),
              //   child: Text(
              //     '취소',
              //     textAlign: TextAlign.center,
              //     style: TextStyle(
              //       color: ColorUtils.O9599AF,
              //       fontSize: 16 * ffem,
              //     ),
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}

void showAddProfileDialog(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    isDismissible: true,
    builder: (BuildContext context) {
      return Wrap(
        children: [AddProfileDialog()],
      );
    },
  );
}
