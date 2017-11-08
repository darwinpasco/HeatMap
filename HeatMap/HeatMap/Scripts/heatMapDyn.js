// initialise variables
var speed = 5;
var interval = setInterval(function () { }, 1000);
var iter = 0;
var playing = false;
var startDatetime;
var endDateTime;
// function to change map
function changeSpeed(change) {
    //        speed = speed+change;
    speed = document.getElementById("speedSlider").value;
    startDatetime = new Date(document.getElementById("DateTime_start").value);
    endDateTime = new Date(document.getElementById("DateTime_end").value);
    //        if (speed<=0) speed=1;
    //        if (speed>=10) speed=10;
    var currentDate = new Date();

    if (startDatetime >= endDateTime || startDatetime == "Invalid Date" || endDateTime == "Invalid Date" || currentDate < startDatetime || currentDate < endDateTime) {
        alert("Please enter valid date and time.");
        return;
    }

    // speed --> delay
    if (speed > 5) {
        delay = 500 / (speed - 5);
    } else {
        delay = 500 * (6 - speed);
    }
    // restarting the function
    clearInterval(interval)
    if (playing) {
        interval = setInterval(function () {
            iter++;
            if (iter >= heatmapData.length) iter = 0;
            heatmapLayer.setData(heatmapData[iter]);
            document.getElementById("time").innerHTML = iter.toString();
            //d.toLocaleTimeString();
        }, delay);
    }
}

function reset(play_clicked) {
    clearInterval(interval)

    play_clicked = typeof play_clicked !== 'undefined' ? play_clicked : false;
    iter = 0;
    heatmapLayer.setData(heatmapData[iter]);
    document.getElementById("time").innerHTML = "";
    speed = document.getElementById("speedSlider").value;
    if (!play_clicked) {
        document.getElementById("DateTime_start").value = "";
        document.getElementById("DateTime_end").value = "";
    }
    //d.toLocaleTimeString();
    playing = true;
}

