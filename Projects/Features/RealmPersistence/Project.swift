import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.framework(
  name: "RealmPersistence",
  dependencies: [
    .package(product: "Realm"),
    .package(product: "RealmSwift"),
    .package(product: "RxSwift"),
    .project(
      target: "Persistence",
      path: .relativeToRoot("Projects/Features/Persistence")
    )
  ]
)
