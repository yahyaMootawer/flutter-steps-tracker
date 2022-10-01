enum WalkingStatus { walking, stopped }

class StepCount {
  final int steps;
  final DateTime timestamp;

  StepCount(this.steps, this.timestamp);
}

abstract class PedometerSource {
  Stream<WalkingStatus> get pedestrianStatusStream;
  Stream<StepCount> get stepCountStream;
}
