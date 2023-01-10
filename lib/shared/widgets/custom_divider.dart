import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.black54,
      indent: 50,              //المسافة بين الخط وجهه اليسار
      endIndent: 50,           //المسافة بين الخط وجهه اليمين
      height: 10,              //المسافه بين الخط والwidgets
      thickness: 2,            //سمك الخط
    );
  }
}
