abstract class NewsStates {}

class NewsIntialSrates extends NewsStates {}

class ChangeBottomNavBarState extends NewsStates {}

class GetBusinessDataLoading extends NewsStates {}

class GetBusinessDataSuccessfully extends NewsStates {}

class GetBusinessDataError extends NewsStates {
  final String error;
  GetBusinessDataError(this.error);
}

class GetGeneralDataLoading extends NewsStates {}

class GetGeneralDataSuccessfully extends NewsStates {}

class GetGeneralDataError extends NewsStates {
  final String error;
  GetGeneralDataError(this.error);
}

class GetSportsDataLoading extends NewsStates {}

class GetSportsDataSuccessfully extends NewsStates {}

class GetSportsDataError extends NewsStates {
  final String error;
  GetSportsDataError(this.error);
}


