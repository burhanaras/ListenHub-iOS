//
//  Coordinator.swift
//  ListenHub
//
//  Created by Burhan Aras on 12.09.2021.
//

import Foundation
import SwiftUI

final class Coordinator{
    public static let shared = Coordinator()
    private let repository: IRepository = DummyDataRepository()
    private let player = ListenHubPlayer.shared
    
    func contentView() -> ContentView {
        return ContentView(viewModel: ContentviewModel(player: player))
    }
    
    func bookDetailView(for book: Book) -> BookDetailView {
        let viewModel = BookDetailViewModel(repository: repository, book: book, player: player)
        return BookDetailView(viewModel: viewModel)
    }
    
    func collectionDetail(for language: Language) -> CollectionDetailView {
        let viewModel = CollectionDetailViewModel(repository: repository, category: nil, language: language)
        return CollectionDetailView(viewModel: viewModel)
    }
    
    func collectionDetail(for category: Category) -> CollectionDetailView {
        let viewModel = CollectionDetailViewModel(repository: repository, category: category, language: nil)
        return CollectionDetailView(viewModel: viewModel)
    }
    
    func playerView() -> PlayerView {
        return PlayerView(viewModel: PlayerViewModel(player: player))
    }
}
