import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home_data_controller.dart';
import 'package:movielab/pages/show/show_box/show_box.dart';

class HomePopularMovies extends StatelessWidget {
  const HomePopularMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 265,
      child: Row(
        children: [
          Expanded(
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: Get.find<HomeDataController>().popularMovies.length,
                itemBuilder: (context, index) {
                  return ShowBox(
                      show:
                          Get.find<HomeDataController>().popularMovies[index]);
                }),
          ),
        ],
      ),
    );
  }
}
