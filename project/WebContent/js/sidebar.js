/**
 * 
 */

$(function(){
    var duration = 300;

    var $sidebar = $('.sidebar');
    var $sidebarButton = $sidebar.find('button').on('click', function(){
        $sidebar.toggleClass('open');
        if($sidebar.hasClass('open')){
            $sidebar.stop(true).animate({right: '-10px'}, duration, 'easeOutBack');
            $sidebarButton.find('span').text('CLOSE');
        }else{
            $sidebar.stop(true).animate({right: '-270px'}, duration, 'easeInBack');
            $sidebarButton.find('span').text('OPEN');
        };
    });
});
