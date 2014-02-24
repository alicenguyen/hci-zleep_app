var modal_content_1 = "<div class='modal-content'>"+
"<div class='modal-header'>"+
"<button type='button' class='close' data-dismiss='modal' aria-hidden='true'>&times;</button>"+
"<h4 class='modal-title' id='myModalLabel'>Create alarm</h4>"+
"</div>"+
"<div class='modal-body'>"+
"<div class='row'>"+
"<!-- time input column -->"+
"<div class='col-xs-12 col-time-input'>"+
"<form class='form-inline' role='form'>"+
"<div style='display:inline;'>"+
"<span> I need to</span> <select id='alarm-type-selection'> <option>wakeup</option> <option>sleep</option> </select></div>"+
"<div class='input-append bootstrap-timepicker' style='display: inline;'>"+
"<span> at"+
"<input id='timepicker'class='dateselect-time input-small timepicker' type='text'/>"+
"<span class='add-on'><i class='icon-time glyphicon glyphicon-time'></i></span></span>"+
"</div>"+
"</form>"+
"</div>"+
"</div>"+
"<div class='row' style='margin-top:25px'>"+
"<div class='col-xs-12'>"+
"<form class='form-inline' role='form'><span>Alarm type: </span> "+
"<div class='radio'> <label> <input type='radio' name='optionsRadios' id='optionsRadios1' value='call' checked> call </label> </div>"+
"<div class='radio'> <label> <input type='radio' name='optionsRadios' id='optionsRadios2' value='sms'> sms </label> </div>"+
"</form>"+
"</div>"+
'</div>'+
'<div class="modal-footer">'+
'<button id="btn-modal-1-cancel"type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>'+
'<button id="btn-modal-1-next"type="button" class="btn btn-primary">Next</button>'+
'</div>';

var modal_content_2 = "<div id='modal-2-content' class='modal-content'>"+
"<div class='modal-header'>"+
"<button type='button' class='close' data-dismiss='modal' aria-hidden='true'>&times;</button>"+
"<h4 class='modal-title' id='myModalLabel'></h4>"+
"</div>"+
"<div id='modal-body-2' class='modal-body'>"+
"<div class='row'>"+
"<div class=' col-xs-12'>"+
"<h4 style='color:#999'>Reminder</h4>"+
"<div>"+
"<label class='radio-inline'>"+
"<input type='radio' id='inlineCheckbox1' value='option1'> SMS"+
"</label>"+
"<label class='radio-inline'>"+
"<input type='radio' id='inlineCheckbox2' value='option2'> Call"+
"</label>"+
"<label class='radio-inline'>"+
"<input type='radio' id='inlineCheckbox3' value='option3'> None"+
"</label>    "+
"<label> <input class='radio-inline form-control'type='number' name='quantity' min='1' max='60' value='10'></label>"+
"<label class=> <select class='form-control radio-inline'>"+
"<option>minutes</option>"+
"<option>hours</option>"+
"<option>days</option>"+
"</select></label>"+
"<label class=> <select class='form-control radio-inline'>"+
"<option>minutes</option>"+
"<option>hours</option>"+
"<option>days</option>"+
"</select></label>"+
"</div>"+
"</div>"+
"</div>"+
"</div>"+
"<div class='modal-footer'>"+
"<button id='btn-modal-2-back' type='button' class = 'btn btn-default' data-dismiss='modal'><span class=' glyphicon glyphicon-chevron-left'></span></button>"+
"<button id='btn-modal-2-cancel'type='button' class='btn btn-default' data-dismiss='modal'>Cancel</button>"+
"<span id='btn_save'><%= submit_tag 'Save' %></span>"+
"</div>"+
"</div>";



