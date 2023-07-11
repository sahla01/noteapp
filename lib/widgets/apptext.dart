import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  String? text;
  Color? color;
  double? size;
  FontWeight? fw;
  TextAlign? txtalign;
  AppText({Key? key, required this.text,this.color=Colors.blueGrey,this.size=16,this.fw=FontWeight.normal,this.txtalign=TextAlign.center}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(

      text.toString(),
      textAlign: txtalign,
      style: TextStyle(color: color,fontSize: size,fontWeight: fw),);
  }
}
