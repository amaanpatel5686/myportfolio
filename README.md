# Flutter Portfolio — Amaan Patel

A responsive, professional personal portfolio built with **Flutter Web**,
presenting Amaan Patel as an AI/ML student and aspiring AI Analyst. Built for
a college UI Lab internal examination and doubles as a resume/LinkedIn/GitHub
-ready portfolio.

## About

- **Name:** Amaan Patel
- **College:** CR RAO AIMSCS
- **Year / Branch:** 3rd Year, CSE (AI/ML)
- **Location:** Hyderabad
- **Tagline:** AI Analyst

## Features

- Clean, modern Material 3 design with cards, rounded corners and subtle
  shadows
- Fully responsive layout (desktop, tablet, mobile) using `LayoutBuilder`
  and `MediaQuery`
- Simple `Navigator.push` / `Navigator.pop` navigation — no third-party
  routing packages
- Reusable widgets: `ProjectCard`, `SkillChip`

## Portfolio Sections

| Section    | Where it lives |
| ---------- | -------------- |
| Home       | `HomePage`     |
| About Me   | `AboutPage`    |
| Skills     | Inside `AboutPage`, via `SkillChip` |
| Projects   | `ProjectsPage`, via `ProjectCard`   |

## Technologies

- Flutter (Web)
- Dart
- Material 3

## Flutter Widgets Demonstrated

`MaterialApp`, `Scaffold`, `AppBar`, `Text`, `CircleAvatar`, `Card`, `Chip`,
`Wrap`, `Row`, `Column`, `Padding`, `Expanded`, `ElevatedButton`,
`OutlinedButton`, `MediaQuery`, `LayoutBuilder`, `GridView`,
`SingleChildScrollView`, `SafeArea`

## Responsive Design

`LayoutBuilder` is used on the Projects page to switch the `GridView` between
1, 2, or 3 columns depending on screen width (breakpoints at 600px and
900px). `Wrap` is used for skill chips so they flow onto new lines
automatically on narrow screens.

## Navigation

Navigation uses plain Flutter `Navigator`:

```dart
Navigator.push(context, MaterialPageRoute(builder: (_) => const AboutPage()));
Navigator.pop(context);
Navigator.popUntil(context, (route) => route.isFirst);
```

## Project Structure

```
portfolio_app/
│
├── lib/
│   └── main.dart
│
├── web/
│
├── .github/
│   └── workflows/
│       └── deploy.yml
│
├── pubspec.yaml
├── README.md
└── .gitignore
```

## Local Installation

```
flutter doctor
flutter pub get
```

## Running Locally

```
flutter run -d chrome
```

## Production Build

```
flutter build web --release --base-href "/myportfolio/"
```

The build output is generated inside `build/web/`.

## GitHub Pages Deployment

Pushing to `main` triggers `.github/workflows/deploy.yml`, which builds the
site and publishes `build/web` to GitHub Pages automatically. In the
repository, go to **Settings → Pages → Build and deployment → Source** and
select **GitHub Actions**.

Live site: `https://amaanpatel5686.github.io/myportfolio/`