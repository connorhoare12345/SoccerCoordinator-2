// Player Information Dictionaries
let joeSmith: [String: Any] = ["name": "Joe Smith", "height": 42, "experienced": true, "guardianName": "Jim and Jan Smith"]
let jillTanner: [String: Any] = ["name": "Jill Tanner", "height": 36, "experienced": true, "guardianName": "Clara Tanner"]
let billBon: [String: Any] = ["name": "Bill Bon", "height": 43, "experienced": true, "guardianName": "Sara and Jenny Bon"]
let evaGordon: [String: Any] = ["name": "Eva Gordon", "height": 45, "experienced": false, "guardianName": "Wendy and Mike Gordon"]
let mattGill: [String: Any] = ["name": "Matt Gill", "height": 40, "experienced": false, "guardianName": "Charles and Sylvia Gill"]
let kimmyStein: [String: Any] = ["name": "Kimmy Stein", "height": 41, "experienced": false, "guardianName": "Bill and Hilary Stein"]
let sammyAdams: [String: Any] = ["name": "Sammy Adams", "height": 45, "experienced": false, "guardianName": "Jeff Adams"]
let karlSaygan: [String: Any] = ["name": "Karl Saygan", "height": 42, "experienced": true, "guardianName": "Heather Bledsoe"]
let suzaneGreenberg: [String: Any] = ["name": "Suzane Greenberg", "height": 44, "experienced": true, "guardianName": "Henrietta Dumas"]
let salDali: [String: Any] = ["name": "Sal Dali", "height": 41, "experienced": false, "guardianName": "Gala Dali"]
let joeKavalier: [String: Any] = ["name": "Joe Kavalier", "height": 39, "experienced": false, "guardianName": "Sam and Elaine Kavalier"]
let benFinkelstein: [String: Any] = ["name": "Ben Finklestein", "height": 44, "experienced": false, "guardianName": "Aaron and Jill Finkelstein"]
let diegoSoto: [String: Any] = ["name": "Deigo Soto", "height": 41, "experienced": true, "guardianName": "Robin and Sarika Soto"]
let chloeAlaska: [String: Any] = ["name": "Chloe Alaska", "height": 47, "experienced": false, "guardianName": "David and Jamie Alaska"]
let arnoldWillis: [String: Any] = ["name": "Arnold Willis", "height": 43, "experienced": false, "guardianName": "Claire Willis"]
let phillipHelm: [String: Any] = ["name": "Phillip Helm", "height": 44, "experienced": true, "guardianName": "Thomas Helm and Eva Jones"]
let lesClay: [String: Any] = ["name": "Les Clay", "height": 42, "experienced": true, "guardianName": "Wynonna Brown"]
let herschelKrustofski: [String: Any] = ["name": "Herschel Krustofski", "height": 45, "experienced": true, "guardianName": "Hyman and Rachel Krustofski"]


var players = [joeSmith, jillTanner, billBon, evaGordon, mattGill, kimmyStein, sammyAdams, karlSaygan, suzaneGreenberg, salDali, joeKavalier, benFinkelstein, diegoSoto, chloeAlaska, arnoldWillis, phillipHelm, lesClay, herschelKrustofski]

// Empty teams
var teamSharks: [[String: Any]] = []
var teamDragons: [[String: Any]] = []
var teamRaptors: [[String: Any]] = []

// Function to add experienced players to teams
func experiencedPlayers(in players: [[String: Any]]) -> Int {
    var experiencedPlayers = 0
    for player in players {
        let experienced = player["experienced"] as! Bool
        if experienced {
            experiencedPlayers += 1
        }
    }
    return experiencedPlayers
}

// Adding Players to their teams

for player in players {
    if let experienced = player["experienced"] as? Bool {
        if experienced {
            // add to least experienced team
            if experiencedPlayers(in: teamSharks) <= experiencedPlayers(in: teamDragons) && experiencedPlayers(in: teamSharks) <= experiencedPlayers(in: teamRaptors) {
                teamSharks.append(player)
            } else if experiencedPlayers(in: teamDragons) <= experiencedPlayers(in: teamSharks) && experiencedPlayers(in: teamDragons) <= experiencedPlayers(in: teamRaptors){
                teamDragons.append(player)
            } else {
                teamRaptors.append(player)
            }
        } else {
            // add to shortest team
            if teamSharks.count <= teamDragons.count && teamSharks.count <= teamRaptors.count {
                teamSharks.append(player)
            } else if teamDragons.count <= teamSharks.count && teamDragons.count <= teamRaptors.count {
                teamDragons.append(player)
            } else {
                teamRaptors.append(player)
            }
        }
    } else { print("ERROR") }
}


// MARK: - Letters
var letters: [String] = []
for player in players {
    let guardianNames = player["guardianName"] as! String
    let name = player["name"] as! String
    
    var team = ""
    var trainingTime = ""
    
    // Player's team check
    for teamMember in teamSharks {
        let teamMemberName = teamMember["name"] as? String
        let playerName = player["name"] as? String
        if teamMemberName == playerName {
            team = "Sharks"
            trainingTime = "March 17th, 3pm"
        }
    }
    
    for teamMember in teamDragons {
        let teamMemberName = teamMember["name"] as? String
        let playerName = player["name"] as? String
        if teamMemberName == playerName {
            team = "Dragons"
            trainingTime = "March 17th, 1pm"
        }
    }
    
    for teamMember in teamRaptors {
        let teamMemberName = teamMember["name"] as? String
        let playerName = player["name"] as? String
        if teamMemberName == playerName {
            team = "Raptors"
            trainingTime = "March 18th, 1pm"
        }
    }
    
    let letter = "To \(guardianNames), We would like to inform you that \(name) has been selected to play for \(team). Congratulations. This is a big achievement and you should all be very proud. The first team training will be on \(trainingTime). We look forward to seeing you at training. \nKind Regards \nConnor Hoare."
    
    letters.append(letter)
}


for letter in letters {
    print(letter)
}









































