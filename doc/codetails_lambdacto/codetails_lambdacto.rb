# encoding: utf-8
center <<-EOS
  ┌────────────────────────────┐
  │ \e[1m The Cocktail's Lambdacto \e[0m │
  └────────────────────────────┘
  a simple
  contact form
  implemented
  with an
  AWS Lambda



  nando @colgado_es
  © The Cocktail Codetails 2016
EOS

block <<-EOS
  ────────────────────────────────────
   1.- Mira mamá, ¡sin servidor!__g+3
   2.- AWS Lambda________________g+16
   3.- AWS API Gateway___________g+29
   4.- AWS S3____________________g+42
   5.- Aprendiendo CORS__________g+45
   6.- The Cocktail's Lambdacto__g+50
  ────────────────────────────────────
EOS

section "\e[1m‟Mira mamá, ¡sin servidor!″\e[0m" do

block <<-EOS
  \e[1mAmazon Web Services\e[0m (AWS):

    * \e[1mS3\e[0m

    * \e[1mAPI Gateway\e[0m

    * \e[1mLambda\e[0m

    * \e[1mSES\e[0m (Simple Email Service)
EOS

center <<-EOS
\e[1mAcceso a la Consola de AWS\e[0m
────────────────────────────
http://\e[1mtcesistemas\e[0m.signin.aws.
       amazon.com/console

IAM User
\e[1m lambda_deploy \e[0m
(en Desarrollo.kbdx)
EOS


center <<-EOS
 (antes de empezar)

 \e[1mDISCLAIMER IMPORTANTE\e[0m
────────────────────────────
 posiblemente
 \e[1mes todavía más simple\e[0m
 porque...
EOS

center <<-EOS
  he llegado a su CLI

  (aws lambda \e[1mhelp\e[0m)

  la semana pasada...

  \e[1m¡después de hacerla!\e[0m

  Y además porque...
EOS

center <<-EOS
\e[1mLambda que nace para TCV...\e[0m
─────────────────────────────

  http://github.com/the-cocktail/
  \e[1m the-cocktail-ventures.git\e[0m
EOS

center <<-EOS
\e[1m...que después se independiza.\e[0m
────────────────────────────────

  http://github.com/the-cocktail/
  \e[1m new-contact-lambda.git \e[0m
EOS

center <<-EOS
  puede que queden
  \e[1mcosas por cambiar\e[0m...
EOS

center <<-EOS
  ...e incluso...

  \e[1m¡QUE SEA CORRECTO!\e[0m
EOS

center <<-EOS
  \e[1m“Lo genérico es un fraude”\e[0m
  Juan Lupión
EOS

block <<-EOS
  \e[1m          Recursos S3 \e[0m
  ──────────────────────────────────
  Bucket:
   *\e[1m the-cocktail-new-contact-lambda\e[0m 

  Files:
   *\e[1m /index.html \e[0m 
   *\e[1m /javascripts/lambdacto.js \e[0m
EOS

block <<-EOS
  \e[1m       API Gateway \e[0m
  ────────────────────────────────
   API:
    * \e[1mThe Cocktail Experience API\e[0m

   Resource:
    * \e[1mPOST /contacts\e[0m
EOS

block <<-EOS
  \e[1m       AWS Lambda \e[0m
  ────────────────────────────────
   Función:
    * \e[1mTheCocktailNewContact\e[0m

   Runtime:
    * \e[1mNode.js 4.3\e[0m
EOS
end

section "*\e[1m AWS Lambda \e[0m*" do
  center <<-EOS
    Based in
    \e[1mStephen Crosby\e[0m's
    lambda example

    (lithostech.com)

    \e[1mThanks Steve!\e[0m
  EOS
  block <<-EOS
    \e[1mCreate a Lambda Function\e[0m...
    ───────────────────────────────────
    - Runtime:\e[1m Node 4.3\e[0m
    - Role:\e[1m lambda_tck_ventures_role\e[0m
                   \e[1m ||\e[0m
                   \e[1m \\/\e[0m
                \e[1mBasic + SES \e[0m
    - Memory limit: \e[1m128Mb\e[0m (mínimo)
    - Timeout: \e[1m30 sec.\e[0m
  EOS

  block <<-EOS
    - Code:
      \e[1m the_cocktail_new_contact\e[0m.zip
    - Handler:
      \e[1m the_cocktail_new_contact\e[0m.handler
                   \e[1m ||\e[0m
                   \e[1m \\/\e[0m
       exports\e[1m.handler\e[0m = \e[1mfunction\e[0m(e, c) {...}
      (\e[1mthe_cocktail_new_contact.js\e[0m)

  EOS

  block <<-EOS
     \e[1mthe_cocktail_new_contact.zip\e[0m
    ───────────────────────────────────────────
     * dentro de la carpeta \e[1mlambda\e[0m
     * con el contenido de su subcarpeta
         \e[1mthe_cocktail_new_contact\e[0m

        \e[1m/ (raíz)
        ├ public/
        ├ lambda/
        │  ├ the_cocktail_new_contact.zip
        │  ├ the_cocktail_new_contact/
        │  └ tests/
        └ tmp/\e[0m
  EOS

  block <<-EOS
     \e[1mthe_cocktail_new_contact.zip\e[0m
    ───────────────────────────────────────────
    *\e[1m the_cocktail_new_contact.js\e[0m
       exports.handler = function(e, c) {...}
    *\e[1m utils.js\e[0m
       validateEmail: function(email) {...}
    *\e[1m conf.js\e[0m
       domains: {
         'thecocktailventures.com': {
           emailAddress: "ear@the-cocktail.com",
           emailSubject: "Nuevo contacto en TCV"
         }, [...] }
  EOS

  block <<-EOS
     \e[1mDespliegue nueva versión\e[0m 
    ───────────────────────────────────────────
      * Generar zip
      * Subirlo
      * Testar lambda
  EOS

  block <<-EOS
    \e[1mGenerar zip\e[0m
    ───────────────────────────────────────────
    $ \e[1mcd lambda/the_cocktail_new_contact\e[0m
    $ \e[1mzip -r ../the_cocktail_new_contact.zip *\e[0m
    updating: conf.js (deflated 50%)
    updating: the_cocktail_new_contact.js (...)
    updating: utils.js (deflated 49%)
    $
  EOS

  code <<-EOS
    \e[1mDesplegar nueva lambda\e[0m
    ───────────────────────────────────────────
    $ aws lambda \e[1mupdate-function-code\e[0m \\
    > --function-name \e[1mTheCocktailNewContact\e[0m \\
    > --zip-file \e[1mfileb://the_cocktail_new_contact.zip\e[0m
    {
      "CodeSha256": "yz6w4qRDe[...]9eIWix1Rc=", 
      "FunctionName": "TheCocktailNewContact",
      [...]
      "Runtime": "nodejs4.3",
      "CodeSize": 1765
    }
    $
  EOS

  block <<-EOS
    \e[1mTestar lambda\e[0m
    ───────────────────────────────────────────
     \e[1mtest/succeded/basic.json\e[0m:

       {
         "domain": "the-cocktail.com",
         "name": "Probando Nueva Lambda",
         [...]
         "message": "Disculpa las molestias"
       }
  EOS

  code <<-EOS
    $ aws lambda \e[1minvoke\e[0m \\
    > --function-name \e[1mTheCocktailNewContact\e[0m \\
    > --payload file://tests/succeeded/\e[1mbasic.json\e[0m \\
    > tmp/\e[1mbasic.output\e[0m
    {
      "FunctionError": "Handled", 
      "StatusCode": 200
    }
    $ cat \e[1mbasic.output
    0\e[0m
  EOS

  code <<-EOS
    $ aws lambda \e[1minvoke\e[0m \\
    > --function-name \e[1mTheCocktailNewContact\e[0m
    > --payload file://tests/failed/\e[1memail_empty.json\e[0m
    > tmp/\e[1memail_empty.output\e[0m
    {
      "FunctionError": "Handled", 
      "StatusCode": 200
    }
    $ cat \e[1memail_empty.output\e[0m
    {"errorMessage":"\e[1memail: empty\e[0m"}
  EOS

  block <<-EOS
     \e[1mmuchas ganas de hacer un script... :)\e[0m
    ───────────────────────────────────────────
      \e[1m├ lambda/tests/
      │  ├ succeeded/
      │  │  ├ basic.json
      │  │  └ with_cc.json
      │  └ failed/
      │     ├ domain_empty.json
      │     ├ domain_not_found.json
      │     ├ email_empty.json 
      │     ├ email_format.json
      │     └ message_empty.json\e[0m
  EOS
end

section "* \e[1mAWS API Gateway\e[0m *" do
  center "\e[1mThe Cocktail Experience API \e[0m"

  center "\e[1mREST\e[0m API"
  
  block <<-EOS
   ──────────────────────────────────────────
   * Resources: \e[1m/contacts\e[0m (por ahora)
   * Stages: \e[1mprod\e[0m => AMImage que desplegamos
   ──────────────────────────────────────────
                   \e[1m ||\e[0m
                   \e[1m \\/\e[0m
  ┌──────────────────────────────────────────┐
  │ https://6b0gd8a1h0.execute-api.eu-west-1.│
  │        amazonaws.com/\e[1mprod\e[0m/\e[1mcontacts\e[0m       │
  └──────────────────────────────────────────┘
  EOS

  block <<-EOS
    \e[1mPOST\e[0m /contacts
    Content-Type: application/json
    {
      "domain": "the-cocktail.com",
      "name": "Probando Lambda API",
      [...]
      "message": "Disculpa las molestias"
    }
  EOS

  block <<-EOS
    \e[1mPOST\e[0m /contacts
    ──────────────────────────────────
    \e[1mCLIENT\e[0m
      Method Request
        Integration Request
          TheCocktailNewContact \e[1mlambda\e[0m
        Integration Response
      Method Response
    \e[1mCLIENT\e[0m
  EOS

  block <<-EOS
    \e[1mMethod Request\e[0m
    ──────────────────────────────────
     \e[1m* Autorización\e[0m
     \e[1m* Query String Parameters\e[0m
     \e[1m* HTTP Request Headers\e[0m
     * Request Models \e[1m¿¿¿???\e[0m
  EOS

  block <<-EOS
    \e[1mIntegration Request\e[0m
    ─────────────────────────────────────
     * Integration type (\e[1mLambda Function\e[0m)
     * Lambda Region (\e[1meu-west-1\e[0m)
     * \e[1mLambda Function\e[0m
     * Body \e[1mMapping Templates\e[0m
  EOS

  block <<-EOS
    \e[1mIntegration Response\e[0m
    ─────────────────────────────────────
     * Map the possible response RegExps
         to Method Responses:

          \e[1m/.+errorMessage.+/ => 422 \e[1m
  EOS

  block <<-EOS
    \e[1mMethod Response\e[0m
    ─────────────────────────────────────
     * HTTP Status Codes:
       - \e[1m200\e[0m (OK)
       - \e[1m422\e[0m (Unprocessable Entity)
     * Response Models... \e[1mempty\e[0m
  EOS

  center <<-EOS
    "Botón '\e[1mActions\e[0m'"
  EOS

  code <<-EOS
    \e[1mResource\e[0m Actions
    ────────────────────
     * Create Method
     * Create Resource
     * Enable \e[1mCORS\e[0m
  EOS

  code <<-EOS
    \e[1mAPI\e[0m Actions\e
    ──────────────────────────────────
     * \e[1mDeploy\e[0m API => Deployment stage (prod)
     * Import API
     * Delete API
  EOS
end

section "* \e[1mAWS S3\e[0m *" do
  block <<-EOS
    * Bucket con \e[1mHTML/JS\e[0m
  EOS

  block <<-EOS
    $ \e[1maws s3 sync\e[0m --acl public-read \e[1mpublic\e[0m \\
    > s3://\e[1mthe-cocktail-new-contact-lambda\e[0m
    upload: public/javascript/lambdacto.js to s3://...
    upload: public/index.html to s3://the-cocktail-...
    $
  EOS
end

section "* \e[1mAprendiendo CORS\e[0m *" do
  block <<-EOS
    * \e[1mNo entendía bien\e[0m CORS
    * Es mi principal peligro ahora
      (parece que sé de lo que hablo)
    * Si no hubiera tocado nada...
         \e[1m¡¡¡HABRÍA FUNCIONADO!!!\e[0m
  EOS

  center <<-EOS
    No vamos a perder mucho tiempo
    (quien no sepa
     cómo funciona
     \e[1mque me lo diga\e[0m)
  EOS

  center <<-EOS
    La cabecera
    \e[1mAccess-Control-Allow-Origin\e[0m
    dice al navegador qué
    "origen" tiene permitido
    gargar nuestra página
    \e[1mdesde su JavaScript\e[0m
  EOS

  center <<-EOS
    Mejor \e[1mNO\e[0m explicar
    lo que yo entendía \e[1m:D\e[0m
  EOS
end

section "* \e[1mThe Cocktail's Lambdacto\e[0m *" do
  block <<-EOS
    \e[1mindex.html\e[0m
    ──────────────────────────────────
     <form id="\e[1mcontact-form\e[0m">
       [...]
       <input type="text" name="name" />
       <textarea name="message"></textarea>
       [...]
     </form>
  EOS

  block <<-EOS
    \e[1mindex.html\e[0m's #contact-form
    ──────────────────────────────────
     [...]
     <select name="\e[1mdomain\e[0m">
       <option>the-cocktail.com</option>
       <option>thecocktailventures.com</option>
     </select>
     [...]
  EOS

  block <<-EOS
    \e[1mindex.html\e[0m's #contact-form
    ──────────────────────────────────
     [...]
     <input type="checkbox" name="\e[1mcc\e[0m" value="1" />
     <label>Quiero recibir una copia</label>
     [...]
  EOS

  block <<-EOS
    \e[1mjavascript/lambdacto.js\e[0m
    ──────────────────────────────────
     * jQuery
     * Extraído de the-cocktail-ventures
     * Nos manda también "domain":
  EOS

  block <<-EOS
    \e[1mjavascript/lambdacto.js\e[0m
    ───────────────────────────────────────────────
     $.fn.\e[1mserializeFormJSON\e[0m = function () {...}
     $('\e[1m#contact-form\e[0m').on('submit', function(e) {
       var \e[1mcontact\e[0m = $(this).serializeFormJSON();
       $.\e[1mpost\e[0m( "https://[...]\e[1m/prod/contacts\e[0m",
               contact ).\e[1mdone\e[0m( function(data) {
         [...]
       }).fail( function(data) {
         [...]
       }).always( function() {[...]} ) });
  EOS

  block <<-EOS
    \e[1mjavascript/lambdacto.js'\e[0m .post.done
    ───────────────────────────────────────────────
     function(data) {
       if( \e[1mdata == 0\e[0m )
         $result.text('Formulario enviado.');
       else
         $result.text('error: ' +
                      \e[1mdata.errorMessage\e[0m);
     }
  EOS
end

section "\e[1mDedicatoria\e[0m" do
  block <<-EOS
    Complicada esta vez tirando
    de \e[1mByeByeDrome\e[0m:
       \e[1m
       Abel...
          Kike...
             Álvaro...
                Roberto...\e[0m
  EOS

  center <<-EOS
    Buen momento para cambiar...

    \e[1m¡al pedalódromo!\e[0m

   (para dedicatorias)
  EOS


  block <<-EOS
                                               
                   #;;;;;;;;;;;+               
                   +:::::::::::'               
             `;;;;;;;::::::::::+;;;;;@         
             `;;;;;;;::::::::::+;;;;;@         
             `;;;;;;.  :::::#  +;;;;;@  @      
        ```  `;;;;;;,  :::::#  +;;;;;@  @```   
        :::  `######.  :::::#  #######  @::@   
        :::            :::::#           @::@   
        :::            :::::#           @::@   
        :::;;'      ';;:::::;;;;     @;;;::@   
     @@@:::::;      ;::::::::::;     @:::::@@@'
     ;::::::::::::::::::::::::::::::::::::::::'
     ;::::::::::::::::::::::::::::::::::::::::'
     ;::::::::::::::::::::::::::::::::::::::::'
     ;::::::::::::::::::::::::::::::::::::::::'
     ;::::::::::::::::::::::::::::::::::::::::'
     ;::::::::::::::::::::::::::::::::::::::::'
     ;::::::::::::::::::::::::::::::::::::::::'
     ;::::::::::::::::::::::::::::::::::::::::'
     ;:::::@@@:::::::::@@@@@@::::::::@@@::::::'
     ;:::::@ `:::::::::     @::::::::@  ::::::'
     ;::@@@@ `@@@::::::     @:::::#@@@  @@@:::'
     ;::@       :::::::     @:::::#       `:::'
     ''''       ,''''''     '''''''       `''':
             ¡ ¡ ¡   G R A C I A S   ! ! !
  EOS
  
end
# Copyright 2016 The Cocktail Experience, S.L.
