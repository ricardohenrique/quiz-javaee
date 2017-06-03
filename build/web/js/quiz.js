var timeHide = 0;
var timeShow = 0;
$('#question-2').hide();
$('#question-3').hide();
$('#question-4').hide();
$('#question-5').hide();
$('#question-6').hide();
$('#question-7').hide();
$('#question-8').hide();
$('#question-9').hide();
$('#question-10').hide();
$('#back-1').hide();
$('#next-10').hide();
//// -----next-----;
$("#next-1").click(function(){
    if($("input[name='question-1']").is(':checked')) { 
        $('#question-1').hide(timeHide);
        $('#question-2').show(timeShow);
    }else{
        alert("Selecione uma das alternativas por favor."); 
    }
});
$("#next-2").click(function(){
    if($("input[name='question-2']").is(':checked')) { 
        $('#question-2').hide(timeHide);
        $('#question-3').show(timeShow);
    }else{
        alert("Selecione uma das alternativas por favor."); 
    }
});
$("#next-3").click(function(){
    if($("input[name='question-3']").is(':checked')) { 
        $('#question-3').hide(timeHide);
        $('#question-4').show(timeShow);
    }else{
        alert("Selecione uma das alternativas por favor."); 
    }
});
$("#next-4").click(function(){
    if($("input[name='question-4']").is(':checked')) { 
        $('#question-4').hide(timeHide);
        $('#question-5').show(timeShow);
    }else{
        alert("Selecione uma das alternativas por favor."); 
    }
});
$("#next-5").click(function(){
    if($("input[name='question-5']").is(':checked')) { 
        $('#question-5').hide(timeHide);
        $('#question-6').show(timeShow);
    }else{
         alert("Selecione uma das alternativas por favor.");
    }
});
$("#next-6").click(function(){
    if($("input[name='question-6']").is(':checked')) { 
        $('#question-6').hide(timeHide);
        $('#question-7').show(timeShow);
    }else{
        alert("Selecione uma das alternativas por favor.");
    }
});
$("#next-7").click(function(){
    if($("input[name='question-7']").is(':checked')) { 
        $('#question-7').hide(timeHide);
        $('#question-8').show(timeShow);
    }else{
        alert("Selecione uma das alternativas por favor.");
    }
});
$("#next-8").click(function(){
    if($("input[name='question-8']").is(':checked')) {
        $('#question-8').hide(timeHide);
        $('#question-9').show(timeShow);
    }else{
        alert("Selecione uma das alternativas por favor.");
    }
});
$("#next-9").click(function(){
    if($("input[name='question-8']").is(':checked')) {
        $('#question-9').hide(timeHide);
        $('#question-10').show(timeShow);
        $('#send-quiz').show(timeShow);
    }else{
        alert("Selecione uma das alternativas por favor.");
    }
});
//// -----back-----
$("#back-2").click(function(){
    $('#question-2').hide(timeHide);
    $('#question-1').show(timeShow);
});
$("#back-3").click(function(){
    $('#question-3').hide(timeHide);
    $('#question-2').show(timeShow);
});
$("#back-4").click(function(){
    $('#question-4').hide(timeHide);
    $('#question-3').show(timeShow);
});
$("#back-5").click(function(){
    $('#question-5').hide(timeHide);
    $('#question-4').show(timeShow);
});
$("#back-6").click(function(){
    $('#question-6').hide(timeHide);
    $('#question-5').show(timeShow);
});
$("#back-7").click(function(){
    $('#question-7').hide(timeHide);
    $('#question-6').show(timeShow);
});
$("#back-8").click(function(){
    $('#question-8').hide(timeHide);
    $('#question-7').show(timeShow);
});
$("#back-9").click(function(){
    $('#question-9').hide(timeHide);
    $('#question-8').show(timeShow);
});
$("#back-10").click(function(){
    $('#send-quiz').hide(timeHide);
    $('#question-10').hide(timeHide);
    $('#question-9').show(timeShow);
});