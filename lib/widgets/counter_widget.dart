import 'package:book_now_null_safety/utilities/size_config.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../constraints.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({
    Key? key,
    required this.title,
    required this.onPlusTap,
    required this.onMinustap,
    required this.count,
  }) : super(key: key);
  final String title;
  final int count;
  final onPlusTap;
  final onMinustap;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
              fontSize: 16.0, fontFamily: 'Urban', fontWeight: FontWeight.w600),
        ),
        SizedBox(height: MySize.size5),
        Container(
            height: MySize.size54,
            width: MySize.screenWidth / 2.65,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade500),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TextButton(
                    onPressed: onMinustap,
                    child: Icon(
                      MdiIcons.minusCircleOutline,
                      color: Colors.grey[600],
                      size: 26,
                    )),
                Text('$count', style: kSearchFieldTextStyle),
                TextButton(
                  onPressed: onPlusTap,
                  child: Icon(
                    MdiIcons.plusCircleOutline,
                    color: Colors.grey[600],
                    size: 26,
                  ),
                )
              ],
            )),
      ],
    );
  }
}
