import 'package:hrm/localization/app_localization.dart';
import 'package:hrm/routes/app_routes.dart' as route;
import 'package:hrm/widgets/toolbar_widget.dart';
import 'package:hrm/theme/app_dimension.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool openMenu = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ToolbarWidget(
        title: AppLocalization.of(context)!.translate('home')!,
        hideBackArrow: true,
        leading: const Icon(
          Icons.account_circle,
          size: DIMENSION_30,
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications,
              size: DIMENSION_28,
            ),
            onPressed: () {
              setState(() {
                openMenu = !openMenu;
              });
            },
          ),
          const SizedBox(
            width: DIMENSION_12,
          )
        ],
        onClick: () {
          Navigator.of(context).pushNamed(route.settingScreen);
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Center(
            child: Text(
              "Dashboard",
              style: TextStyle(color: Colors.black45),
            ),
          )
        ],
      ),
    );
  }
}
