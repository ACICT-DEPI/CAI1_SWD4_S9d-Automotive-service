import 'package:demi1/presentation/services/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SparePartCubit extends Cubit<SparePartState> {
  SparePartCubit()
      : super(SparePartState(
          fuelFilterStock: 70,
          oilFilterStock: 100,
          mirrorsStock: 5,
          wiperStock: 10,
          batteryStock: 40,
          frontGlassStock: 60,
          tyresStock: 30,
        ));

  void orderSparePart(String partName) {
    switch (partName) {
      case 'fuelFilter':
        if (state.fuelFilterStock > 0) {
          emit(state.copyWith(fuelFilterStock: state.fuelFilterStock - 1));
        }
        break;
      case 'oilFilter':
        if (state.oilFilterStock > 0) {
          emit(state.copyWith(oilFilterStock: state.oilFilterStock - 1));
        }
        break;
      case 'mirrors':
        if (state.mirrorsStock > 0) {
          emit(state.copyWith(mirrorsStock: state.mirrorsStock - 1));
        }
        break;
      case 'wiper':
        if (state.wiperStock > 0) {
          emit(state.copyWith(wiperStock: state.wiperStock - 1));
        }
        break;
      case 'battery':
        if (state.batteryStock > 0) {
          emit(state.copyWith(batteryStock: state.batteryStock - 1));
        }
        break;
      case 'frontGlass':
        if (state.frontGlassStock > 0) {
          emit(state.copyWith(frontGlassStock: state.frontGlassStock - 1));
        }
        break;
      case 'tyres':
        if (state.tyresStock > 0) {
          emit(state.copyWith(tyresStock: state.tyresStock - 1));
        }
        break;
      default:
        break;
    }
  }
}
