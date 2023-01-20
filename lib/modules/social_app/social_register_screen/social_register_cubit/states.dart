

abstract class SocialRegisterStates{}

class socialRegisterInitialState extends SocialRegisterStates{}

class socialRegisterLodingState extends SocialRegisterStates{}
class socialRegisterSuccefulState extends SocialRegisterStates{
}
class socialRegisterErrorState extends SocialRegisterStates{
  final String error;
  socialRegisterErrorState(this.error);
}

class socialCreateUserrSuccefulState extends SocialRegisterStates{
}
class socialCreateUserErrorState extends SocialRegisterStates{
  final String error;
  socialCreateUserErrorState(this.error);
}
class socialRegisterChangePasswordVisibilityState extends SocialRegisterStates{}

