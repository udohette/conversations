class APIEndPoints{
  static const String baseUrl = "https://social-backend-377617.uw.r.appspot.com/";
  static _UserEndPoints userEndPoint = _UserEndPoints();

}
class _UserEndPoints{
  final String registerEmail = "conversation/user/registration";
  final String userActivation = "conversation/user/activation";
  final String login = "conversation/user/login_otp";
  final String loginOTP = "conversation/user/login_otp";
  final String otpVerification = "conversation/user/login_otp";
}

