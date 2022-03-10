import 'package:flutter/material.dart';
import 'package:hrm/bloc_cubits/emp_cubit/emp_cubit.dart';
import 'package:hrm/bloc_cubits/emp_cubit/emp_state.dart';
import 'package:hrm/localization/app_localization.dart';
import 'package:hrm/routes/app_routes.dart' as route;
import 'package:hrm/widgets/input_field_widget.dart';
import 'package:hrm/helper/snackbar_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrm/widgets/button_widget.dart';
import 'package:hrm/helper/dialog.helper.dart';
import 'package:hrm/theme/app_dimension.dart';
import 'package:hrm/widgets/text_widget.dart';
import 'package:hrm/theme/app_colors.dart';
import 'package:formz/formz.dart';

class AddEmployee extends StatefulWidget {
  @override
  _AddEmployeeState createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  var brightness;

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _altMobileNumberController = TextEditingController();
  final TextEditingController _functionController = TextEditingController();
  final TextEditingController _departmentController = TextEditingController();
  final TextEditingController _dateOfJoiningController = TextEditingController();
  final TextEditingController _workingLocationController = TextEditingController();
  final TextEditingController _empEndDateController = TextEditingController();
  final TextEditingController _bloodGroupController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _aadharNoController = TextEditingController();
  final TextEditingController _panNoController = TextEditingController();
  final TextEditingController _pfNoController = TextEditingController();
  final TextEditingController _esicNoController = TextEditingController();
  final TextEditingController _wcPolicyController = TextEditingController();





