# 🛍️ Flutter E-Commerce App

A modern and responsive e-commerce Flutter application inspired by Amazon's UI.  
This app showcases product listing, authentication with Firebase, and integrated **PayPal payment**.

---

## 📱 App Screens

| ![Home](https://github.com/user-attachments/assets/f50d5e8a-b1e5-4f00-94cc-a219e1eb81fd) | ![Products](https://github.com/user-attachments/assets/8a86c983-baf6-4842-85b1-c23f30dcd422) | ![Details](https://github.com/user-attachments/assets/456ce525-0154-44be-a889-9ff4dd2bb394) |
|:--:|:--:|:--:|
| **Home Page** | **Product List** | **Product Details** |

| ![SignUp](https://github.com/user-attachments/assets/a50d2acd-8ec3-46f7-98b2-d11a18167466) | ![Login](https://github.com/user-attachments/assets/9f250501-506d-4b56-8b44-d667076737e8) | ![Checkout](https://github.com/user-attachments/assets/0ba7bb75-ebc4-4a31-af25-6e8578621293) |
|:--:|:--:|:--:|
| **Sign Up** | **Login** | **Checkout / PayPal** |


---

## 🚀 Features

- 📦 **Product Listing** (with image, title, and price)
- 🔍 **Product Details Page** similar to Amazon
- 🔐 **Firebase Authentication** for login & sign up
- ✅ **Form Validation** for user input
- 🛒 **Cart Page** (with UI logic ready for backend)
- 💰 **Integrated PayPal Checkout**
- 📡 **REST API Integration** (products)
- 🧠 **Provider State Management**
- 🧑‍🎨 **Clean, Modern, and Responsive UI**

---

## 💳 PayPal Integration

The app includes seamless integration with **PayPal** using the WebView or JS SDK method (depending on platform).  
Easily pass the cart total and redirect users to PayPal for secure payment.

🔑 Add your **Client ID** in the appropriate place:

```Flutter
  clientId: "XXXXXXX",
  secretKey: "XXXXXX",
