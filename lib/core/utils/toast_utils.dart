import 'package:test_todo_manabie/shelf/all_import.dart';

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