import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'counter_controller.dart';

void main() {
  runApp(const CounterApp());
}

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomeScreen(),
      initialBinding: ControllerBindings(),
    );
  }
}

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(CounterController());
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Obx((){
            //   return  Text(
            //     "Counter value  ${_counterController.count}",
            //     style: const TextStyle(fontSize: 21),
            //   );
            // })
            GetBuilder<CounterController>(
              builder: (counterController) {
                return Text(
                  "Counter value  ${counterController.count}",
                  style: const TextStyle(fontSize: 21),
                );
              },
            ),
            TextButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => ProfileScreen(),
                  //   ),
                  // );
                  Get.to(() => const ProfileScreen(
                        name: "Subrata",
                      ));
                },
                child: const Text("Go to Profile")),
            TextButton(
                onPressed: () {
                  Get.to(() => const SettingsScreen());
                },
                child: const Text("Go to Settings")),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: Get.find<CounterController>().incrementCount,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  final String name;

  const ProfileScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Column(
        children: [
          Text(name),
          ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text("Back")),
          ElevatedButton(
              onPressed: () {
                Get.off(() => const SettingsScreen());
              },
              child: const Text("Settings")),
        ],
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Get.offAll(() => HomeScreen());
              },
              child: const Text("Back to home")),
          ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text("Back")),
        ],
      ),
    );
  }
}
