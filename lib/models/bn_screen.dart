import 'package:flutter/cupertino.dart';

class BnScreen {
  final Widget widget;
  final String title;

 const BnScreen({
    required this.widget,
    required this.title,
  });
}

// ما بنفع نضع const للكلاس الذي متغيراته  late لانهيأخذ قيمته في runtime فقط نضع const للكلاس الذي متغيراته final
//  ال const يأخذ قيمته في compantTime
