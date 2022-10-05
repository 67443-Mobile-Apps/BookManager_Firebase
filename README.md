BookManager: Class Example with Firebase
---

This is a variant of the BookManager lab that uses Firebase to populate the app rather than the huge array we kept in memory.  It does not contain a `GoogleService-Info.plist` file, so each student would have to go to [Firebase](https://firebase.google.com/) and set up a project and an instance of Firestore.  Within that, it expects a collection called `books` and each book has the fields we have been working with.
