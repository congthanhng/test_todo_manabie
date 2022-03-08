import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppColor {
  static const lightFillColor = Colors.black;
  static const darkFillColor = Colors.white;

  static final Color lightFocusColor = Colors.black.withOpacity(0.12);

  static const Color lightHintColor = Color(0xff929DAA);
  static const Color lightDisableColor = Color(0xff929DAA);
  static const Color lightBackgroundColor = Colors.white;
  static const Color lightErrorColor = Color(0xffEB3B5B);
  static const Color titleColor = Color(0xFF2C333A);

  static final Color darkFocusColor = Colors.white.withOpacity(0.12);

  static const Color app_main = Color(0xFF0C967C);
  static const Color dark_app_main = Color(0xffFBFBFD);

  static const Color accent = Color(0xfff8a954);
  static const Color dark_accent = Color(0xffd58d48);

  static const MaterialColor app_main_swatch = Colors.green;
  static MaterialColor dark_app_main_swatch = materialWhite;

  static const Color shadow = Colors.black;
  static const Color dark_shadow = Color(0xFF121212);

  static const Color surface = Color(0xffffffff);
  static const Color dark_surface = Color(0xFF363640);

  static const Color scaffold_bg_color = Color(0xffF6F6F8);
  static const Color dark_scaffold_bg_color = Color(0xFF27272F);

  static const Color material_bg = Color(0xFFFFFFFF);
  static const Color dark_material_bg = Color(0xFF27272F);

  static const Color text = Color(0xFF555555);
  static const Color dark_text = Color(0xFFFAFBFC);

  static const Color text_gray = Color(0xFFcccccc);
  static const Color dark_text_gray = Color(0xFF666666);

  static const Color text_heading = Color(0xFF392a25);
  static const Color dark_text_heading = Color(0xFF666666);

  static const Color bg_gray = Color(0xFFF6F6F6);
  static const Color dark_bg_gray = Color(0xFF1F1F1F);

  static const Color line = Color(0xFFE3E3E3);
  static const Color dark_line = Color(0xFF3A3C3D);

  static const Color red = Color(0xFFFF4759);
  static const Color dark_red = Color(0xFFE03E4E);

  static const Color link = Color(0xFF00A5C7);
  static const Color dark_link = Color(0xFF00C6E8);

  static const Color text_disabled = Color(0xFFD4E2FA);
  static const Color dark_text_disabled = Color(0xFFCEDBF2);

  static const Color button_disabled = Color(0xFF96BBFA);
  static const Color dark_button_disabled = Color(0xFF83A5E0);

  static const Color unselected_item_color = Color(0xffececec);
  static const Color dark_unselected_item_color = Color(0xFF4D4D4D);

  static const Color hint = Color(0xff777b7c);
  static const Color dark_hint = Color(0xFF4D4D4D);

  static const Color icon = Colors.white;
  static const Color dark_icon = Color(0xFF4D4D4D);

  static const Color bg_gray_ = Color(0xFFE6E6E6);
  static const Color dark_bg_gray_ = Color(0xFF242526);

  static const Color bg_gray_price_border = Color(0xFFBBBBBB);
  static const Color dark_bg_gray_price_border = Color(0xFFBBBBBB);

  static const Color bg_gray_price = Color(0xFFFAFAFA);
  static const Color dark_bg_gray_price = Color(0xFFFAFAFA);

  static const Color base_price = Color(0xFFCA1C26);
  static const Color dark_base_price = Color(0xFFCA1C26);

  static const Color base_discount = Color(0xFF919191);
  static const Color dark_base_discount = Color(0xFF919191);

  static const Color h2 = Color(0xFF16796F);
  static const Color dark_h2 = Color(0xFF16796F);

  static const Color light_tag = Color(0xFFFBFAF9);
  static const Color dark_tag = Color(0xFFFBFAF9);

  static const Color light_border_tag = Color(0xFFEFEFEF);
  static const Color dark_border_tag = Color(0xFFEFEFEF);

  static const Color light_text_tag = Color(0xFF8E8B87);
  static const Color dark_text_tag = Color(0xFF8E8B87);
  static const Color light_freeship_banner = Color(0xFF0A947C);
  static const Color dark_freeship_banner = Color(0xFF0A947C);
  static const Color greyBtn = Color(0xFFC4C4C4);

  static const Color _plantTabLight = Color(0xFFE7F5F2);
  static const Color _plantPrimaryLight = Color(0xFF07917A);
  static const Color _toggleLight = Color(0xFFA0A0A0);
  static const Color _toggleDark = Color(0xFFA0A0A0);
  static const Color loginGradientStart = Color(0xFFfbab66);
  static const Color loginGradientEnd = Color(0xFFf7418c);


  static Color get primary => Get.isDarkMode ? dark_app_main : app_main;
  static Color get secondary => Get.isDarkMode ? dark_line : line;
  static Color get onPrimary => Get.isDarkMode ? dark_surface : surface;
  static Color get h2Color => Get.isDarkMode ? dark_h2 : h2;
  static Color get tag => Get.isDarkMode ? dark_tag : light_tag;
  static Color get border_tag => Get.isDarkMode ? dark_border_tag : light_border_tag;
  static Color get text_tag => Get.isDarkMode ? dark_text_tag : light_text_tag;
  static Color get freeship_banner => Get.isDarkMode ? dark_freeship_banner : light_freeship_banner;

  static Color get plantTab => Get.isDarkMode ? _plantTabLight : _plantTabLight;
  static Color get plantPrimary => Get.isDarkMode ? _plantPrimaryLight : _plantPrimaryLight;
  static Color get toggle => Get.isDarkMode ? _toggleLight : _toggleDark;

  static List<Color> get colorList => [
    Color(0xFFA6D3FC),
    Color(0xFFCAB3E9),
    Color(0xFF60C9C5),
    Color(0xFFF7C262),
    Color(0xFFFAAD91)
  ];

  static Color getAccentColor() {
    return Get.isDarkMode ? AppColor.dark_accent : AppColor.accent;
  }

  static Color getBaseDiscount() {
    return Get.isDarkMode
        ? AppColor.dark_base_discount
        : AppColor.base_discount;
  }

  static Color getBasePriceColor() {
    return Get.isDarkMode ? AppColor.dark_base_price : AppColor.base_price;
  }

  static Color getPriceBorderColor() {
    return Get.isDarkMode
        ? AppColor.dark_bg_gray_price_border
        : AppColor.bg_gray_price_border;
  }

  static Color getPriceColor() {
    return Get.isDarkMode
        ? AppColor.dark_bg_gray_price
        : AppColor.bg_gray_price;
  }

  static Color getLinkColor() {
    return Get.isDarkMode ? AppColor.dark_link : AppColor.link;
  }

  static Color getDarkText() {
    return Get.isDarkMode
        ? Colors.white.withOpacity(0.9)
        : Colors.black.withOpacity(0.9);
  }

  static Color getWarningColor() {
    return Get.isDarkMode ? Color(0xFFF7C262) : Colors.orange;
  }

  static Color getErrorColor() {
    return Get.isDarkMode ? AppColor.dark_red : AppColor.red;
  }

  static Color getSuccessColor() {
    return Get.isDarkMode ? Colors.lightGreen : Colors.green;
  }

  static Color getIconDark() {
    return Get.isDarkMode ? AppColor.icon : AppColor.dark_icon;
  }

  static const LinearGradient primaryGradient = LinearGradient(
    colors: <Color>[loginGradientStart, loginGradientEnd],
    stops: <double>[0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static MaterialColor get materialWhite => const MaterialColor(
    0xFFFFFFFF,
    const <int, Color>{
      50: const Color(0xFFFFFFFF),
      100: const Color(0xFFFFFFFF),
      200: const Color(0xFFFFFFFF),
      300: const Color(0xFFFFFFFF),
      400: const Color(0xFFFFFFFF),
      500: const Color(0xFFFFFFFF),
      600: const Color(0xFFFFFFFF),
      700: const Color(0xFFFFFFFF),
      800: const Color(0xFFFFFFFF),
      900: const Color(0xFFFFFFFF),
    },
  );

  static getTransparentGrey() {
    return Colors.grey[600]!.withOpacity(0.3);
  }
}
