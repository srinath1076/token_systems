import 'package:intl/intl.dart';

import 'token_controller.dart';

class StatsController {
  final TokenController _tokenController;

  StatsController(this._tokenController);

  int getTotalTokensIssued() {
    return _tokenController.tokens.length;
  }

  int getTotalTokensPending() {
    int pendingTokens = 0;
    final DateTime now = DateTime.now();
    for (final token in _tokenController.tokens) {
      if (token.validUntil.isAfter(now)) {
        pendingTokens++;
      }
    }
    return pendingTokens;
  }

  int getTotalTokensCollected() {
    final DateTime now = DateTime.now();
    int collectedTokens = 0;
    for (final queue in _tokenController.queues) {
      for (final token in queue) {
        if (token.validUntil.isBefore(now)) {
          collectedTokens++;
        }
      }
    }
    return collectedTokens;
  }

  double getAverageWaitTime() {
    final DateTime now = DateTime.now();
    int totalWaitTime = 0;
    int tokenCount = 0;
    for (final queue in _tokenController.queues) {
      for (final token in queue) {
        if (token.validUntil.isBefore(now)) {
          final waitTime = now.difference(token.validUntil).inMinutes;
          totalWaitTime += waitTime;
          tokenCount++;
        }
      }
    }
    if (tokenCount == 0) return 0.0;
    return totalWaitTime / tokenCount;
  }

  String formatAverageWaitTime(double averageWaitTime) {
    final formattedWaitTime = NumberFormat('0.00').format(averageWaitTime);
    return '$formattedWaitTime minutes';
  }
}
