import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:tasktodo/Views/edit_task.dart';
import 'package:tasktodo/Views/login.dart';
import 'package:tasktodo/auth/check_auth.dart';
import 'package:tasktodo/auth/google_sign_in.dart';
import 'package:tasktodo/utils/constants.dart';
import 'package:tasktodo/utils/size_config.dart';

Future<void> main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // HttpOverrides.global = MyHttpOverrides();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {});
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          print("error");
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Container(
              child: Text("Error"),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          print("connection state done");
          return LayoutBuilder(builder: (context, constraints) {
            return OrientationBuilder(builder: (context, orientation) {
              SizeConfig().init(constraints, orientation);
              return ChangeNotifierProvider(
                create: (context) => GoogleSignInProvider(),
                child: GetMaterialApp(
                  title: 'HRmove',
                  debugShowCheckedModeBanner: false,
                  initialRoute: '/',
                  getPages: [
                    GetPage(name: '/', page: () => CheckAuth()),
                    GetPage(
                        name: '/editTask',
                        page: () => EditTask(),
                        transition: Transition.zoom),
                  ],
                  theme: ThemeData(
                    brightness: Brightness.dark,
                    primaryColor: Colors.lightBlue[800],
                    accentColor: Colors.cyan[600],
                    primarySwatch: Colors.amber,
                    buttonTheme: const ButtonThemeData(
                      buttonColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(),
                      textTheme: ButtonTextTheme.primary,
                    ),
                    textTheme: const TextTheme(
                      headline1: TextStyle(
                          fontSize: 72.0, fontWeight: FontWeight.bold),
                      headline6: TextStyle(
                        fontSize: 24.0,
                        color: Colors.white,
                      ),
                      bodyText2: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                  home: Login(),
                ),
              );
            });
          });
        } else {
          print("not connecting");
          return MaterialApp(
            title: 'HRmove',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              brightness: Brightness.dark,
              primaryColor: Colors.lightBlue[800],
              accentColor: Colors.cyan[600],
              primarySwatch: Colors.amber,
              // textTheme: GoogleFonts.latoTextTheme(),
            ),
            home: Container(
              child: Text("Not connecting"),
            ),
          );
        }
      },
    );

    // return LayoutBuilder(builder: (context, constraints) {
    //   return OrientationBuilder(builder: (context, orientation) {
    //     SizeConfig().init(constraints, orientation);
    //     return GetMaterialApp(
    //       // translations: LocalString(),
    //       // locale: Locale('en', 'US'),
    //       initialRoute: '/',
    //       getPages: [
    //         GetPage(name: '/', page: () => CheckAuth()),
    //         GetPage(
    //             name: '/editTask',
    //             page: () => EditTask(),
    //             transition: Transition.zoom),
    //
    //       ],
    //       title: 'Auto Smart',
    //       debugShowCheckedModeBanner: false,

    //       // home: Login(),
    //     );
    //   });
    // });
  }
}
