import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/data/cubit/bloc_observer.dart';
import 'package:myapp/data/cubit/cubit/theme_cubit_cubit.dart';
import 'package:myapp/data/services/api_services.dart';
import 'package:myapp/ui/screens/HomeLayout.dart';


void main() {
  Bloc.observer = MyBlocObserver();
  ApiServices.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubitCubit(),
      child:BlocBuilder<ThemeCubitCubit,ThemeData>(
        builder: (context, themeState) {
      return MaterialApp(
        theme: themeState,

        home: HomeLayout(),
        debugShowCheckedModeBanner: false,
        // This trailing comma makes auto-formatting nicer for build methods.
      );
        },
      ),
    );
  }
}
