//
//  CacheService.swift
//  PictureOfEmoji
//
//  Created by Egor Volkov on 14.12.2019.
//  Copyright © 2019 Ivan Neskin. All rights reserved.
//

import UIKit
import CoreData


class CacheService {
   
    let persistentContainer:NSPersistentContainer
    private weak var startViewController:IStartScreenViewController?
    
    init() {
        self.persistentContainer = NSPersistentContainer(name: "PictureOfEmoji")
        self.persistentContainer.loadPersistentStores { (_, error) in
            if let error = error {
                fatalError("Can't load persistent stores. Error info: \(error.localizedDescription)")
            }
        }
    }
    
    func save() {
           do {
               try self.persistentContainer.viewContext.save()
           } catch {
               assertionFailure("Can't save viewContext with error: \(error.localizedDescription)")
           }
       }
}

extension CacheService: ICacheService {
    
    func cacheUser(userPlaiObject: UserPlainObject) -> UserManaged? {
        let context = self.persistentContainer.viewContext
        
        guard let entity = NSEntityDescription.entity(forEntityName: "User", in: context),
            let managedUser = NSManagedObject(entity: entity, insertInto: context) as? UserManaged else {

            assertionFailure("Can't cast managedUser to \(UserManaged.self)")
            return nil
        }
        
        managedUser.login = userPlaiObject.userLogin
        managedUser.password = userPlaiObject.userPassword
        
        save()
        
        return managedUser
    }
    
    
    func retrieve() -> [UserPlainObject] {
        let context = self.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")

        do {
            guard let results = try context.fetch(fetchRequest) as? [UserManaged] else {
                assertionFailure("Can't results cast to ManagedPerson.")
                return []
            }
            
            return results.map { UserPlainObject(userManaged: $0) }
        } catch {
            assertionFailure("Can't obtain person from Database.")
            return []
        }
    }
    
    
    func checkForEntities(with login: String, password: String) -> UserManaged? {
      let context = self.persistentContainer.viewContext

      let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
      fetchRequest.predicate = NSPredicate(format: "login = %@ && password = %@", login, password)

      do {
          guard let results = try context.fetch(fetchRequest) as? [UserManaged],
            let user = results.first else {
                startViewController?.alertController()
             // assertionFailure("No User.")
              return nil
          }
             return user
      } catch {
          assertionFailure("Can't obtain specific persons from Database.")
      }
        
        return nil
    }
    
    func attach(currentUser: UserPlainObject, imageEmojiData: EmojiModel) {
    
        let context = self.persistentContainer.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: "Picture", in: context),
            let managedPicture = NSManagedObject(entity: entity, insertInto: context) as? PictureManaged else {
                return
        }
        
        managedPicture.imageData = imageEmojiData.imageData
        managedPicture.created = imageEmojiData.createdDate
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        fetchRequest.predicate = NSPredicate(format: "login == %@", currentUser.userLogin)
        guard let userManaged = (try? context.fetch(fetchRequest) as? [UserManaged])??.first else { return }
 
        userManaged.addToImageDTO(managedPicture)
 
        save()
 
        }
    
    
    func retrieveImage(user: UserPlainObject) -> [EmojiModel] {
        let context = self.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        fetchRequest.predicate = NSPredicate(format: "login == %@",user.userLogin)
        do {
            let fetchResults = try context.fetch(fetchRequest)
            guard let results = fetchResults as? [UserManaged],
                let person = results.first else {
                return []
            }
            let array: [PictureManaged] = person.imageDTO?.allObjects as! [PictureManaged]
            return array.map { EmojiModel(pictureManaged: $0)  }
        }
            
        catch {
            fatalError()
        }
    }

    }
        
//func retrieve(login:String) -> [StockDTO] {
//    let context = self.persistentContainer.viewContext
//
//    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
//    fetchRequest.predicate = NSPredicate(format: "login == %@", login)
//    do {
//        let fetchResults = try context.fetch(fetchRequest)
//        guard let results = fetchResults as? [UserMO], let person = results.first else {
//            return []
//        }
//        let array: [StocksMO] = person.stocks?.allObjects as! [StocksMO]
//        return array.map { StockDTO(managedStock: $0) }
//    }
//
//    catch {
//        fatalError()
//    }
//}

