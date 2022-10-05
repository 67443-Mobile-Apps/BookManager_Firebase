// Created by Prof. H in 2022
// Part of the BookManager project
// Using Swift 5.0
// Qapla'

import SwiftUI

struct NewBookView: View {

  @ObservedObject var libraryViewModel = LibraryViewModel()

  @State private var title = ""
  @State private var author = ""
  @State private var gender = "Male"
  @State private var displayed = false

  var body: some View {
    VStack {
      Text("New Book")
        .font(.title)
        .fontWeight(.bold)
      Form {
        TextField("Title", text: $title)
        TextField("Author", text: $author)

        Picker(selection: $gender,
               label: Text("Author Gender")) {
          ForEach(Gender.allGenders, id: \.self) { gender in
               Text(gender).tag(gender)
            }
          }

        Toggle(isOn: $displayed,
               label: {
                 Text("Display book in library")
        })

        if self.isValidBook() {
          Button("Add Book") {
            addBook()
            clearFields()
          }
        }
      }
    }
  }

  private func isValidBook() -> Bool {
    if title.isEmpty { return false }
    if author.isEmpty { return false }
    return true
  }

  private func clearFields() {
    title = ""
    author = ""
  }
  
  private func addBook() {
    let book = Book(title: title, author: author, gender: gender, displayed: true)
    libraryViewModel.add(book)
  }
  
}
