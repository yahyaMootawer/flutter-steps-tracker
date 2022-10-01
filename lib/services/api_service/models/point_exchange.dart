import 'package:cloud_firestore/cloud_firestore.dart';

class PointExchange {
  PointExchange({
    required this.id,
    required this.gainedPoints,
    required this.stepsCount,
    required this.date,
  });
  late final String id;
  late final int gainedPoints;
  late final int stepsCount;
  late final DateTime date;

  PointExchange.fromJson(Map<String, dynamic> json) {
    // id = json['id'];
    gainedPoints = json['gainedPoints'];
    stepsCount = json['stepsCount'];
    date = DateTime.fromMillisecondsSinceEpoch(
        (json['date'] as Timestamp).millisecondsSinceEpoch);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['gainedPoints'] = gainedPoints;
    _data['stepsCount'] = stepsCount;
    _data['date'] = date.toUtc();
    return _data;
  }
}
