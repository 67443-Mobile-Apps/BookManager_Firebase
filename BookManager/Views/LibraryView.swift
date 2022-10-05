// Created by Prof. H in 2022
// Part of the BookManager project
// Using Swift 5.0
// Qapla'

import SwiftUI

struct LibraryView: View {
  
  // @EnvironmentObject var library: Library
  @ObservedObject var libraryViewModel = LibraryViewModel()
  
  var body: some View {    
    NavigationView {
      List{
        let bookViewModels = libraryViewModel.bookViewModels.sorted(by: { $0.book < $1.book })
        ForEach(bookViewModels) { bookViewModel in
          BookRowView(book: bookViewModel.book)
        }
      }.navigationBarTitle("Library")
    }
  }
  
}

