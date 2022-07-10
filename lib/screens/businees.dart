import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_api_1/shared/components/components.dart';
import 'package:flutter_application_api_1/shared/cubit/cubit.dart';
import 'package:flutter_application_api_1/shared/cubit/cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Cubity, CubityState>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = Cubity.get(context).business;
          return ScreenTypeLayout(
            mobile: Builder(
              builder: (context) {
                Cubity.get(context).setDesktop(false);
                return businessLayout(context, list);
              },
            ),
            desktop: Builder(
              builder: (context) {
                Cubity.get(context).setDesktop(true);

                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: businessLayout(context, list),
                    ),
                    if (list.length > 0)
                      Expanded(
                          child: Container(
                              height: double.infinity,
                              color: Colors.grey[200],
                              child: Text(
                                  "${list[Cubity.get(context).selectedItem]['description']}")))
                  ],
                );
              }
            ),
            breakpoints:
                ScreenBreakpoints(desktop: 600, tablet: 300, watch: 300),
          );
        });
  }

  Widget businessLayout(context, List list) => ConditionalBuilder(
        condition: Cubity.get(context).business.isNotEmpty,
        builder: (context) => ListView.separated(
            itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Cubity.get(context).changeSelectedItem(index);
                },
                child: Container(
                    color: Cubity.get(context).selectedItem == index &&
                            Cubity.get(context).isDesktop == true
                        ? Colors.grey[200]
                        : null,
                    child: BuildArticalItem(list[index]))),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: list.length),
        fallback: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
      );
}
