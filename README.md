# Ranking_App

## COMMANDS TO GENERATED CODE:

### Locales

```flutter pub run easy_localization:generate -S assets/i18n -f keys -O lib/ui/i18n -o locale_keys.g.dart```

### Other generated codes

```dart run build_runner build```

# STEPS TO RUN THE THE APPLICATION:

1. Run the above commands
2. Update .env.example and put your GPT API KEY inside and rename the file into .env
3. Run the Flutter essential commands (ex. pub get, etc.)

# TODO CHANGES:

- [ ] Use streams instead futures to get the information from backend
- [ ] Improve the UI/UX
- [ ] Improve gptProvider
