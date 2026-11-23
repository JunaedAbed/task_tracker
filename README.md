# Task Tracker

A Flutter task-management app with user accounts. Users register, log in and see their tasks on a dashboard that pulls from a REST API.

## Features
- Register, log in and log out against a token-based REST API
- Bearer token kept on the device in SQLite (`sqflite`), so the session survives app restarts
- Dashboard and task list loaded from the API
- Profile screen, splash screen and bottom-navigation shell
- Lottie animations and cached network images

## Tech stack
- **Flutter / Dart**
- **GetX** for state management, routing and dependency injection
- **GetConnect** HTTP client wrapped in a single `ApiClient`
- `sqflite`, `shared_preferences`, `cached_network_image`, `lottie`, `flutter_svg`

## Architecture
```
lib/
├── core/           # app-wide exports, utilities, local DB helper
├── data/
│   ├── api/        # ApiClient (base URL, auth headers, response handling)
│   └── services/   # auth and task repositories
├── presentation/   # one folder per screen: view / controller / models
├── routes/         # named GetX routes
├── theme/          # colours and text styles
└── widgets/        # shared widgets
```
Each screen keeps its UI (`view/`), logic (`controller/`) and request and response models (`models/`) separate.

## Run it
```bash
flutter pub get
flutter run
```
Requires the Flutter SDK (Dart ≥ 3). The API base URL is set in `lib/data/api/api_client.dart`.

## Author
**Md Junaed Abed**: [Portfolio](https://abed-page.vercel.app) · [GitHub](https://github.com/JunaedAbed)
