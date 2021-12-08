<cfset obj = createObject("component","action/components/storedProcedures")>
<cfparam name="form.quantity" default="1">
<cfparam name="session.uuid" default=null>
<cfparam name="form.colorId" default=null>
<cfset variables.filteredQuery=obj.productPage(form.colorId)> 
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title><cfoutput>#variables.filteredQuery.PRODUCTNAME#</cfoutput></title>
        <link rel="icon"  href="./img/mainLogo.png">
        <link rel="stylesheet" type="text/css" href="./css/listingPage.css">
    </head>
    <body>
        <cfoutput>
            <div class="header">
                <div class="header-left">
                    <img src="./img/mainLogo.png" alt="mainLogo">
                    <a href="./shoppingcart.cfm"><p>ONLINE PEEDIKA</p></a>
                </div>
                <div class="header-right">
                    <img src="./img/cartLogo.png" alt="cartLogo">
                    <a href="./cart.cfm"><h6>CART</h6></a>
                    <form action="./action/components/storedProcedures.cfc?method=logout" method="post">
                        <input type="submit" name="logout" value="LOGOUT" class="logoutBtn">
                    </form>
                </div>
            </div>
            <form action = "./action/components/storedProcedures.cfc?method=productPageAction" method ="POST">
                <div class="main-body flex">
                    <div class="left-body ">
                        <cfloop query="variables.filteredQuery" >
                            <div class="productImage">
                                <img src="./photos/#imageLocation#.jpg" height="100px">
                            </div>
                        </cfloop>
                    </div>
                    <div class="right-body">
                        <div class="right-bodyCol ">
                            <div class="productDetails flex">
                                <div class="productImg">
                                    <img src="./photos/#variables.filteredQuery.imageLocation#.jpg" class="productImage" height=60px>
                                    <input type="hidden" name="imageId" value="#variables.filteredQuery.imageLocation#">
                                </div>
                                <div class="productDesc">
                                    <p class="productHead">
                                        #variables.filteredQuery.brandname# #variables.filteredQuery.PRODUCTNAME# (#variables.filteredQuery.colorName#,#variables.filteredQuery.INTERNALSTORAGE# GB ) (#variables.filteredQuery.RAM#GB RAM)
                                    </p>
                                    <div class="productDescription flex">
                                        <div>
                                            <cfif variables.filteredQuery.rating NEQ '' >
                                                <div>
                                                    <input type="button" value="#variables.filteredQuery.rating#" class="productRating">
                                                </div>
                                            </cfif>
                                        </div>
                                        <div class="productDescLineCol">
                                            <p class="productDescLine">- Processor : #variables.filteredQuery.processor#</p>
                                            <p class="productDescLine">- Display: #variables.filteredQuery.display#</p>
                                            <p class="productDescLine">- RAM : #variables.filteredQuery.ram#</p>
                                            <p class="productDescLine">- Battery #variables.filteredQuery.Battery#</p>
                                            <p class="productDescLine">- #variables.filteredQuery.rearCamera# Rear Camera and #variables.filteredQuery.frontCamera# FrontCamera</p>
                                        </div>
                                        <div>
                                            <p class="priceDet">₹#variables.filteredQuery.PRODUCTPRICE#</p>
                                        </div>
                                    </div>
                                    <div class="offerDetails">
                                        <p class="offerDet">Bank Offer #variables.filteredQuery.discountrate#% Unlimited Cashback on Flipkart Axis Bank Credit CardT&C</p> 
                                    </div>
                                </div>
                            </div>                   
                            <div class="quantityContainer">
                                <label for="quantity">Quantity</label>
                                <input type="number" name="quantity" value="1" max="#variables.filteredQuery.productCount#"  min="1" class="quantity" >
                            </div>
                            <input type="hidden" name="colorId" value="#form.colorId#">
                            <input type="submit" name="buynow" value="BUY NOW" class="transactionButton transactionButtonclass">
                            <input type="submit" name="addtocart" value="ADD TO CART" class="transactionButton">
                        </div>
                    </div>
                </div>
            </form>
        </cfoutput>
    </body>
</html>