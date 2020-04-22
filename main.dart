
String token = "";
String input = "3+4*6-8;";
int pos = 0;

getToken(){
  if(pos < input.length){
    token = input[pos];
  } else {
    token = "#EOF";
  }

  pos++;
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
      print(token);
      getToken();
    }
  } while (token != "#EOF");

  print(token);
}


void main(){
  print('Input: ${input}');
  secuencia();
}