import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  static Future<AppLocalizations> load(Locale locale) async {
    final localizations = AppLocalizations(locale);
    await localizations._load();
    return localizations;
  }

  Map<String, String> _localizedStrings = {};

  Future<void> _load() async {
    _localizedStrings = {
      'appTitle': {
        'en': 'Countdown Timer',
        'ru': 'Таймер обратного отсчета',
        'kk': 'Кері санау таймері',
      }[locale.languageCode] ?? 'Countdown Timer',
      'cancel': {
        'en': 'Cancel',
        'ru': 'Отмена',
        'kk': 'Болдырмау',
      }[locale.languageCode] ?? 'Cancel',
      'add': {
        'en': 'Add',
        'ru': 'Добавить',
        'kk': 'Қосу',
      }[locale.languageCode] ?? 'Add',
      'edit': {
        'en': 'Edit',
        'ru': 'Редактировать',
        'kk': 'Өңдеу',
      }[locale.languageCode] ?? 'Edit',
      'update': {
        'en': 'Update',
        'ru': 'Обновить',
        'kk': 'Жаңарту',
      }[locale.languageCode] ?? 'Update',
      'delete': {
        'en': 'Delete',
        'ru': 'Удалить',
        'kk': 'Жою',
      }[locale.languageCode] ?? 'Delete',
      'select': {
        'en': 'Select',
        'ru': 'Выбрать',
        'kk': 'Таңдау',
      }[locale.languageCode] ?? 'Select',
      'upcomingEvents': {
        'en': 'Upcoming Events',
        'ru': 'Предстоящие события',
        'kk': 'Алдағы оқиғалар',
      }[locale.languageCode] ?? 'Upcoming Events',
      'timezone': {
        'en': 'Timezone',
        'ru': 'Часовой пояс',
        'kk': 'Уақыт белдеуі',
      }[locale.languageCode] ?? 'Timezone',
      'currentTime': {
        'en': 'Current Time',
        'ru': 'Текущее время',
        'kk': 'Қазіргі уақыт',
      }[locale.languageCode] ?? 'Current Time',
      'noTimers': {
        'en': 'No timers yet!',
        'ru': 'Таймеров пока нет!',
        'kk': 'Таймерлер әлі жоқ!',
      }[locale.languageCode] ?? 'No timers yet!',
      'addFirstTimer': {
        'en': 'Add your first timer',
        'ru': 'Добавьте первый таймер',
        'kk': 'Алғашқы таймерді қосыңыз',
      }[locale.languageCode] ?? 'Add your first timer',
      'trackDates': {
        'en': 'Track your important dates',
        'ru': 'Отслеживайте важные даты',
        'kk': 'Маңызды күндерді қадағалаңыз',
      }[locale.languageCode] ?? 'Track your important dates',
      'changeTimezone': {
        'en': 'Change Timezone',
        'ru': 'Изменить часовой пояс',
        'kk': 'Уақыт белдеуін өзгерту',
      }[locale.languageCode] ?? 'Change Timezone',
      'hideCompleted': {
        'en': 'Hide completed',
        'ru': 'Скрыть завершенные',
        'kk': 'Аяқталғандарды жасыру',
      }[locale.languageCode] ?? 'Hide completed',
      'showCompleted': {
        'en': 'Show completed',
        'ru': 'Показать завершенные',
        'kk': 'Аяқталғандарды көрсету',
      }[locale.languageCode] ?? 'Show completed',
      'hideHelp': {
        'en': 'Hide help',
        'ru': 'Скрыть справку',
        'kk': 'Анықтаманы жасыру',
      }[locale.languageCode] ?? 'Hide help',
      'showHelp': {
        'en': 'Show help',
        'ru': 'Показать справку',
        'kk': 'Анықтаманы көрсету',
      }[locale.languageCode] ?? 'Show help',
      'about': {
        'en': 'About',
        'ru': 'О приложении',
        'kk': 'Қолданба туралы',
      }[locale.languageCode] ?? 'About',
      'addTimer': {
        'en': 'Add New Timer',
        'ru': 'Добавить таймер',
        'kk': 'Таймер қосу',
      }[locale.languageCode] ?? 'Add New Timer',
      'editTimer': {
        'en': 'Edit Timer',
        'ru': 'Редактировать таймер',
        'kk': 'Таймерді өңдеу',
      }[locale.languageCode] ?? 'Edit Timer',
      'eventName': {
        'en': 'Event Name',
        'ru': 'Название события',
        'kk': 'Оқиға атауы',
      }[locale.languageCode] ?? 'Event Name',
      'enterName': {
        'en': 'Please enter a name',
        'ru': 'Пожалуйста, введите название',
        'kk': 'Атауын енгізіңіз',
      }[locale.languageCode] ?? 'Please enter a name',
      'selectDateTime': {
        'en': 'Select Date & Time',
        'ru': 'Выберите дату и время',
        'kk': 'Күн мен уақытты таңдаңыз',
      }[locale.languageCode] ?? 'Select Date & Time',
      'selectDate': {
        'en': 'Select Date',
        'ru': 'Выберите дату',
        'kk': 'Күнді таңдаңыз',
      }[locale.languageCode] ?? 'Select Date',
      'selectTime': {
        'en': 'Select Time',
        'ru': 'Выберите время',
        'kk': 'Уақытты таңдаңыз',
      }[locale.languageCode] ?? 'Select Time',
      'color': {
        'en': 'Color',
        'ru': 'Цвет',
        'kk': 'Түс',
      }[locale.languageCode] ?? 'Color',
      'target': {
        'en': 'Target',
        'ru': 'Цель',
        'kk': 'Мақсат',
      }[locale.languageCode] ?? 'Target',
      'created': {
        'en': 'Created',
        'ru': 'Создано',
        'kk': 'Құрылған',
      }[locale.languageCode] ?? 'Created',
      'timeRemaining': {
        'en': 'Time remaining',
        'ru': 'Осталось времени',
        'kk': 'Қалған уақыт',
      }[locale.languageCode] ?? 'Time remaining',
      'eventPassed': {
        'en': 'Event passed',
        'ru': 'Событие прошло',
        'kk': 'Оқиға өтті',
      }[locale.languageCode] ?? 'Event passed',
      'deleteTimer': {
        'en': 'Delete Timer?',
        'ru': 'Удалить таймер?',
        'kk': 'Таймерді жою керек пе?',
      }[locale.languageCode] ?? 'Delete Timer?',
      'deleteConfirm': {
        'en': 'Are you sure you want to delete this timer?',
        'ru': 'Вы уверены, что хотите удалить этот таймер?',
        'kk': 'Сіз бұл таймерді жойғыңыз келетініне сенімдісіз бе?',
      }[locale.languageCode] ?? 'Are you sure you want to delete this timer?',
      'selectTimezone': {
        'en': 'Select Timezone',
        'ru': 'Выберите часовой пояс',
        'kk': 'Уақыт белдеуін таңдаңыз',
      }[locale.languageCode] ?? 'Select Timezone',
      'settings': {
        'en': 'Settings',
        'ru': 'Настройки',
        'kk': 'Баптаулар',
      }[locale.languageCode] ?? 'Settings',
      'theme': {
        'en': 'Theme',
        'ru': 'Тема',
        'kk': 'Тақырып',
      }[locale.languageCode] ?? 'Theme',
      'language': {
        'en': 'Language',
        'ru': 'Язык',
        'kk': 'Тіл',
      }[locale.languageCode] ?? 'Language',
      'home': {
        'en': 'Home',
        'ru': 'Главная',
        'kk': 'Басты бет',
      }[locale.languageCode] ?? 'Home',
      'login': {
        'en': 'Login',
        'ru': 'Войти',
        'kk': 'Кіру',
      }[locale.languageCode] ?? 'Login',
      'register': {
        'en': 'Register',
        'ru': 'Регистрация',
        'kk': 'Тіркелу',
      }[locale.languageCode] ?? 'Register',
      'email': {
        'en': 'Email',
        'ru': 'Электронная почта',
        'kk': 'Электрондық пошта',
      }[locale.languageCode] ?? 'Email',
      'password': {
        'en': 'Password',
        'ru': 'Пароль',
        'kk': 'Құпия сөз',
      }[locale.languageCode] ?? 'Password',
      'confirmPassword': {
        'en': 'Confirm Password',
        'ru': 'Подтвердите пароль',
        'kk': 'Құпия сөзді растау',
      }[locale.languageCode] ?? 'Confirm Password',
      'enterEmail': {
        'en': 'Please enter your email',
        'ru': 'Пожалуйста, введите email',
        'kk': 'Электрондық поштаны енгізіңіз',
      }[locale.languageCode] ?? 'Please enter your email',
      'enterPassword': {
        'en': 'Please enter your password',
        'ru': 'Пожалуйста, введите пароль',
        'kk': 'Құпия сөзді енгізіңіз',
      }[locale.languageCode] ?? 'Please enter your password',
      'passwordsDontMatch': {
        'en': 'Passwords do not match',
        'ru': 'Пароли не совпадают',
        'kk': 'Құпия сөздер сәйкес келмейді',
      }[locale.languageCode] ?? 'Passwords do not match',
      'backToLogin': {
        'en': 'Back to Login',
        'ru': 'Вернуться к входу',
        'kk': 'Кіруге оралу',
      }[locale.languageCode] ?? 'Back to Login',
      'profile': {
        'en': 'Profile',
        'ru': 'Профиль',
        'kk': 'Профиль',
      }[locale.languageCode] ?? 'Profile',
      'userInfo': {
        'en': 'User Information',
        'ru': 'Информация о пользователе',
        'kk': 'Пайдаланушы туралы ақпарат',
      }[locale.languageCode] ?? 'User Information',
      'uid': {
        'en': 'User ID',
        'ru': 'ID пользователя',
        'kk': 'Пайдаланушы ID',
      }[locale.languageCode] ?? 'User ID',
      'logout': {
        'en': 'Logout',
        'ru': 'Выйти',
        'kk': 'Шығу',
      }[locale.languageCode] ?? 'Logout',
      'guestMode': {
        'en': 'Guest Mode',
        'ru': 'Гостевой режим',
        'kk': 'Қонақ режимі',
      }[locale.languageCode] ?? 'Guest Mode',
      'notLoggedIn': {
        'en': 'You are not logged in',
        'ru': 'Вы не вошли в систему',
        'kk': 'Сіз жүйеге кірмегенсіз',
      }[locale.languageCode] ?? 'You are not logged in',
      'continueAsGuest': {
        'en': 'Continue as Guest',
        'ru': 'Продолжить как гость',
        'kk': 'Қонақ ретінде жалғастыру',
      }[locale.languageCode] ?? 'Continue as Guest',
      'loginRequired': {
        'en': 'Please log in to access this feature',
        'ru': 'Пожалуйста, войдите, чтобы получить доступ к этой функции',
        'kk': 'Бұл функцияға қол жеткізу үшін жүйеге кіріңіз',
      }[locale.languageCode] ?? 'Please log in to access this feature',
      'invalidEmail': {
        'en': 'Please enter a valid email address',
        'ru': 'Пожалуйста, введите действительный адрес электронной почты',
        'kk': 'Жарамды электрондық пошта мекенжайын енгізіңіз',
      }[locale.languageCode] ?? 'Please enter a valid email address',
      'weakPassword': {
        'en': 'Password must be at least 6 characters',
        'ru': 'Пароль должен содержать не менее 6 символов',
        'kk': 'Құпия сөз кемінде 6 таңба болуы керек',
      }[locale.languageCode] ?? 'Password must be at least 6 characters',
      'emailInUse': {
        'en': 'An account already exists for this email',
        'ru': 'Аккаунт с этим email уже существует',
        'kk': 'Бұл электрондық поштамен тіркелгі бар',
      }[locale.languageCode] ?? 'An account already exists for this email',
      'userNotFound': {
        'en': 'No user found with this email',
        'ru': 'Пользователь с таким email не найден',
        'kk': 'Бұл электрондық поштамен пайдаланушы табылмады',
      }[locale.languageCode] ?? 'No user found with this email',
      'wrongPassword': {
        'en': 'Wrong password provided',
        'ru': 'Неверный пароль',
        'kk': 'Қате құпия сөз',
      }[locale.languageCode] ?? 'Wrong password provided',
      'invalidCredentials': {
        'en': 'Invalid email or password',
        'ru': 'Неверный email или пароль',
        'kk': 'Қате электрондық пошта немесе құпия сөз',
      }[locale.languageCode] ?? 'Invalid email or password',
      'unexpectedError': {
        'en': 'An unexpected error occurred',
        'ru': 'Произошла непредвиденная ошибка',
        'kk': 'Күтпеген қате орын алды',
      }[locale.languageCode] ?? 'An unexpected error occurred',
      'loginFailed': {
        'en': 'Failed to log in',
        'ru': 'Не удалось войти',
        'kk': 'Жүйеге кіру сәтсіз аяқталды',
      }[locale.languageCode] ?? 'Failed to log in',
      'registerFailed': {
        'en': 'Failed to register',
        'ru': 'Не удалось зарегистрироваться',
        'kk': 'Тіркелу сәтсіз аяқталды',
      }[locale.languageCode] ?? 'Failed to register',
      'googleSignInFailed': {
        'en': 'Failed to sign in with Google',
        'ru': 'Не удалось войти через Google',
        'kk': 'Google арқылы кіру сәтсіз аяқталды',
      }[locale.languageCode] ?? 'Failed to sign in with Google',
      'guestSignInFailed': {
        'en': 'Failed to continue as guest',
        'ru': 'Не удалось продолжить как гость',
        'kk': 'Қонақ ретінде жалғастыру сәтсіз аяқталды',
      }[locale.languageCode] ?? 'Failed to continue as guest',
      'signOutFailed': {
        'en': 'Failed to sign out',
        'ru': 'Не удалось выйти',
        'kk': 'Жүйеден шығу сәтсіз аяқталды',
      }[locale.languageCode] ?? 'Failed to sign out',
      'preferencesUpdateFailed': {
        'en': 'Failed to update preferences',
        'ru': 'Не удалось обновить настройки',
        'kk': 'Баптауларды жаңарту сәтсіз аяқталды',
      }[locale.languageCode] ?? 'Failed to update preferences',
      'preferencesLoadFailed': {
        'en': 'Failed to load preferences',
        'ru': 'Не удалось загрузить настройки',
        'kk': 'Баптауларды жүктеу сәтсіз аяқталды',
      }[locale.languageCode] ?? 'Failed to load preferences',
      'offlineMode': {
        'en': 'You are currently offline',
        'ru': 'Вы работаете в автономном режиме',
        'kk': 'Сіз қазір офлайн режимінде жұмыс істеудесіз',
      }[locale.languageCode] ?? 'You are currently offline',
      'sync': {
        'en': 'Sync',
        'ru': 'Синхронизировать',
        'kk': 'Синхрондау',
      }[locale.languageCode] ?? 'Sync',
      'syncInProgress': {
        'en': 'Syncing data...',
        'ru': 'Синхронизация данных...',
        'kk': 'Деректер синхрондалуда...',
      }[locale.languageCode] ?? 'Syncing data...',
      'syncComplete': {
        'en': 'Sync complete',
        'ru': 'Синхронизация завершена',
        'kk': 'Синхрондау аяқталды',
      }[locale.languageCode] ?? 'Sync complete',
      'syncFailed': {
        'en': 'Sync failed',
        'ru': 'Ошибка синхронизации',
        'kk': 'Синхрондау сәтсіз аяқталды',
      }[locale.languageCode] ?? 'Sync failed',
      'enableOfflineMode': {
        'en': 'Enable Offline Mode',
        'ru': 'Включить автономный режим',
        'kk': 'Офлайн режимін қосу',
      }[locale.languageCode] ?? 'Enable Offline Mode',
      'setPin': {
        'en': 'Set PIN',
        'ru': 'Установить PIN',
        'kk': 'PIN орнату',
      }[locale.languageCode] ?? 'Set PIN',
      'enterPin': {
        'en': 'Enter PIN',
        'ru': 'Введите PIN',
        'kk': 'PIN енгізіңіз',
      }[locale.languageCode] ?? 'Enter PIN',
      'pinRequired': {
        'en': 'PIN is required',
        'ru': 'Требуется PIN',
        'kk': 'PIN қажет',
      }[locale.languageCode] ?? 'PIN is required',
      'pinMismatch': {
        'en': 'PINs do not match',
        'ru': 'PIN-коды не совпадают',
        'kk': 'PIN-кодтар сәйкес келмейді',
      }[locale.languageCode] ?? 'PINs do not match',
      'offlineLogin': {
        'en': 'Offline Login',
        'ru': 'Автономный вход',
        'kk': 'Офлайн кіру',
      }[locale.languageCode] ?? 'Offline Login',
      'offlineLoginSuccess': {
        'en': 'Offline login successful',
        'ru': 'Автономный вход выполнен',
        'kk': 'Офлайн кіру сәтті аяқталды',
      }[locale.languageCode] ?? 'Offline login successful',
      'offlineLoginFailed': {
        'en': 'Offline login failed',
        'ru': 'Ошибка автономного входа',
        'kk': 'Офлайн кіру сәтсіз аяқталды',
      }[locale.languageCode] ?? 'Offline login failed',
      'lastSync': {
        'en': 'Last sync:',
        'ru': 'Последняя синхронизация:',
        'kk': 'Соңғы синхрондау:',
      }[locale.languageCode] ?? 'Last sync:',
      'never': {
        'en': 'Never',
        'ru': 'Никогда',
        'kk': 'Ешқашан',
      }[locale.languageCode] ?? 'Never',
    };
  }

  String translate(String key) => _localizedStrings[key] ?? key;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ru', 'kk'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}