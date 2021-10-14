//
//  NewPlayerViewModel.swift
//  ListenHub
//
//  Created by Burhan Aras on 5.10.2021.
//

import Foundation
import Combine

class NewPlayerViewModel: ObservableObject{
    @Published var book: Book = dummyBook
    @Published var chapters: [Chapter] = dummyBook.chapters
    
    @Published var currentChanpterIndex: Int = 0
    @Published var progress: Double = 0 {
        didSet {
            seek(to: Float(progress))
        }
    }
    @Published var isPlaying: Bool = false
    
    private let player: Player
    private var cancellables: Set<AnyCancellable> = []
    
    init(player: Player){
        self.player = player
        
        
        self.player.progressPublisher.sink(receiveValue: { [unowned self] prg in
            print("Progress is \(prg)")
            self.progress = Double(prg)
        })
            .store(in: &cancellables)
        
        self.player.playerStatePublisher.sink(receiveValue: { [unowned self] state in
            switch state {
            case .playing:
                self.isPlaying = true
            case .preparing:
                self.isPlaying = false
            case .paused:
                self.isPlaying = false
            }
        })
            .store(in: &cancellables)
        
        self.player.bookPublisher.sink(receiveValue: { [unowned self] book in
            self.book = book
            self.chapters = book.chapters
        })
            .store(in: &cancellables)
        
        self.player.currentChapterIndexPublisher.sink(receiveValue: { [unowned self] currentChapterIndex in
            self.currentChanpterIndex = currentChapterIndex
        })
            .store(in: &cancellables)
    }
    
    
    func togglePlay() {
        self.player.togglePlay()
    }
    
    func skip(to chapterIndex: Int) {
        self.player.skip(to: chapterIndex)
    }
    
    func skipToNextChapter() {
        self.player.skipToNextChapter()
    }
    
    func skipToPreviousChapter() {
        self.player.skipToPreviousChapter()
    }
    
    func seek(to percent: Float) {
        self.player.seek(to: percent)
    }
    
    func skipForward(){
        self.player.skipForward()
    }
    
    func skipBackward() {
        self.player.skipBackward()
    }
    
}
