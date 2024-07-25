# Tummoc

**Tummoc** is a SwiftUI-based iOS application that showcases products from various categories. The app allows users to mark items as favorites, add them to a shopping cart, and navigate through the categories using a floating button. It also displays app creator details.

## Features

* **Product Categories**: View products organized by categories.
* **Favorites**: Mark items as favorites and view them in a dedicated section.
* **Shopping Cart**: Add items to the cart, manage cart contents, and view the total cart value.
* **Floating Button**: Quickly navigate between product categories using a floating button.
* **Creator Details**: View app creator details from the navigation bar on the main page.

## Screenshots

![Simulator Screenshot - iPhone 15 Pro - 2024-07-26 at 00 27 24](https://github.com/user-attachments/assets/e76e6af9-31a1-492e-aa41-fbf9c0988ae2)
![Simulator Screenshot - iPhone 15 Pro - 2024-07-26 at 00 26 55](https://github.com/user-attachments/assets/277ec40c-02a0-4201-af18-e3baa0c800b1)
![Simulator Screenshot - iPhone 15 Pro - 2024-07-26 at 00 27 11](https://github.com/user-attachments/assets/56617a58-3034-4ee4-b29d-56671f355f9f)
![Simulator Screenshot - iPhone 15 Pro - 2024-07-26 at 00 27 08](https://github.com/user-attachments/assets/4f4d69dd-9e84-49d7-ad7c-343d004fcb7f)
![Simulator Screenshot - iPhone 15 Pro - 2024-07-26 at 00 27 16](https://github.com/user-attachments/assets/2dfe906b-bab4-4426-b499-f7dd03f4b9df)


## Installation

1. **Clone the repository:**

   ```sh
   git clone https://github.com/your-username/tummoc.git
   ```

2. **Open the project in Xcode:**

   ```sh
   open TummocSandesh.xcodeproj
   ```

3. **Run the app:** Select the target device or simulator and click the `Run` button in Xcode.

## Usage

### Main Page
* **Navigation**: The main page displays a list of product categories. Use the floating button to quickly navigate between categories.
* **Products**: Tap on a product to view its details. You can add it to favorites or to the cart.
* **Creator Details**: Access the creator details by tapping the icon in the navigation bar.

### Favorites
* **View Favorites**: Access the favorites view by tapping the heart icon in the navigation bar.
* **Manage Favorites**: Add or remove items from favorites.

### Cart
* **View Cart**: Access the cart view by tapping the cart icon in the navigation bar.
* **Manage Cart**: View items in the cart, adjust quantities, and view the total cart value.
* **Checkout**: Proceed to checkout or remove all items from the cart.

## Code Overview

### MainPageView
The `MainPageView` struct is the main view of the app, displaying the list of categories and handling navigation. It includes a floating button for category navigation and an option to view creator details.

### MainPageViewViewModel
The `MainPageViewViewModel` class is the view model for the `MainPageView`. It handles managing favorites and cart items, and providing data to the view.

## Customization

### Adding New Categories and Items
To add new categories and items, update the static `categories` variable in the `MainPageView`.

### Adjusting UI
The UI can be customized by modifying the SwiftUI views. Adjust the appearance, layout, and style as needed.

## Contributing

Contributions are welcome! Feel free to open an issue or submit a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Acknowledgements

* Icons used in the project are sourced from [Flaticon](https://www.flaticon.com/).
* This project uses SwiftUI for a seamless and efficient user experience.
