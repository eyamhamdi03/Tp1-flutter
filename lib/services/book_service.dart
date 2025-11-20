import '../models/book.dart';
import 'db_helper.dart';

class BookService {
  // INSERT
  Future<void> insertBook(Book book, {String? userEmail}) async {
    final database = await DatabaseHelper.getDb();

    await database.transaction((txn) async {
      await txn.rawInsert(
        "INSERT INTO book(name, price, image, user_email) "
        "VALUES('${book.name}', ${book.price}, '${book.image}', '${userEmail ?? ""}')",
      );
    });

    print("Book inserted !");
  }

  Future<List<Book>> fetchBasketBooks() async {
    final database = await DatabaseHelper.getDb();

    List<Book> books = [];

    await database.transaction((txn) async {
      List<Map> list = await txn.rawQuery("SELECT * FROM book");

      print("📚 Fetched ${list.length} books from database");
      print("📚 Database result: $list");

      for (var element in list) {
        books.add(
          Book(
            element["name"] as String,
            element["price"] as int,
            element["image"].toString(),
          ),
        );
      }
    });

    return books;
  }

  Future<List<Book>> fetchBooksByUser(String email) async {
    final database = await DatabaseHelper.getDb();

    List<Book> books = [];
    await database.transaction((txn) async {
      List<Map> list = await txn.rawQuery(
        "SELECT * FROM book WHERE user_email = '$email'",
      );

      for (var element in list) {
        books.add(
          Book(element["name"], element["price"], element["image"].toString()),
        );
      }
    });

    return books;
  }

  Future<void> deleteBook(String name) async {
    final db = await DatabaseHelper.getDb();
    await db.rawDelete("DELETE FROM book WHERE name = '$name'");
  }

  Future<void> clearBooks() async {
    final db = await DatabaseHelper.getDb();
    await db.rawDelete("DELETE FROM book");
  }
}
