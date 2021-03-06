//
//  IRepository.swift
//  ListenHub
//
//  Created by Burhan Aras on 11.09.2021.
//

import Foundation

protocol IRepository {
    func getHomeCollections(completion: @escaping (Result<[Collection], Error>) -> Void)
    func getSimilarContentFor(bookId: String, completion: @escaping (Result<Collection, Error>) -> Void)
    func getLanguages(completion: @escaping (Result<[Language], Error>) -> Void)
    func getCategories(completion: @escaping (Result<[Category], Error>) -> Void)
    func search(for query: String, completion: @escaping (Result<[Book], Error>) -> Void)
    func getSearchHints(completion: @escaping (Result<[String], Error>) -> Void)
    func getCategoryDetail(completion: @escaping (Result<[Book], Error>) -> Void)
    func getLanguageDetail(completion: @escaping (Result<[Book], Error>) -> Void)
}


enum RequestError: Error{
    case badURL
    case sessionExpired
    case noInternet
    case webServiceDown
}
