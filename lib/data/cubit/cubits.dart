import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/data/services/api_services.dart';
import 'package:myapp/ui/screens/business_screen.dart';
import 'package:myapp/ui/screens/general_news_screen.dart';
import 'package:myapp/ui/screens/sports_screen.dart';
import 'package:myapp/utils/app_constants.dart';
import 'package:myapp/utils/color_manager.dart';
import 'package:myapp/data/cubit/states.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsIntialSrates());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screens = [
    const BusinessScreen(),
    const GeneralNewsScreen(),
    const SportsScreen(),
  ];
  void changeBottomNavBar(index) {
    currentIndex = index;
    emit(ChangeBottomNavBarState());
  }

  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
      label: "business",
      icon: Icon(
        Icons.business,
        color: Color(ColorManager.bottomNavBarItemColor),
      ),
    ),
    const BottomNavigationBarItem(
      label: "General",
      icon: Icon(
        Icons.add_chart,
        color: Color(ColorManager.bottomNavBarItemColor),
      ),
    ),
    const BottomNavigationBarItem(
      label: "sports",
      icon: Icon(
        Icons.sports,
        color: Color(ColorManager.bottomNavBarItemColor),
      ),
    )
  ];

  List<dynamic> business = [];

  void GetBusiness() {
    emit(GetBusinessDataLoading());

    ApiServices.getData(url: AppConstants.topHeadline, query: {
      "apiKey": AppConstants.apiKey,
      "country": "eg",
      "category": "business",
    }).then((value) {
      //debugPrint(value.data["articles"][0]["title"]);
       business = value.data["articles"];

      emit(GetBusinessDataSuccessfully());
    }).catchError((error) {
      debugPrint(error.toString());

      emit(GetBusinessDataError(error.toString()));
    });
  }

  List<dynamic> general = [];
  void GetGeneralNews() {
    emit(GetGeneralDataLoading());

    ApiServices.getData(url: AppConstants.topHeadline, query: {
      "apiKey": AppConstants.apiKey,
      "country": "eg",
      "category": "general",
    }).then((value) {
     
      //debugPrint(value.data["articles"][0]["title"]);
        general = value.data["articles"];

      emit(GetGeneralDataSuccessfully());
    }).catchError((error) {
      debugPrint(error.toString());

      emit(GetGeneralDataError(error.toString()));
    });
  }

  List<dynamic> sports = [];

  void GetSportsNews() {
    emit(GetSportsDataLoading());

    ApiServices.getData(url: AppConstants.topHeadline, query: {
      "apiKey": AppConstants.apiKey,
      "country": "eg",
      "category": "sports",
    }).then((value) {
      //debugPrint(value.data["articles"][0]["title"]);
        sports = value.data["articles"];

      emit(GetSportsDataSuccessfully());
    }).catchError((error) {
      debugPrint(error.toString());

      emit(GetSportsDataError(error.toString()));
    });
  }
}
