import 'package:hrm/theme/app_shared_preferences_constant.dart';
import 'package:hrm/bloc_cubits/login_cubit/login_cubit.dart';
import 'package:hrm/storage/cache/secure_storage_helper.dart';
import 'package:hrm/localization/app_localization.dart';
import 'package:hrm/routes/app_routes.dart' as route;
import 'package:hrm/widgets/card_view_widget.dart';
import 'package:hrm/widgets/toolbar_widget.dart';
import 'package:hrm/theme/app_dimension.dart';
import 'package:hrm/theme/app_colors.dart';
import 'package:provider/src/provider.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var brightness, userType;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    brightness = MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
        .platformBrightness;

    getUserData();
  }

  getUserData() async {
    userType =
        await SecStore.getValue(keyVal: SharedPreferencesConstant.userType);
    print("userType => $userType");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (brightness == Brightness.dark)
          ? backgroundDarkColor
          : backgroundColor,
      appBar: ToolbarWidget(
        leading: const Icon(Icons.arrow_back_outlined),
        onClick: () {
          Navigator.of(context).pop();
        },
        title: AppLocalization.of(context)!.translate('profile')!,
        actions: const [
          Icon(
            Icons.notifications,
            size: DIMENSION_28,
          ),
          SizedBox(
            width: DIMENSION_12,
          )
        ],
      ),
      body: Column(children: [
        const SizedBox(height: DIMENSION_20),
        CardViewWidget(
          backgroundColor:
              (brightness == Brightness.dark) ? cardDarkColor : cardColor,
          width: MediaQuery.of(context).size.width,
          height: DIMENSION_55,
          elevation: DIMENSION_1,
          child: Row(
            children: [
              Flexible(
                child: ListTile(
                  leading: const Icon(Icons.ac_unit,
                      size: DIMENSION_24, color: primaryColor),
                  title: Text(
                    AppLocalization.of(context)!.translate('mad')!,
                    textScaleFactor: DIMENSION_1_50,
                    style: const TextStyle(
                        fontSize: DIMENSION_10, fontWeight: FontWeight.bold),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: DIMENSION_16,
                  ),
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: DIMENSION_10),
        CardViewWidget(
          backgroundColor:
              (brightness == Brightness.dark) ? cardDarkColor : cardColor,
          width: MediaQuery.of(context).size.width,
          height: DIMENSION_55,
          elevation: DIMENSION_1,
          child: Row(
            children: [
              Flexible(
                child: ListTile(
                  leading: const Icon(Icons.ac_unit,
                      size: DIMENSION_24, color: primaryColor),
                  title: Text(
                    AppLocalization.of(context)!.translate('preferences')!,
                    textScaleFactor: DIMENSION_1_50,
                    style: const TextStyle(
                        fontSize: DIMENSION_10, fontWeight: FontWeight.bold),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: DIMENSION_16,
                  ),
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
        userType != "Patient"
            ? const SizedBox(height: DIMENSION_10)
            : Container(
                height: 0,
              ),
        userType != "Patient"
            ? CardViewWidget(
                backgroundColor:
                    (brightness == Brightness.dark) ? cardDarkColor : cardColor,
                width: MediaQuery.of(context).size.width,
                height: DIMENSION_55,
                elevation: DIMENSION_1,
                child: Row(
                  children: [
                    Flexible(
                      child: ListTile(
                        leading: const Icon(Icons.ac_unit,
                            size: DIMENSION_24, color: primaryColor),
                        title: Text(
                          AppLocalization.of(context)!.translate('mpt')!,
                          textScaleFactor: DIMENSION_1_50,
                          style: const TextStyle(
                              fontSize: DIMENSION_10,
                              fontWeight: FontWeight.bold),
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios_sharp,
                          size: DIMENSION_16,
                        ),
                        onTap: () {
                          //Navigator.pushNamed(context, route.patientsScreen);
                        },
                      ),
                    ),
                  ],
                ),
              )
            : Container(
                height: 0,
              ),
        const SizedBox(height: DIMENSION_10),
        CardViewWidget(
          backgroundColor:
              (brightness == Brightness.dark) ? cardDarkColor : cardColor,
          width: MediaQuery.of(context).size.width,
          height: DIMENSION_55,
          elevation: DIMENSION_1,
          child: Row(
            children: [
              Flexible(
                child: ListTile(
                  leading: const Icon(Icons.g_translate,
                      size: DIMENSION_24, color: primaryColor),
                  title: Text(
                    AppLocalization.of(context)!.translate('clang')!,
                    textScaleFactor: DIMENSION_1_50,
                    style: const TextStyle(
                        fontSize: DIMENSION_10, fontWeight: FontWeight.bold),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: DIMENSION_16,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, route.chooseLangScreen);
                  },
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: DIMENSION_30),
        CardViewWidget(
          backgroundColor:
              (brightness == Brightness.dark) ? cardDarkColor : cardColor,
          width: MediaQuery.of(context).size.width,
          height: DIMENSION_55,
          elevation: DIMENSION_1,
          child: Row(
            children: [
              Flexible(
                child: ListTile(
                  leading: const Icon(Icons.arrow_drop_down_circle,
                      size: DIMENSION_24, color: primaryColor),
                  title: Text(
                    AppLocalization.of(context)!.translate('ihas')!,
                    textScaleFactor: DIMENSION_1_50,
                    style: const TextStyle(
                        fontSize: DIMENSION_10, fontWeight: FontWeight.bold),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: DIMENSION_16,
                  ),
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: DIMENSION_1,
        ),
        CardViewWidget(
          backgroundColor:
              (brightness == Brightness.dark) ? cardDarkColor : cardColor,
          width: MediaQuery.of(context).size.width,
          height: DIMENSION_55,
          elevation: DIMENSION_1,
          child: Row(
            children: [
              Flexible(
                child: ListTile(
                  leading: const Icon(Icons.error,
                      size: DIMENSION_24, color: primaryColor),
                  title: Text(
                    AppLocalization.of(context)!.translate('ata')!,
                    textScaleFactor: DIMENSION_1_50,
                    style: const TextStyle(
                        fontSize: DIMENSION_10, fontWeight: FontWeight.bold),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: DIMENSION_16,
                  ),
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: DIMENSION_1,
        ),
        CardViewWidget(
          backgroundColor:
              (brightness == Brightness.dark) ? cardDarkColor : cardColor,
          width: MediaQuery.of(context).size.width,
          height: DIMENSION_55,
          elevation: DIMENSION_1,
          child: Row(
            children: [
              Flexible(
                child: ListTile(
                  leading: const Icon(Icons.description,
                      size: DIMENSION_24, color: primaryColor),
                  title: Text(
                    AppLocalization.of(context)!.translate('tac')!,
                    textScaleFactor: DIMENSION_1_50,
                    style: const TextStyle(
                        fontSize: DIMENSION_10, fontWeight: FontWeight.bold),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: DIMENSION_16,
                  ),
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: DIMENSION_30,
        ),
        CardViewWidget(
          backgroundColor:
              (brightness == Brightness.dark) ? cardDarkColor : cardColor,
          width: MediaQuery.of(context).size.width,
          height: DIMENSION_55,
          elevation: DIMENSION_1,
          child: Row(
            children: [
              Flexible(
                child: ListTile(
                  leading: const Icon(Icons.logout_rounded,
                      size: DIMENSION_24, color: primaryColor),
                  title: Text(
                    AppLocalization.of(context)!.translate('logout')!,
                    textScaleFactor: DIMENSION_1_50,
                    style: const TextStyle(
                        fontSize: DIMENSION_10, fontWeight: FontWeight.bold),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: DIMENSION_16,
                  ),
                  onTap: () {
                    context.read<LoginCubit>().logout();
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        route.loginScreen, (Route<dynamic> route) => false);
                  },
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
