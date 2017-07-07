$(document).ready(function() {


    
      
    

    var textarea = document.getElementById('tweet_content');

    console.log(textarea);


    var char = document.getElementById('characters');
     var create_tweet_submit = document.getElementById('create_tweet_submit');
    console.log(char);



    textarea.addEventListener('input', function() {
        console.log(textarea.value.length);


        char.innerHTML = textarea.value.length;
       
          if (textarea.value.length > 140) {
            char.style.color = "red";
            create_tweet_submit.disabled = true;


        } else {
            char.style.color = "black";
            create_tweet_submit.disabled = false;

        }
    });





});
