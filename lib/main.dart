import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/controllers/navigation_controller.dart';
import 'package:flutter_web_dashboard/layout.dart';
import 'package:flutter_web_dashboard/pages/404/error.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'helpers/user.dart';
import 'pages/home/home.dart';
import 'routing/routes.dart';

void main() async {
    WidgetsFlutterBinding.ensureInitialized();
          final prefs = await SharedPreferences.getInstance().then((value){
            if(value.containsKey("email")){
              User().logedIn = true;
              User().userEmail = value.getString("email");
            }
          });

    await Firebase.initializeApp(options: FirebaseOptions(
      
  apiKey: "AIzaSyCGh4cZWMDH1lrttcvAXOBYW9k_5oHmJIc",
  authDomain: "blogs-ea78a.firebaseapp.com",
  projectId: "blogs-ea78a",
  storageBucket: "blogs-ea78a.appspot.com",
  messagingSenderId: "230299640116",
  appId: "1:230299640116:web:cbab265d03df13440c4561",
  measurementId: "G-2M8TGGVKFS"

    ));
  Get.put(NavigationController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialRoute: authenticationPageRoute,
        unknownRoute: GetPage(name: '/not-found', page: () => PageNotFound(), transition: Transition.fadeIn),
        getPages: [
        GetPage(name: rootRoute, page: () {
          return SiteLayout();
        }),
        GetPage(name: authenticationPageRoute, page: () => HomeScreen()),
      ],
      debugShowCheckedModeBanner: false,
      title: 'Blogs',
      theme: ThemeData(
        scaffoldBackgroundColor: light,
        textTheme: GoogleFonts.mulishTextTheme(Theme.of(context).textTheme).apply(
          bodyColor: Colors.black
        ),
            pageTransitionsTheme: PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
      }
    ),
        primarySwatch: Colors.blue,
      ),
    );
  }
}
