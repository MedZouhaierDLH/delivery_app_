# Food Delivery App

A pre-built, functional food delivery app developed with **Flutter x Firebase**, ready to deploy and use out of the box. This app includes email authentication and a fully integrated backend. Users can create accounts, browse menus, add items to their cart, input card payment details, and place orders. Orders are saved in Firebase for real-time live updates, and a receipt summarizing the order is generated for the user.

---

## Features

### 🔐 **Authentication**
- Create a new account
- Login with email authentication

### 🍔 **Browse Menu**
- Categories include burgers, salads, sides, desserts, drinks, etc.
- Easily customizable to add/edit food categories directly in the code

### ➕ **Food Add-ons**
- Customize each food item with special options

### 🛒 **Cart**
- Add or remove items
- Increase or decrease item quantities
- Proceed to checkout

### 📃 **Receipt Generator**
- Automatically calculates totals
- Generates a receipt summarizing the order

### 💳 **Payment**
- Input card payment details securely

### 📦 **Order Management**
- Place orders with live updates in the backend database

### 🌗 **Light & Dark Mode**
- Supports both light and dark themes for a modern user experience

### 📱 **Modern Design**
- Features a **Sliver App Bar** that stretches as you scroll, adding sleek and interactive visuals

---

## File Structure

All the files necessary for customization and functionality are located in the **lib** folder.

---

## Getting Started

1. Clone this repository.
2. Open the project in your preferred IDE (e.g., Visual Studio Code, Android Studio).
3. Ensure Flutter and Firebase are configured on your machine.
4. Build and run the app on an emulator or physical device.

---

## Dependencies
Ensure the following dependencies are added to your `pubspec.yaml` file:
- `flutter`
- `firebase_auth`
- `firebase_database`
- `provider`
- `stripe_payment` (or your preferred payment plugin)

---

## Customization
- **Menu Categories**: Edit or add new categories in the `menu` section of the code.
- **Theming**: Modify light and dark theme settings in the `theme` section.
- **Backend Integration**: Customize Firebase configurations in the project settings.

---

## Preview

![Preview of the app in light and dark mode](#)

---

## Support
If you encounter any issues or have questions, feel free to open an issue or contribute to the project.


