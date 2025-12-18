import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notepases/src/presentation/bloc/onbording_bloc/onbordingBloc.dart';

List<BlocProvider> blocProviders = [
      BlocProvider<OnboardingBloc>(create: (context) => OnboardingBloc(lastPageIndex: 1)),
  
];