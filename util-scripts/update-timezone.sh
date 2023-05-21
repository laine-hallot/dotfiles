source ./util-scripts/location-checker.sh;


function updateTimeZone() {
    local locationData
    getLocationData locationData;
    timezone=${locationData[0]};
    timedatectl set-timezone $timezone;
}

updateTimeZone;