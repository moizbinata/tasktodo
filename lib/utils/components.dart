import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tasktodo/utils/constants.dart';
import 'package:tasktodo/utils/size_config.dart';

Widget regularText(
    String title, double size, Color color, FontWeight fontWeight) {
  return Text(
    title,
    overflow: TextOverflow.ellipsis,
    textAlign: TextAlign.left,
    maxLines: 3,
    style: TextStyle(
      color: color,
      fontFamily: 'Roboto',
      fontSize: SizeConfig.textMultiplier * size,
      fontWeight: fontWeight,
    ),
  );
}

customImpDec2(String s) {
  return InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(15, 0, 15, 0),
      border: CustomBorder.enabledBorder,
      // labelText: s,
      hintText: s,
      hintStyle: TextStyle(color: Constants.grey.withOpacity(0.25)),
      focusedBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      labelStyle: TextStyle(
        fontSize: SizeConfig.textMultiplier * 1.9,
        color: Constants.blackGrey,
      ),
      floatingLabelBehavior: FloatingLabelBehavior.auto);
}

class CustomBorder {
  static var enabledBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(color: Colors.grey));

  static var focusBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(color: ThemeData.light().primaryColor, width: 1));

  static var errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(color: Colors.red, width: 1));
}

textFieldIcon(icon, textController, fieldHint) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Expanded(
        flex: 1,
        child: FaIcon(
          icon,
          color: Constants.grey,
          size: SizeConfig.textMultiplier * 2.8,
        ),
      ),
      Expanded(
        flex: 10,
        child: TextFormField(
          controller: textController,
          decoration: customImpDec2(fieldHint),
        ),
      ),
    ],
  );
}

googleButton() {
  return Container(
    decoration: BoxDecoration(
        color: Color(0xffDD4B39), borderRadius: BorderRadius.circular(100)),
    width: SizeConfig.heightMultiplier * 5,
    height: SizeConfig.heightMultiplier * 5,
    child: Center(
      child: FaIcon(
        FontAwesomeIcons.googlePlusG,
        size: SizeConfig.heightMultiplier * 3,
        color: Colors.white,
      ),
    ),
  );
}

verticalSpacer() {
  return SizedBox(
    height: SizeConfig.heightMultiplier * 10,
  );
}
