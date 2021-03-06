//
//  TableViewController.swift
//  Advanced UI 1
//
//  Created by Nakama on 07/11/18.
//

import UIKit

class TableViewController: UITableViewController {

    //NOTE: Provide this when we want to set table cell programatically
    let cellText = [["Sign in to your iPhone"], ["General", "Privacy"], ["Password & Accounts"], ["Maps", "Safari", "News", "iTunes", "Photos", "Game Center"], ["Developer"]]
    let cellImage = [[#imageLiteral(resourceName: "profile_pic")], [#imageLiteral(resourceName: "settings"), #imageLiteral(resourceName: "air_asia")], [#imageLiteral(resourceName: "camera")], [#imageLiteral(resourceName: "maps"), #imageLiteral(resourceName: "safari"), #imageLiteral(resourceName: "icon_time_half_green"), #imageLiteral(resourceName: "itunes"), #imageLiteral(resourceName: "photos"), #imageLiteral(resourceName: "game_center")], [#imageLiteral(resourceName: "settings")]]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
//         self.clearsSelectionOnViewWillAppear = true

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        //NOTE: No need for "Dynamic Prototypes" table view
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        tableView.register(UINib(nibName: String(describing: TableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: TableViewCell.self))
        
        //NOTE: best practice. Pre-requisite: set the constraint correctly.
        tableView.rowHeight = UITableView.automaticDimension
        //NOTE: this param is not mandatory, yet this is best practice too. Too help the system minimize the calculation process
        tableView.estimatedRowHeight = 61;
    }
    
    //NOTE: A way to insert header to every section.
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "This is Header"
    }
    
    //NOTE: A way to force style to table section header.
//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let label = UILabel()
//        label.font = UIFont.systemFont(ofSize: 16);
//        label.text = "This is Header"
//
//        return label
//    }
    
    //NOTE: A way to set action when table view cell selected.
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if indexPath.section > 0 {
//            if let cell = tableView.cellForRow(at: indexPath) {
//                cell.accessoryType = cell.accessoryType == .none ? .checkmark : .none
//            }
//            //tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
//        }
        
        //NOTE: Navigate to certain view controller when element clicked
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "StackViewViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }

    // MARK: - Table view data source
    // NOTE: This method return 1 by default, we can omit this function when having 1 section only
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 5
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section {
        case 0:
            return 1
        case 1:
            return 2
        case 2:
            return 1
        case 3:
            return 6
        case 4:
            return 1
        default:
            return 0
        }
    }

    // NOTE: By implementing this function, we omit every view we implement in storyboard
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "profile_pic_cell", for: indexPath)
            return cell
        }
        else if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TableViewCell.self), for: indexPath) as? TableViewCell {
            cell.imgView.image = cellImage[indexPath.section % cellImage.count][indexPath.row % cellImage[indexPath.section % cellImage.count].count]
            cell.label.text = cellText[indexPath.section % cellText.count][indexPath.row % cellText[indexPath.section % cellText.count].count]
            cell.infoLabel.text = "2018/11/09"
            cell.subtitle.text = "This is setting"
            
            return cell
        }
        
        return UITableViewCell()
        
        //NOTE: This is how we configure cell with dynamic prototypes
//        if indexPath.section == 0 {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "profile_pic_cell", for: indexPath)
//            return cell
//        }
//        else {
//            //NOTE: A way to set label and image programatically
//            let cell = tableView.dequeueReusableCell(withIdentifier: "basic_cell", for: indexPath)
//            cell.textLabel?.text = cellText[indexPath.section % cellText.count][indexPath.row % cellText[indexPath.section % cellText.count].count]
//            cell.imageView?.image = cellImage[indexPath.section % cellImage.count][indexPath.row % cellImage[indexPath.section % cellImage.count].count]
//            return cell
//        }
        
        //NOTE: A way to set label and image programatically
//        let cell = tableView.dequeueReusableCell(withIdentifier: "basic_cell", for: indexPath)
//        cell.textLabel?.text = cellText[indexPath.section % cellText.count][indexPath.row % cellText[indexPath.section % cellText.count].count]
//        cell.imageView?.image = cellImage[indexPath.section % cellImage.count][indexPath.row % cellImage[indexPath.section % cellImage.count].count]
//        return cell
        
//         Configure the cell...
//        //NOTE: this is a way to access row and section programatically
//        cell.textLabel?.text = "This is cell \(indexPath.row) section \(indexPath.section)"
//
//        //NOTE: type "Image" and then double click on the icon showed to choose image
//        if indexPath.row % 2 == 0 {
//            cell.imageView?.image = #imageLiteral(resourceName: "camera")
//        } else {
//            cell.imageView?.image = #imageLiteral(resourceName: "air_asia")
//        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
