import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notepases/injection.dart';
import 'package:notepases/src/domain/useCases/geolocator/GeolocatorUseCase.dart';
import 'package:notepases/src/presentation/bloc/onbording_bloc/onbordingBloc.dart';

List<BlocProvider> blocProviders = [
  BlocProvider<OnboardingBloc>(
    create: (context) => OnboardingBloc(locator<GeolocatorUseCase>(), 1),
  ),
];