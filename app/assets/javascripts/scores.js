$(document).ready( function() {
  // get scores
  let scores;
  $.getJSON( 'scoreboard.json', function(res) {
    console.log(res);
    for (let s in res) {
      $('tbody').append(`<tr><td>${parseInt(s) + parseInt(1)}</td><td>${res[s].nickname}</td><td>${res[s].score}</td></tr>`);
    }
    colorCells();
  });

  // color cells
  function colorCells() {
    let colors = ['#f80c12', '#ff4422', '#feae2d', '#ccbb33', '#aacc22', '#69d025',
    '#22ccaa', '#12bdb9', '#4444dd', '#442299'];
    
    let rows = $('table tbody tr');

    for (let i = 0; i < rows.length; i++) {
      $(rows[i]).css('background-color', colors[i]);
    }
  }
})
