import BSON
import MongoCore

public struct InsertCommand: Codable, Sendable {
    /// This variable _must_ be the first encoded value, so keep it above all others
    private let insert: String
    public var collection: String { return insert }
    
    public var documents: [Document]
    public var ordered: Bool?
    public var writeConcern: WriteConcern?
    public var bypassDocumentValidation: Bool?
    
    public init(documents: [Document], inCollection collection: String) {
        self.insert = collection
        self.documents = documents
    }
}

public struct InsertReply: Decodable, Error, CustomDebugStringConvertible, Sendable {
    private enum CodingKeys: String, CodingKey {
        case ok, writeErrors, writeConcernError
        case insertCount = "n"
        case errmsg
        case code
        case codeName
    }
    
    public let ok: Int
    public let insertCount: Int
    public let writeErrors: [MongoWriteError]?
    public let writeConcernError: WriteConcernError?
    
    ///undev 4 modifications
    public let errmsg:String?
    public let code:Int?
    public let codeName:String?
    
    public var debugDescription: String {
        if ok == 1 {
            return "InsertReply(insertCount: \(insertCount))"
        } else {
            return "InsertError"
        }
    }
}

