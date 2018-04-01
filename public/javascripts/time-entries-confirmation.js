function weekPicked(){
  $("#time-entries-form").attr("action","/time_entries_confirmation/entries/" + $('#week-select').val())
  $("#time-entries-form").submit()
}

function weekSheduleActionButtonclicked(){
  wsa = parseInt($("#wsa-status-title").attr("wsa"))
  if(wsa == 0){
    $("#week-shedule-agreement-form").attr("action","/week_shedule_agreements/confirm")
  } else {
    $("#week-shedule-agreement-form").attr("action","/week_shedule_agreements/reject")
  }
  $("#week-shedule-agreement-form").submit()
}


window.formReloaded = function(wsa_id){
  $("#wsa-status-title").attr("wsa", wsa_id)
  if(wsa_id > 0){
    $("#wsa-status-title").html("Согласовано")
    $("#week-shedule-action-button").html("Отменить")
  } else {
    $("#wsa-status-title").html("Не согласовано")
    $("#week-shedule-action-button").html("Согласовать")
  }
}

$(document).ready(function(){

  $('#week-select').change(weekPicked)
  $('#user-select').change(weekPicked)
  $('#week-shedule-action-button').click(weekSheduleActionButtonclicked)
  weekPicked()

})
