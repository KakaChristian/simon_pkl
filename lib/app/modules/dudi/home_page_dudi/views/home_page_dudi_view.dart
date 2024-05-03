import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_page_dudi_controller.dart';

class HomePageDudiView extends GetView<HomePageDudiController> {
  const HomePageDudiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePageDudiView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'HomePageDudiView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
