source ./util-scripts/location-checker.sh;


function getWeather() {
    local locationData
    getLocationData locationData;
    loc=${locationData[3]};
    weatherForecast=$(curl -s https://wttr.in/$loc?0QT);
    notify-send "$weatherForecast";
}

getWeather;