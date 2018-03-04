function weekPicked(){
  $("#time-entries-form").attr("action","/time_entries_confirmation/entries/" + $('#week-select').val())
  $("#time-entries-form").submit()
}

window.formReloaded = function(){

}

$(document).ready(function(){

  formReloaded()
  $('#week-select').change(weekPicked)


})
