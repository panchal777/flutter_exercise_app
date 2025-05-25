🏋️ Flutter Fitness App

A Flutter application which is having list of workouts with name, description and duration, You can see the more details about the workout in workout details screen.

## 🚀 Getting Started

🛠️ System Requirements

System Setup for this Project

- Android Studio: Meerkat Feature Drop | 2024.3.2
- Flutter SDK: 3.32.0 (stable)
- Dart SDK: 3.8.0 (stable)

Follow the steps below to set up and run the project locally:

```bash
flutter clean
flutter pub get
flutter packages pub run build_runner build

```

## Features

- Splash with Logo
- Dashboard (Workout List)
- Workout Details

This project architecture uses Clean Architecture pattern with Bloc

- data (Data layer logic)
- domain (Interact/Business Logic)
- presentation (UI/Views/State management)

## Project Folder Structure


```text
lib/
├── core/                        # Common, reusable components and services
│   ├── base/                    # Base classes or abstract implementations
│   ├── retrofit/                # API client and retrofit setup
│   ├── routes/                  # App routing/navigation setup
│   ├── utils/                   # Utility functions/constants
│   └── widgets/                 # Shared/reusable widgets
│
├── features/                    # Feature-specific code (e.g., Exercise feature)
│   └── exercise/
│       ├── data/               # Data layer: models, API sources, repositories
│       │   ├── data_source/      # Remote or local data sources
│       │   ├── models/           # Data models
│       │   └── repositories/     # Data implementation of repositories
│       ├── domain/             # Domain layer: business logic
│       │   ├── repositories/     # Abstract repository definitions
│       │   └── use_cases/        # Application-specific use cases
│       └── presentation/       # UI layer: screens, BLoCs, and UI components
│           ├── bloc/             # State management (BLoC/Cubit files)
│           ├── components/       # Smaller UI elements/widgets
│           └── screens/          # Full screen UI widgets
│
├── injection_container.dart    # Dependency injection setup
└── main.dart                   # App entry point

```

Please refer the below video to understand the app

## 📸 Demo Video

▶️ [Watch the Demo Video on Google Drive](https://drive.google.com/file/d/1DLBylazcCVlMGaopCWJ4tSPYPzpeezFQ/view?usp=sharing)





