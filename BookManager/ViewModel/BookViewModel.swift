// Created by Prof. H in 2022
// Part of the BookManager project
// Using Swift 5.0
// Qapla'

import Foundation
import Combine

class BookViewModel: ObservableObject, Identifiable {

  private let bookRepository = BookRepository()
  @Published var book: Book
  private var cancellables: Set<AnyCancellable> = []
  var id = ""

  init(book: Book) {
    self.book = book
    $book
      .compactMap { $0.id }
      .assign(to: \.id, on: self)
      .store(in: &cancellables)
  }

  func update(book: Book) {
    bookRepository.update(book)
  }

  func destroy(book: Book) {
    bookRepository.delete(book)
  }
  
}
