window.load_more_active = false;
    window.offset = 10;

    


    document.addEventListener('scroll', function(event){
        
        if(!window.load_more_active){
           if(window.scrollMaxY - event.pageY < 50){
            window.load_more_active = true;
            $.ajax({
              url: '/',
              type: 'GET',
              dataType: 'script',
              data: {
              offset: window.offset,
              format: 'js'
              }
            });
        } 
        }
        
    });

    
    