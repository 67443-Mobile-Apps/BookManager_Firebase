// Created by Prof. H in 2022
// Part of the BookManager project
// Using Swift 5.0
// Qapla'

import SwiftUI

struct AppView: View {

  // Originally had this:
  //  var library = Library()
  // Now it would be this:
  //  var libraryViewModel = LibraryViewModel()
  
  var body: some View {
    
    TabView {
      LibraryView()
      .tabItem {
          Image(systemName: "books.vertical")
          Text("Library")
      }

      NewBookView()
      .tabItem {
          Image(systemName: "rectangle.stack.badge.plus")
          Text("New Book")
      }
      
      ChartsView()
      .tabItem {
          Image(systemName: "chart.bar.xaxis")
          Text("Charts")
      }
    }
  // But since I am using Firebase, do I really need this anymore?
  //    .environmentObject(libraryViewModel)
  }
}


