import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'localization.dart';
import 'package:flutter/foundation.dart'; // Добавьте этот импорт

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final themeProvider = Provider.of<ThemeProvider>(context);
    final localeProvider = Provider.of<LocaleProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.translate('settings')),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            title: Text(localizations.translate('theme')),
            trailing: DropdownButton<ThemeMode>(
              value: themeProvider.themeMode,
              onChanged: (ThemeMode? newValue) {
                if (newValue != null) {
                  themeProvider.setThemeMode(newValue);
                }
              },
              items: ThemeMode.values.map((ThemeMode mode) {
                return DropdownMenuItem<ThemeMode>(
                  value: mode,
                  child: Text(
                    mode.toString().split('.')[1],
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyMedium?.color,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const Divider(),
          ListTile(
            title: Text(localizations.translate('language')),
            trailing: DropdownButton<Locale>(
              value: localeProvider.locale,
              onChanged: (Locale? newValue) {
                if (newValue != null) {
                  localeProvider.setLocale(newValue);
                }
              },
              items: const [
                DropdownMenuItem<Locale>(
                  value: Locale('en'),
                  child: Text('English'),
                ),
                DropdownMenuItem<Locale>(
                  value: Locale('ru'),
                  child: Text('Русский'),
                ),
                DropdownMenuItem<Locale>(
                  value: Locale('kk'),
                  child: Text('Қазақша'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  void setThemeMode(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }
}

class LocaleProvider extends ChangeNotifier {
  Locale _locale = const Locale('en');

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    _locale = locale;
    notifyListeners();
  }
}