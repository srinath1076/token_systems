import 'package:test/test.dart';
import 'package:token_system/controllers/TokenController.dart';
import 'package:token_system/models/Token.dart';

void main() {
  group('TokenController', () {
    late TokenController tokenController;

    setUp(() {
      tokenController = TokenController();
      // Load any initial tokens or queues if required
      // tokenController.loadTokens();
    });

    tearDown(() {
      // Clean up any resources used in the tests
      // tokenController.resetTokens();
    });

    test('Assign token to queue', () {
      final token = Token(tokenNumber: 'A001', validUntil: DateTime.now());
      final queueIndex = 0;

      final result = tokenController.assignTokenToQueue(token, queueIndex);

      expect(result, equals(1));
      expect(tokenController.queues[queueIndex], contains(token));
    });

    test('Initialize queues', () {
      tokenController.initializeQueues();

      expect(tokenController.queues.length, equals(3));
      expect(tokenController.queues[0], isEmpty);
      expect(tokenController.queues[1], isEmpty);
      expect(tokenController.queues[2], isEmpty);
    });

    test('Reset tokens', () {
      final token = Token(tokenNumber: 'A001', validUntil: DateTime.now());
      tokenController.assignTokenToQueue(token, 0);

      tokenController.resetTokens();

      expect(tokenController.tokens, isEmpty);
      expect(tokenController.queues[0], isEmpty);
      expect(tokenController.queues[1], isEmpty);
      expect(tokenController.queues[2], isEmpty);
    });

    // Add more tests as needed
  });
}
