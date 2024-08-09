** Project Overview **

Sahha iOS application is built using the MVVM Clean architecture pattern. The primary objective is to maintain a scalable, testable, and maintainable codebase by separating concerns into different layers.

** Key Features **
User Authentication via Sahha SDK
Fetching and displaying user data from GitHub API
Clean architecture for better separation of concerns
Unit tests for key functionalities

** Architecture Overview **

MVVM Clean Architecture
The MVVM Clean architecture in this project is organized into three main layers:

Presentation Layer (UI and ViewModels)
Domain Layer (Use Cases , Model)
Data Layer (Repositories and Data Sources)
Each layer has a distinct responsibility, ensuring that the application is modular and easy to maintain.

** Layer Breakdown **

1. Presentation Layer

Views (SwiftUI): The Views represent the UI components. They are responsible for rendering the user interface and binding to the ViewModels.
ViewModels: ViewModels manage the UI state and handle interactions between the View and Domain layer. They observe changes and notify the View to update the UI accordingly.
Example:

AuthenticateViewModel: Handles authentication logic, updates UI state based on authentication success or failure.

2. Domain Layer

Use Cases: Use cases are central to the Domain layer. They encapsulate the application's business logic and act as intermediaries between the ViewModels and Repositories.

Example:

UserListUseCase: Fetches user data from the repository and provides it to the ViewModel.

3. Data Layer

Repositories: Repositories are responsible for data handling and act as a bridge between Use Cases and Data Sources. They abstract the data source details, providing a clean API to the Domain layer.

Data Sources: Data sources include API services or local storage. They fetch or store data as required.

Example:

UsersListRepository: Fetches user data from the UsersListDataSource.
UsersListDataSource: Handles API calls to fetch data from the GitHub API.

** Dependency Injection **

The architecture relies on dependency injection, primarily through initializers, to provide dependencies across layers. This ensures that the components are loosely coupled and easy to mock for testing purposes.


** Design Patterns **


1. Dependency Injection
Dependencies are injected into classes using initializer injection, which simplifies unit testing and enhances code reusability.

2. Repository Pattern
The repository pattern is used to abstract the data sources and provide a unified interface for data operations.

3. Asynchronous Programming
The project extensively uses Swift's async/await for handling asynchronous operations, ensuring non-blocking and efficient code execution.

** Testing **
Unit tests are written using XCTest to validate key functionalities, particularly within the ViewModel and Use Case layers. Mocks are used to simulate dependencies, ensuring that tests are isolated and reliable.

Example Test Cases
Authentication Flow: Tests to ensure that the authentication process correctly handles success and failure cases.
User Fetching: Validates that user data is fetched correctly and errors are handled appropriately.




****** Conclusion ******

The MVVM Clean architecture implemented in this project ensures that the application is modular, testable, and maintainable. By clearly separating the responsibilities across different layers, the architecture promotes scalability and ease of future enhancements.

