import 'dart:math';
import 'package:multi_language_words/src/utils/languages.dart';

class WordGenerator {
  final Random _random = Random();
  static const Language _defaultLanguage = Language.english;

  /// Generate a list of random words in specified language
  /// [count] - number of words to generate
  /// [language] - optional language to use (defaults to English)
  List<String> generateRandomWords(int count, [Language? language]) {
    if (count <= 0) {
      throw ArgumentError('Count must be greater than 0');
    }

    final selectedLanguage = language ?? _defaultLanguage;
    final List<String> wordlist = getWordList(selectedLanguage);
    if (wordlist.length < count) {
      throw ArgumentError('Not enough words, only having ' +
          wordlist.length.toString() +
          "and not " +
          count.toString());
    }

    final List<String> result = [];
    final Set<int> usedIndices = {};

    List<int> availableIndices =
        List.generate(wordlist.length, (index) => index);
    while (result.length < count) {
      final randomIndex = _random.nextInt(availableIndices.length);
      final selectedIndex = availableIndices[randomIndex];
      result.add(wordlist[selectedIndex]);
      availableIndices.removeAt(randomIndex);
    }

    return result;
  }

  /// Get all available languages
  /// Returns a list of all supported languages
  List<Language> getAvailableLanguages() {
    return Language.values;
  }

  /// Get all words for a specific language
  /// [language] - optional language to use (defaults to English)
  /// Returns complete word list for the specified language
  List<String> getAllWords([Language? language]) {
    final selectedLanguage = language ?? _defaultLanguage;
    return getWordList(selectedLanguage);
  }
}