  bool get isPopulated =>
      _userNameController.text.isNotEmpty &&
          _emailController.text.isNotEmpty &&
          _mobileNumberController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty &&
          _confirmPasswordController.text.isNotEmpty &&
          _dobController.text.isNotEmpty &&
           _genderController.text.isNotEmpty &&
          _altMobileNumberController.text.isNotEmpty &&
          _functionController.text.isNotEmpty &&
          _departmentController.text.isNotEmpty &&
           _dateOfJoiningController.text.isNotEmpty &&
          _workingLocationController.text.isNotEmpty &&
          _empEndDateController.text.isNotEmpty &&
          _bloodGroupController.text.isNotEmpty &&
          _addressController.text.isNotEmpty &&
          _aadharNoController.text.isNotEmpty &&
          _panNoController.text.isNotEmpty &&
          _pfNoController.text.isNotEmpty &&
          _esicNoController.text.isNotEmpty &&
          _wcPolicyController.text.isNotEmpty;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    brightness = MediaQueryData
        .fromWindow(WidgetsBinding.instance!.window)
        .platformBrightness;
  }

  late String gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: BlocConsumer<EmpCubit, EmpState>(listener: (context, state) {
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
              children: [
                _buildTitleWidget(),
                const SizedBox(height: DIMENSION_30),

                //1

                InputTextFormFieldWidget(
                  controller: _userNameController,
                  hintText: AppLocalization.of(context)!.translate('uname'),
                  functionValidate: (val){
                    if(val.toString().isEmpty){
                      print("This field can not be empty");
                    }
                  },
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
                      context.read<EmpCubit>().nameChanged(name),
                  parametersValidate:
                  AppLocalization.of(context)!.translate('peuname'),
                ),
                const SizedBox(height: DIMENSION_10),

                // 2 DOB

                InputTextFormFieldWidget(
                  controller: _dobController,
                  hintText: AppLocalization.of(context)!.translate('email'),
                  functionValidate: (val){
                    if(val.toString().isEmpty){
                      print("This field can not be empty");
                    }
                  },
                  textCapitalization: TextCapitalization.sentences,
                  textInputType: TextInputType.datetime,
                  actionKeyboard: TextInputAction.next,
                  prefixIcon: const Icon(
                    Icons.calendar_today,
                    color: hoverColorDarkColor,
                  ),
                  errorMessage: state.dob.invalid
                      ? AppLocalization.of(context)!.translate('peeid')
                      : null,
                  onChange: (name) =>
                      context.read<EmpCubit>().dobChanged(name),
                  parametersValidate:
                  AppLocalization.of(context)!.translate('peeid'),
                ),
                const SizedBox(height: DIMENSION_10),

                //3 Gender
/*
                DropdownButton(
                    value: gender,
                    items: [
                      DropdownMenuItem(
                        child: Text("MALE"),
                               value: 'MALE',
                      ),
                      DropdownMenuItem(
                        child: Text("FEMALE"),
                        value: 'FEMALE',
                      ),
                      DropdownMenuItem(
                        child: Text("OTHERS"),
                        value: 'OTHERS',
                      ),
                    ], onChanged:



                ),


*/


                InputTextFormFieldWidget(
                  controller: _genderController,
                  hintText: AppLocalization.of(context)!.translate('pno'),
                  functionValidate: (val){
                    if(val.toString().isEmpty){
                      print("This field can not be empty");
                    }
                  },
                  textCapitalization: TextCapitalization.sentences,
                  textInputType: TextInputType.name,
                  actionKeyboard: TextInputAction.next,
                  prefixIcon: const Icon(
                    Icons.transgender,
                    color: hoverColorDarkColor,
                  ),
                  errorMessage: state.gender.invalid
                      ? AppLocalization.of(context)!.translate('peno')
                      : null,
                  onChange: (name) =>
                      context.read<EmpCubit>().numberChanged(name),
                  parametersValidate:
                  AppLocalization.of(context)!.translate('peno'),
                ),
                const SizedBox(height: DIMENSION_10),


                //4 mobile no

                InputTextFormFieldWidget(
                  /*
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
                      context.read<EmpCubit>().passwordChanged(name),
                  parametersValidate:
                  AppLocalization.of(context)!.translate('pepass'),

                   */
                  controller: _mobileNumberController,
                  hintText: AppLocalization.of(context)!.translate('pno'),
                  functionValidate: (val){
                    if(val.toString().isEmpty){
                      print("This field can not be empty");
                    }
                  },
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
                      context.read<EmpCubit>().numberChanged(name),
                  parametersValidate:
                  AppLocalization.of(context)!.translate('peno'),
                ),
                const SizedBox(height: DIMENSION_10),

                //5 Alternate mobile no.

                InputTextFormFieldWidget(/*
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
                      .read<EmpCubit>()
                      .confirmPassword(name, _passwordController.text),
                  parametersValidate:
                  AppLocalization.of(context)!.translate('pecpass'), */
                  controller: _altMobileNumberController,
                  hintText: AppLocalization.of(context)!.translate('alpno'),
                  functionValidate: (val){
                    if(val.toString().isEmpty){
                      print("This field can not be empty");
                    }
                  },
                  textCapitalization: TextCapitalization.sentences,
                  textInputType: TextInputType.number,
                  actionKeyboard: TextInputAction.next,
                  prefixIcon: const Icon(
                    Icons.call,
                    color: hoverColorDarkColor,
                  ),
                  errorMessage: state.number.invalid
                      ? AppLocalization.of(context)!.translate('pealpno')
                      : null,
                  onChange: (name) =>
                      context.read<EmpCubit>().numberChanged(name),
                  parametersValidate:
                  AppLocalization.of(context)!.translate('pealpno'),
                ),

                // 6 Email
                InputTextFormFieldWidget(
                  controller: _emailController,
                  hintText: AppLocalization.of(context)!.translate('email'),
                  functionValidate: (val){
                    if(val.toString().isEmpty){
                      print("This field can not be empty");
                    }
                  },
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
                      context.read<EmpCubit>().emailChanged(name),
                  parametersValidate:
                  AppLocalization.of(context)!.translate('peeid'),
                ),
                const SizedBox(height: DIMENSION_10),

                // 7 function

                InputTextFormFieldWidget(
                  controller: _functionController,
                  hintText: AppLocalization.of(context)!.translate('function'),
                  functionValidate: (val){
                    if(val.toString().isEmpty){
                      print("This field can not be empty");
                    }
                  },
                  textCapitalization: TextCapitalization.sentences,
                  textInputType: TextInputType.text,
                  actionKeyboard: TextInputAction.next,
                  prefixIcon: const Icon(
                    Icons.person,
                    color: hoverColorDarkColor,
                  ),
                  errorMessage: state.name.invalid
                      ? AppLocalization.of(context)!.translate('pefunction')
                      : null,
                  onChange: (name) =>
                      context.read<EmpCubit>().nameChanged(name),
                  parametersValidate:
                  AppLocalization.of(context)!.translate('pefunction'),
                ),
                const SizedBox(height: DIMENSION_10),

                // 8 Dept

                InputTextFormFieldWidget(
                  controller: _departmentController,
                  hintText: AppLocalization.of(context)!.translate('department'),
                  functionValidate: (val){
                    if(val.toString().isEmpty){
                      print("This field can not be empty");
                    }
                  },
                  textCapitalization: TextCapitalization.sentences,
                  textInputType: TextInputType.name,
                  actionKeyboard: TextInputAction.next,
                  prefixIcon: const Icon(
                    Icons.account_balance,
                    color: hoverColorDarkColor,
                  ),
                  errorMessage: state.name.invalid
                      ? AppLocalization.of(context)!.translate('pedepartment')
                      : null,
                  onChange: (name) =>
                      context.read<EmpCubit>().nameChanged(name),
                  parametersValidate:
                  AppLocalization.of(context)!.translate('pedepartment'),
                ),
                const SizedBox(height: DIMENSION_10),

                // 9 Date of Joining
                InputTextFormFieldWidget(
                  controller: _dateOfJoiningController,
                  hintText: AppLocalization.of(context)!.translate('doj'),
                  functionValidate: (val){
                    if(val.toString().isEmpty){
                      print("This field can not be empty");
                    }
                  },
                  textCapitalization: TextCapitalization.sentences,
                  textInputType: TextInputType.datetime,
                  actionKeyboard: TextInputAction.next,
                  prefixIcon: const Icon(
                    Icons.person,
                    color: hoverColorDarkColor,
                  ),
                  errorMessage: state.dob.invalid
                      ? AppLocalization.of(context)!.translate('pedoj')
                      : null,
                  onChange: (name) =>
                      context.read<EmpCubit>().nameChanged(name),
                  parametersValidate:
                  AppLocalization.of(context)!.translate('pedoj'),
                ),
                const SizedBox(height: DIMENSION_10),

                //10 Working Location

                InputTextFormFieldWidget(
                  controller: _workingLocationController,
                  hintText: AppLocalization.of(context)!.translate('workinglocation'),
                  functionValidate: (val){
                    if(val.toString().isEmpty){
                      print("This field can not be empty");
                    }
                  },
                  textCapitalization: TextCapitalization.sentences,
                  textInputType: TextInputType.streetAddress,
                  actionKeyboard: TextInputAction.next,
                  prefixIcon: const Icon(
                    Icons.location_on,
                    color: hoverColorDarkColor,
                  ),
                  errorMessage: state.location.invalid
                      ? AppLocalization.of(context)!.translate('peworkinglocation')
                      : null,
                  onChange: (name) =>
                      context.read<EmpCubit>().nameChanged(name),
                  parametersValidate:
                  AppLocalization.of(context)!.translate('peworkinglocation'),
                ),
                const SizedBox(height: DIMENSION_10),

                // 11 Employment end date

                InputTextFormFieldWidget(
                  controller: _empEndDateController,
                  hintText: AppLocalization.of(context)!.translate('empenddate'),
                  functionValidate: (val){
                    if(val.toString().isEmpty){
                      print("This field can not be empty");
                    }
                  },
                  textCapitalization: TextCapitalization.sentences,
                  textInputType: TextInputType.streetAddress,
                  actionKeyboard: TextInputAction.next,
                  prefixIcon: const Icon(
                    Icons.location_on,
                    color: hoverColorDarkColor,
                  ),
                  errorMessage: state.location.invalid
                      ? AppLocalization.of(context)!.translate('peempenddate')
                      : null,
                  onChange: (name) =>
                      context.read<EmpCubit>().nameChanged(name),
                  parametersValidate:
                  AppLocalization.of(context)!.translate('peempenddate'),
                ),
                const SizedBox(height: DIMENSION_10),

                // 12 Blood grp

                InputTextFormFieldWidget(
                  controller: _bloodGroupController,
                  hintText: AppLocalization.of(context)!.translate('bloodbgrp'),
                  functionValidate: (val){
                    if(val.toString().isEmpty){
                      print("This field can not be empty");
                    }
                  },
                  textCapitalization: TextCapitalization.sentences,
                  textInputType: TextInputType.name,
                  actionKeyboard: TextInputAction.next,
                  prefixIcon: const Icon(
                    Icons.bloodtype,
                    color: hoverColorDarkColor,
                  ),
                  errorMessage: state.name.invalid
                      ? AppLocalization.of(context)!.translate('pebloodgrp')
                      : null,
                  onChange: (name) =>
                      context.read<EmpCubit>().nameChanged(name),
                  parametersValidate:
                  AppLocalization.of(context)!.translate('pebloodgrp'),
                ),
                const SizedBox(height: DIMENSION_10),

                // 13 Address

                InputTextFormFieldWidget(
                  controller: _addressController,
                  hintText: AppLocalization.of(context)!.translate('address'),
                  textCapitalization: TextCapitalization.sentences,
                  textInputType: TextInputType.streetAddress,
                  actionKeyboard: TextInputAction.next,
                  prefixIcon: const Icon(
                    Icons.location_on,
                    color: hoverColorDarkColor,
                  ),
                  errorMessage: state.location.invalid
                      ? AppLocalization.of(context)!.translate('peaddress')
                      : null,
                  onChange: (name) =>
                      context.read<EmpCubit>().nameChanged(name),
                  parametersValidate:
                  AppLocalization.of(context)!.translate('peaddress'),
                ),
                const SizedBox(height: DIMENSION_10),

                // 14 Aadhar no.

                InputTextFormFieldWidget(
                  controller: _aadharNoController,
                  hintText: AppLocalization.of(context)!.translate('aadharno'),
                  textCapitalization: TextCapitalization.sentences,
                  textInputType: TextInputType.number,
                  actionKeyboard: TextInputAction.next,
                  prefixIcon: const Icon(
                    Icons.numbers,
                    color: hoverColorDarkColor,
                  ),
                  errorMessage: state.number.invalid
                      ? AppLocalization.of(context)!.translate('peaadharno')
                      : null,
                  onChange: (name) =>
                      context.read<EmpCubit>().nameChanged(name),
                  parametersValidate:
                  AppLocalization.of(context)!.translate('peaadharno'),
                ),
                const SizedBox(height: DIMENSION_10),

                // 15 Pan no.

                InputTextFormFieldWidget(
                  controller: _panNoController,
                  hintText: AppLocalization.of(context)!.translate('panno'),
                  textCapitalization: TextCapitalization.sentences,
                  textInputType: TextInputType.text,
                  actionKeyboard: TextInputAction.next,
                  prefixIcon: const Icon(
                    Icons.numbers,
                    color: hoverColorDarkColor,
                  ),
                  errorMessage: state.name.invalid
                      ? AppLocalization.of(context)!.translate('pepanno')
                      : null,
                  onChange: (name) =>
                      context.read<EmpCubit>().nameChanged(name),
                  parametersValidate:
                  AppLocalization.of(context)!.translate('pepanno'),
                ),
                const SizedBox(height: DIMENSION_10),

                // 16 Pf no.

                InputTextFormFieldWidget(
                  controller: _pfNoController,
                  hintText: AppLocalization.of(context)!.translate('unpfno'),
                  textCapitalization: TextCapitalization.sentences,
                  textInputType: TextInputType.text,
                  actionKeyboard: TextInputAction.next,
                  prefixIcon: const Icon(
                    Icons.numbers,
                    color: hoverColorDarkColor,
                  ),
                  errorMessage: state.name.invalid
                      ? AppLocalization.of(context)!.translate('pepfno')
                      : null,
                  onChange: (name) =>
                      context.read<EmpCubit>().nameChanged(name),
                  parametersValidate:
                  AppLocalization.of(context)!.translate('pepfno'),
                ),
                const SizedBox(height: DIMENSION_10),

                // 17 Esic no.

                InputTextFormFieldWidget(
                  controller: _esicNoController,
                  hintText: AppLocalization.of(context)!.translate('esicno'),
                  textCapitalization: TextCapitalization.sentences,
                  textInputType: TextInputType.text,
                  actionKeyboard: TextInputAction.next,
                  prefixIcon: const Icon(
                    Icons.numbers,
                    color: hoverColorDarkColor,
                  ),
                  errorMessage: state.name.invalid
                      ? AppLocalization.of(context)!.translate('peesicno')
                      : null,
                  onChange: (name) =>
                      context.read<EmpCubit>().nameChanged(name),
                  parametersValidate:
                  AppLocalization.of(context)!.translate('peesicno'),
                ),
                const SizedBox(height: DIMENSION_10),

                // 18 Wc Policy

                InputTextFormFieldWidget(
                  controller: _wcPolicyController,
                  hintText: AppLocalization.of(context)!.translate('wcpolicy'),
                  textCapitalization: TextCapitalization.sentences,
                  textInputType: TextInputType.name,

                  actionKeyboard: TextInputAction.next,
                  prefixIcon: const Icon(
                    Icons.policy,
                    color: hoverColorDarkColor,
                  ),
                  errorMessage: state.name.invalid
                      ? AppLocalization.of(context)!.translate('pewcpolicy')
                      : null,
                  onChange: (name) =>
                      context.read<EmpCubit>().nameChanged(name),
                  parametersValidate:
                  AppLocalization.of(context)!.translate('pewcpolicy'),
                ),




                const SizedBox(height: DIMENSION_20),
                ButtonWidget(
                  width: double.infinity,
                  title: AppLocalization.of(context)!.translate('Add Employee'),
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
                      ? () => context.read<EmpCubit>().userReg("admin")
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
            text: AppLocalization.of(context)!.translate(''),
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
      text: AppLocalization.of(context)!.translate(' '),
      title: true,
      bold: true,
      textColor:
      (brightness == Brightness.dark) ? primaryDarkColor : primaryColor,
    );
  }

}

