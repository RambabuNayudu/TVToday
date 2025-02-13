//
//  TVShowDetailViewTestsDark.swift
//  ShowDetailsTests
//
//  Created by Jeans Ruiz on 19/12/21.
//

import SnapshotTesting
import XCTest

@testable import ShowDetails
@testable import Shared

class TVShowDetailViewTestsDark: XCTestCase {

  override func setUp() {
    super.setUp()
    isRecording = false
  }

  func test_WhenViewIsLoading_thenShowLoadingScreen() {
    // given
    let initialState = TVShowDetailViewModelMock(state: .loading)

    // when
    let viewController = TVShowDetailViewController(viewModel: initialState)
    viewController.overrideUserInterfaceStyle = .dark

    // then
    assertSnapshot(matching: viewController, as: .wait(for: 1, on: .image(on: .iPhoneSe)))
  }

  func test_WhenViewPopulated_thenShowPopulatedScreen() {
    // given
    let initialState = TVShowDetailViewModelMock(state: .populated( TVShowDetailInfo.stub() ))

    // when
    let viewController = TVShowDetailViewController(viewModel: initialState)
    viewController.overrideUserInterfaceStyle = .dark

    // then
    assertSnapshot(matching: viewController, as: .wait(for: 1, on: .image(on: .iPhoneSe)))
    assertSnapshot(matching: viewController, as: .wait(for: 1, on: .image(on: .iPhoneXsMax)))
  }

  func test_WhenViewIsError_thenShowErrorScreen() {
    // given
    let initialState = TVShowDetailViewModelMock(state: .error("Error to Fetch Details"))

    // when
    let viewController = TVShowDetailViewController(viewModel: initialState)
    viewController.overrideUserInterfaceStyle = .dark

    // then
    assertSnapshot(matching: viewController, as: .wait(for: 1, on: .image(on: .iPhoneSe)))
  }
}
