// Created by Prof. H in 2022
// Part of the BookManager project
// Using Swift 5.0
// Qapla'

import Foundation
import FirebaseFirestoreSwift

struct Book: Identifiable, Comparable, Codable {
    
  // MARK: Fields
  @DocumentID var id: String?
  var title: String
  var author: String
  var gender: String
  var displayed: Bool
  
  // MARK: Codable
  enum CodingKeys: String, CodingKey {
    case id
    case title
    case author
    case gender
    case displayed
  }
  
  // MARK: Comparable
  static func ==(lhs: Book, rhs: Book) -> Bool {
    return lhs.title == rhs.title && lhs.author == rhs.author
  }
  
  static func <(lhs: Book, rhs: Book) -> Bool {
    return lhs.title < rhs.title
  }
  
}
