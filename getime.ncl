
; getting the time index of a variable -- monthly data
; Input variables: startYear(yyyy), endYear(yyyy),monmin(mm),monmax(mm),time
; time is the f->time
; Output variable: mon_ind
; mon_ind: indexes of the months you need

undef("getime")
function getime(startYear,endYear,monmin,monmax,time)
begin
  if monmin.eq.monmax then
    years=ispan(startYear,endYear,1)
    index=years*100+monmin
  else
    monn=monmax-monmin+1
    mons=ispan(monmin,monmax,1)
    Num=endYear-startYear

    index=new((/Num+1,monn/),"integer")
    do i=0,Num
       Temp=(i+startYear)*100
       Tind=Temp+mons
       index(i,:)=Tind
    end do
  end if
  
  t=cd_calendar(time, 1)
  mon_ind=get1Dindex(t,ndtooned(index))
  return(mon_ind)
end

