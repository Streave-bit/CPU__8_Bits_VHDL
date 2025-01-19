# **Projet : Conception d'un CPU 8 bits**

Ce projet est une implémentation d'un **CPU 8 bits simple**, inspiré d'un tutoriel YouTube. L'objectif est de comprendre les concepts de base d'un CPU en utilisant le langage VHDL.

---

## **Table des matières**
1. [Introduction](#introduction)
2. [Composants du CPU](#composants-du-cpu)
3. [Program Counter (PC)](#program-counter-pc)
4. [Outils utilisés](#outils-utilisés)
5. [Comment utiliser ce projet](#comment-utiliser-ce-projet)


---

## **Introduction**
Ce projet est une implémentation d'un CPU 8 bits simple, basée sur un tutoriel YouTube. Il est conçu pour aider à comprendre les concepts fondamentaux d'un processeur, tels que la gestion des instructions, les opérations arithmétiques et logiques, et le contrôle du flux d'exécution.



---

## **Composants du CPU**
Le CPU est composé des modules suivants :
1. **Program Counter (PC)** : Gère l'adresse de la prochaine instruction.
2. **ALU (Unité Arithmétique et Logique)** : Effectue les opérations arithmétiques et logiques.
3. **Registres** : Stockent les données temporaires.
4. **Unité de contrôle** : Gère le flux des instructions.
5. **Mémoire** : Stocke les instructions et les données.

---

## **Program Counter (PC)**
Le **Program Counter (PC)** est un registre qui contient l'adresse de la prochaine instruction à exécuter. Il est mis à jour à chaque cycle d'horloge en fonction des signaux de contrôle.

### **Fonctionnalités du PC**
- **Reset** : Réinitialise le PC à `0x00`.
- **Load** : Charge une nouvelle adresse dans le PC.
- **Increment** : Incrémente le PC pour pointer vers l'instruction suivante.

---

## **Outils utilisés**
- **GHDL** : Un simulateur VHDL open-source pour compiler et simuler le code.
- **GTKWave** : Un visualiseur de waveforms pour analyser les résultats de la simulation.

---

## **Comment utiliser ce projet**
### **Prérequis**
- **GHDL** : Installé sur votre système.
- **GTKWave** : Installé pour visualiser les waveforms.


### **Étapes pour simuler le PC**
1. Clone le dépôt :
   ```bash
   git clone https://github.com/ton-utilisateur/8-bit-cpu.git
   cd CPU8Bits
   cd Testbench
   Pour lancer la simulation du testbench de PC :
   ghdl -e pc_tb
   ghdl -r pc_tb --vcd=waveform.vcd
