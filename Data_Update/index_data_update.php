<?php

?>
<!DOCTYPE html><html class=''>
    
<head><script src=''></script><meta charset='UTF-8'><meta name="robots" />
<title>foreUcast</title>
<LINK REL="stylesheet" TYPE="text/css" HREF="css.css">
<style class="cp-pen-styles">.reveal-if-active {
  opacity: 0;
  max-height: 0;
  overflow: hidden;
  font-size: 16px;
  -webkit-transform: scale(0.8);
          transform: scale(0.8);
  -webkit-transition: 0.5s;
  transition: 0.5s;
}
.reveal-if-active label {
  display: block;
  margin: 0 0 3px 0;
}
.reveal-if-active input[type=text] {
  width: 100%;
}
input[type="radio"]:checked ~ .reveal-if-active, input[type="checkbox"]:checked ~ .reveal-if-active {
  opacity: 1;
  max-height: 100px;
  padding: 10px 20px;
  -webkit-transform: scale(1);
          transform: scale(1);
  overflow: visible;
}

form {
  max-width: 500px;
  margin: 20px auto;
}
form > div {
  margin: 0 0 20px 0;
}
form > div label {
  font-weight: bold;
}
form > div > div {
  padding: 5px;
}
form > h4 {
  color: green;
  font-size: 24px;
  margin: 0 0 10px 0;
  border-bottom: 2px solid green;
}
    
