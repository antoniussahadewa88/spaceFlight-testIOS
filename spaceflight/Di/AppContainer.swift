//
//  AppContainer.swift
//  spaceflight
//
//  Created by Antonius Krisna Sahadewa on 08/11/25.
//

import Foundation
import Swinject
import Alamofire
import Combine

enum DI {
    static let container: Container = {
        let c = Container()
        // Network Session with SSL pinning is registered in Network module
        c.register(Session.self) { _ in
            APIClient.session // use shared session
        }.inObjectScope(.container)

        c.register(SpaceFlightAPI.self) { r in
            SpaceFlightAPI(session: r.resolve(Session.self)!)
        }.inObjectScope(.container)

        c.register(ArticleRepository.self) { r in
            ArticleRepositoryImpl(api: r.resolve(SpaceFlightAPI.self)!)
        }.inObjectScope(.container)

        c.register(FetchArticlesUseCase.self) { r in
            FetchArticlesUseCaseImpl(repo: r.resolve(ArticleRepository.self)!)
        }

        c.register(ArticleListViewModel.self) { r in
            ArticleListViewModel(fetchUseCase: r.resolve(FetchArticlesUseCase.self)!)
        }
        
        
        
        c.register(RecentSearchRepository.self) { _ in
            RecentSearchRepositoryImpl()
        }.inObjectScope(.container)

        c.register(RecentSearchUseCase.self) { r in
            RecentSearchUseCaseImpl(repo: r.resolve(RecentSearchRepository.self)!)
        }

        c.register(RecentSearchViewModel.self) { r in
            RecentSearchViewModel(useCase: r.resolve(RecentSearchUseCase.self)!)
        }

        return c
    }()
}
