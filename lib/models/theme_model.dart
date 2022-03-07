import 'package:objectbox/objectbox.dart';

@Entity()
class ThemesModel {
  int id = 0;
  String? appLang;

  ThemesModel({this.appLang});

  get getFullName => appLang;

  set setFullName(fullName) => appLang = fullName;

  @override
  String toString() {
    return 'UserEntity(id: $id, fullName: $appLang)';
  }
}