function turnMonitorOff(){
    export DISPLAY=:0
    xset dpms force off
}
function turnMonitorOn(){
    export DISPLAY=:0
    xset dpms force on
}
