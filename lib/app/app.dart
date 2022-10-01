import 'package:flutter/material.dart';
import 'package:flutter_steps_tracker/app/bindings.dart';
import 'package:flutter_steps_tracker/app/routes.dart';
import 'package:flutter_steps_tracker/app/theme.dart';
import 'package:get/route_manager.dart';

class StepCounterApp extends StatelessWidget {
  const StepCounterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      initialRoute: '/auth_dispatcher',
      getPages: routes,
      initialBinding: initialBindings,
    );
  }
}
