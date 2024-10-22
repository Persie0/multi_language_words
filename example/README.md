## Examples

```dart
import 'package:multi_language_words/multi_language_words.dart';

void main() {
  final generator = WordGenerator();

  // Generate 5 random words (defaults to English)
  final words = generator.generateRandomWords(5);
  print(words); // e.g., ["network", "turtle", "cannon", "design", "market"]

  // Generate words in a specific language
  final spanishWords = generator.generateRandomWords(3, Language.spanish);
  print(spanishWords); // e.g., ["casa", "tiempo", "vida"]

  // Get all available languages
  final languages = generator.getAvailableLanguages();
  print(languages); // [Language.english, Language.spanish, ...]

  // Get complete word list for a language
  final allJapaneseWords = generator.getAllWords(Language.japanese);
  print(allJapaneseWords); // prints all available Japanese words
}

}
```

