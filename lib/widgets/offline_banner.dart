import 'package:flutter/material.dart';
import '../services/connectivity_service.dart';
import '../localization.dart';

class OfflineBanner extends StatelessWidget {
  final ConnectivityService connectivityService;
  final VoidCallback? onSyncPressed;

  const OfflineBanner({
    super.key,
    required this.connectivityService,
    this.onSyncPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: connectivityService,
      builder: (context, _) {
        if (connectivityService.isOnline) return const SizedBox.shrink();

        final localizations = AppLocalizations.of(context)!;

        return Container(
          width: double.infinity,
          color: Theme.of(context).colorScheme.error,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: SafeArea(
            child: Row(
              children: [
                Icon(
                  Icons.cloud_off,
                  color: Theme.of(context).colorScheme.onError,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    localizations.translate('offlineMode'),
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onError,
                    ),
                  ),
                ),
                if (onSyncPressed != null)
                  TextButton.icon(
                    onPressed: onSyncPressed,
                    icon: const Icon(Icons.sync),
                    label: Text(localizations.translate('sync')),
                    style: TextButton.styleFrom(
                      foregroundColor: Theme.of(context).colorScheme.onError,
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
} 