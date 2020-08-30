const USAGE = "_usage";
const ignoreSheets = [USAGE, "Materials"]

const getSheetData = sheet => sheet.getDataRange().getValues()

function myFunction() {
  s = SpreadsheetApp.getActiveSpreadsheet()
  const usageSheetData = s.getSheetByName(USAGE)
  const allSheets = s.getSheets()
  const sheets = allSheets.filter(sheet => !ignoreSheets.includes(sheet.getName()))
  const allData = sheets.map(getSheetData)
  const sumData = Lib.sumSheets(allData)
  // Logger.log(sumData)
  usageSheetData.getRange(1, 1, sumData.length, 2).setValues(sumData)
}

function testStuff() {
  Logger.log(Lib.sumAllSheets(ignoreSheets))
}  