import 'package:flutter/material.dart';
import 'package:flutter_application_api_1/shared/cubit/cubit.dart';
import 'package:flutter_application_api_1/shared/cubit/cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyAPIApp extends StatelessWidget {
  const MyAPIApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Cubity, CubityState>(
      listener: (context, state) {},
      builder: (context, state) {
        Cubity cubity = Cubity.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'API APP',
            ),
          ),
          drawer: const Drawer(),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubity.indexNav,
              onTap: (value) {
                cubity.navChangeIcon(value);
              },
              items: cubity.navThemItems),
          body: cubity.listScreens[cubity.indexNav],
        );
      },
    );
  }
}
