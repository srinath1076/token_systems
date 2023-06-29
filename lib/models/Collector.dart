class Collector {
  final String name;
  final String queueId;
  final String queuePIN;

  Collector(
      {required this.queueId, required this.name, required this.queuePIN});

  Map<String, dynamic> toJson() {
    return {'queueId': queueId, 'name': name, 'queuePIN': queuePIN};
  }

  factory Collector.fromJson(Map<String, dynamic> json) {
    return Collector(
        queueId: json['queueId'],
        name: json['name'],
        queuePIN: json['queuePIN']);
  }
}
