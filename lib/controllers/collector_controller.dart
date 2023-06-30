import 'package:logging/logging.dart';
import 'package:token_system/models/token.dart';

import '../models/collector.dart';
import 'token_controller.dart';
import '../utils/crypto_routines.dart';

class CollectorController {
  final List<Collector> _collectors = [];
  int _totalTokensCollected = 0;
  String _pin = "";

  final TokenController _tokenController;
  final Logger _logger;

  CollectorController(this._tokenController, this._logger);

  void setPIN(String pin) {
    _pin = CryptoRoutines.getSecureHash(pin);
  }

  String getPIN() {
    return _pin;
  }

  void addCollector(Collector collector) {
    _collectors.add(collector);
  }

  void removeCollector(int id) {
    _collectors.removeAt(id);
  }

  int getTokensCollected() {
    return _totalTokensCollected;
  }

  int getActiveCollectors() {
    return _collectors.length;
  }

  Token collectToken(Collector collector) {
    Token token = Token.empty();
    if (CryptoRoutines.secureCompare(_pin, collector.queuePIN)) {
      token = _tokenController.consumeToken();
      if (token != Token.empty()) {
        _totalTokensCollected++;
      }
    } else {
      _logger.log(Level.INFO, 'Supplied PIN does not match the set PIN');
    }
    return token;
  }
}
