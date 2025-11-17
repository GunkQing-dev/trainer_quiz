# Find Your Trainer Type

A Flutter web experience that turns Dark Type Darsh's "DTD Guide III" trainer quiz into an interactive personality check for VGC enthusiasts. It's a fan-made hobby project meant for fun self-reflection - not a competitive guarantee or official endorsement.

## Run It Locally

1. **Prerequisites**
   - Flutter 3.24 (stable) with web support enabled (`flutter config --enable-web`)
   - Chrome/Edge (or any browser/device you plan to target)

2. **Clone & install**
   ```bash
   git clone https://github.com/QuervoDev/trainer_quiz.git
   cd trainer_quiz
   flutter pub get
   ```

3. **Run the quiz in a browser**
   ```bash
   flutter run -d chrome
   ```
   Replace `chrome` with another device ID (e.g., `edge`, `macos`, `windows`) to test elsewhere.

4. **Optional: build the optimized web bundle**
   ```bash
   flutter build web --release
   ```
   The release output lands in `build/web/` and is what GitHub Pages (or any static host) should serve.

## Credits & Inspiration

- Quiz concept, archetype language, and original guide by **Dark Type Darsh**  
  - Twitter/X: [@DarkTypeDarsh](https://x.com/DarkTypeDarsh)  
  - YouTube: [Dark Type Darsh](https://www.youtube.com/@darktypedarsh?si=mKzB6XS2E3YiA0tR)  
  - Deep dive video on trainer types: [Watch here](https://www.youtube.com/watch?v=g_QRaxbye1M&t=934s)

This project just packages his public quiz into a slicker interface. All competitive insights belong to Darsh - support his work!

## Questions / Feedback

Have ideas or run into issues? Reach out anytime:

- Twitter/X: [@GunkQing](https://x.com/GunkQing)  
- GitHub: [QuervoDev](https://github.com/QuervoDev)
