class Collector {
  final String name;
  final String id;
  final String queuePIN;

  Collector({required this.id, required this.name, required this.queuePIN});

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'queuePIN': queuePIN};
  }

  factory Collector.fromJson(Map<String, dynamic> json) {
    return Collector(
        id: json['id'], name: json['name'], queuePIN: json['queuePIN']);
  }
}
