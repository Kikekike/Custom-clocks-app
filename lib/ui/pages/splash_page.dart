import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'main_page.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {

  @override
  void initState() {
    super.initState();
  }

  Future splash() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    Get.off(() => const MainPage(),
      transition: Transition.cupertino,
      duration: const Duration(milliseconds: 800),
    );
  }

  @override
  Widget build(BuildContext context) {
    splash();
    return Container(
      decoration: BoxDecoration(
        color: Colors.deepPurpleAccent
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 80,
                  left: 24,
                  right: 24
                ),
                child: SizedBox(
                    height: 80,
                    child: const Text('Splash Page')
                ),
              )
            )
          ]),
        ])
      ),
    );
  }
}
