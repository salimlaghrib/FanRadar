# 📱 FanRadars - Mobile App

FanRadars.com est une **plateforme interactive dédiée aux fans** des cultures populaires mondiales.  
Cette application mobile Flutter offre aux utilisateurs une **expérience immersive** pour suivre les tendances fandom, partager du contenu, voter et acheter des produits exclusifs.

---

## 🔍 Objectif de l'Application

L'application vise à :
- 📊 Suivre les **tendances des fandoms** en temps réel (K-pop, anime, jeux, etc.)
- 🎨 Permettre aux fans de **publier du contenu créatif**
- 🛍️ Lancer des **ventes de produits exclusifs (Radar Drops)**
- 🤖 Fournir des **informations personnalisées via une IA (RadarBot)**
- 📱 Offrir une interface **mobile native** fluide et intuitive

---

## 🧱 Architecture du Projet
lib/
│
├── main.dart
│
├── core/
│   ├── constants/
│   ├── utils/
│   ├── theme/
│   └── routes/
│
├── models/
│   └── user_model.dart
│
├── views/
│   ├── screens/
│   │   ├── login_screen.dart
│   │   └── home_screen.dart
│   └── widgets/
│       ├── custom_button.dart
│       └── user_card.dart
│
├── controllers/
│   ├── login_controller.dart
│   └── user_controller.dart
│
├── services/
│   └── api_service.dart
│
└── data/
    ├── datasources/
    │   ├── local/
    │   └── remote/
    └── repositories/
        └── user_repository.dart

📲 Fonctionnalités Clés
🎯 Fonctionnalités Générales
Authentification : connexion/inscription

Thème clair/sombre

Notifications push (Firebase)

Navigation fluide (bottom bar / drawer)

🔥 Fan Radar
Affichage des fandoms tendance (temps réel)

Score Radar dynamique basé sur les votes

Filtrage par catégorie (K-pop, anime, sport...)

🎨 Fan Content
Publication de fan arts, vidéos, textes

Galerie d’exploration par fandom

Système de vote + badge “Fan of the Week”

🛍️ Fan Shop
Liste des produits (Radar Drops)

Commandes en ligne

Suivi d’achats et alertes nouveautés

💬 RadarBot (Phase 2)
Chatbot IA pour poser des questions comme :

“Quelles tendances dans l’anime aujourd’hui ?”

Résumé des tendances par NLP (traitement du langage)
🧪 Technologies Utilisées
| Côté             | Technologies                      |
| ---------------- | --------------------------------- |
| Mobile App       | **Flutter** (Dart)                |
| Backend API      | Laravel (PHP)                     |
| State Management | GetX (ou Riverpod, selon version) |
| Authentification | Firebase Auth / API Token         |
| Notifications    | Firebase Cloud Messaging (FCM)    |
| Stockage images  | Firebase Storage / S3             |
| Base de données  | MySQL / PostgreSQL                |


🛠️ Installation du Projet
✅ Prérequis
Flutter SDK 3.10+

Android Studio / VS Code

Un émulateur Android ou iOS

(Optionnel) Un compte Firebase (pour les tests)
