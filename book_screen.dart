import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'book_provider.dart';
import 'book.dart';

class BookScreen extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController authorController = TextEditingController();

  BookScreen({super.key});

  void showBookDialog(BuildContext context, {int? index, Book? book}) {
    titleController.text = book?.title ?? "";
    authorController.text = book?.author ?? "";

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(index == null ? "Add Book" : "Edit Book"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: "Title"),
              ),
              TextField(
                controller: authorController,
                decoration: InputDecoration(labelText: "Author"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                if (titleController.text.isEmpty || authorController.text.isEmpty) return;

                if (index == null) {
                  Provider.of<BookProvider>(context, listen: false)
                      .addBook(titleController.text, authorController.text);
                } else {
                  Provider.of<BookProvider>(context, listen: false)
                      .updateBook(index, titleController.text, authorController.text);
                }
                Navigator.pop(context);
              },
              child: Text(index == null ? "Add" : "Update"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Book Manager")),
      body: Consumer<BookProvider>(
        builder: (context, bookProvider, child) {
          return ListView.builder(
            itemCount: bookProvider.books.length,
            itemBuilder: (context, index) {
              final book = bookProvider.books[index];
              return Card(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: ListTile(
                  title: Text(book.title, style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text("Author: ${book.author}"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit, color: Colors.blue),
                        onPressed: () => showBookDialog(context, index: index, book: book),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          Provider.of<BookProvider>(context, listen: false).deleteBook(index);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showBookDialog(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
