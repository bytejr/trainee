window.addEventListener('load', function(){
  // Point to display element
  const display = document.querySelector('#display');

  // Point to range inputs
  const redInput = document.querySelector('#red');
  const greenInput = document.querySelector('#green');
  const blueInput = document.querySelector('#blue');

  let red = 0;
  let green = 0;
  let blue = 0;

  // Handle red color change
  redInput.addEventListener('input', (e)=>{
    red = e.target.value;
    const newColor = `rgb(${red},${green},${blue})`;
    display.style.background = newColor;
  });

  // Handle green color change
  greenInput.addEventListener('input', (e)=>{
    green = e.target.value;
    const newColor = `rgb(${red},${green},${blue})`;
    display.style.background = newColor;
  });

  // Handle blue color change
  blueInput.addEventListener('input', (e)=>{
    blue = e.target.value;
    const newColor = `rgb(${red},${green},${blue})`;
    display.style.background = newColor;
  });
})