import 'package:flutter/material.dart';
//import 'package:test/test.dart';
//

//import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
//import 'package:mockito/mockito.dart';
//import 'package:path_provider/path_provider.dart';
//import 'package:path_provider_android/path_provider_android.dart';
import 'package:token_system/controllers/token_controller.dart';
import 'package:token_system/models/token.dart';

//class MockPathProvider extends Mock implements PathProviderPlatform {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  group('TokenController', () {
    //MockPathProvider mockPathProvider;
    //  TestDefaultBinaryMessenger mockBinaryMessenger;

    late TokenController tokenController;
    Token token1 = Token.empty(),
        token2 = Token.empty(),
        token3 = Token.empty();

    setUp(() {
      /**mockPathProvider = MockPathProvider();
      when(mockPathProvider.getApplicationDocumentsDirectory())
          .thenAnswer((_) async => '/mocked/directory/path');
      // Register the mock implementation
      PathProviderPlatform.instance = mockPathProvider; 

      mockBinaryMessenger = TestDefaultBinaryMessenger();
      mockBinaryMessenger.setMockMethodCallHandler(
        MethodChannel('plugins.flutter.io/path_provider').invokeMethod,
        (MethodCall methodCall) async {
          if (methodCall.method == 'getApplicationDocumentsDirectory') {
            return '/mocked/directory/path';
          }
          return null;
        },
      ); */
      tokenController = TokenController();
      token1 = tokenController.issueToken();
      token2 = tokenController.issueToken();
      token3 = tokenController.issueToken();
      // Load any initial tokens or queues if required
      // tokenController.loadTokens();
    });

    tearDown(() {
      // Clean up any resources used in the tests
      tokenController.resetTokens();
    });

    test('Token Consumer checks - Issue token...', () {
      expect(token1.tokenNumber, "1");
      expect(token2.tokenNumber, "2");
      expect(token3.tokenNumber, "3");
      expect(tokenController.getTokensIssued(), 3);
      expect(token3.tokenNumber, isNot(token2.tokenNumber));
      expect(token2.id, isNot(token1.id));
      expect(token3.validUntil, token1.validUntil);
    });

    test('Token Collector checks - verify token', () {
      expect(tokenController.consumeToken().tokenNumber, token1.tokenNumber);
      expect(tokenController.consumeToken().tokenNumber, token2.tokenNumber);
      expect(tokenController.consumeToken().id, token3.id);
      expect(
          tokenController.consumeToken().validUntil, Token.empty().validUntil);
    });

    // Add more tests as needed
  });
}
