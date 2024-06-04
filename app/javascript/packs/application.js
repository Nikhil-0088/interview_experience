// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
// require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
import "bootstrap"
import 'jquery'
import 'jquery-ui'
// document.addEventListener("DOMContentLoaded",()=>{
//     const search_input= document.getElementById("search")
//     const company=document.querySelectorAll(".company_name");

//     search_input.addEventListener("keyup",()=>{
//         const query=search_input.value.toLowerCase();
//         company.forEach((c)=>{
//             const name=c.textContent.toLocaleLowerCase()
//             c.style.display=name.includes(query) ? "":"none"
//             console.log(name)
//         })

//     })
// })
document.addEventListener("DOMContentLoaded", function() {
    var companySearch = document.getElementById('company_search');
    var resultsContainer = document.getElementById('company_results');
    if (companySearch) {
      companySearch.addEventListener('input', function() {
        var query = this.value.trim();
        if (query.length>=1) {
          fetch('/companies/search?query=' + encodeURIComponent(query))
            .then(function(response) {
              return response.json();
            })
            .then(function(data) {
                console.log(data)
              showAutocompleteResults(data);
            })
            .catch(function(error) {
              console.error('Error fetching autocomplete results:', error);
            });
        }
        else{
                resultsContainer.style.display="none"
        }
      });
    }
  });
  
  function showAutocompleteResults(data) {
    var resultsContainer = document.getElementById('company_results');
    resultsContainer.style.display="flex"
    if (resultsContainer) {
      resultsContainer.innerHTML = ''; // Clear previous results
      data.forEach(function(company) {
        var link = document.createElement('a');
        link.href = '/companies/' + encodeURIComponent(company[1]);
        link.textContent = company[0];
        link.classList.add('autocomplete-item');
        link.addEventListener('click', function(event) {
          event.preventDefault();
          window.location.href = this.href;
        });
        resultsContainer.appendChild(link);
      });
    }
  }
  
