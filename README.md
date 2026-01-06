# Pepsi Man Clone (Godot Engine)

This project is a clone of the "Pepsi Man" endless runner game, developed using **Godot Engine 4** and **GDScript**. It features a 3-lane movement system, procedural level generation, and a high-score system.

## 🎮 Controls
* **A / Left Arrow**: Move Left
* **D / Right Arrow**: Move Right
* **Space**: Jump (If implemented) / Start Game

## 🚀 How to Run the Project
1.  Clone this repository or download the ZIP file.
2.  Open **Godot Engine 4.x**.
3.  Click on **Import** and select the `project.godot` file from the downloaded folder.
4.  Open the `Main.tscn` scene in the editor.
5.  Press the **Play** button (F5) to start the game.

## 🛠 Features Implemented
* **3-Lane Movement**: Smooth lerp-based movement between lanes.
* **Procedural Generation**: Infinite road generation with random obstacles.
* **Scoring System**: Real-time score updates and High Score saving (using `ConfigFile`).
* **Game Over**: Collision detection and restart functionality.

## 📝 Reflection
During this project, I learned how to manage memory in endless runners by removing old road tiles (`queue_free`). I also learned to use `Mathf.lerp` for smooth player movement and `ConfigFile` for persistent data storage similar to Unity's PlayerPrefs.

NOTE: the main report and documention of the project is in report.pdf file.
