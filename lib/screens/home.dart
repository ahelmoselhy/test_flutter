import 'package:flutter/material.dart';
import 'package:test_flutter/colors/color.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: _buildAppBar(),
      body: _buildContainer(),
    );
  }

  Container _buildContainer(){
    return Container(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
            child: TextField(),
          )
        ],
      ),
    );
  }
  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: backgroundColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.menu, color: black, size: 30),
          SizedBox(
            height: 40,
            width: 40,
            child: ClipRRect(
              child: Image.asset("assets/images/profile_images_for_test.jpg"),
            ),
          )
        ],
      ),
    );
  }
}
