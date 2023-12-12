function doGet(e) {
  switch (e.parameter.func) {
    case "addNewDay":
      addNewDay();
      break;
    case "givePresence":
      givePresence(e.parameter.register);
      break;
    case "countPresence":
      countPresence(e.parameter.register);
      break;
    case "addNewStudent":
      addNewStudent(e.parameter.register);
      break;
    default:
      return ContentService.createTextOutput("Funcao inexistente");
  }
}

function addNewDay() {
  var sheet = SpreadsheetApp.getActiveSpreadsheet().getActiveSheet();
  var firstEmptyCell = confirmDay(sheet);

  if ( firstEmptyCell == 0) return;

  var date = new Date();
  sheet.getRange(1,firstEmptyCell).setValue(formatarDataParaString(date));

  return "OK";
}

function givePresence(register) {
  var sheet = SpreadsheetApp.getActiveSpreadsheet().getActiveSheet();

  var row = getStudent(sheet, register);

  if( row != 0 ) { 
    var lastColumn = getLastColumn(sheet);
    sheet.getRange(row, lastColumn).setValue(0);
    return "Ok";
  }
  return "Registro não encontrado\nTente novamente";
}

function getLastColumn(sheet) {
  // Obtém os valores na linha especificada
  var row = sheet.getRange(1, 1, 1, sheet.getLastColumn()).getValues()[0];

  // Encontra a última coluna preenchida
  var lastColumn = row.lastIndexOf(row.filter(String).pop()) + 1;

  return lastColumn;
  //Logger.log("A última coluna preenchida na linha " + 1 + " é: " + las);
}

function countPresence(register) {
  var sheet = SpreadsheetApp.getActiveSpreadsheet().getActiveSheet();
  var student_row_position = getStudent(sheet, register);

  if(student_row_position == 0) return "Registro não encontrado\nTente novamente";

  var row = sheet.getRange(student_row_position, 1, 1, sheet.getLastColumn()).getValues()[0];

  var numOfSkip = 0;
  for( var element = 1; element < row.length; element++ ) {
    numOfSkip += row[element];
  }
  
}

function getStudent(sheet, register) {
  var column = sheet.getRange(1, 1, sheet.getLastRow(), 1).getValues();
  for( var row = 1; row < column.length; row++ ) {
    if( column[row][0] == register ) {
      return row+1
    }
  }
  return 0;
}

function addNewStudent(register) {
  var sheet = SpreadsheetApp.getActiveSpreadsheet().getActiveSheet();
  if( getStudent( sheet, register ) == 0 ) {
    var column = sheet.getRange(1, 1, sheet.getLastRow(), 1).getValues();

    //Logger.log(column);
    sheet.getRange(column.length+1, 1).setValue(register);
  }
  else {
    return "Matricula já se encontra presente na planilha";
  }
}

function confirmDay(sheet) {
  var row = sheet.getRange(1, 1, 1, sheet.getLastColumn()).getValues()[0];
  var date = new Date();
  date = formatarDataParaString(date);

  // Procura a primeira célula não vazia a partir da segunda célula (índice 1)
  for (var i = 1; i < row.length; i++) {
    Logger.log(row[i]);
    if(row[i] == '') {
      Logger.log("oi");
      return i+1;
    }
    var a = new Date(row[i]);
    a = formatarDataParaString(a);
    if (a == date) {
      // Encontrou uma data não vazia
      return 0;
    }
  }
  return row.length
}

function formatarDataParaString(data) {
  var dia = data.getDate();
  var mes = data.getMonth() + 1;  // Adiciona 1, pois os meses são baseados em zero
  var ano = data.getFullYear();

  // Formata a string no formato "dd/mm/yyyy"
  var dataFormatada = padLeft(dia) + '/' + padLeft(mes) + '/' + ano;

  return dataFormatada;
}

function padLeft(valor) {
  // Adiciona um zero à esquerda se o valor for menor que 10
  return valor < 10 ? '0' + valor : valor;
}

