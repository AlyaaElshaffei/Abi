import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/data/cubit/cubit/theme_cubit_cubit.dart';
import 'package:myapp/data/cubit/cubits.dart';
import 'package:myapp/data/cubit/states.dart';
//import 'package:myapp/data/services/api_services.dart';
//import 'package:myapp/utils/app_constants.dart';
import 'package:myapp/utils/color_manager.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()
        ..GetBusiness()
        ..GetGeneralNews()
        ..GetSportsNews(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              title: Text("News Api"),
              actions: [
                IconButton(
                    onPressed: () {
                      context.read<ThemeCubitCubit>().toggleTheme();
                    },
                    icon:Theme(
                      data:ThemeData(
                        iconTheme: const IconThemeData(
                          color: Colors.white ,)
                      ),
                          child:
                    const Icon(Icons.brightness_2))),
                      
                

              ],
            ),
            backgroundColor: const Color(ColorManager.ScaffoldCplor),
            // floatingActionButton: FloatingActionButton(
            //   child: const Icon(Icons.add),
            //   backgroundColor:
            //       const Color(ColorManager.bottomNavBarBackgroundColor),
            //   onPressed: () {
            //     ApiServices.getData(url: AppConstants.topHeadline, query: {
            //       "apiKey": AppConstants.apiKey,
            //       "country": "eg",
            //       "category": "general",
            //     }).then((value) {
            //       debugPrint(value.data["articles"][0]["title"]);
            //     }).catchError((error) {
            //       debugPrint(error.toString());
            //     });
            //   },
            // ),
            bottomNavigationBar: BottomNavigationBar(
              // selectedItemColor: Colors.white,
              // type: BottomNavigationBarType.fixed,
              // backgroundColor: Color(ColorManager.bottomNavBarBackgroundColor),
              items: cubit.bottomItems,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeBottomNavBar(index);
              },
            ),
            body: cubit.screens[cubit.currentIndex],
          );
        },
      ),
    );
  }
}
