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

## Pages Overview

### **Login Page**

Allows users to sign in with email authentication.

### **Register Page**

New users can create an account with their details.

### **Home Page**

Displays the menu and allows users to browse food categories.

### **Drawer Menu**

Provides quick access to navigation options like Home, Settings, and more.

### **Settings Page**

Users can update their preferences, including theme and account settings.

### **Food Details Page**

Shows detailed information about a selected food item, including options for add-ons.

### **Cart Page**

Lists all items added to the cart and provides options to modify the order.

### **Payment Page**

Collects card payment details for secure processing.

### **Delivery In Progress Page**

Displays real-time updates about the delivery status of the order.

---

## Navigation Flow

To help users and developers understand how to navigate between the pages, include a diagram or flowchart showing the relationships between them.

![Screen Shot 2024-03-06 at 5 26 58 pm](https://github.com/user-attachments/assets/45106bcf-5890-498b-bba5-4a3a6765d8fc)


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

---

## Customization

- **Menu Categories**: Edit or add new categories in the `menu` section of the code.
- **Theming**: Modify light and dark theme settings in the `theme` section.
- **Backend Integration**: Customize Firebase configurations in the project settings.

---

## Preview



---

## Support

If you encounter any issues or have questions, feel free to open an issue or contribute to the project.

