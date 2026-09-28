import 'package:flutter/material.dart';
import 'package:movie_pair/features/profile/pages/widgets/text_style_user_info.dart';

Widget statisticCard (String lable, String value) {
  return Expanded(child: Container(
    padding: EdgeInsets.symmetric(vertical:14 ),
    decoration: BoxDecoration(
      color: Color(0xFF1b1e25),
      borderRadius: BorderRadius.circular(16),
    ),
    child: Column(
      children: [
        Text(value,style: TextStyleUserInfo().userInfoText(22),),
        SizedBox(height: 4,),
        Text(lable, style: TextStyleUserInfo().discriptionText(),)
      ],
    ),
  ));
}