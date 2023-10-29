import BSON
import MongoCore

public struct CountCommand: Codable, Sendable {
    private let count: String
    
    /// Optional. A query that selects which documents to count in the collection or view.
    public var query: Document?
    
    /// Optional. The maximum number of matching documents to return.
    public var limit: Int?
    
    /// Optional. The number of matching documents to skip before returning results.
    public var skip: Int?
    public var readConcern: ReadConcern?
    public var collation: Collation?
    
    public init(on collection: String, where query: Document? = nil) {
        self.count = collection
        self.query = query
    }
}

public struct CountReply: Sendable, Decodable {
    private enum CodingKeys: String, CodingKey {
        case ok
        case count = "n"
        
        ///undev4
        case errmsg
        case codeName
        case code
       
    }
    
    let ok: Int
    public let count: Int
    /// undev4
    public let code:Int?
    public let codeName:String?
    public let errmsg:String?
    
}
