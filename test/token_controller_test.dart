import 'package:test/test.dart';
import 'package:token_system/controllers/token_controller.dart';
import 'package:token_system/models/token.dart';

void main() {
  group('TokenController', () {
    late TokenController tokenController;
    Token token1 = Token.empty(),
        token2 = Token.empty(),
        token3 = Token.empty();

    setUp(() {
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
      expect(token1.tokenNumber, equals(1));
      expect(token2.tokenNumber, equals(2));
      expect(token3.tokenNumber, equals(3));
      expect(tokenController.getTokensIssued(), equals(3));
      expect(token3.tokenNumber, isNot(token2.tokenNumber));
      expect(token2.id, isNot(token1.id));
      expect(token3.validUntil, equals(token1.validUntil));
    });

/** 
    test('Token Collector checks - verify token', () {
      expect(tokenController, equals(3));
      expect(tokenController.queues[0], isEmpty);
      expect(tokenController.queues[1], isEmpty);
      expect(tokenController.queues[2], isEmpty);
    });
*/
    // Add more tests as needed
  });
}
