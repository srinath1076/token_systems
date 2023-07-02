import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'package:token_system/models/token.dart';

class EndIssuanceView extends StatefulWidget {
  final Token token;

  EndIssuanceView({required this.token});

  @override
  _EndIssuanceViewState createState() => _EndIssuanceViewState();
}

class _EndIssuanceViewState extends State<EndIssuanceView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('End Issuance View'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Generate a new token
                Token newToken = Token.empty();
                // Perform any necessary operations on the newToken object

                setState(() {
                  widget.token = newToken;
                });
              },
              child: const Text('Get Token'),
            ),
//            if (widget.token != null)
            Column(
              children: [
                const SizedBox(height: 20.0),
                Text('Token Number: ${widget.token.tokenNumber}'),
                /**QrImage(
                  data: widget.token.tokenNumber.toString(),
                  version: QrVersions.auto,
                  size: 200.0,
                ),*/
              ],
            ),
          ],
        ),
      ),
    );
  }
}
