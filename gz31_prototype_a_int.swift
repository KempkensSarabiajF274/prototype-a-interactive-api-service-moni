import Foundation

// Data Model for API Service Monitor
struct ApiService {
    let id: Int
    let name: String
    let baseURL: URL
    let status: Status
    let responseTime: Double
    let lastChecked: Date
}

enum Status: String {
    case online
    case offline
    case degraded
    case unknown
}

struct ApiResponse {
    let apiService: ApiService
    let statusCode: Int
    let responseMessage: String
}

class ApiServiceMonitor {
    var apiServices: [ApiService] = []
    var apiResponses: [ApiResponse] = []
    
    func addApiService(_ apiService: ApiService) {
        apiServices.append(apiService)
    }
    
    func updateApiResponse(_ apiResponse: ApiResponse) {
        apiResponses.append(apiResponse)
    }
    
    func getApiServiceStatus(_ id: Int) -> Status? {
        return apiServices.first(where: { $0.id == id })?.status
    }
    
    func getApiResponse(_ id: Int) -> ApiResponse? {
        return apiResponses.first(where: { $0.apiService.id == id })
    }
    
    func getApiServices() -> [ApiService] {
        return apiServices
    }
    
    func getApiResponses() -> [ApiResponse] {
        return apiResponses
    }
}