class Book {
  int id;
  String title;
  bool borrowed;

  Book(this.id, this.title, this.borrowed);

  void displayInfo() {
    if(borrowed){
          print("Book ID: $id, Title: '$title', Borrowed: Yes");
    }else{
          print("Book ID: $id, Title: '$title', Borrowed: No");
    }
  }
}

class User {
  int id;
  String name;

  User(this.id, this.name);

  void displayInfo() {
    print("User ID: $id, Name: $name");
  }
}

class Library {
  List<Book> books = [];
  List<User> users = [];

  void addBook(Book book) {
    books.add(book);
    print("Book '${book.title}' has been added to the library.");
  }

  void addUser(User user) {
    users.add(user);
    print("User '${user.name}' has been added to the library.");
  }

  void borrowBook(int bookId, int userId) {
    // Find the book by ID
    var book = books.firstWhere(
      (__book) => __book.id == bookId
    );

    if (!book.borrowed) {
      book.borrowed = true;
      print("User with ID $userId borrowed the book '${book.title}'.");
    } else {
      print("The book with ID $bookId is already borrowed.");
    }
  }

  void returnBook(int bookId) {
    // Find the book by ID
    var book = books.firstWhere(
      (__book) => __book.id == bookId);

    // Check if the book is borrowed
    if (book.borrowed) {
      book.borrowed = false;
      print("The book '${book.title}' has been returned.");
    } else {
      print("The book with ID $bookId is not borrowed.");
    }
  }

  void displayInfo() {
    print("\n Library Info");
    print("Books in the library:");
    for (var book in books) {
      book.displayInfo();
    }
    print("\n Users in the library:");
    for (var user in users) {
      user.displayInfo();
    }
  }
}

void main() {
  Library library = Library();

 library.addBook(Book(1, "Book1", false));
  library.addBook(Book(2, "Book2", false));
  library.addBook(Book(3, "Book3", false));

  library.addUser(User(1, "Mohamed"));
  library.addUser(User(2, "Ahmed"));

  library.borrowBook(1, 1); 
  library.borrowBook(2, 2); 
  library.returnBook(1);    

  library.displayInfo();
}
