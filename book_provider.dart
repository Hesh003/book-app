import 'package:flutter/material.dart';
import 'book.dart';

class BookProvider extends ChangeNotifier {
  final List<Book> _books = [];

  List<Book> get books => _books;

  void addBook(String title, String author) {
    _books.add(Book(title: title, author: author));
    notifyListeners();
  }

  void updateBook(int index, String title, String author) {
    _books[index] = Book(title: title, author: author);
    notifyListeners();
  }

  void deleteBook(int index) {
    _books.removeAt(index);
    notifyListeners();
  }
}
