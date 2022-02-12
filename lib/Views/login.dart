import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:tasktodo/Views/edit_task.dart';
import 'package:tasktodo/utils/components.dart';
import 'package:tasktodo/utils/constants.dart';
import 'package:tasktodo/utils/size_config.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController userController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Container(
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight,
        padding: EdgeInsetsDirectional.fromSTEB(SizeConfig.heightMultiplier * 6,
            0, SizeConfig.heightMultiplier * 6, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: SizeConfig.heightMultiplier * 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  regularText(
                      "THINGS", 4.0, Constants.blackGrey, FontWeight.normal),
                  Transform.translate(
                    offset: Offset(0, -10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        regularText(
                            "TOD", 5.0, Constants.blackGrey, FontWeight.w900),
                        Image.asset(
                          "assets/img/logo.png",
                          width: SizeConfig.heightMultiplier * 4.5,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            verticalSpacer(),
            Container(
              padding: EdgeInsetsDirectional.only(
                start: SizeConfig.heightMultiplier * 3,
                end: SizeConfig.heightMultiplier * 3,
              ),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Constants.grey.withOpacity(0.25), width: 1)),
              // width: SizeConfig.heightMultiplier * 8,
              child: Column(
                children: [
                  textFieldIcon(
                    FontAwesomeIcons.user,
                    userController,
                    'Username',
                  ),
                  Divider(
                    color: Constants.grey.withOpacity(0.25),
                    thickness: 1,
                  ),
                  textFieldIcon(
                    Icons.lock_outline,
                    userController,
                    'Password',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Constants.primaryColor,
                  padding: EdgeInsets.only(
                    top: SizeConfig.heightMultiplier * 2,
                    bottom: SizeConfig.heightMultiplier * 2,
                  ),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                onPressed: () {
                  Get.offAndToNamed('/editTask');
                },
                child: regularText(
                  "LOGIN",
                  2.0,
                  Colors.white,
                  FontWeight.normal,
                ),
              ),
            ),
            verticalSpacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 8,
                  child: Container(
                    height: 1,
                    width: double.infinity,
                    color: Constants.grey.withOpacity(0.25),
                  ),
                ),
                Expanded(
                    flex: 4,
                    child: Center(
                      child: regularText("OR", 2.4,
                          Constants.grey.withOpacity(0.25), FontWeight.normal),
                    )),
                Expanded(
                  flex: 8,
                  child: Container(
                    height: 1,
                    width: double.infinity,
                    color: Constants.grey.withOpacity(0.25),
                  ),
                ),
              ],
            ),
            regularText("login using social media", 1.8,
                Constants.black.withOpacity(0.3), FontWeight.normal),
            SizedBox(
              height: 35,
            ),
            InkWell(
              onTap: () {},
              child: googleButton(),
            )
          ],
        ),
      )),
    );
  }
}
