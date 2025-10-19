import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../main_scaffold.dart';
import '../../features/home/screens/home_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/home',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return MainScaffold(child: child);
      },
      routes: [
        GoRoute(
          path: '/home',
          name: 'home',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: HomeScreen(),
          ),
        ),
        GoRoute(
          path: '/wallet',
          name: 'wallet',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: Placeholder(),
          ),
        ),
        GoRoute(
          path: '/history',
          name: 'history',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: Placeholder(),
          ),
        ),
        GoRoute(
          path: '/profile',
          name: 'profile',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: Placeholder(),
          ),
        ),
      ],
    ),
  ],
);
