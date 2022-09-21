// Stations' url, used to dinamically change the image
const stationsUrl = {
  94.3: 'atlantida',
  97.1: 'oceano',
  102.1: 'gaucha',
  103.3: 'cultura'
}

// Stations' names, used to dinamically change the description
const stations = {
  94.3: 'Atlântida',
  97.1: 'Oceano',
  102.1: 'Gaúcha',
  103.3: 'Cultura',
}

window.addEventListener('load', function(){

  // Reference items
  const image = document.querySelector('#img');
  const input = document.querySelector('#range-input');
  const stationText = document.querySelector('#station-text');
  const currentStationNumber = document.querySelector('#station-number');

  // Add slide event
  input.addEventListener('input', function(e){
    // Get current input value from e (event)
    const freq = e.target.value;

    // Get the newStation, according to the freq variable
    const newStation = stationsUrl[freq];
    
    // If a existent station was found
    if(newStation !== undefined){
      image.src = `public/assets/stations/${newStation}.png`;
      currentStationNumber.innerHTML = Number(freq).toFixed(1);
      stationText.innerHTML = `- Rádio ${stations[freq]}`;
    
    // Display the 'not found' image, only on the it was not shown previously
    }else{
      if(stationText.textContent === 'Fora do ar') return;

      image.src = `public/assets/stations/default.png`;
      currentStationNumber.innerHTML = Number(freq).toFixed(1);
      stationText.innerHTML = `- Fora do ar`;
    }

  });
});