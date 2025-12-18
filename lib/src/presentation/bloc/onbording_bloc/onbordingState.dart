// onboarding_state.dart
import 'package:equatable/equatable.dart';

class OnboardingState extends Equatable {
  final int pageIndex;
  final bool finished;
  final bool requestingPermission;
  final String? error;

  const OnboardingState({
    this.pageIndex = 0,
    this.finished = false,
    this.requestingPermission = false,
    this.error,
  });

  OnboardingState copyWith({
    int? pageIndex,
    bool? finished,
    bool? requestingPermission,
    String? error,
    bool clearError = false,
  }) {
    return OnboardingState(
      pageIndex: pageIndex ?? this.pageIndex,
      finished: finished ?? this.finished,
      requestingPermission: requestingPermission ?? this.requestingPermission,
      error: clearError ? null : (error ?? this.error),
    );
  }

  @override
  List<Object?> get props => [pageIndex, finished, requestingPermission, error];
}
