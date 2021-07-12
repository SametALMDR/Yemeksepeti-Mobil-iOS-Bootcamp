//
//  CookListViewController.swift
//  Week-3
//
//  Created by Kerim Caglar on 4.07.2021.
//

import UIKit
import CoreData

class CookListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var cooks = [CookCD]()
    
    //MARK: Resmi cell de gösteriniz
    //Silme işlemi yapınız. Direk silmeden ziyade kullanıcıya uyarı gösterip silmek istediğinizden emin misiniz uyarısı ile işlemi yapınız.
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getCooks()
    }
    
    private func getCooks() {
        cooks.removeAll()
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Cook")
        
        do {
            let results = try context.fetch(fetchRequest)
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    guard let id = result.value(forKey: "id")as? UUID else { return }
                    guard let name = result.value(forKey: "name") as? String else { return }
                    
                    if let image = result.value(forKey: "image")as? Data {
                        cooks.append(CookCD(id: id, name: name, image: UIImage(data: image) ?? UIImage()))
                    }else {
                        cooks.append(CookCD(id: id, name: name, image: UIImage()))
                    }
                    
                }
                self.tableView.reloadData()
            }
        } catch {
            print("Error")
        }
        
    }

}

extension CookListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cooks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cookCell", for: indexPath)
        
        
        cell.textLabel?.text = cooks[indexPath.row].name
        cell.imageView?.image = cooks[indexPath.row].image
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let alertController = UIAlertController(title: "Ooop?", message: "Are you sure to delete this item?", preferredStyle: .alert)
            let delAction = UIAlertAction(title: "Yes", style: .default) { (UIAlertAction) in
                self.removeCookFromCoreData(id: self.cooks[indexPath.row].id)
                self.cooks.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            let noAction = UIAlertAction(title: "No", style: .cancel) { (UIAlertAction) in
                self.dismiss(animated: true, completion: nil)
            }
            alertController.addAction(delAction)
            alertController.addAction(noAction)
            present(alertController, animated: true, completion: nil)
        }
    }
    
    func removeCookFromCoreData(id: UUID){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Cook")
        
        do {
            let results = try context.fetch(fetchRequest)
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    guard let resid = result.value(forKey: "id")as? UUID else { return }
                    if id == resid {
                        context.delete(result)
                    }
                }
                try context.save()
            }
        } catch {
            print("Error")
        }
        
    }
    
}
