abstract class SignupState {}

class SignupInitial extends SignupState {}

class GetSignupSuccessState extends SignupState {}

class GetSignupErrorState extends SignupState {}

class SignupLoadingState extends SignupState {}

class VisiblePasswordState extends SignupState {}

class VisibleConfirmPasswordState extends SignupState {}

class ChangeGenderState extends SignupState {}
