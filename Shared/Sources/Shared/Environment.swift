import class Foundation.ProcessInfo

public enum EnvironmentType: String, Codable, Equatable {
    case development
    case testing
    case staging
    case production
}

public final class Environment {
    
    public static let shared = Environment()
    
    public func current() -> EnvironmentType {
        #if DEBUG
            // https://stackoverflow.com/a/44165033
            if ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil {
                return .testing
            }
            return .development
        #else
            return .production
        #endif
    }
    
    public func isDev() -> Bool {
        return Environment.shared.current() == EnvironmentType.development
    }
    
    public func isTesting() -> Bool {
        return Environment.shared.current() == EnvironmentType.testing
    }
    
    public func isDebug() -> Bool {
        let current = Environment.shared
        return current.isDev() || current.isTesting()
    }
    
    public func isProduction() -> Bool {
        return Environment.shared.current() == EnvironmentType.production
    }
    
    public func isStaging() -> Bool {
        return Environment.shared.current() == EnvironmentType.staging
    }
}

