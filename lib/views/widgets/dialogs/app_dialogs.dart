import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class AppDialog {
  static void fDialogShowIOS(BuildContext context,
      {required String title, required ValueChanged<String> onSave}) {
    final _controller = TextEditingController(text: title);
    showCupertinoDialog(
      barrierDismissible: true,
      context: context,
      builder: (builder) => CupertinoAlertDialog(
        // title: Text(title),
        content: Material(
          child: TextFormField(
            controller: _controller,
            cursorColor: Colors.amber,
            decoration: InputDecoration(
                // Border
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
                border: OutlineInputBorder(),
                filled: true,
                // hintText: 'Add task',
                labelText: 'Update Task'.tr
                // Icons
                ),
          ),
        ),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text(
              'Cancel'.tr,
            ),
            onPressed: () {
              context.popRoute();
            },
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            child: Text(
              'Save'.tr,
            ),
            onPressed: () {
              if (_controller.text.isNotEmpty) {
                onSave.call(_controller.text);
                context.popRoute();
              }
            },
          ),
        ],
      ),
    );
  }
}
