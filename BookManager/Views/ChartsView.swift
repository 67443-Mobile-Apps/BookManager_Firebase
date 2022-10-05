// Created by Prof. H in 2022
// Part of the BookManager project
// Using Swift 5.0
// Qapla'

import SwiftUI
import Charts

struct ChartsView: View {
  
// MARK: Use this instead if charts don't work on your version of Xcode
//  var body: some View {
//      Text("Qapla'")
//  }
  
  @ObservedObject var library = BookRepository()
  
  var body: some View {
        
    VStack {
      Text("Books by Author Gender")
        .font(.headline)
      Chart {
        BarMark(
          x: .value("Mount", "Male"),
          y: .value("Value", library.getMaleAuthoredBooks().count)
        )
        BarMark(
          x: .value("Mount", "Female"),
          y: .value("Value", library.getFemaleAuthoredBooks().count)
        )
        .foregroundStyle(.pink)
      }
      .frame(height: 250)
      .padding(20)

      Spacer()

      Text("Books by Popular Authors")
        .font(.headline)
      Chart {
        BarMark(
          x: .value("Mount", "Shakespeare"),
          y: .value("Value", library.getBooksFor("William Shakespeare").count)
        )
        BarMark(
          x: .value("Mount", "Tolkien"),
          y: .value("Value", library.getBooksFor("J.R.R. Tolkien").count)
        )
        BarMark(
          x: .value("Mount", "Austen"),
          y: .value("Value", library.getBooksFor("Jane Austen").count)
        )
        BarMark(
          x: .value("Mount", "Dickens"),
          y: .value("Value", library.getBooksFor("Charles Dickens").count)
        )
        BarMark(
          x: .value("Mount", "Bronte"),
          y: .value("Value", library.getBooksFor("Charlotte Bronte").count)
        )
      }
      .frame(height: 250)
      .padding(20)
      .foregroundColor(Color.green)
    }
  }
}
