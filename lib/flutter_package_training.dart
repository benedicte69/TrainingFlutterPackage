library flutter_package_training;

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

///PLATFORM IOS ANDROID
class IosAndroid {
  ///platform checking
  static bool isIOS() => (Platform.isIOS);

  ///PLATFORM MATERIAL DESIGN
  ///use those functions in your code

  /// Material design for Scaffold
  static Widget scaffold({@required String string, @required Widget body}) {
    return (isIOS())
        ? iosScaffold(string, body)
        : androidScaffold(string, body);
  }

  /// Material design for Text
  static text({
    @required String string,
    Color color,
    double size,
    TextAlign align,
  }) {
    var style = textStyle(color, size, align);
    return (isIOS())
        ? iosText(string, style, align)
        : androidText(string, style, align);
  }

  /// Material design for Alert
  static Future alert(
      {@required BuildContext context, @required VoidCallback callback}) {
    return showDialog(
        context: context,
        builder: (context) {
          return isIOS()
              ? iosErrorAlert(context: context, onPressed: callback)
              : androidErrorAlert(context: context, onPressed: callback);
        });
  }

  /// Material design for Button
  static button({@required Widget child, @required VoidCallback onPressed}) {
    return (isIOS())
        ? iosButton(child: child, onPressed: onPressed)
        : androidRaisedButton(child: child, onPressed: onPressed);
  }

  ///ANDROID MATERIAL
  ///prefer using the Platform Material design function instead

  /// Android Material for Scaffold
  static Scaffold androidScaffold(String string, Widget body) {
    return Scaffold(
      appBar: AppBar(
        title: Text(string),
      ),
      body: body,
    );
  }

  /// Android Material for Text
  static Text androidText(String string, TextStyle style, TextAlign align) {
    return Text(
      string,
      style: style,
    );
  }

  /// Android Material for AlertDialog
  static androidErrorAlert(
      {@required BuildContext context, @required VoidCallback onPressed}) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          text(string: 'an error ocured'),
        ],
      ),
      actions: <Widget>[
        button(child: text(string: 'ok'), onPressed: onPressed),
      ],
    );
  }

  /// Android Material for RaisedButton
  static RaisedButton androidRaisedButton(
      {@required Widget child, @required VoidCallback onPressed}) {
    return RaisedButton(
      onPressed: onPressed,
      child: child,
    );
  }

  ///IOS MATERIAL
  ///prefer using the Platform Material design function instead

  /// IOS Material for Scaffold
  static CupertinoPageScaffold iosScaffold(String string, Widget body) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(string),
        ),
        child: body);
  }

  /// IOS Material for Text
  static DefaultTextStyle iosText(
      String string, TextStyle style, TextAlign align) {
    return DefaultTextStyle(
      child: Text(
        string,
        textAlign: align ?? TextAlign.left,
      ),
      style: style,
    );
  }

  /// IOS Material for Alert
  static iosErrorAlert(
      {@required BuildContext context, @required VoidCallback onPressed}) {
    return CupertinoAlertDialog(
      content: Column(
        children: <Widget>[text(string: 'error')],
      ),
      actions: <Widget>[
        button(child: text(string: 'ok'), onPressed: onPressed),
      ],
    );
  }

  /// IOS Material for Button
  static CupertinoButton iosButton(
      {@required Widget child, @required VoidCallback onPressed}) {
    return CupertinoButton(
      child: child,
      onPressed: onPressed,
    );
  }

  ///IOS and ANDROID MATERIAL

  ///IOS and ANDROID Material for Text
  static TextStyle textStyle(Color color, double size, TextAlign align) {
    return TextStyle(
      color: color ?? Colors.black,
      fontSize: size ?? 20,
    );
  }
}
