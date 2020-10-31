var svg = d3.select("svg");

var boxSize = 8;
var boxPadding = 5;
var boxAndPad = boxSize + boxPadding;
var weeksInYear = 52;
var lifeExpectancy = 100;
var colStartPos = 25;
var rowStartPos = 25;

var yearCounter = 0;
var fillWeek = "fill";
var strokeColor = "steelblue"
var weekInMillis = 604800000;
var today = new Date();
var isBornYet = false;
var birthdayWeekCounter = 0;

var blackenedSquares = 0;

buildCalendar = function(birthDateStr)
{
  var weekOfCurrentIteration = Date.parse(birthDateStr);
  var birthDate = weekOfCurrentIteration;
 
  var startOfYear = new Date(weekOfCurrentIteration);
  startOfYear = new Date(startOfYear.getFullYear() + "-01-01");
  startOfYear = startOfYear.getTime();
  weekOfCurrentIteration = startOfYear;

  for (j = rowStartPos; j < (boxAndPad * lifeExpectancy); j += boxAndPad) {
    
    var weekCounter = 0;

    for (i = colStartPos; i < (boxAndPad * weeksInYear); i += boxAndPad) {

      strokeColor = "steelblue";

      if (i == colStartPos && j % 5 == 0) {
        svg.append("text")
           .attr("x", 0)
           .attr("y", j + boxSize)
           .text(yearCounter);
      }

      if (weekOfCurrentIteration < birthDate || weekOfCurrentIteration > today) {
        fillWeek = "transparent";
      }
      else {
        fillWeek = "fill";
        blackenedSquares++;
        if (!isBornYet) {
          isBornYet = true;
        }
      }

      if (!isBornYet) {
        ++birthdayWeekCounter;
      }
      else if (weekCounter == birthdayWeekCounter) {
        strokeColor = "red";
      }

      svg.append("rect")
         .attr("x", i)
         .attr("y", j)
         .attr("width", boxSize)
         .attr("height", boxSize)
         .attr("stroke", strokeColor)
         .attr("fill", fillWeek);

      weekOfCurrentIteration += weekInMillis;
      startOfYear += weekInMillis;
      ++weekCounter;


    } // Each week of the year


    yearCounter++;
  } // Each year
}

console.log(blackenedSquares);
buildCalendar($("#datepicker").val());

$("#datepicker").change(function() {
  var date = $(this).val();
  buildCalendar(date);
});
