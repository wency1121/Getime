
; getting time index of a variable -- daily data
; Input variables: startYear(yyyy), endYear(yyyy),datemin(mmdd),(mmdd),time
; time is the f->time
; Output variable: date_ind
; date_ind: indexes of the dates you need

undef("getimed")
function getimed(startYear,endYear,datemin,datemax,time)
begin
  list_of_files = systemfunc("ls /disk1/data/NCEP/ncep.reanalysis.dailyavgs/pressure/vwnd*.nc")
  f             = addfiles(list_of_files,"r")
  timea         = f[:]->time
  YYYY          = cd_calendar(timea, 1)/100
  iYYYY         = ind(YYYY.ge.startYear.and.YYYY.le.(endYear+1))
  timeY         = timea(iYYYY)
  dates         = cd_calendar(timeY, 2)-toint(cd_calendar(timeY, 2)/10000)*10000
  dates_ind     = ind(dates.ge.datemin.and.dates.le.datemax)
  timeYD        = timeY(dates_ind)
  index         = cd_calendar(timeYD, 2)

  t=cd_calendar(time, 2)
  date_ind=get1Dindex(t, index)

  return(date_ind)

end

