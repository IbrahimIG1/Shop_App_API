import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_api_1/shared/cubit/cubit.dart';
import 'package:flutter_application_api_1/shared/cubit/observer.dart';
import 'package:flutter_application_api_1/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'screens/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var size = DesktopWindow.getWindowSize();
  print(size.toString());
  // if (Platform.isWindows) {
    DesktopWindow.setMinWindowSize(Size(500, 650));
  // }
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(const Appy());
}

class Appy extends StatelessWidget {
  const Appy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: 
        [BlocProvider(create:(context)=> Cubity()..getBusiness())

        ],
        child: MaterialApp(
            theme: ThemeData(
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: const AppBarTheme(
                    // ignore: deprecated_member_use
                    backwardsCompatibility: false,
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: Colors.red,
                        statusBarBrightness: Brightness.dark,
                        statusBarIconBrightness: Brightness.dark),
                    backgroundColor: Colors.white,
                    iconTheme: IconThemeData(color: Colors.black, size: 25),
                    titleTextStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    elevation: 0),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: Colors.deepOrange)),
            home: MyAPIApp(),
              ));
  }
}
