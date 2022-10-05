// Created by Prof. H in 2022
// Part of the BookManager project
// Using Swift 5.0
// Qapla'

import SwiftUI

struct BookDetailsView: View {
  var book: Book
  
  var body: some View {
    VStack {
      Text(book.title)
        .font(.title)
        .fontWeight(.black)
        .padding([.top], 40)
      Text("Author:  \(book.author)")
        .font(.title3)
        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
        .padding(5)
      Text("Author Gender: \(book.gender)")
        .font(.headline)
        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
        .foregroundColor(.secondary)
        .padding(20)
    }.navigationBarTitle(Text("Book Details"), displayMode: .inline)
    
    Spacer()  // To force the content to the top
  }
}
