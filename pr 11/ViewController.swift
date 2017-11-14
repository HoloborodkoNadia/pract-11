//
//  ViewController.swift
//  pr 11
//
//  Created by nadia on 01.11.17.
//  Copyright © 2017 nadia. All rights reserved.
//

import UIKit


struct Section {
    var title: String
    var items: [Animal]
}

struct Animal {
    var name: String
    var image: UIImage
    var opis: String
}


class ViewController: UIViewController {
    
    @IBOutlet private weak var tableViev: UITableView!
    private var datasource: [Section] = []
    
    
    var sourceCount: Int {
        get {
            return datasource.count
        }
    }
    
    func getCountIn(sectionIndex: Int) -> Int {
        return datasource[sectionIndex].items.count
    }
    
    func getSectionNameBy(index: Int) -> String {
        return datasource[index].title
    }
    
    func getItemNameBy(indexPath: IndexPath) -> String {
        return datasource[indexPath.section].items[indexPath.row].name
    }
    
    func getItemImageBy(indexPath: IndexPath) -> UIImage {
        return datasource[indexPath.section].items[indexPath.row].image
    }
    func getItemOpisBy(indexPath: IndexPath) -> String {
        return datasource[indexPath.section].items[indexPath.row].opis

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Animals"
        tableViev.dataSource = self
        tableViev.delegate = self
        
        generateRandomData()
    }
    
    private func generateRandomData() {
        
        
        datasource.append(Section(title: "Fish", items: [
            
            Animal(name: "Fish-hedgehog", image: #imageLiteral(resourceName: "hedgehog-fish"), opis:"Pыба - еж— семейство рыб из отряда иглобрюхообразных. Насчитывает 6—8 родов, распространённых практически во всех тропических морях. Длиной до 60 см. Тело, принимающее при опасности форму шара, покрыто острыми шипами. Кожа и внутренности рыбы ядовиты."),
            Animal(name: "Napoleon fish", image: #imageLiteral(resourceName: "napoleon-fish"), opis:"Hыба-Наполеон — вид морских костистых рыб.Населяют коралловые рифы Красного моря, тропических районов Индийского и Тихого океанов. Обитают на глубинах от 1 до 100 метров. Взрослые наполеоны вырастают до 230 см — это самый крупный представитель губановых, но чаще всего встречаются рыбы длиной до 60 см.")]))
        datasource.append(Section(title: "Birds", items: [
            
            Animal(name: "Bullfinch", image: #imageLiteral(resourceName: "birdsred"), opis: "Cнегир-самец - красногрудая птичка с голубовато-серой спинкой и чёрной головкой, а у самочек наряд более скромный. Снегири обычно держатся небольшими стайками по 7-10 птичек в каждой.")]))
        
        datasource.append(Section(title: "Insectc", items: [
            Animal(name: "Bozhja-korovka", image: #imageLiteral(resourceName: "bozhja-korovka"), opis: "Семиточечная коровка  – самая распространенная божья коровка на территории Европы. Размер божьей коровки достигает 7-8 мм. Надкрылья окрашены в красный цвет, они имеют по одному маленькому белому пятнышку (у основания) и по три крупных черных.")]))
        
        datasource.append(Section(title: "Beasts", items: [Animal(name: "Tiger", image: #imageLiteral(resourceName: "tiger"), opis: "Тигр (лат. Panthera tigris) — вид хищных млекопитающих семейства кошачьих, один из четырёх представителей рода пантера (лат. Panthera), который относится к подсемейству больших кошек."),
            Animal(name: "Wolf", image: #imageLiteral(resourceName: "wolf"), opis: "Волк, или серый волк, или обыкнове́нный волк (лат. Canis lupus) — вид хищных млекопитающих из семейства псовых (Canidae).")]))
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "showDetails", let destVC = segue.destination as? DetailsViewController
            else {
                return }
        guard let cell = sender as? ClassUITableVievCell
            else {
                return
        }
        guard let indexPath = tableViev.indexPath(for: cell)
            else {
                return
        }
        
        destVC.set(about: "", image: getItemImageBy(indexPath: indexPath), animalsName: getSectionNameBy(index: indexPath.section), opis: getItemOpisBy(indexPath: indexPath))
        
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sourceCount
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return getCountIn(sectionIndex: section)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return getSectionNameBy(index: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ClassTableCell", for: indexPath) as! ClassUITableVievCell
        
        cell.update(titel: getItemNameBy(indexPath: indexPath), image: getItemImageBy(indexPath: indexPath))
        return cell
    }
}
