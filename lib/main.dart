import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tasktodo/Views/edit_task.dart';
import 'package:tasktodo/Views/login.dart';
import 'package:tasktodo/utils/constants.dart';
import 'package:tasktodo/utils/size_config.dart';

Future<void> main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  // HttpOverrides.global = MyHttpOverrides();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {});
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraints, orientation);
        return GetMaterialApp(
          // translations: LocalString(),
          // locale: Locale('en', 'US'),
          initialRoute: '/',
          getPages: [
            GetPage(name: '/', page: () => Login()),
            GetPage(
                name: '/editTask',
                page: () => EditTask(),
                transition: Transition.zoom),
            // GetPage(
            //     name: '/third',
            //     page: () => Third(),
            //     transition: Transition.zoom),
          ],
          title: 'Auto Smart',
          debugShowCheckedModeBanner: false,

          // home: Login(),
        );
      });
    });
  }
}
