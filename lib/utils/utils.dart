import 'package:flutter/cupertino.dart';

class Utils {
  static void navigate({required context, required screenWidget, required isClearStack}) {
    if (isClearStack) {
      Navigator.of(context).pushAndRemoveUntil(
          CupertinoPageRoute(builder: (context) => screenWidget),
              (Route<dynamic> route) => false);
    } else {
      Navigator.push(
        context,
        CupertinoPageRoute(builder: (context) => screenWidget),
      );
    }
  }
}
