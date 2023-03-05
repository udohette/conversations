class APIEndPoints{
  static const String baseUrl = "https://social-backend-377617.uw.r.appspot.com/";
  static _UserEndPoints userEndPoint = _UserEndPoints();

}
class _UserEndPoints{
  final String registerEmail = "conversation/user/registration";
  final String login = "conversation/user/login_otp";
  final String loginOTPVerification = "conversation/user/login_otp";
  final String userActivation = "conversation/user/activation/user_id=80/v_code=W3A47L";
}
