function weekPicked(){
  $("#time-entries-form").attr("action","/time_entries_confirmation/entries/" + this)
  $("#time-entries-form").submit()
}

window.formReloaded = function(){

}

$(document).ready(function(){

  formReloaded()
  $("#week-picker").scrollableCalendar({
      touch: false,
      startDate: "2018-01-01",
      endDate: "2018-12-30",
      currentWeek: $("#week-picker").data("current-date"),
      onClick: weekPicked
  });

})
