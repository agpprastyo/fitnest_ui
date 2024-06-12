import 'package:fitnest_ui/core/routes/routes.dart';
import 'package:fitnest_ui/presentations/screens/auth/goal_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../presentations/screens/auth/complete_profile_screen.dart';
import '../../presentations/screens/auth/login_screen.dart';
import '../../presentations/screens/auth/register_screen.dart';
import '../../presentations/screens/auth/success_screen.dart';
import '../../presentations/screens/dashboard/dashboard_screen.dart';
import '../../presentations/screens/home/home_screen.dart';
import '../../presentations/screens/notification/notification_screen.dart';
import '../../presentations/screens/onboarding/introductions_screen.dart';
import '../../presentations/screens/onboarding/onboarding_screen.dart';

const onboardingWidget = Text('Onboarding Screen');
const dashboardWidget = Text('Dashboard Screen');
const homeWidget = Text('Home Screen');
const exploreWidget = Text('Explore Screen');
const bookmarkWidget = Text('Bookmark Screen');
const profileWidget = Text('Profile Screen');
const loginWidget = Text('Login Screen');
const registerWidget = Text('Register Screen');
const forgotPasswordWidget = Text('Forgot Password Screen');
final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();

class AppRouter {
  static GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    routerNeglect: true,
    initialLocation: '/home',
    routes: [
      // Onboarding route
      GoRoute(
          path: '/',
          name: RoutesName.onboarding.name,
          builder: (context, state) => const OnBoardingScreen(),
          routes: [
            GoRoute(
              path: 'introduction',
              name: RoutesName.introduction.name,
              builder: (context, state) => const IntroductionsScreen(),
            ),
            GoRoute(
              path: 'register',
              name: RoutesName.register.name,
              builder: (context, state) => const RegisterScreen(),
            ),
            GoRoute(
              path: 'login',
              name: RoutesName.login.name,
              builder: (context, state) => const LoginScreen(),
            ),
            GoRoute(
              path: 'success-auth',
              name: RoutesName.successAuth.name,
              builder: (context, state) => const SuccessScreen(),
            ),
            GoRoute(
              path: 'complete-profile',
              name: RoutesName.completeProfile.name,
              builder: (context, state) => const CompleteProfileScreen(),
            ),
            GoRoute(
              path: 'goals',
              name: RoutesName.goals.name,
              builder: (context, state) => const GoalScreen(),
            ),
          ]),

      // Nested route for Dashboard with Bottom Navigation
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) => DashboardScreen(
          child: child,
        ),
        routes: [
          GoRoute(
            path: '/home',
            name: RoutesName.home.name,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return slideTransition(state, child: const HomeScreen());
            },
          ),
          GoRoute(
              path: '/explore', // Add leading "/" to the path
              name: 'explore', // Add name for explore screen
              pageBuilder: (BuildContext context, GoRouterState state) {
                return slideTransition(state, child: exploreWidget);
              }),
          GoRoute(
              path: '/bookmark', // Add leading "/" to the path
              name: 'bookmark', // Add name for bookmark screen
              pageBuilder: (BuildContext context, GoRouterState state) {
                return slideTransition(state, child: bookmarkWidget);
              }),
          GoRoute(
              path: '/profile', // Add leading "/" to the path
              name: 'profile', // Add name for profile screen
              pageBuilder: (BuildContext context, GoRouterState state) {
                return slideTransition(state, child: profileWidget);
              }
              // You can add a title for the route if desired:
              // title: 'Profile',
              ),
        ],
      ),

      GoRoute(
        path: '/notification',
        name: RoutesName.notification.name,
        builder: (context, state) => const NotificationScreen(),
      ),
    ],
  );
}

CustomTransitionPage<void> slideTransition(GoRouterState state,
    {required Widget child}) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    child: child,
    barrierDismissible: true,
    barrierColor: Colors.white,
    opaque: false,
    transitionDuration: const Duration(milliseconds: 500),
    reverseTransitionDuration: const Duration(milliseconds: 500),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final PageCubit pageCubit = BlocProvider.of<PageCubit>(context);
      final previousIndex = pageCubit.previousIndex;
      final currentIndex = pageCubit.state;

      // Check if the current index is greater than the previous index
      final isForward = previousIndex < currentIndex;

      // Define the begin and end offsets based on the direction
      final begin =
          isForward ? const Offset(1.0, 0.0) : const Offset(-1.0, 0.0);
      const end = Offset(0.0, 0.0);

      final tween = Tween(begin: begin, end: end);
      final offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}
