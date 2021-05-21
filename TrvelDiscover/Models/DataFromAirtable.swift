//
//  DataFromAirtable.swift
//  TrvelDiscover
//
//  Created by yulin on 2021/5/21.
//
struct AirtableRecords:Decodable {
   var records : [AirTableRecord]
}
struct AirTableRecord: Decodable,Hashable {
    var id : String
    var fields : Place
}

struct Place: Decodable,Hashable {
    var name,thumbnail : String
}
