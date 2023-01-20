import 'package:flutter/material.dart';
enum ENV_MODE{
  prod,
  dev
}

ENV_MODE currentEnv = ENV_MODE.prod;

const primaryColor_ = AppColor.primary;
const accentColor = AppColor.secondary;
const secondaryColor = AppColor.secondary;

Color? backgroundDefaultScaffold = Colors.grey[100];

const String default_user_pic = "https://madahst.com/wp-content/uploads/2020/08/ava.png";
const String default_dummy_user_pic = "http://www.azembelani.co.za/wp-content/uploads/2016/07/20161014_58006bf6e7079-3.png";
const urlFCM = "https://char-products.store/public/fcm_xbetpay.php";

class AppColor {
  static const Color primary = Color(0xff0464CF);
  static const Color secondary = Color(0xffffffff);
  static const Color darkGrey = Color(0xff1657786);
  static const Color lightGrey = Color(0xffAAB8C2);
  static const Color extraLightGrey = Color(0xffE1E8ED);
  static const Color extraExtraLightGrey = Color(0xfF5F8FA);
  static const Color white = Color(0xFFffffff);
  static  const  yellowColor = Color(0xfff8c614);

  static Color shadowColor = Colors.black87;
  static Color cardColor = const Color(0xFFEDF0F3);
  static Color darker = const Color(0xFF3E4249);
  static Color textBoxColor = const Color(0xFFe9e9e9);
  static Color deepBlue = const Color(0xff466aff);
  static Color lightBlue = const Color(0xff5879ff);
  static Color sendBackgroundColor = const Color(0xffcfe3ff);
  static Color sendIconColor = const Color(0xff3f63ff);
  static Color activitiesBackgroundColor = const Color(0xfffbcfcf);
  static Color activitiesIconColor = const Color(0xfff54142);
  static Color statsBackgroundColor = const Color(0xffd3effe);
  static Color statsIconColor = const Color(0xff3fbbfe);
  static Color paymentBackgroundColor = const Color(0xffefcffe);
  static Color paymentIconColor = const Color(0xffef3fff);
}