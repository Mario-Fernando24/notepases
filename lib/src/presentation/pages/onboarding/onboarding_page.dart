 
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notepases/src/presentation/atomic_design/foundations/colors.dart';
import 'package:notepases/src/presentation/bloc/onbording_bloc/onbordingBloc.dart';
import 'package:notepases/src/presentation/bloc/onbording_bloc/onbordingEvent.dart';
import 'package:notepases/src/presentation/bloc/onbording_bloc/onbordingState.dart';
import 'package:notepases/src/presentation/pages/onboarding/location_page.dart';
import 'package:notepases/src/presentation/pages/onboarding/welcome_page.dart';
import 'package:notepases/src/presentation/routes/route_names.dart';
import 'package:notepases/src/presentation/widgets/messageAlert/CustomToast.dart';

class OnbordingPage extends StatefulWidget {
  const OnbordingPage({super.key});

  @override
  State<OnbordingPage> createState() => _OnbordingPageState();
}

class _OnbordingPageState extends State<OnbordingPage> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  BlocListener<OnboardingBloc, OnboardingState>(
        listenWhen: (p, c) => p.pageIndex != c.pageIndex || p.finished != c.finished,
        listener: (context, state) async {
          if (state.finished) {
            // TODO: persistir "onboarding visto" antes si necesitas
            Navigator.pushReplacementNamed(context, RouteNames.auth);
            return;
          }

          await _pageController.animateToPage(
            state.pageIndex,
            duration: const Duration(milliseconds: 280),
            curve: Curves.easeInOut,
          );
        },
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            children:[
           
            SafeArea(
              child: BlocBuilder<OnboardingBloc, OnboardingState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      Expanded(
                        child: PageView(
                          controller: _pageController,
                          onPageChanged: (i) => context.read<OnboardingBloc>().add(OnboardingPageChanged(i)),
                          children: [
                            WelcomePage(
                              onContinue: () => context.read<OnboardingBloc>().add(const OnboardingNextPressed()),
                            ),
                            LocationPage(
                              loading: state.requestingPermission,
                              onAllowAlways: () => context.read<OnboardingBloc>().add(const OnboardingRequestLocationAlwaysPressed()),
                              onLater: () => context.read<OnboardingBloc>().add(const OnboardingSkipPressed()),
                            ),
                          ],
                        ),
                      ),
                      if (state.error != null)
                        Builder(
                          builder: (context) {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                               CustomToast.show(
                                context,
                                message: state.error!,
                                icon: Icons.check_circle_outline,
                                backgroundColor: NotepaseColorsFoundation.colorBackgroundDanger,
                              );
                              // CustomToast.show(
                              //   context,
                              //   message: state.error!,
                              //   icon: Icons.check_circle_outline,
                              //   backgroundColor: Colors.green[600]!,
                              // );
                            });
                            return const SizedBox.shrink();
                          },
                        ),
                    ],
                  );
                },
              ),
            ),
          ]
          ),
         )
        );
    
  }
}
