
class UserProfile{
  late final String imagePath;
  late final String name;
  late final String email;
  late final String about;
  late final String phone;
  late final bool isDarkMode;

  UserProfile({required this.imagePath, required this.name, required this.email,required this.phone,
    required this.about, required this.isDarkMode,});

  UserProfile copy({
      String? imagePath,
      String? name,
      String? email,
      String? about,
     String? phone,
     bool? isDarkMode,

})=>
      UserProfile(
      imagePath: imagePath ?? this.imagePath,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      about:about ?? this.about,
      isDarkMode:isDarkMode ?? this.isDarkMode ,
      );

  static UserProfile fromJson(Map<String, dynamic> json) => UserProfile(
      imagePath: json['imagePath'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      about: json['about'],
      isDarkMode: json['isDarkMode']);

  Map<String, dynamic> toJson()=>{
    'imagePath':imagePath,
    'name':name,
    'email':email,
    'phone':phone,
    'about':about,
    'isDarkMode':isDarkMode
  };
}