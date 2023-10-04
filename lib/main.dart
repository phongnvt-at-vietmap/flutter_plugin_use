import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter_bloc/battery/battery_bloc.dart';
import 'package:flutter_counter_bloc/counter/app_bloc.dart';
import 'package:flutter_counter_bloc/main.dart';
import 'package:flutter_plugin_demo2/flutter_plugin_demo2_platform_interface.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterBlocs()),
        BlocProvider(create: (context) => BatteryBloc()),
      ],
      child: MaterialApp(
          home: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 500,
              child: HomePage(),
            ),
            FutureBuilder(
              future: FlutterPluginDemo2Platform.instance.getPlatformVersion(),
              builder: (context, snapshot) {
                String version = '';
                if (snapshot.hasData) {
                  version = snapshot.data ?? '';
                }
                return Text('version: $version');
              },
            )
          ],
        ),
      )
          // Scaffold(
          //   body: Center(
          //     child: FutureBuilder(
          //         future:
          //             FlutterPluginDemo2Platform.instance.getPlatformVersion(),
          //         builder: (context, snapshot) {
          //           String version = '';
          //           if (snapshot.hasData) {
          //             version = snapshot.data ?? '';
          //           }
          //           return Text('version: $version');
          //         }),
          //   ),
          // ),
          ),
    );
  }
}
