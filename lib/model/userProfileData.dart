class UserProfile{
  late final String imagePath;
  late final String name;
  late final String email;
  late final String about;
  final String phone;
  final String status;
  late final bool isDarkMode;

  UserProfile(
      this.imagePath, this.name, this.email, this.about, this.isDarkMode, this.phone, this.status);
}