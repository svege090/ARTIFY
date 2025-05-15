# **ARTIFY** - E-commerce UI Project 🎨🛒

**Student Name:** Santi Jean V. Ege  
**Student ID:** 2023-219662  

---

## 📌 Project Description

**ARTIFY** is a niche e-commerce store focused on **art supplies** for beginner and hobbyist artists. The app features a clean, visually engaging UI for browsing and purchasing materials such as **colors, pens, and paper**. The theme is light and expressive — encouraging creativity while maintaining a smooth and intuitive shopping experience.

---


### 🎨 Additional UI Features

- **Category Filtering** (via mock data: Colors, Pens, Paper)
- **Search Functionality UI** (filters product list by name)
- **Animations**: Subtle animations on splash screen and transitions
- **Custom Widgets**: `ProductCard`, `CustomNavbar`
- **Mock Data Driven**: All content uses hardcoded mock data

---

## ✨ Unique Design Choices & Creativity

### 🎯 Niche
I chose **Art Supplies** as a niche to cater to creatives, particularly students and young artists. This focused theme allowed for a cohesive and expressive design.

### 🎨 Color Palette
- **Deep Purple** as the primary swatch — evokes creativity and calm.
- Light backgrounds with strong image contrasts to make products pop.

### 🔤 Typography
- Clean, modern sans-serif fonts for easy readability.
- Emphasis on product names and prices for quick scanning.

### 🔧 Iconography
- Material Design Icons for clarity and consistency.
- Cart, category, and navigation icons match the app’s artistic tone.

### 🌟 Creative Features
- Animated splash screen sets the tone for a modern, polished app.
- Visually engaging grid layout and detail transitions.
- Thoughtful use of shadows, padding, and rounded corners for a “soft” feel.

---

## 🚧 Challenges Faced & Solutions

### 1. **Image Assets Not Displaying**
**Problem:** Flutter couldn't locate images in `assets/images/`.  
**Solution:** Ensured image names matched in `mock_data.dart`, verified folder structure, and updated `pubspec.yaml` with:
```yaml
flutter:
  assets:
    - assets/images/