h3{
	color: green;
  font-size: 24px;
  margin: 0 0 10px 0;
  border-bottom: 2px solid green;
	text-align:center;
}
h2{
	color: green;
  font-size: 12px;
  margin: 0 0 10px 0;
  border-bottom: 0px solid green;
	text-align:center;    

body {
  font-size: 20px;
}

* {
  box-sizing: border-box;
}
</style></head><body>

<div class="menu">

    <?php include '../menu.php';?>
    <br><br><br>
    
</div>
    
        <div>
            <h3>ForeUcast</h3>
                <p>
                    <h2>In this page you can modify some of the values that produce the parameter coeficients<h2>
                </p>
				<p>
                    <h2>Each coeficient has a country and a year so, first you have to select the country and the year.<h2>
                </p>
				<p>
                    <h2>Once a country and a year are selected, then you may choose the coeficient to be update and insert the new values <h2>
                </p>
        </div>  
    
    
<form method="post" action="insert.php">
    
  <h4>Choose a Country</h4>
    
  <div>
      
    <input type="checkbox" name="choice-country" id="choice-country">
    <label for="choice-country">Display Countries List</label>

    <div class="reveal-if-active">
       <table>
            <tr>
                <td>
                    Select One Country:
                </td> 
                <td>
                        <input type = "radio" name = "COUNTRY" value = "AND">Andorra
                        <input type = "radio" name = "COUNTRY" value = "CAT">Catalunya
                        <input type = "radio" name = "COUNTRY" value = "SPA">Spain
                        <input type = "radio" name = "COUNTRY" value = "CAN">Canada
                        <input type = "radio" name = "COUNTRY" value = "JAP">Japan
                        <input type = "radio" name = "COUNTRY" value = "USA">United States America
                        <input type = "radio" name = "COUNTRY" value = "GER">Germany
                        <input type = "radio" name = "COUNTRY" value = "FRA">France
                        <input type = "radio" name = "COUNTRY" value = "RUS">Russia
                        <input type = "radio" name = "COUNTRY" value = "UK">United Kingdom
                </td>
            </tr>
         </table>
	</div>
   </div> 
    
    
<h4>Choose a Year</h4>
    
<div>
    
    <input type="checkbox" name="choice-country" id="choice-country">
    <label for="choice-country">Display Years with Data</label>

    <div class="reveal-if-active">
       <table>
            <tr>
               <td>Select One Year:</td> 
			   <td>
                  <input type = "radio" name = "year" value = "2000"> 2000
                  <input type = "radio" name = "year" value = "2001"> 2001
			      <input type = "radio" name = "year" value = "2002"> 2002
                  <input type = "radio" name = "year" value = "2003"> 2003
				  <input type = "radio" name = "year" value = "2004"> 2004
                  <input type = "radio" name = "year" value = "2005"> 2005
				  <input type = "radio" name = "year" value = "2006"> 2006
                  <input type = "radio" name = "year" value = "2007"> 2007  
				  <input type = "radio" name = "year" value = "2008"> 2008
                  <input type = "radio" name = "year" value = "2009"> 2009
                  <input type = "radio" name = "year" value = "2010"> 2010
                  <input type = "radio" name = "year" value = "2011"> 2011
				  <input type = "radio" name = "year" value = "2012"> 2012
                  <input type = "radio" name = "year" value = "2013"> 2013
				  <input type = "radio" name = "year" value = "2014"> 2014
                  <input type = "radio" name = "year" value = "2015"> 2015
                  <input type = "radio" name = "year" value = "2016"> 2016
               </td>
              		
			</tr>
         </table>
	</div>
   </div>
    
<h4>Choose a Coeficient to Modify</h4>
<div>
	<p>
		<h2>Some values can not be modified because they are objective facts (e.g GDP or PISA results), but other values, 
		like the amount freedom are more subjective and can be modified. Some objective values, like the ones used to rate universities
		can be changed but, for a proper comparison, you may have to chang it in all the countries and years <h2>
	</p> 
</div>  
<div>
    <input type="checkbox" name="choice-wealth" id="choice-wealth">
    <label for="choice-wealth">Wealth</label>
    
	<div class="reveal-if-active">
				
			 <table>
				 <tr>Input a new value between 0 and 100 for:</tr>
					<tr>
					   <td>
						   Resources:
					   </td> 
					   <td>
							<input type = "text" name = "resources" value="" size="20" maxlength="20">  
						</td>
					</tr>
					<tr>
					   <td>
						   Dependency:
					   </td>
					   <td>
						   <input type = "text" name = "depende" value="" size="20" maxlength="20">
						</td>
					</tr>
			  </table>
	</div>

	<div>
		<input type="checkbox" name="choice-university" id="choice-university">
		<label for="choice-university">University</label>

		<div class="reveal-if-active">
			
		  
			 <table>
				 <tr>Input a new value between 0 and 100 for: </tr>
				 <tr>
				   <td>
					   Index 1 Univ.
				   </td> 
				   <td>
					   <input type = "text" name = "index_uni_1" value="" size="20" maxlength="20"
				   </td>
				</tr>
				<tr>
				   <td>
					   Index 2 Univ.
				   </td> 
				   <td>
					   <input type = "text" name = "index_uni_2" value="" size="20" maxlength="20"
				   </td>
				</tr>
			</table>
		</div>
	</div>
    
    
	<div>
		<input type="checkbox" name="choice-sociodemo" id="choice-sociodemo">
		<label for="choice-sociodemo">Socio Demographics</label>

		<div class="reveal-if-active">
			
		  
			 <table>
				 <tr>Input a new value between 0 and 100 for: </tr>
				 <tr>
				   <td>
					   Freedom.
				   </td> 
				   <td>
					   <input type = "text" name = "index_freedom" value="" size="20" maxlength="20"
				   </td>
				</tr>
				<tr>
				   <td>
					   Civil Risks.
				   </td> 
				   <td>
					   <input type = "text" name = "index_civil_risks" value="" size="20" maxlength="20"
				   </td>
				</tr>
				 <tr>
				   <td>
					   Religion
				   </td> 
				   <td>
					   <input type = "text" name = "index_religion" value="" size="20" maxlength="20"
				   </td>
				</tr>
			</table>
		</div>
	</div>
    
    
    <div>
        <h2><input type="Submit" value="Enviar"></h2>
	</div>
</div> 
    
</form>
        
<script src=''></script>
<script>var FormStuff = 
{
  
  init: function() 
          {
            this.applyConditionalRequired();
            this.bindUIActions();
          },
  
  bindUIActions: function() 
        {
            $("input[type='radio'], input[type='checkbox']").on("change", this.applyConditionalRequired);
        },
  
  applyConditionalRequired: function() 
        {
  	
            $(".require-if-active").each(function() {
              var el = $(this);
              if ($(el.data("require-pair")).is(":checked")) {
                el.prop("required", true);
              } else {
                el.prop("required", false);
              }
            });

        }
  
};

    FormStuff.init();
    //# sourceURL=pen.js
</script>
            
 <div class="footer">
         <h2>
            <?php include '../footer.php';?>
        </h2>
</div>       
</body>
</html>