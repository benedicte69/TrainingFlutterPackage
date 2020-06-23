library flutter_package_training;

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class IosAndroid {
  //check platform
  static bool isIOS() => (Platform.isIOS);
//Material Design Adapted
  static Widget scaffold({@required String string, @required Widget body}) {
    return (isIOS())
        ? iosScaffold(string, body)
        : androidScaffold(string, body);
  }

  static text(
      {@required String string, Color color, double size, TextAlign align}) {
    TextStyle style = textStyle(color, size, align);
    return (isIOS())
        ? iosText(string, style, align)
        : androidText(string, style, align);
  }

  static Future alert({@required BuildContext context}) {
    return showDialog(
        context: context,
        builder: (context) {
          return isIOS()
              ? iosErrorAlert(context: context)
              : androidErrorAlert(context: context);
        });
  }

// Android Material
  static Scaffold androidScaffold(String string, Widget body) {
    return Scaffold(
      appBar: AppBar(
        title: Text(string),
      ),
      body: body,
    );
  }

  static Text androidText(String string, TextStyle style, TextAlign align) {
    return Text(
      string,
      style: style,
    );
  }

  static androidErrorAlert({@required BuildContext context}) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          text(string: 'an error ocured'),
        ],
      ),
      actions: <Widget>[
        RaisedButton(
            child: text(string: 'ok'),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ],
    );
  }

//IOS Material
  static CupertinoPageScaffold iosScaffold(String string, Widget body) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(string),
        ),
        child: body);
  }

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

  static iosErrorAlert({@required BuildContext context}) {
    return CupertinoAlertDialog(
      content: Column(
        children: <Widget>[text(string: 'error')],
      ),
      actions: <Widget>[
        CupertinoButton(
            child: text(string: 'ok'),
            onPressed: () {
              Navigator.of(context).pop();
            })
      ],
    );
  }

//Both material
  static TextStyle textStyle(Color color, double size, TextAlign align) {
    return TextStyle(
      color: color ?? Colors.black,
      fontSize: size ?? 20,
    );
  }
}
