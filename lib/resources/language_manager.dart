import 'app_strings.dart';

enum LanguageType{
  ENGLISH,
  ARABIC,
  FRENCH
}

extension LanguageTypeExtension on LanguageType{
  String getValue(){
    switch(this){

      case LanguageType.ENGLISH:
        return  AppStrings.ENGLISH;

      case LanguageType.ARABIC:
        return  AppStrings.ARABIC;

      case LanguageType.FRENCH:
        return AppStrings.FRENCH;
    }
  }
}