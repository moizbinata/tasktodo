import 'package:flutter/material.dart';

import 'package:tasktodo/utils/constants.dart';

class EditTask extends StatelessWidget {
  const EditTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      appBar: AppBar(
        backgroundColor: Constants.primaryColor,
        leading: IconButton(
          onPressed: () {
            // Get.offAndToNamed(Login());
          },
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: Container(),
    );
  }
}
