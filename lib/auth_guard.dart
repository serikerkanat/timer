import 'package:flutter/material.dart';
import 'providers.dart';
import 'localization.dart';

class AuthGuard extends StatelessWidget {
  final Widget child;
  final bool requireAuth;
  final String? customMessage;

  const AuthGuard({
    super.key,
    required this.child,
    this.requireAuth = true,
    this.customMessage,
  });

  @override
  Widget build(BuildContext context) {
    final appState = AppState.of(context);
    final localizations = AppLocalizations.of(context)!;

    if (requireAuth && appState.isGuest) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.lock_outline,
                size: 64,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 16),
              Text(
                customMessage ?? localizations.translate('loginRequired'),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                icon: const Icon(Icons.login),
                label: Text(localizations.translate('login')),
              ),
              const SizedBox(height: 16),
              TextButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                icon: const Icon(Icons.person_add),
                label: Text(localizations.translate('register')),
              ),
            ],
          ),
        ),
      );
    }

    return child;
  }
}

class AuthGuardBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, bool isAuthenticated) builder;
  final bool requireAuth;
  final String? customMessage;

  const AuthGuardBuilder({
    super.key,
    required this.builder,
    this.requireAuth = true,
    this.customMessage,
  });

  @override
  Widget build(BuildContext context) {
    final appState = AppState.of(context);
    final isAuthenticated = !appState.isGuest;

    if (requireAuth && !isAuthenticated) {
      return AuthGuard(
        child: builder(context, false),
        customMessage: customMessage,
      );
    }

    return builder(context, isAuthenticated);
  }
} 