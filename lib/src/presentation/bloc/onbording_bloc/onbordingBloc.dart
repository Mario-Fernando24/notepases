import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notepases/src/domain/models/DTO/locationPermissionResult.dart';
import 'package:notepases/src/domain/useCases/geolocator/GeolocatorUseCase.dart';
import 'package:notepases/src/presentation/bloc/onbording_bloc/onbordingEvent.dart';
import 'package:notepases/src/presentation/bloc/onbording_bloc/onbordingState.dart';


class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final int lastPageIndex;
  final GeolocatorUseCase geolocatorUseCase;

  OnboardingBloc(this.geolocatorUseCase, this.lastPageIndex) : super(const OnboardingState()) {
    on<OnboardingPageChanged>(_onPageChanged);
    on<OnboardingNextPressed>(_onNextPressed);
    on<OnboardingSkipPressed>(_onSkipPressed);
    on<OnboardingRequestLocationAlwaysPressed>(_onRequestLocationAlways);
  }

  void _onPageChanged(
    OnboardingPageChanged event,
    Emitter<OnboardingState> emit,
  ) {
    emit(state.copyWith(pageIndex: event.index, clearError: true));
  }

  void _onNextPressed(
    OnboardingNextPressed event,
    Emitter<OnboardingState> emit,
  ) {
    if (state.pageIndex < lastPageIndex) {
      emit(state.copyWith(pageIndex: state.pageIndex + 1, clearError: true));
    } else {
      emit(state.copyWith(finished: true, clearError: true));
    }
  }

  void _onSkipPressed(
    OnboardingSkipPressed event,
    Emitter<OnboardingState> emit,
  ) {
    emit(state.copyWith(finished: true, clearError: true));
  }

  Future<void> _onRequestLocationAlways(
    OnboardingRequestLocationAlwaysPressed event,
    Emitter<OnboardingState> emit,
  ) async {
    try {
      emit(state.copyWith(requestingPermission: true, clearError: true));
       
      LocationPermissionResult resp = await geolocatorUseCase.requestLocationPermissionUseCase.run();
      
      if (!resp.isGranted) {
        emit(state.copyWith(
          requestingPermission: false,
          error: resp.message,
        ));
        return;
      }

      print('******************** RESPUESTA PERMISO ********************');
      print(resp.isGranted);
      print(resp.message);
      print('****************************************************');


     // emit(state.copyWith(requestingPermission: false));
      add(const OnboardingNextPressed());
    } catch (_) {
      emit(state.copyWith(
        requestingPermission: false,
        error: 'No se pudo solicitar el permiso. Intenta de nuevo.',
      ));
    }
  }
}
