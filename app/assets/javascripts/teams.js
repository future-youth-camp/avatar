function getMaxOfArray(numArray) {
  return Math.max.apply(null, numArray);
}

$(document).ready(function(){
  /* Loop all teams, find max height, set all heights to max height. */
  a = [];
  $teams = $('.team-display');
  $teams.each(function() {
    a.push($(this).height())
  });
  maxheight = getMaxOfArray(a);
  $teams.each(function(){
    $(this).height(maxheight);
  });
});
