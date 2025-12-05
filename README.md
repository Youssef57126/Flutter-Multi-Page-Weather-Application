# Flutter-Multi-Page-Weather-Application

 ## App Description

The Weather App allows users to search for any city and view detailed weather information including temperature, humidity, wind speed, sunrise, and sunset.
Users can also save cities to their favorites list, and choose between Metric (°C) or Imperial (°F) units.


=======================================================================================================================================================================
✨ Features
🔍 Search Weather

Search for any city worldwide

View weather icon, temperature, description, and details

Glass-effect UI design for clarity and readability

⭐ Favorites

Save your favorite cities

Tap a saved city to instantly load its weather

⚙️ Settings

Choose temperature unit:

Metric (°C)

Imperial (°F)

📄 Weather Details

Feels like temperature

Humidity

Wind speed

Sunrise & sunset (based on timezone)

Large weather icon

🎨 Modern UI

Gradient backgrounds

Transparent AppBar

Glass-morphism components

Consistent theme across all pages
========================================================================================================================================================================


# Setup Steps

Follow these steps to run the app on your device:

1. Clone the repository
git clone <your-repo-url>
cd weather_app

2. Install dependencies
flutter pub get

3. Add your OpenWeatherMap API key

Go to:

lib/services/api_service.dart


Replace:

const String apiKey = "YOUR_API_KEY";


with your actual API key from:

👉 https://openweathermap.org/api

4. Run the app
flutter run
========================================================================================================================================================================


# API Usage

The app uses the OpenWeatherMap API:

API Endpoint Example
https://api.openweathermap.org/data/2.5/weather?q={city}&appid={API key}&units={metric/imperial}
| Parameter | Description                  |
| --------- | ---------------------------- |
| `q`       | City name (e.g., "Cairo")    |
| `appid`   | Your API key                 |
| `units`   | Metric (°C) or Imperial (°F) |
======================================================================================================================================================================
Data extracted
Temperature
Feels like temperature
Weather icon
Weather description
Humidity
Wind speed
Sunrise / Sunset
Timezone shift
