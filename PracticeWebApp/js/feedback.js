var feedback = function () {
    $(".commentTextarea").keyup(function () {
        var postLength = $(this).val().length;
        var charLeft = 200 - postLength;
        $(".charCount").text(charLeft);

        if (charLeft < 0) {
            $(".btnPost").addClass("disabled");
        }
        else if (charLeft == 200) {
            $(".btnPost").addClass("disabled");
        }
        else {
            $(".btnPost").removeClass("disabled");
        }
    });

    $(".btnPost").addClass("disabled");
};

$(document).ready(feedback);