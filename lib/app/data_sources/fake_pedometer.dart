import 'dart:async';

import 'package:flutter_steps_tracker/app/data_sources/pedometer_source.dart';

class FakePedometer implements PedometerSource {
  var _status = WalkingStatus.stopped;

  final _randomStream = Stream.periodic(const Duration(seconds: 5));
  final _oneSecStream = Stream.periodic(const Duration(seconds: 1));

  final _stepsController = StreamController<int>.broadcast();

  var _cnt = 0;

  void init() {
    _oneSecStream.listen((event) {
      if (_status == WalkingStatus.stopped) return;
      _stepsController.add(_cnt++);
    });
  }

  void close() {}

  @override
  Stream<WalkingStatus> get pedestrianStatusStream => _randomStream.map(
        (event) {
          if (_status == WalkingStatus.stopped) {
            _status = WalkingStatus.walking;
          } else {
            _status = WalkingStatus.stopped;
          }
          return _status;
        },
      );

  @override
  Stream<StepCount> get stepCountStream => _stepsController.stream.map(
        (val) {
          return StepCount(
            val,
            DateTime.now(),
          );
        },
      );
}
