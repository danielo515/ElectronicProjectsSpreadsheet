const USAGE = "_usage";
const ignoreSheets = [USAGE, "Materials"]

const isEmptyArr = arr => arr.every(i => i)
const not = f => (x) => !f(x)

const getSheetData = sheet => sheet.getDataRange().getValues()

function myFunction() {
  s = SpreadsheetApp.getActiveSpreadsheet()
  const usageSheetData = s.getSheetByName(USAGE)
  const allSheets = s.getSheets()
  const sheets = allSheets.filter(sheet => !ignoreSheets.includes(sheet.getName()))
  const allData = sheets.map(getSheetData)
  const sumData = Util.sumSheets(allData)
  // Logger.log(sumData)
  usageSheetData.getRange(1, 1, sumData.length, 2).setValues(sumData)
}
