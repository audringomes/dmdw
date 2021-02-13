/*! 
* Enter the function/s you want to call after topics load in this file.
* Nothing in this file should be executed on loading! All execution is
* initiated with a single statement stored in the POSTLOAD_FUNC variable
* including any arguments. Example:
* myFunction("red","blue");
*/
function UpdateLastEdited()
{
 var Leb = document.getElementById("revised");
 if (Leb == null)
    console.log('Element with ID revised not Found in topic',document.title);
 else 
    { var LastUpdate = document.getElementById("last_update");
      if (LastUpdate!==null) LastUpdate.innerHTML=Leb.innerHTML;
      console.log('Ran UpdateLastEdited',Leb.innerHTML);
    }
}
