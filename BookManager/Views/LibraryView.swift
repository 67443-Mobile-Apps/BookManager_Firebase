// Created by Prof. H in 2022
// Part of the BookManager project
// Using Swift 5.0
// Qapla'

import SwiftUI

struct LibraryView: View {
  
  // @EnvironmentObject var library: Library
  @ObservedObject var libraryViewModel = LibraryViewModel()
  
  var body: some View {
    let bookViewModels = libraryViewModel.bookViewModels.sorted(by: { $0.book < $1.book })
    
    NavigationView {
      List{
        ForEach(bookViewModels) { bookViewModel in
          BookRowView(book: bookViewModel.book)
        }
        .onDelete(perform: removeBooks)
      }.navigationBarTitle("Library")
    }
  }
  

  
  func removeBooks(at offsets: IndexSet) {
    libraryViewModel.bookViewModels =
    libraryViewModel.bookViewModels.sorted(by: { $0.book < $1.book }).enumerated().filter { (i, bookVM) -> Bool in
        let removed = offsets.contains(i)
        if removed {
          libraryViewModel.destroy(bookVM.book)
        }
        return !removed
    }.map { $0.1 }
  }
  
}

