import 'dart:async';

import 'package:flutter_steps_tracker/app/data_sources/fake_pedometer.dart';
import 'package:flutter_steps_tracker/app/data_sources/pedometer_source.dart';
import 'package:flutter_steps_tracker/services/api_service/api_service.dart';
import 'package:flutter_steps_tracker/services/auth_service/auth_service.dart';
import 'package:get/get.dart';

final initialBindings = BindingsBuilder(() {
  Get.put<PedometerSource>(FakePedometer()..init());
  Get.put(AuthService());
  Get.put<ApiService>(FirebaseApiService());
});
