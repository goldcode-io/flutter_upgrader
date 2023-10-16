/*
 * Copyright (c) 2019-2023 Larry Aasen. All rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:upgrader/upgrader.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Only call clearSavedSettings() during testing to reset internal values.
  await Upgrader.clearSavedSettings(); // REMOVE this for release builds

  // On Android, the default behavior will be to use the Google Play Store
  // version of the app.
  // On iOS, the default behavior will be to use the App Store version of
  // the app, so update the Bundle Identifier in example/ios/Runner with a
  // valid identifier already in the App Store.
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Upgrader Example',
      home: Builder(
        builder: (context) {
          return UpgradeAlert(
            upgrader: Upgrader(
              canDismissDialog: false,
              durationUntilAlertAgain: Duration(seconds: 30),
              debugDisplayAlways: true,
            ),
            content: (
              String appName,
              String appStoreVersion,
              String appInstalledVersion,
            ) {
              return Container(
                color: Colors.green,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(appName),
                      SizedBox(height: 12),
                      Text(appStoreVersion),
                      SizedBox(height: 12),
                      Text(appInstalledVersion),
                    ],
                  ),
                ),
              );
            },
            child: Scaffold(
              appBar: AppBar(title: Text('Upgrader Example')),
              body: Center(child: Text('Checking...')),
            ),
          );
        },
      ),
    );
  }
}

class DialogContent extends StatelessWidget {
  const DialogContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
