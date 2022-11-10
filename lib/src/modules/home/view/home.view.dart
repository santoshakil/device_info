import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/device.info.provider.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceInfo = ref.watch(deviceInfoProvider).value ?? {};
    return Scaffold(
      body: ListView.builder(
        itemCount: deviceInfo.length,
        itemBuilder: (_, i) => Row(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                deviceInfo.keys.elementAt(i),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                child: Text(
                  deviceInfo.values.elementAt(i).toString(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
