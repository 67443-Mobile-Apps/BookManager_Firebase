// Created by Prof. H in 2022
// Part of the BookManager project
// Using Swift 5.0
// Qapla'

import Foundation
import Combine

class LibraryViewModel: ObservableObject {
  @Published var bookViewModels: [BookViewModel] = []
  private var cancellables: Set<AnyCancellable> = []

  @Published var bookRepository = BookRepository()
  @Published var library: [Book] = []
  
  init() {
    bookRepository.$books.map { books in
      books.map(BookViewModel.init)
    }
    .assign(to: \.bookViewModels, on: self)
    .store(in: &cancellables)
  }

  func add(_ book: Book) {
    bookRepository.create(book)
  }
  
  func destroy(_ book: Book) {
    bookRepository.delete(book)
  }
  
}
