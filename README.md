# Multi-Language Word Generator

A Dart package for generating random words in multiple languages. This package provides a simple way to generate unique random words from predefined word lists in various languages. Based on the word lists from [bip39_multi_language](https://github.com/bhoomit74/bip39_multi_language).
## Supported Languages

- English
- French
- Italian
- Spanish
- Japanese
- Korean
- Portuguese
- Czech
- Chinese (Traditional)
- Chinese (Simplified)

## Features

- Generate random unique words in multiple languages
- Get complete word lists for supported languages
- Retrieve list of available languages
- Default English language support with optional language selection
- No external dependencies required
- Efficient random selection algorithm

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  multi_language_words: ^1.0.0
```

Then run:

```bash
dart pub get
```

## Usage

### Basic Usage

```dart
import 'package:multi_language_words/multi_language_words.dart';

void main() {
  final generator = WordGenerator();
  
  // Generate 5 random English words (default language)
  final words = generator.generateRandomWords(5);
  print(words); // e.g., ["network", "turtle", "cannon", "design", "market"]
  
  // Generate words in a specific language
  final spanishWords = generator.generateRandomWords(3, Language.spanish);
  print(spanishWords); // e.g., ["casa", "tiempo", "vida"]
}
```

### Get Available Languages

```dart
final generator = WordGenerator();
final languages = generator.getAvailableLanguages();
print(languages); // [Language.english, Language.spanish, ...]
```

### Get Complete Word List

```dart
final generator = WordGenerator();
final allWords = generator.getAllWords(Language.english);
print(allWords.length); // prints total number of words in English
```

## API Reference

### `WordGenerator` Class

#### `generateRandomWords(int count, [Language? language])`
Generates a list of random unique words.
- `count`: Number of words to generate
- `language`: Optional language selection (defaults to English)
- Returns: `List<String>` of unique random words
- Throws: `ArgumentError` if count is less than 1 or exceeds available words

#### `getAvailableLanguages()`
Returns a list of all supported languages.
- Returns: `List<Language>` containing all available languages

#### `getAllWords([Language? language])`
Returns the complete word list for a specified language.
- `language`: Optional language selection (defaults to English)
- Returns: `List<String>` containing all words in the specified language

### `Language` Enum

Available languages include:
- `Language.english`
- `Language.french`
- `Language.italian`
- `Language.spanish`
- `Language.japanese`
- `Language.korean`
- `Language.portuguese`
- `Language.czech`
- `Language.chineseTraditional`
- `Language.chineseSimplified`

## Error Handling

The package includes proper error handling:

```dart
try {
  // This will throw an ArgumentError if count exceeds available words
  final words = generator.generateRandomWords(1000000);
} catch (e) {
  print(e); // "Not enough words, only having X and not Y"
}

try {
  // This will throw an ArgumentError
  final words = generator.generateRandomWords(0);
} catch (e) {
  print(e); // "Count must be greater than 0"
}
```

## Implementation Details

- Uses Dart's built-in `Random` class for random number generation
- Ensures no duplicate words in generated lists
- Efficient selection algorithm using dynamic index list
- Memory-efficient implementation for large word lists

## Attribution

This package uses word lists from the [bip39_multi_language](https://github.com/bhoomit74/bip39_multi_language) package by [bhoomit74](https://github.com/bhoomit74).

## License

MIT License

Copyright (c) 2024

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.
