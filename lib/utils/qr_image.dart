import 'package:flutter/material.dart';
//import 'package:qr_flutter/qr_flutter.dart';

import '../models/token.dart';

class QRImage extends StatelessWidget {
  const QRImage(this._token, {super.key});

  final Token _token;

  @override
  Widget build(BuildContext context) {
    return Text(_token.toString());
  }
}
