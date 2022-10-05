// Created by Prof. H in 2022
// Part of the BookManager project
// Using Swift 5.0
// Qapla'

import SwiftUI

struct BookRowView: View {
  var book: Book
  
  var body: some View {
    
    NavigationLink(
      destination: BookDetailsView(book: book),
      label: {
        Text(book.title)
          .fontWeight(.bold)
          .font(.body)
      })
  }
}
