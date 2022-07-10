import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_api_1/shared/components/components.dart';
import 'package:flutter_application_api_1/shared/cubit/cubit.dart';
import 'package:flutter_application_api_1/shared/cubit/cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Cubity, CubityState>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = Cubity.get(context).science;
          return ConditionalBuilder(
            condition: Cubity.get(context).science.isNotEmpty,
            builder: (context) => ListView.separated(
                itemBuilder: (context, index) => BuildArticalItem(list[index]),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: list.length),
            fallback: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
