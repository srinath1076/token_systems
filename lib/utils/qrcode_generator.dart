import 'package:flutter/material.dart';
//import 'package:qr_flutter/qr_flutter.dart';

class QRCodeGenerator {
  static Widget generate(String data) {
    /*
    return ClipRRect(
        borderRadius: BorderRadius.circular(0),
        child: QrImage(
          size: 200.0,
          data: data,
        ));
        */
    return Text(data);
  }
}
