# Civic Games

A Flutter arcade for short simulations about democracy, media literacy, and public life.

## Run locally

```bash
flutter pub get
flutter run -d chrome
```

Build the web version with:

```bash
flutter build web --release
```

## Structure

- `lib/main.dart`: app UI, game catalog, About placeholder, and game interactions.
- `test/`: widget tests.
- `web/`: web shell, manifest, and icons.

## Personalize

The editable About section is on the Discover and Library screens. Replace the placeholder biography, name/studio label, and link chips in `_AboutSection` inside `lib/main.dart`.
