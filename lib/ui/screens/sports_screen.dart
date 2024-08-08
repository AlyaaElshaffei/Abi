import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/data/cubit/cubits.dart';
import 'package:myapp/data/cubit/states.dart';
import 'package:myapp/ui/widgets/article_item.dart';
//import 'package:myapp/ui/widgets/article_item.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({super.key});
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).sports;

        return ConditionalBuilder(
          condition: state is! GetSportsDataLoading,
          builder: (context) => ListView.separated(
            itemBuilder: (context, index) {
              return buildArticleItem(context,list[index]);
            },
            separatorBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Divider(
                  color: Colors.white,
                ),
              );
            },
            itemCount: list.length,
          ),
          fallback: (context) =>
              const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
