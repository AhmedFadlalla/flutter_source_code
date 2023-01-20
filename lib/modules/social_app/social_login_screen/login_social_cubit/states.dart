import 'package:bmi_flutter_app/models/shop_app/login_model.dart';

abstract class SocialLoginStates{}

class socialLoginInitialState extends SocialLoginStates{}

class socialLoginLodingState extends SocialLoginStates{}
class socialLoginSuccefulState extends SocialLoginStates{
  final String uId;

  socialLoginSuccefulState(this.uId);
}
class socialLoginErrorState extends SocialLoginStates{
  final String error;
  socialLoginErrorState(this.error);
}
class socialLoginChangePasswordVisibilityState extends SocialLoginStates{}

