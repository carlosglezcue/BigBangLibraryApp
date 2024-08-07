//
//  DataTest.swift
//  BigBangLibraryApp
//
//  Created by carlos.gonzalez.local on 26/4/24.
//

import SwiftUI

struct EpisodeInteractorTest: DataInteractor {
    func loadEpisodes() throws -> [Episode] {
        guard let url = Bundle.main.url(
            forResource: "BigBangTest",
            withExtension: "json"
        ) else { return [] }
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode([EpisodeDTO].self, from: data).map(\.toPresentationTest)
    }
    
    func saveEpisode(episodes: [Episode]) throws {
    }
}

extension EpisodeDTO {
    var toPresentationTest: Episode {
        Episode(
            id: id,
            url: url,
            name: name,
            season: season,
            number: number,
            airdate: airdate,
            runtime: runtime,
            image: image,
            summary: summary,
            isFavourite: false,
            wasSeen: false,
            rating: 0.0,
            notes: ""
        )
    }
}

extension MainView {
    static var preview: some View {
        MainView()
            .environmentObject(MainViewModel(interactor: EpisodeInteractor()))
    }
}

extension DetailView {
    static var preview: some View {
        NavigationStack {
            DetailView(detailViewModel: DetailViewModel(episode: .test))
                .environmentObject(MainViewModel(interactor: EpisodeInteractorTest()))
        }
    }
}

extension FavoritedListView {
    static var preview: some View {
        FavoritedListView()
            .environmentObject(MainViewModel(interactor: EpisodeInteractor()))
    }
}

extension Episode {
    static let test = Episode(
        id: 2928,
        url: URL(string: "https://www.tvmaze.com/episodes/2928/the-big-bang-theory-1x16-the-peanut-reaction")!,
        name: "The Peanut Reaction",
        season: 1,
        number: 16,
        airdate: "2008-05-12",
        runtime: 30,
        image: "12464",
        summary: "When Penny learns that Leonard doesn't celebrate birthdays, she attempts to throw him a surprise party, but is sidetracked by Sheldon who unexpectedly gets to live out one of his greatest fantasies at an electronics store.\n",
        isFavourite: false,
        wasSeen: false,
        rating: 0.0,
        notes: ""
    )
}
