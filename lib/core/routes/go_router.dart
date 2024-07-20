import 'package:go_router/go_router.dart';
import 'package:reso/core/routes/navigation_const.dart';
import 'package:reso/feature/splas_screen/splash_view.dart';

final goRouter = GoRouter(
  debugLogDiagnostics: true,
  navigatorKey: NavigationService.rootNavigatorKey,
  initialLocation: '/splashScreen',
  routes: <RouteBase>[
    GoRoute(
      path: '/splashScreen',
      builder: (context, state) => const SplashScreen(),
    ),
    // GoRoute(
    //   path: '/updateAppScreen',
    //   builder: (context, state) => const UpdateAppScreen(),
    // ),
    // GoRoute(
    //   path: '/loginScreen',
    //   builder: (context, state) => const LoginScreen(),
    // ),
    // GoRoute(
    //   path: '/signUpScreen',
    //   builder: (context, state) => const SignUpScreen(),
    // ),
    // GoRoute(
    //   path: '/forgotPasswordScreen',
    //   builder: (context, state) => const ForgotPasswordPage(),
    // ),
    // GoRoute(
    //     path: '/onBoardingScreens',
    //     builder: (context, state) => const OnBoardingScreen(),
    //     routes: [
    //       GoRoute(
    //         path: 'introductionScreen1',
    //         builder: (context, state) => const IntroPage1(),
    //       ),
    //       GoRoute(
    //         path: 'introductionScreen2',
    //         builder: (context, state) => const IntroPage2(),
    //       ),
    //       GoRoute(
    //         path: 'introductionScreen3',
    //         builder: (context, state) => const IntroPage3(),
    //       ),
    //       GoRoute(
    //         path: 'introductionScreen4',
    //         builder: (context, state) => const IntroPage4(),
    //       ),
    //       GoRoute(
    //         path: 'introductionScreen5',
    //         builder: (context, state) => const IntroPage5(),
    //       ),
    //     ]),
    // ShellRoute(
    //     navigatorKey: NavigationService.shellNavigatorKey,
    //     builder: (context, state, child) => ScaffoldWithNavBar(
    //           childScreen: child,
    //         ),
    //     routes: [
    //       GoRoute(
    //         path: '/',
    //         builder: (context, state) => const FeedScreen(),
    //       ),
    //       GoRoute(
    //           path: '/creatorScreen/:user',
    //           builder: (context, state) {
    //             return const CreateScreen();
    //           }),
    //       GoRoute(
    //         path: '/reelsScreen',
    //         builder: (context, state) => const ComingSoonPage(),
    //       ),
    //       GoRoute(
    //         path: '/socials',
    //         builder: (context, state) => const SocialScreen(),
    //       ),
    //       GoRoute(
    //         path: '/account',
    //         builder: (context, state) => const ProfileScreen(),
    //       )
    //     ]),
  ],
);