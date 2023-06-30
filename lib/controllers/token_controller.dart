import 'dart:convert';
import 'dart:io';
import 'dart:collection';

import 'package:path_provider/path_provider.dart';
import 'package:synchronized/synchronized.dart';
import 'package:uuid/uuid.dart';

import '../models/token.dart';

class TokenController {
  final Queue<Token> tokenQueue = Queue<Token>();
  final Lock _queueLock = Lock();
  int _totalTokensIssued = 0;

  Token issueToken() {
    final token = _generateToken();
    _queueLock.synchronized(() {
      tokenQueue.add(token);
      _saveTokensToFile();
      _totalTokensIssued++;
    });
    return token;
  }

// Need to persist this total tokens issued per day. Currently this can go for a toss on restart/crash!
  int getTokensIssued() {
    return _totalTokensIssued;
  }

  Token _generateToken() {
    final id = const Uuid().v4();
    final number = tokenQueue.length + 1;
    final validUntil = _calculateValidUntil(DateTime.now());
    return Token(
        id: id, tokenNumber: number.toString(), validUntil: validUntil);
  }

  DateTime _calculateValidUntil(DateTime dateTime) {
    final now = dateTime;
    final midnight =
        DateTime(now.year, now.month, now.day).add(const Duration(days: 1));
    return midnight.subtract(const Duration(milliseconds: 1));
  }

  Token getCurrentToken() {
    _queueLock.synchronized(() {
      return tokenQueue.isEmpty ? Token.empty() : tokenQueue.first;
    });
    return Token.empty();
  }

  Token consumeToken() {
    _queueLock.synchronized(() {
      if (tokenQueue.isNotEmpty) {
        Token token = tokenQueue.removeFirst();
        _saveTokensToFile();
        return token;
      }
    });
    return Token.empty();
  }

  void resetTokens() {
    _queueLock.synchronized(() {
      tokenQueue.clear();
      _saveTokensToFile();
    });
  }

  Future<void> _saveTokensToFile() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/tokens.json');
    final sink = file.openWrite();
    final encodedTokens = tokenQueue.map((token) => token.toJson()).toList();
    final jsonString = jsonEncode(encodedTokens);
    sink.write(jsonString);
    await sink.close();
  }

  // Add the following method to load tokens from file if needed
  Future<void> loadTokensFromFile() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/tokens.json');
    if (file.existsSync()) {
      final jsonString = await file.readAsString();
      final decodedTokens = jsonDecode(jsonString) as List<dynamic>;
      final token = decodedTokens.map((json) => Token.fromJson(json)).toList();
      tokenQueue.addAll(token);
    }
  }
}
