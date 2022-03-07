import 'package:objectbox/objectbox.dart';

@Entity()
class UserModel {
  int id = 0;
  String? fullName;
  String? phone;
  String? email;
  String? password;
  String? userType;

  UserModel(
      {this.fullName, this.email, this.phone, this.password, this.userType});

  //final careGiver = ToOne<CareTakerModel>();

  get getFullName => fullName;

  set setFullName(fullName) => this.fullName = fullName;

  get getPhone => phone;

  set setPhone(phone) => this.phone = phone;

  get getEmail => email;

  set setEmail(email) => this.email = email;

  get getPassword => password;

  set setPassword(password) => this.password = password;

  get getUserType => userType;

  set setUserType(userType) => this.userType = userType;

  @override
  String toString() {
    return 'UserEntity(id: $id, fullName: $fullName, phone: $phone'
        'email: $email, password: $password, userType: $userType)';
  }
}
