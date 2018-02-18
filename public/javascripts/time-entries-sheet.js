function weekPicked(){
  $("#time-entries-form").attr("action","/time_entries_sheet/" + this)
  $("#time-entries-form").submit()
}


$(document).ready(function(){

  $("#week-picker").scrollableCalendar({
      touch: false,
      startDate: "2016-01-01",
      endDate: "2018-03-18",
      currentWeek: "2018-02-18",
      onClick: weekPicked
  });

})
