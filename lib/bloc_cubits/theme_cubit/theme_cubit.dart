import 'package:hrm/bloc_cubits/theme_cubit/theme_state.dart';
import 'package:hrm/repository/lang_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrm/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit(this.themeRepository) : super(const ThemeState(themeMode: ThemeMode.light)) {
    updateAppTheme();
    changeStartLang();
  }

  ThemeRepository themeRepository;

  void updateAppTheme() {
    final Brightness? currentBrightness = AppThemes.currentSystemBrightness;
    currentBrightness == Brightness.light
        ? _setTheme(ThemeMode.light)
        : _setTheme(ThemeMode.dark);
  }

  void _setTheme(ThemeMode themeMode) {
    if (themeMode == ThemeMode.light) {
      AppThemes.themeData(false);
    } else {
      AppThemes.themeData(true);
    }
    emit(ThemeState(themeMode: themeMode));
  }

  void changeStartLang() async {
    //var langCode = await SecStore.getValue(keyVal: 'lang');
    var langCode = themeRepository.getLang();
    if (langCode != "") {
      emit(SelectedLocale(Locale(langCode, '')));
    } else {
      emit(SelectedLocale(Locale(ui.window.locale.toString().split('_')[0], '')));
    }
  }

  Future<void> changeLang(context, String data) async {
    emit(SelectedLocale(Locale(data, '')));
    themeRepository.saveLang(data);
    //await SecStore.setValue(keyVal: 'lang', value: data);
  }
}
