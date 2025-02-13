//
//  SearchShowsOptionsHelper.swift
//  SearchShowsTests
//
//  Created by Jeans Ruiz on 20/12/21.
//

@testable import SearchShows
@testable import Shared
@testable import Persistence

public func createSectionModel(showsVisited: [ShowVisited], genres: [Genre]) -> [SearchOptionsSectionModel] {
  var dataSource: [SearchOptionsSectionModel] = []

  let showsSectionItem = mapRecentShowsToSectionItem(recentsShows: showsVisited)

  if let recentShowsSection = showsSectionItem {
    dataSource.append(.showsVisited(items: [recentShowsSection]))
  }

  let genresSectionItem = mapGenreToSectionItem(genres: genres)

  if !genresSectionItem.isEmpty {
    dataSource.append(.genres(items: genresSectionItem))
  }

  return dataSource
}

private func mapRecentShowsToSectionItem(recentsShows: [ShowVisited]) -> SearchSectionItem? {
  let visitedModel = VisitedShowViewModelMock(showsMock: recentsShows)
  return recentsShows.isEmpty ? nil : .showsVisited(items: visitedModel)
}

private func mapGenreToSectionItem(genres: [Genre] ) -> [SearchSectionItem] {
  return genres
    .map { GenreViewModelMock(id: $0.id, name: $0.name) }
    .map { SearchSectionItem.genres(items: $0) }
}
