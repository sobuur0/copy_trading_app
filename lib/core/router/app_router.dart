import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../main_scaffold.dart';
import '../../features/home/screens/home_screen.dart';
import '../../features/copy_trading/screens/copy_trading_intro_screen.dart';
import '../../features/copy_trading/screens/conversational_engagement_screen.dart';
import '../../features/copy_trading/screens/copy_trading_dashboard_screen.dart';
import '../constants/app_routes.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.home,
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return MainScaffold(child: child);
      },
      routes: [
        GoRoute(
          path: AppRoutes.home,
          name: 'home',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: HomeScreen(),
          ),
        ),
        GoRoute(
          path: AppRoutes.wallet,
          name: 'wallet',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: Placeholder(),
          ),
        ),
        GoRoute(
          path: AppRoutes.history,
          name: 'history',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: Placeholder(),
          ),
        ),
        GoRoute(
          path: AppRoutes.profile,
          name: 'profile',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: Placeholder(),
          ),
        ),
      ],
    ),
    GoRoute(
      path: AppRoutes.copyTradingIntro,
      name: 'copyTradingIntro',
      pageBuilder: (context, state) => const NoTransitionPage(
        child: CopyTradingIntroScreen(),
      ),
    ),
    GoRoute(
      path: AppRoutes.conversationalEngagement,
      name: 'conversationalEngagement',
      pageBuilder: (context, state) => const NoTransitionPage(
        child: ConversationalEngagementScreen(),
      ),
    ),
    GoRoute(
      path: AppRoutes.copyTradingDashboard,
      name: 'copyTradingDashboard',
      pageBuilder: (context, state) => const NoTransitionPage(
        child: CopyTradingDashboardScreen(),
      ),
    ),
  ],
);
