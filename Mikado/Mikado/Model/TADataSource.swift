import Foundation

public struct AttractionDetail {
    public let rating: Double
    public let description: String
    public let suggestedDuration: Range<Double>
}

public struct Attraction {
    public let title: String
    public let category: String
    public let detailURL: String
    public let imageURL: String
}

public struct AttractionGroup {
    public let groupTitle: String
    public let attractions: [Attraction]
}

public class TripAdvisorDataSource {
    
    public init() { }
    
    public func attractionGroup(for city: String) -> [AttractionGroup] {
        let featured = AttractionGroup(groupTitle: "Featured Tours and Tickets", attractions: [
            Attraction(title: "San Francisco Super Saver: Muir Woods & Wine Country w/ optional Gourmet Lunch", category: "Super Savers", detailURL: "https://www.tripadvisor.ca/AttractionProductReview-g60713-d11447262-San_Francisco_Super_Saver_Muir_Woods_Wine_Country_w_optional_Gourmet_Lunch-San_Fran.html", imageURL: "https://media-cdn.tripadvisor.com/media/photo-s/16/51/44/23/optional-gourmet-lunch.jpg"),
            Attraction(title: "San Francisco Love Tour", category: "City Tours", detailURL: "https://www.tripadvisor.ca/AttractionProductReview-g60713-d11472142-San_Francisco_Love_Tour-San_Francisco_California.html", imageURL: "https://media-cdn.tripadvisor.com/media/photo-s/0e/7f/38/03/san-francisco-love-tour.jpg"),
            Attraction(title: "Big Bus San Francisco Hop-on Hop-off Tour", category: "Hop-on Hop-off Tours", detailURL: "https://www.tripadvisor.ca/AttractionProductReview-g60713-d11450632-Big_Bus_San_Francisco_Hop_on_Hop_off_Tour-San_Francisco_California.html", imageURL: "https://media-cdn.tripadvisor.com/media/photo-s/0e/7f/37/dc/big-bus-san-francisco.jpg")
        ])
        let museums = AttractionGroup(groupTitle: "Museum Tickets & Passes", attractions: [
            Attraction(title: "Madame Tussauds and San Francisco Dungeon Combo", category: "Attraction Tickets", detailURL: "https://www.tripadvisor.ca/AttractionProductDetail-g60713-d11454175-Madame_Tussauds_and_San_Francisco_Dungeon_Combo-San_Francisco_California.html?", imageURL: "https://media-cdn.tripadvisor.com/media/photo-s/12/f8/68/37/madame-tussauds-and-san.jpg")
        ])
        return [featured, museums]
    }
    
    public func retrieveDetails(for attraction: Attraction) -> AttractionDetail {
        return AttractionDetail(rating: 4.5, description: "Park rangers conduct tours by recounting the prison's thrilling history along with intriguing anecdotes about Al Capone and other legendary figures that made a \"home\" here.", suggestedDuration: Range(uncheckedBounds: (2, 3)))
    }
}
