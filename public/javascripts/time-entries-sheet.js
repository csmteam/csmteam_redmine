function weekPicked(){
  $("#time-entries-form").attr("action","/time_entries_sheet/" + this)
  $("#time-entries-form").submit()
}


$(document).ready(function(){

  $("#week-picker").scrollableCalendar({
      touch: false,
      startDate: "2018-01-01",
      endDate: "2018-12-30",
      currentWeek: "2018-02-19",
      onClick: weekPicked
  });

})
