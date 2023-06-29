class Token {
  final String id;
  final String tokenNumber;
  final DateTime validUntil;

  Token(
      {required this.id, required this.tokenNumber, required this.validUntil});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tokenNumber': tokenNumber,
      'validUntil': validUntil.toIso8601String(),
    };
  }

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
      id: json['id'],
      tokenNumber: json['tokenNumber'],
      validUntil: DateTime.parse(json['validUntil']),
    );
  }
}
