const USAGE = "_usage";
const ignoreSheets = [USAGE, "Materials"]
import './src/Util'

const normalizeStr = str => str.toLowerCase().replace(/ /g, '_')
const flatten = arr => arr.reduce((a, b) => [...a, ...b], [])
const indexArr = arr => Object.assign({}, arr)
const arrToObj = (obj, k) => ({ ...obj, [k]: [] })
const isEmptyArr = arr => arr.every(i => i)
const not = f => (x) => !f(x)


const getSheetData = sheet => sheet.getDataRange().getValues()
const getSheetAsObj = sheet => {
  const data = (getSheetData(sheet)).filter(not(isEmptyArr))
  const lookup = indexArr(data[0])
  const result = data[0].reduce(arrToObj, {})

  return data.slice(1).reduce((res, row) => {
    row.forEach((val, idx) => res[lookup[idx]].push(val))
    return res
  }, result)
}

function myFunction() {
  s = SpreadsheetApp.getActiveSpreadsheet()
  const usageSheetData = s.getSheetByName(USAGE)
  const allSheets = s.getSheets()
  const sheets = allSheets.filter(sheet => !ignoreSheets.includes(sheet.getName()))
  // Logger.log(JSON.stringify(sheets.map(getSheetData)))
  const allData = sheets.map(getSheetAsObj)
  Logger.log(allData)
}
