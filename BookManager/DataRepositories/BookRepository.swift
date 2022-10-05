// Created by Prof. H in 2022
// Part of the BookManager project
// Using Swift 5.0
// Qapla'

import Foundation
import Combine
import FirebaseFirestore
import FirebaseFirestoreSwift

class BookRepository: ObservableObject {
  private let path: String = "books"
  private let store = Firestore.firestore()

  @Published var books: [Book] = []
  private var cancellables: Set<AnyCancellable> = []

  init() {
    self.get()
  }

  func get() {
    store.collection(path)
      .addSnapshotListener { querySnapshot, error in
        if let error = error {
          print("Error getting books: \(error.localizedDescription)")
          return
        }

        self.books = querySnapshot?.documents.compactMap { document in
          try? document.data(as: Book.self)
        } ?? []
      }
  }

  // MARK: CRUD methods
  func add(_ book: Book) {
    do {
      var newBook = book
      _ = try store.collection(path).addDocument(from: newBook)
    } catch {
      fatalError("Unable to add book: \(error.localizedDescription).")
    }
  }

  func update(_ book: Book) {
    guard let bookId = book.id else { return }
    
    do {
      try store.collection(path).document(bookId).setData(from: book)
    } catch {
      fatalError("Unable to update book: \(error.localizedDescription).")
    }
  }

  func remove(_ book: Book) {
    guard let bookId = book.id else { return }
    
    store.collection(path).document(bookId).delete { error in
      if let error = error {
        print("Unable to remove book: \(error.localizedDescription)")
      }
    }
  }
  
  // MARK: Filtering methods
  func getBooksFor(_ author: String) -> [Book] {
    return self.books.filter{$0.author == author}
  }
  
  func getFemaleAuthoredBooks() -> [Book] {
    return self.books.filter{$0.gender == "Female"}
  }
  
  func getMaleAuthoredBooks() -> [Book] {
    return self.books.filter{$0.gender == "Male"}
  }
  
}
