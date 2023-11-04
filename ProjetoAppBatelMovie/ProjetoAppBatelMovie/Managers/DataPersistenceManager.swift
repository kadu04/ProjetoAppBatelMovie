//
//  DataPersistenceManager.swift
//  ProjetoAppBatelMovie
//
//  Created by Ricardo Massaki on 04/11/23.
//

import Foundation
import UIKit
import CoreData


class DataPersistenceManager {
    
    enum DataBaseError: Error {
        case failedToSaveData
    }
    
    static let shared = DataPersistenceManager()
    
    func downloadTitleWith(model: Title, completion: @escaping(Result<Void, Error>) -> Void) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        
        let item = TitleItem(context: context)
        
        item.original_title = model.original_title
        item.id = Int64(model.id)
        item.title = model.title
        item.overview = model.overview
        item.poster_path = model.poster_path
        item.release_data = model.release_data
        item.vote_average = model.vote_average
        item.vote_count = Int64(model.vote_count)
        
        
        do {
            try context.save()
            completion(.success(()))
        } catch {
            completion(.failure(DataBaseError.failedToSaveData) )
        }
    }
}
