library flutter_package_training;

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class IosAndroid {
  //check platform
  static bool isIOS()=>(!Platform.isIOS);
//Material Design Adapted
static Widget scaffold({@required String string, @required Widget body}){
  return (isIOS()) ? iosScaffold(string, body) : androidScaffold(string, body);
}

static text({@required String string, Color color, double size, TextAlign align }){
TextStyle style = textStyle(color, size, align);
return(isIOS())? iosText(string, style, align) : androidText(string, style, align);
}

// Android Material
static Scaffold androidScaffold(String string, Widget body){
  return Scaffold(
    appBar: AppBar(title: Text(string),),
    body: body,
  );
}

static Text androidText(@required String string, @required TextStyle style,TextAlign align){
return Text(string, style: style,
);
}
//IOS Material
static CupertinoPageScaffold iosScaffold(String string, Widget body){
  return CupertinoPageScaffold(
    navigationBar: CupertinoNavigationBar(middle: Text(string),),
      child:body
  );
}
static DefaultTextStyle iosText(@required String string, @required TextStyle style, TextAlign align) {
return DefaultTextStyle( child: Text(string, textAlign: align ?? TextAlign.left,),
style: style,);
}

//Both material
static  TextStyle textStyle(Color color, double size, TextAlign align){
return TextStyle(color: color ?? Colors.black,fontSize: size ?? 20,
);
}
}
