import 'package:flutter/material.dart';

class IosStyleToast extends StatelessWidget {
  const IosStyleToast({Key? key, required this.msg, this.icon}) : super(key: key);
  final String? msg;
  final Widget? icon;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTextStyle(
        style: Theme.of(context).textTheme.bodyText2!.copyWith(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.w600
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 150.0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                color: Colors.black.withOpacity(0.4),
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if(icon != null) icon!,
                    Text(msg??''),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
