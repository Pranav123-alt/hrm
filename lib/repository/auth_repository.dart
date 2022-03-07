import 'package:hrm/models/user_model.dart';
import 'package:hrm/objectbox.g.dart';
import 'package:hrm/main.dart';
import 'package:hrm/storage/cache/secure_storage_helper.dart';
import 'package:hrm/theme/app_shared_preferences_constant.dart';
import 'package:hrm/utils/encryption_utils.data.dart';

class AuthRepository {
  late final Box<UserModel> userBox = objectbox.store.box<UserModel>();
  late Query<UserModel> userQuery;

  String? userRegistrationUser(UserModel userModel) {
    if (!checkUserEmail(userModel.getEmail)) {
      return '0';
    } else {
      String caretakerId = userBox.put(userModel).toString();
      return caretakerId;
    }
  }

  bool checkUserEmail(String email) {
    userQuery = userBox.query(UserModel_.email.equals(email)).build();
    List<UserModel> caretakerData = userQuery.find();
    userQuery.close();
    if (caretakerData.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  String? userLogin(String userName, String password) {
    if (checkUserEmail(EncryptData.encryptAES(userName))) {
      return '0';
    } else {
      userQuery = userBox
          .query(UserModel_.email.equals(EncryptData.encryptAES(userName)))
          .build();
      List<UserModel> patientData = userQuery.find();
      userQuery.close();
      print(
          "object ${EncryptData.decryptAES(patientData[0].password)} => $password");
      print("object ${patientData[0].id.toString()}");
      if (EncryptData.decryptAES(patientData[0].password) == password) {
        SecStore.setValue(
            keyVal: SharedPreferencesConstant.userType,
            value: EncryptData.decryptAES(patientData[0].userType)!);
        SecStore.setValue(
            keyVal: SharedPreferencesConstant.userEmail,
            value: EncryptData.decryptAES(patientData[0].email!));
        return patientData[0].id.toString();
      } else {
        return "2";
      }
    }
  }
}
