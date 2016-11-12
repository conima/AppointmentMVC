// scripts
// Render script files only from Appointment page (otherwise ajax is running twice)
// Ajax request includs json data type and date is wrapped in JSON.stringify(). Controller returns json.

$(document).ready(function () {
    var today = new Date();
    var options = { year: 'numeric', month: 'long', day: 'numeric' };
    var appDate = $('#AppDate').datepicker({
        dateFormat: 'MM d, yy',
        minDate: new Date()
    }).change(dateChanged).on('changeDate', dateChanged).val();
    var adminDate = $('#AdminDate').datepicker({
        dateFormat: 'MM d, yy',
    }).change(dateChanged).on('changeDate', dateChanged).val();
    function dateChanged(ev) {
        var desiredDate = new Date($(".AppDate").val());
        var formattedDate = convertDate(desiredDate);
        if ($("#AdminDate").length != 0) {
            getAppointments(formattedDate, getAppointmentPath);
        }
        else {
            $("#AppTime").empty();
            checkTimes(formattedDate, checkDatePath);
        }       
    }
    $("#desc0").on('click', function () {
        alert();
    });
});

$("#AppTime").on('select', function () {
    var selectedTime = $('option').val().substr(0, 5);
    var b = toDate(selectedTime, "h:m")
});

$("#CreateApp").on('click', function () {
    var time = 0;
    switch ($("#AppTime").val()) {
        case "08:00 - 09:00":
            time = 1;
            break;
        case "09:00 - 10:00":
            time = 2;
            break;
        case "10:00 - 11:00":
            time = 3;
            break;
        case "11:00 - 12:00":
            time = 4;
            break;
        case "12:00 - 13:00":
            time = 5;
            break;
        case "13:00 - 14:00":
            time = 6;
            break;
        case "14:00 - 15:00":
            time = 7;
            break;
        case "15:00 - 16:00":
            time = 8;
            break;
        case "16:00 - 17:00":
            time = 9;
            break;
        case "17:00 - 18:00":
            time = 10;
            break;
        case "18:00 - 19:00":
            time = 11;
            break;
    }
    event.preventDefault();
    CreateAppointment(time, new Date($(".AppDate").val()));
});

function checkTimes(desiredDate, path) {
    $("#divLoading").show();
    var request = $.ajax({
        url: path,
        dataType: 'json',
        contentType: 'application/json; charset=utf-8',
        type: "POST",
        data: JSON.stringify({ desiredDay: desiredDate }),
        success: function (data) {
            $("#divLoading").hide();
            dropDownMenuLoad(data);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert("Request failed: " + textStatus);
            $("#divLoading").hide();
        }
    });
}

function convertDate(dateToConvert) {

    var curr_date = dateToConvert.getDate();
    var curr_month = dateToConvert.getMonth() + 1;
    var curr_year = dateToConvert.getFullYear();
    var formattedDate = curr_date + "/" + curr_month + "/" + curr_year;
    return formattedDate;
}

function dropDownMenuLoad(data) {

        for (i = 0; i < data.length; i++)
        {
            var hour = data[i].Hours + ":" + data[i].Minutes + "0";
            if (data[i].Hours < 10) { hour = "0" + hour; }
            var nextHour = (data[i].Hours + 1) + ":" + data[i].Minutes + "0";
            if ((data[i].Hours + 1) < 10) { nextHour = "0" + nextHour; }
            $("#AppTime").append("<option>" + hour + " - " + nextHour + "</option>");            
        }
}

function toDate(dStr, format) {
    var now = new Date();
    if (format == "h:m") {
        now.setHours(dStr.substr(0, dStr.indexOf(":")));
        now.setMinutes(dStr.substr(dStr.indexOf(":") + 1));
        now.setSeconds(0);
        return now;
    } else
        return "Invalid Format";
}

function CreateAppointment(slot, day) {
    $.ajax({
        url: setAppointmentPath,
        dataType: 'json',
        contentType: 'application/json; charset=utf-8',
        type: "POST",
        data: JSON.stringify({ timeSlot: slot,
                                appDate: day}),
        success: function (data) {
            $("#message").html(data);
            $(".AppDate").val("");
            $("#AppTime").val("");
            $("#AppTime").empty();
        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert("Request failed: " + textStatus);
        }
    });
}

function getAppointments(appDate, path) {
    $("#divLoading").show();
    var request = $.ajax({
        url: path,
        dataType: 'json',
        contentType: 'application/json; charset=utf-8',
        type: "POST",
        data: JSON.stringify({ appDay: appDate }),
        success: function (data) {
            $("#divLoading").hide();
            CreateTable(data);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert("Request failed: " + textStatus);
            $("#divLoading").hide();
        }
    });
}

