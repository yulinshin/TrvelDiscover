//
//  DataFromAirtable.swift
//  TrvelDiscover
//
//  Created by yulin on 2021/5/21.
//
struct CategorytableRecords:Decodable {
   var records : [CategoryTableRecord]
}
struct CategoryTableRecord: Decodable,Hashable {
    var id : String
    var fields : Place
}

struct Place: Decodable,Hashable {
    var name,thumbnail : String
}
