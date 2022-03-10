import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_todo_manabie/core/values/app_gaps.dart';

/// interval
class Gaps {
  Gaps._();

  /// Horizontal interval
  static const Widget hGap2 = SizedBox(width: AppGaps.gap_dp2);
  static const Widget hGap4 = SizedBox(width: AppGaps.gap_dp4);
  static const Widget hGap5 = SizedBox(width: AppGaps.gap_dp5);
  static const Widget hGap6 = SizedBox(width: AppGaps.gap_dp6);
  static const Widget hGap8 = SizedBox(width: AppGaps.gap_dp8);
  static const Widget hGap10 = SizedBox(width: AppGaps.gap_dp10);
  static const Widget hGap12 = SizedBox(width: AppGaps.gap_dp12);
  static const Widget hGap15 = SizedBox(width: AppGaps.gap_dp15);
  static const Widget hGap16 = SizedBox(width: AppGaps.gap_dp16);
  static const Widget hGap24 = SizedBox(width: AppGaps.gap_dp24);
  static const Widget hGap32 = SizedBox(width: AppGaps.gap_dp32);

  /// Vertical interval
  static const Widget vGap2 = SizedBox(height: AppGaps.gap_dp2);
  static const Widget vGap4 = SizedBox(height: AppGaps.gap_dp4);
  static const Widget vGap5 = SizedBox(height: AppGaps.gap_dp5);
  static const Widget vGap6 = SizedBox(height: AppGaps.gap_dp6);
  static const Widget vGap8 = SizedBox(height: AppGaps.gap_dp8);
  static const Widget vGap10 = SizedBox(height: AppGaps.gap_dp10);
  static const Widget vGap12 = SizedBox(height: AppGaps.gap_dp12);
  static const Widget vGap15 = SizedBox(height: AppGaps.gap_dp15);
  static const Widget vGap16 = SizedBox(height: AppGaps.gap_dp16);
  static const Widget vGap20 = SizedBox(height: AppGaps.gap_dp20);
  static const Widget vGap24 = SizedBox(height: AppGaps.gap_dp24);
  static const Widget vGap32 = SizedBox(height: AppGaps.gap_dp32);
  static const Widget vGap36 = SizedBox(height: AppGaps.gap_dp36);
  static const Widget vGap50 = SizedBox(height: AppGaps.gap_dp50);

  static const Widget line = Divider();

  static const Widget vLine = SizedBox(
    width: 0.6,
    height: 24.0,
    child: VerticalDivider(),
  );

  static const Widget empty = SizedBox.shrink();
}
