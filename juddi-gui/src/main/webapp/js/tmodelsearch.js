
var offset=0; //start at the begining
var maxrecords=10;  //record 20 at a time
var lang="en";  //langauge english
var totalrecords=0;

RenderTmodelListBySearch('%', offset, maxrecords);

function pagedownChooserTmodel()
{
    offset = $("#offset").text();
    //alert(offset);
    var newoffset = offset - maxrecords;
    if (newoffset < 0)
        return;
    //alert(newoffset);
    if (newoffset != offset)
        RenderTmodelListBySearch('%', newoffset, maxrecords, true);
}
function pageupChooserTmodel()
{
    offset = $("#offset").text();
    //alert(offset);
    var fetch = maxrecords;
    if ((parseInt(offset) + parseInt(maxrecords))  > totalrecords)
        //fetch = maxrecords - offset;
        return;
    else 
        fetch = (parseInt(offset) + parseInt(maxrecords));    
    //alert(fetch);
    offset = fetch;
    RenderTmodelListBySearch('%', fetch, maxrecords, true);
}


function pagedown()
{
    offset = $("#offset").text();
    //alert(offset);
    var newoffset = offset - maxrecords;
    if (newoffset < 0)
        return;
    //alert(newoffset);
    if (newoffset != offset)
        RenderTmodelListBySearch('%', newoffset, maxrecords, false);
}
function pageup()
{
    offset = $("#offset").text();
    //alert(offset);
    var fetch = maxrecords;
    if ((parseInt(offset) + parseInt(maxrecords))  > totalrecords)
        //fetch = maxrecords - offset;
        return;
    else 
        fetch = (parseInt(offset) + parseInt(maxrecords));    
    //alert(fetch);
    offset = fetch;
    RenderTmodelListBySearch('%', fetch, maxrecords, false);
}
var selectedItem=null;

//offset, maxrecords, keyword
function RenderTmodelListBySearch(keyword1, offset1, maxrecords1, isForChooser)
{
    
    var    keyword =$("#name_tmodel").val();
    var lang = $("#lang_tmodel").val();
    if (lang==undefined)
       lang = "";
    if (keyword==undefined)
       keyword = "";
    lang = encodeURIComponent(lang);
    keyword = encodeURIComponent(keyword);
    offset1 = encodeURIComponent(offset1);
    maxrecords1 = encodeURIComponent(maxrecords1);
    isForChooser = encodeURIComponent(isForChooser);
    $("#tmodellist").html("<img src=\"img/bigrollergreen.gif\" title=\"Loading\"/>");
    var request=   $.ajax({
        url: 'ajax/tmodelsearch.jsp?keyword=' + keyword + "&offset=" + offset1 + "&maxrecords=" + maxrecords1 + "&lang=" + lang + "&chooser=" + isForChooser,
        type:"GET",
        cache: false
    });
                  
    request.done(function(msg) {
        window.console && console.log('postback done ');                
        $("#tmodellist").html(msg);
        $('.modalable').click(function(){
            selectedItem =$(this).attr("id");
        });
    //refresh();
    });

    request.fail(function(jqXHR, textStatus) {
        window.console && console.log('postback failed ');                                
        $("#tmodellist").html("An error occured! " + jqXHR.responseText + textStatus);
    //refresh();
    });
/*
    $.get('ajax/businesssearch.jsp?keyword=' + keyword1 + "&offset=" + offset1 + "&maxrecords=" + maxrecords1 + "&lang=" + lang, function(data) {
        $("#businesslist").html(data);
        refresh();
    });*/
}

function refresh()
{
    var displayrecords = $("#displayrecords").text();
    if (displayrecords == totalrecords)
    {
        $("#pageup").addClass("disabled");
        $("#pagedown").addClass("disabled");
    }
    else if (offset + maxrecords > totalrecords)
    {
        $("#pageup").addClass("disabled");    
    }
    else if (offset ==0)
    {
        $("#pagedown").removeClass("disabled");        
    }
    else
    {
        $("#pagedown").removeClass("disabled");        
        $("#pageup").removeClass("disabled");        
    }
}