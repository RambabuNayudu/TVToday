//
//  HeaderSeasonsTableViewCell.swift
//  ShowDetails
//
//  Created by Jeans Ruiz on 8/11/20.
//

import UIKit
import Shared
import UI

class HeaderSeasonsTableViewCell: NiblessTableViewCell {

  private let showNameLabel = TVRegularLabel()
  private let seasonsLabel = TVRegularLabel()

  var viewModel: SeasonHeaderViewModelProtocol?

  public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupUI()
  }

  func setModel(viewModel: SeasonHeaderViewModelProtocol) {
    self.viewModel = viewModel
    showNameLabel.text = viewModel.showName
  }

  private func setupUI() {
    backgroundColor = .systemGroupedBackground
    constructHierarchy()
    activateConstraints()
    setupViews()
  }

  private func setupViews() {
    showNameLabel.font = Font.sanFrancisco.of(type: .bold, with: .custom(22))
    seasonsLabel.textColor = .secondaryLabel
    seasonsLabel.text = "Seasons:"
  }

  private func constructHierarchy() {
    addSubview(showNameLabel)
    addSubview(seasonsLabel)
  }

  private func activateConstraints() {
    activateConstraintsForTitleLabel()
    activateConstraintsForSeasons()
  }

  private func activateConstraintsForTitleLabel() {
    showNameLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      showNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
      showNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
      showNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
      showNameLabel.bottomAnchor.constraint(equalTo: seasonsLabel.topAnchor, constant: -10)
    ])
  }

  private func activateConstraintsForSeasons() {
    seasonsLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      seasonsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
      seasonsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
      seasonsLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
    ])
  }
}
