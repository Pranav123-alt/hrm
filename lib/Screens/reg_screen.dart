import 'package:hrm/bloc_cubits/reg_cubit/reg_cubit.dart';
import 'package:hrm/bloc_cubits/reg_cubit/reg_state.dart';
import 'package:hrm/localization/app_localization.dart';
import 'package:hrm/routes/app_routes.dart' as route;
import 'package:hrm/widgets/input_field_widget.dart';
import 'package:hrm/helper/snackbar_helper.dart';
import 'package:hrm/widgets/button_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrm/helper/dialog.helper.dart';
import 'package:hrm/theme/app_dimension.dart';
import 'package:hrm/widgets/text_widget.dart';
import 'package:hrm/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

class RegScreen extends StatefulWidget {
  const RegScreen({Key? key}) : super(key: key);

  @override
  _RegScreenState createState() => _RegScreenState();
}

class _RegScreenState extends State<RegScreen> {
  var brightness;

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool get isPopulated =>
      _userNameController.text.isNotEmpty &&
      _emailController.text.isNotEmpty &&
      _mobileNumberController.text.isNotEmpty &&
      _passwordController.text.isNotEmpty &&
      _confirmPasswordController.text.isNotEmpty;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    brightness = MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
        .platformBrightness;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<RegCubit, RegState>(listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          CustomWidgets.buildErrorSnackbar(
              context: context,
              message: state.exceptionError,
              color: Colors.red);
          DialogHelper.dismissDialog(context);
        } else if (state.status.isSubmissionSuccess) {
          Navigator.of(context).pushNamedAndRemoveUntil(
              route.loginScreen, (Route<dynamic> route) => false);
        } else if (state.status.isSubmissionInProgress) {
          DialogHelper.showLoaderDialog(context);
        }
      }, builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                //
                children: [
                  _buildTitleWidget(),
                  const SizedBox(height: DIMENSION_30),
                  InputTextFormFieldWidget(
                    controller: _userNameController,
                    hintText: AppLocalization.of(context)!.translate('uname'),
                    textCapitalization: TextCapitalization.sentences,
                    textInputType: TextInputType.name,
                    actionKeyboard: TextInputAction.next,
                    prefixIcon: const Icon(
                      Icons.person,
                      color: hoverColorDarkColor,
                    ),
                    errorMessage: state.name.invalid
                        ? AppLocalization.of(context)!.translate('peuname')
                        : null,
                    onChange: (name) =>
                        context.read<RegCubit>().nameChanged(name),
                    parametersValidate:
                        AppLocalization.of(context)!.translate('peuname'),
                  ),
                  const SizedBox(height: DIMENSION_10),
                  InputTextFormFieldWidget(
                    controller: _emailController,
                    hintText: AppLocalization.of(context)!.translate('email'),
                    textCapitalization: TextCapitalization.sentences,
                    textInputType: TextInputType.emailAddress,
                    actionKeyboard: TextInputAction.next,
                    prefixIcon: const Icon(
                      Icons.email,
                      color: hoverColorDarkColor,
                    ),
                    errorMessage: state.email.invalid
                        ? AppLocalization.of(context)!.translate('peeid')
                        : null,
                    onChange: (name) =>
                        context.read<RegCubit>().emailChanged(name),
                    parametersValidate:
                        AppLocalization.of(context)!.translate('peeid'),
                  ),
                  const SizedBox(height: DIMENSION_10),
                  InputTextFormFieldWidget(
                    controller: _mobileNumberController,
                    hintText: AppLocalization.of(context)!.translate('pno'),
                    textCapitalization: TextCapitalization.sentences,
                    textInputType: TextInputType.number,
                    actionKeyboard: TextInputAction.next,
                    prefixIcon: const Icon(
                      Icons.call,
                      color: hoverColorDarkColor,
                    ),
                    errorMessage: state.number.invalid
                        ? AppLocalization.of(context)!.translate('peno')
                        : null,
                    onChange: (name) =>
                        context.read<RegCubit>().numberChanged(name),
                    parametersValidate:
                        AppLocalization.of(context)!.translate('peno'),
                  ),
                  const SizedBox(height: DIMENSION_10),
                  InputTextFormFieldWidget(
                    controller: _passwordController,
                    hintText:
                        AppLocalization.of(context)!.translate('password'),
                    textCapitalization: TextCapitalization.sentences,
                    textInputType: TextInputType.text,
                    actionKeyboard: TextInputAction.next,
                    obscureText: true,
                    showSuffixIcon: true,
                    maxLine: ONE,
                    suffixIcon: const Icon(Icons.visibility,
                        color: hoverColorDarkColor),
                    prefixIcon:
                        const Icon(Icons.lock, color: hoverColorDarkColor),
                    errorMessage: state.password.invalid
                        ? AppLocalization.of(context)!.translate('pepass')
                        : null,
                    onChange: (name) =>
                        context.read<RegCubit>().passwordChanged(name),
                    parametersValidate:
                        AppLocalization.of(context)!.translate('pepass'),
                  ),
                  const SizedBox(height: DIMENSION_10),
                  InputTextFormFieldWidget(
                    controller: _confirmPasswordController,
                    hintText: AppLocalization.of(context)!.translate('cpass'),
                    textCapitalization: TextCapitalization.sentences,
                    textInputType: TextInputType.text,
                    actionKeyboard: TextInputAction.next,
                    obscureText: false,
                    showSuffixIcon: false,
                    maxLine: ONE,
                    suffixIcon: const Icon(Icons.visibility,
                        color: hoverColorDarkColor),
                    prefixIcon:
                        const Icon(Icons.lock, color: hoverColorDarkColor),
                    errorMessage: state.confirmPassword.invalid
                        ? AppLocalization.of(context)!.translate('pecpass')
                        : null,
                    onChange: (name) => context
                        .read<RegCubit>()
                        .confirmPassword(name, _passwordController.text),
                    parametersValidate:
                        AppLocalization.of(context)!.translate('pecpass'),
                  ),
                  const SizedBox(height: DIMENSION_20),
                  ButtonWidget(
                    width: double.infinity,
                    title: AppLocalization.of(context)!.translate('signout'),
                    height: DIMENSION_42,
                    bTitleBold: true,
                    bgColor: (brightness == Brightness.dark)
                        ? buttonDarkColor
                        : buttonColor,
                    textColor: (brightness == Brightness.dark)
                        ? buttonDarkTextColor
                        : buttonTextColor,
                    disabledBgColor: (brightness == Brightness.dark)
                        ? disabledDarkColor
                        : disabledColor,
                    disabledTextColor: (brightness == Brightness.dark)
                        ? disabledTextDarkColor
                        : disabledTextColor,
                    bTitleS: true,
                    borderRadius: DIMENSION_5,
                    onClick: isPopulated && state.status.isValidated
                        ? () => context.read<RegCubit>().userReg("admin")
                        : null,
                  ),
                  const SizedBox(
                    height: DIMENSION_10,
                  ),
                  _buildSignUpText(brightness)
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  _buildSignUpText(brightness) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextWidget(
          text: AppLocalization.of(context)!.translate('ahaacc'),
          small: true,
          textColor:
              (brightness == Brightness.dark) ? textDarkColor : textColor,
        ),
        const SizedBox(width: DIMENSION_5),
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
                route.loginScreen, (Route<dynamic> route) => false);
          },
          child: TextWidget(
            text: AppLocalization.of(context)!.translate('signin'),
            medium: true,
            bold: true,
            textColor: (brightness == Brightness.dark)
                ? primaryDarkColor
                : primaryColor,
          ),
        ),
      ],
    );
  }

  _buildTitleWidget() {
    return TextWidget(
      text: AppLocalization.of(context)!.translate('signup'),
      title: true,
      bold: true,
      textColor:
          (brightness == Brightness.dark) ? primaryDarkColor : primaryColor,
    );
  }
}
