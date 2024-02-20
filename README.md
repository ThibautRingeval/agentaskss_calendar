# Agentask - Application Flutter

Agentask est une application Flutter conçue pour vous permettre de consulter un emploi du temps, de vous enregistrer, de vous connecter et de créer des alertes via un écran dédié. L'application utilise MockAPI pour la gestion des utilisateurs.

---
Thibaut Ringeval
Meline Godefroy
Maxence Locmant
---

## Table des matières

1. [Installation](#installation)
2. [Configuration](#configuration)
3. [Utilisation](#utilisation)
    - [Consultation de l'emploi du temps](#consultation-de-lemploi-du-temps)
    - [Enregistrement et Connexion](#enregistrement-et-connexion)
    - [Gestion des alertes](#gestion-des-alertes)
4. [Contributions](#contributions)

---

## 1. Installation <a name="installation"></a>

Assurez-vous d'avoir Flutter installé sur votre machine. Clonez ensuite le dépôt et exécutez la commande suivante dans le répertoire du projet pour installer les dépendances :

```bash
flutter pub get
```
---

## 2. Configuration <a name="configuration"></a>

Avant de lancer l'application, veuillez configurer les paramètres nécessaires tels que l'URL de l'API MockAPI pour la gestion des utilisateurs. Ces configurations se trouvent dans le fichier `lib/config.dart`. Modifiez-les en fonction de vos besoins.

```dart
// lib/config.dart

class AppConfig {
  static const String mockApiUrl = "https://api.mockapi.io/v1/users";
  // Ajoutez d'autres configurations au besoin
}
```
---

## 3. Utilisation <a name="utilisation"></a>

### 3.1 Consultation de l'emploi du temps <a name="consultation-de-lemploi-du-temps"></a>

Accédez à l'onglet "Emploi du temps" pour visualiser votre planning. Les informations sont récupérées en temps réel depuis la source de données.

### 3.2 Enregistrement et Connexion <a name="enregistrement-et-connexion"></a>

Utilisez l'onglet "Enregistrement" pour créer un nouveau compte. Une fois enregistré, vous pouvez vous connecter via l'onglet "Connexion" en utilisant vos identifiants.

### 3.3 Gestion des alertes <a name="gestion-des-alertes"></a>

Naviguez vers l'écran dédié à la gestion des alertes pour créer, modifier ou supprimer des alertes pour des événements spécifiques de votre emploi du temps.

---

## 4. Contributions <a name="contributions"></a>

Les contributions sont les bienvenues! Avant de soumettre des modifications, veuillez ouvrir une issue pour discuter des changements proposés.

---
