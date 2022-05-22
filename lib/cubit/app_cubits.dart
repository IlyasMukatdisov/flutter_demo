import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/cubit/app_cubit_state.dart';
import 'package:flutter_demo/services/data_services.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits({required this.data}) : super(InitialState()) {
    emit(WelcomeState());
  }

  final DataServices data;
  late final places;

  Future<void> getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places));
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
