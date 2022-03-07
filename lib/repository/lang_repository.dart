import 'package:hrm/models/theme_model.dart';
import 'package:hrm/objectbox.g.dart';
import 'package:hrm/main.dart';

class ThemeRepository {
  final Box<ThemesModel> langUserBox = objectbox.store.box<ThemesModel>();
  Query<ThemesModel>? langQuery;

  String? saveLang(String lang) {
    String langId = langUserBox.put(ThemesModel(appLang: lang)).toString();
    return langId;
  }

  getLang() {
    langQuery = langUserBox.query().build();
    List<ThemesModel> langData = langQuery!.find();
    langQuery!.close();
    if (langData.isNotEmpty) {
      return langData[langData.length-1].appLang.toString();
    } else {
      return "";
    }
  }
}