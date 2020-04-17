
String token = ";";

getToken(){
  token = "#EOF";
}

void expression(){
  if(
    (token == "=") ||
    (token == ">") ||
    (token == "<") ||
    (token == ">=") ||
    (token == "<=") ||
    (token == "!=")
  ){
    getToken();
    exprSimple();
  }
}

void exprSimple() {
  do{
    getToken();
    termino();
  } while(token == "+" || token == "-");
}

void termino(){
  factor();
  while(
    (token == "*" ) ||
    (token == "/" ) ||
    (token == "%" ) ||
    (token == "&" )
  ){
    getToken();
    factor();
  }
}

void factor(){
  switch (token) {
    case "ID": getToken(); break;
    case "NUM": getToken(); break;
    case "!": getToken(); factor(); break;
    default: throw "Invalid expression";
  }
}


void secuencia(){
  getToken();

  do{
    expression();
    while(token != ";"){
      //If not error in expression
      getToken();
    }
  } while (token != "#EOF");
}