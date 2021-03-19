$(function () {
        $("#chkCouple").click(function () {
            if ($(this).is(":checked")) {
                $("#dvCouple").show();
                $("#AddSolo").show();
            } else {
                $("#dvCouple").hide();
                $("#AddSolo").show();
            }
        });
        $("#chkSolo").click(function () {
            if ($(this).is(":checked")) {
                $("#dvCouple").hide();
                $("#AddSolo").show();
            } else {
                $("#dvCouple").hide();
                $("#AddSolo").show();
            }
        });
    });
