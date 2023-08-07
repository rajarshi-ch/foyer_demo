import 'package:flutter/material.dart';
import 'package:foyer_demo/features/common/presentation/ui/color_picker_circle.dart';

class SelectedProfileCard extends StatelessWidget {
  const SelectedProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(12, 16, 12, 16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 14),
            width: double.infinity,
            height: 58,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.only(right: 12),
                        width: 56,
                        decoration: BoxDecoration(
                          color: Color(0x1d6dff),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ColorPickerCircle(
                          color: Theme.of(context).colorScheme.primary,
                          isSelected: false,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 2),
                        Text(
                          "NickName",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                          ),
                        ),
                        Text(
                          // LC6 (8:27759)
                          'total assets',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                CircleAvatar(),
                // Container(
                //   // arrowg14 (8:27760)
                //   margin:
                //       EdgeInsets.fromLTRB(0 , 0 , 0 , 2 ),
                //   child: Icon(
                //     Icons.chevron_right,
                //     color: ColorUtils.OA7ACCB,
                //     size: 28 ,
                //   ),
                // ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 40,
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              '소개글 작성',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF1D6DFF),
                fontSize: 13,
                fontFamily: 'SF Pro Text',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          SizedBox(
            // followernpn (8:27761)
            width: double.infinity,
            height: 40,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      // context.navigator
                      //     .push(FollowersPage.route(initalTab: 1));
                    },
                    child: Container(
                      //width: 172,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '팔로워',
                            style: TextStyle(
                              color: Color(0xffa7acca),
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(width: 2),
                          Text(
                            'lat',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 6),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '팔로잉',
                          style: TextStyle(
                            color: Color(0xffa7acca),
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(width: 2),
                        Text(
                          'Long',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
