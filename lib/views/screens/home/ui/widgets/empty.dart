import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({Key? key, required this.content}) : super(key: key);
  final String content;

  @override
  Widget build(BuildContext context) {
    return content.text.center.make().centered();
  }
}
