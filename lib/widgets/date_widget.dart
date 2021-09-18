
import 'package:book_now_null_safety/utilities/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class DateWidget extends StatelessWidget {
  const DateWidget({
    Key? key,
    required this.startDate,
    required this.endDate,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final String startDate;
  final String endDate;
  final String title;
  final onTap;

  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title, style: TextStyle(
                fontSize: 16.0,
                fontFamily: 'Urban',
                fontWeight: FontWeight.w600
              ),),
          SizedBox(
            height: MySize.size5,
          ),
          Container(
            alignment: Alignment.center,
            height: MySize.size54,
            width: MySize.screenWidth,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade500),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Text('From'.tr +' ($startDate) '+ 'To'.tr +' ($endDate)',
                style: TextStyle(
                fontSize: 16.0,
                fontFamily: 'Urban',
                fontWeight: FontWeight.w800
              ),),
          )
        ],
      ),
    );
  }
}
