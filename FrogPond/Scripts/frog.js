// JScript source code

//here is my javascript page to do different actions as get,update,insert and delete actions,ajax jquery is easy and interactive
$(function () {

    var itmtpl = $("#Itemtpl").html();
    $.ajax({
        type: "POST",
        url: 'Main.aspx/getData',
        contentType: "application/json; charset=utf-8",
        datatype: "json",
        //        data: "",
        async: "true",
        success: function (data) {
            $.each(data, function (index, element) {
                element = JSON.parse(element);
                var html = Mustache.to_html(itmtpl, element);

                $("#mytable > tbody:last").append(html);
            });
        },
        error: function (jqXHR, status, err) {
            alert(err);
        }
    });

    $("#addfrog").click(function () {


        var frog = { Name: $("#name").val(), Gender: ($("#gender1").is(":checked")) ? "Female" : "Male", Environment: $("#environ").val(), Birth: $("#birth").val(), Death: $("#death").val() };
        $.ajax({
            url: 'Main.aspx/addData',
            type: "POST",
            data: JSON.stringify({ 'frog': frog }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (rcv) {
                location.reload();
            },
            error: function (jqXHR, status, err) {

            }
        });

    });

    $("#deletebtn").click(function () {
        var id = $('#hidid').val();
        var strData = JSON.stringify({ id: id });
        $.ajax({
            type: "POST",
            url: 'Main.aspx/deleteData',
            contentType: "application/json; charset=utf-8",
            datatype: "json",
            data: strData,
            async: "true",
            success: function (data) {
                location.reload();
            },
            error: function (jqXHR, status, err) {
                alert(err);
            }
        });

    });
    $("#mytable").on("click", ".delete", function () {
        var id = $(this).closest("tr").find("#idtd").text();
        $('#hidid').val($.trim(id));
    });

    $("#updatebtn").click(function () {
        var frog = { ID: $('#hidid').val(), Name: $("#ename").val(), Gender: ($("#egender1").is(":checked")) ? "Female" : "Male", Environment: $("#eenviron").val(), Birth: ($("#ebirth").val() == "mm/dd/yyyy") ? "" : $("#ebirth").val(), Death: ($("#edeath").val() == "mm/dd/yyyy") ? "" : $("#edeath").val() };
        $.ajax({
            type: "POST",
            url: 'Main.aspx/updateData',
            contentType: "application/json; charset=utf-8",
            datatype: "json",
            data: JSON.stringify({ 'frog': frog }),
            async: "true",
            success: function (data) {
                location.reload();
            },
            error: function (jqXHR, status, err) {
                alert(err);
            }
        });

    });

    $("#mytable").on("click", ".edit", function () {
        var id = $(this).closest("tr").find("#idtd").text();
        $('#hidid').val($.trim(id));
        $("#ename").val($.trim($(this).closest("tr").find("#nametd").text()));
        ($.trim($(this).closest("tr").find($("#gendertd")).text()) == "Female") ? $("#egender1").prop("checked", "checked") : $("#egender2").prop("checked", "checked");
        $("#eenviron").val($.trim($(this).closest("tr").find("#environtd").text()));
        $("#ebirth").val($.trim($(this).closest("tr").find("#birthtd").text()));
        $("#edeath").val($.trim($(this).closest("tr").find("#deathtd").text()));

    });
});