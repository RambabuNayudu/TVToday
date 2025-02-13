//
//  FetchAccountDetailsUseCaseMock.swift
//  AccountTV-Unit-Tests
//
//  Created by Jeans Ruiz on 8/8/20.
//

import RxSwift
@testable import Account

final class FetchAccountDetailsUseCaseMock: FetchAccountDetailsUseCase {
  var result: AccountResult?

  var error: Error?

  func execute() -> Observable<AccountResult> {
    if let error = error {
      return Observable.error(error)
    }

    if let result = result {
      return Observable.just(result)
    }

    return Observable.empty()
  }
}