function CreateTable(data) {
    
    var table = $('table');
    $("td").remove();
    var elements = ['Time', 'FirstName', 'LastName', 'Email', 'AppNumber', 'Description'];
    for (i = 0; i < data.length; i++) {
        var row = $('<tr/>');
        
        for (j = 0; j < elements.length; j++) {
            var col = $('<td/>');
            if (elements[j] == "Time")
            {
                var hour = data[i].Time.Hours + ":" + data[i].Time.Minutes + "0";
                if (data[i].Time.Hours < 10) { hour = "0" + hour; }
                var nextHour = (data[i].Time.Hours + 1) + ":" + data[i].Time.Minutes + "0";
                if ((data[i].Time.Hours + 1) < 10) { nextHour = "0" + nextHour; }
                col.append(hour + " - " + nextHour);
            }
            if (elements[j] == "Description") {
                if (data[i].Description.trim() != "") {
                    col.append('<p>Add/Edit</p><div>' + data[i].Description.trim() + '</div>').attr('id', 'desc' + data[i].Id);
                }
                else
                    col.append('<p>Add/Edit</p>').attr('id', 'desc' + data[i].Id);
            }
            else {
                col.append(data[i][elements[j]]);
            }
            
            row.append(col);
        }
        table.append(row);
    }
    $(".AppTable").show();
}

$("table").on("click", "p", function () {
    var clickId = $(this).parent().attr('id');
    var text = $('#' + clickId + ' div').html();
    if (text == null) {
        text = "";
    }
    $('#' + clickId + ' div').remove();
    $('#' + clickId).append('<input type="text" class="addInput" id="text' + clickId + '" value="' + text + '" />');
});

$("table").on("blur", "input", function () {
    var clickId = $(this).parent().attr('id');
    var id = clickId.substr(4);
    var text = $('#' + clickId + ' input').val();
    AddDescription(text, id, clickId);
    $('#' + clickId + ' input').remove();
});

function AddDescription(text, id, clickId) {
    $.ajax({
        url: setDescriptionPath,
        dataType: 'json',
        contentType: 'application/json; charset=utf-8',
        type: "POST",
        data: JSON.stringify({
            id: id,
            text: text
        }),
        success: function (data) {
            $('#' + clickId).append('<div>' + text + '</div>').attr('id', clickId);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert("Request failed: " + textStatus);
        }
    });
}

$('#myAppoinments').on('click', function () {
    GetMyAppointments();
    $("#message").html("");
});

function GetMyAppointments() {
    $("#divLoading").show();
    var request = $.ajax({
        url: getMyAppointmentsPath,
        dataType: 'json',
        contentType: 'application/json; charset=utf-8',
        type: "POST",
        data: JSON.stringify({}),
        success: function (data) {
            $("#divLoading").hide();
            CreateAppointmentTable(data);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert("Request failed: " + textStatus);
            $("#divLoading").hide();
        }
    });
}

function CreateAppointmentTable(data)    {
    var table = $('.AppTable table');
    $(".AppTable td").remove();
    var elements = ['Date', 'Time', 'FirstName', 'LastName', 'Previous Appointments', 'Cancel'];
    for (i = 0; i < data.length; i++) {
        var row = $('<tr/>');

        for (j = 0; j < elements.length; j++) {
            var col = $('<td/>');
            if (elements[j] == "Date") {
                var date = new Date(parseInt(data[i].AppDate.substr(6)));
                col.append(convertDate(date));
            }
            if (elements[j] == "Time") {
                var hour = data[i].Time.Hours + ":" + data[i].Time.Minutes + "0";
                if (data[i].Time.Hours < 10) { hour = "0" + hour; }
                col.append(hour);
            }
            if (elements[j] == "Previous Appointments") {
                col.append(data[i].AppNumber);
            }
            if (elements[j] == "Cancel") {
                col.append('<button class="btn" style="border: 1px solid" type="button" title="Cancel">Cancel</button>').attr('id', 'cancel' + data[i].Id);
            }
            else {
                col.append(data[i][elements[j]]);
            }

            row.append(col).attr('id', 'appoinment' + data[i].Id);
        }
        table.append(row);
    }
    $(".AppTable").show();
}

$("table").on("click", "button", function () {
    var clickId = $(this).parent().attr('id');
    var rowId = $(this).parent().parent().attr('id');
    var id = clickId.substr(6);
    DeleteAppointment(id);
    $(this).closest('tr').remove();
    return false;
});

function DeleteAppointment(id) {
    $.ajax({
        url: deleteMyAppointmentsPath,
        dataType: 'json',
        contentType: 'application/json; charset=utf-8',
        type: "POST",
        data: JSON.stringify({id: id}),
        success: function (data) {
            
        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert("Request failed: " + textStatus);
        }
    });
}