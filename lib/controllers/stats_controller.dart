//import 'dart:html';

import 'package:intl/intl.dart';

import 'token_controller.dart';
import '../models/token.dart';

class StatsController {
  final TokenController _tokenController;

  StatsController(this._tokenController);

  int getTotalTokensIssued() {
    return _tokenController.getTokensIssued();
  }

  int getTotalTokensPending() {
    int pendingTokens = 0;
    final DateTime now = DateTime.now();
    List<Token> tokenList = _tokenController.tokenQueue.toList();
    for (final token in tokenList) {
      if (token.validUntil.isAfter(now)) {
        pendingTokens++;
      }
    }
    return pendingTokens;
  }

  int getTotalTokensCollected() {
    return _tokenController.getTokensCollected();
  }

  double getAverageWaitTime() {
    final DateTime now = DateTime.now();
    int totalWaitTime = 0;
    int tokenCount = 0;
    List<Token> tokenList = _tokenController.tokenQueue.toList();
    for (final token in tokenList) {
      if (token.validUntil.isBefore(now)) {
        final waitTime = now.difference(token.validUntil).inMinutes;
        totalWaitTime += waitTime;
        tokenCount++;
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
