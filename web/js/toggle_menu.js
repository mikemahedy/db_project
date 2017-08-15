/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var request = new XMLHttpRequest();
function searchInfo() {
    var url = "display.jsp?val=" + 1;
    var val = "";
    document.getElementById('pie').innerHTML = val;
    try {
        request.onreadystatechange = function () {
            if (request.readyState == 4) {
                var val = request.responseText;
                document.getElementById('mylocation').innerHTML = val;
            }
        }//end of function  
        request.open("POST", url, true);
        request.send();
    } catch (e) {
        alert("Unable to connect to server");
    }
}

function pieinfo() {
    var request1 = new XMLHttpRequest();
    request1.open("GET", "pie.jsp", false);

    try {
        request1.onreadystatechange = function () {
            if (request1.readyState == 4) {
                var val = "";
                document.getElementById('mylocation').innerHTML = val;
                var val = request1.responseText;
                $('#pie').append(val);
            }
        }//end of function  
        //request.open("POST", url, true);
        request1.send();
    } catch (e) {
        alert("Unable to connect to server");
    }


    //console.log(el);
    //document.getElementById('mylocation').innerHTML = el.id;
    //  console.log(el);
    // document.getElementById('svgcon').appendChild(request1.responseXML.documentElement);*/
    /*
     var va="<html><h1>Hello project</h1></html>";
     var $doc=new DOMParser().parseFromString(va,"text/html");
     
     console.log($doc.innerHTML);*/
}  