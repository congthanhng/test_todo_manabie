import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:test_todo_manabie/views/widgets/toast/error_toast.dart';
import 'package:test_todo_manabie/views/widgets/toast/ios_toast.dart';

class ToastUtils{
  static OverlaySupportEntry? toastQueue;

  static showToast( {required BuildContext context, required String msg}) {
    toastQueue?.dismiss();
    toastQueue = showOverlay(
          (_, t) {
        return Theme(
          data: Theme.of(context),
          child: Opacity(
            opacity: t,
            child: IosStyleToast(
              msg: msg,
            ),
          ),
        );
      },
      key: const ValueKey('overlay_toast'),
    );
  }

  static showErrorToast( {required BuildContext context, required String msg}) {
    toastQueue?.dismiss();
    toastQueue = showOverlay(
          (_, t) {
        return Theme(
          data: Theme.of(context),
          child: Opacity(
            opacity: t,
            child: ErrorToast(
              msg: msg,
            ),
          ),
        );
      },
      key: const ValueKey('overlay_toast'),
    );
  }
}