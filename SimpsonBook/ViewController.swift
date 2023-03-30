//
//  ViewController.swift
//  SimpsonBook
//
//  Created by Can Kanbur on 30.03.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var tableView: UITableView!
    var simpsonFamily: [Simpson] = []
    var name = ""
    var job = ""
    var image = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()

        let homer = Simpson(name: "homer", job: "test1", image: UIImage(named: "homer")!)
        let bart = Simpson(name: "bart", job: "test2", image: UIImage(named: "bart")!)
        let lisa = Simpson(name: "lisa", job: "test3", image: UIImage(named: "lisa")!)
        let maggie = Simpson(name: "maggie", job: "test4", image: UIImage(named: "maggie")!)
        let marge = Simpson(name: "marge", job: "test5", image: UIImage(named: "marge")!)

        simpsonFamily.append(homer)
        simpsonFamily.append(bart)
        simpsonFamily.append(lisa)
        simpsonFamily.append(lisa)
        simpsonFamily.append(maggie)
        simpsonFamily.append(marge)

        tableView.dataSource = self

        tableView.delegate = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return simpsonFamily.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = simpsonFamily[indexPath.row].name
        cell.contentConfiguration = content
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        name = simpsonFamily[indexPath.row].name
        job = simpsonFamily[indexPath.row].job
        image = simpsonFamily[indexPath.row].image
        performSegue(withIdentifier: "toSecondVc", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondVc" {
            let destination = segue.destination as! SecondViewController
            destination.name = name
            destination.job = job
            destination.image = image
        }
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            simpsonFamily.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
}
