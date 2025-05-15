import 'package:flutter/material.dart';
import 'localization.dart';
import 'services/storage_service.dart';

class OfflineLoginScreen extends StatefulWidget {
  final StorageService storageService;
  final VoidCallback onLoginSuccess;

  const OfflineLoginScreen({
    super.key,
    required this.storageService,
    required this.onLoginSuccess,
  });

  @override
  State<OfflineLoginScreen> createState() => _OfflineLoginScreenState();
}

class _OfflineLoginScreenState extends State<OfflineLoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _pinController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.translate('offlineLogin')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.phone_android,
                size: 64,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 24),
              Text(
                localizations.translate('offlineLogin'),
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: _pinController,
                decoration: InputDecoration(
                  labelText: localizations.translate('enterPin'),
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.pin),
                ),
                keyboardType: TextInputType.number,
                obscureText: true,
                maxLength: 6,
                enabled: !_isLoading,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return localizations.translate('pinRequired');
                  }
                  if (value.length < 4) {
                    return 'PIN must be at least 4 digits';
                  }
                  return null;
                },
              ),
              if (_errorMessage != null)
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    _errorMessage!,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : ElevatedButton.icon(
                        onPressed: _verifyPin,
                        icon: const Icon(Icons.login),
                        label: Text(localizations.translate('login')),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _verifyPin() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
        _errorMessage = null;
      });

      try {
        final isValid = await widget.storageService.verifyOfflinePin(
          _pinController.text,
        );

        if (isValid) {
          widget.onLoginSuccess();
        } else {
          setState(() {
            _errorMessage = 'Invalid PIN';
          });
        }
      } catch (e) {
        setState(() {
          _errorMessage = 'Failed to verify PIN';
        });
      } finally {
        if (mounted) {
          setState(() => _isLoading = false);
        }
      }
    }
  }

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }
} 