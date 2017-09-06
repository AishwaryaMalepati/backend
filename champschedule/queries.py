from django.db import connection


def perdiem_raw_query(self):
    #raw sql query here

    query = "Select employee_id, avg(case when pd_month = 'Jan-Mar' then pd_days end) as days_JantoMar,avg(case when pd_month = 'Jan-Mar' then pd_amount end) as JantoMar,avg(case when pd_month = 'Mar-Apr' then pd_days end) as days_MartoApr,avg(case when pd_month = 'Mar-Apr' then pd_amount end) as MartoApr,avg(case when pd_month = 'Apr-May' then pd_days end) as days_AprtoMay,avg(case when pd_month = 'Apr-May' then pd_amount end) as AprtoMay,avg(case when pd_month = 'May-Jun' then pd_days end) as days_MaytoJun,avg(case when pd_month = 'May-Jun' then pd_amount end) as MaytoJun,avg(case when pd_month = 'Jun-Jul' then pd_days end) as days_JuntoJul,avg(case when pd_month = 'Jun-Jul' then pd_amount end) as JuntoJul,avg(case when pd_month = 'Jul-Aug' then pd_days end) as days_JultoAug,avg(case when pd_month = 'Jul-Aug' then pd_amount end) as JultoAug,avg(case when pd_month = 'Aug-Sep' then pd_days end) as days_AugtoSep,avg(case when pd_month = 'Aug-Sep' then pd_amount end) as AugtoSep,avg(case when pd_month = 'Sep-Oct' then pd_days end) as days_SeptoOct,avg(case when pd_month = 'Sep-Oct' then pd_amount end) as SeptoOct,avg(case when pd_month = 'Oct-Nov' then pd_days end) as days_OcttoNov,avg(case when pd_month = 'Oct-Nov' then pd_amount end) as OcttoNovfrom(select *, pd_days*35 as pd_amount from(SELECT employee_id,pd_month, SUM(days) as pd_days from (select *, case when (min_end::date - max_start::date)+1 > 0then (min_end::date - max_start::date)+1ELSE 0 END as days from (select *,case when pd_start > start then pd_startelse startEND as max_start,case when pd_end < end then pd_end else end END as min_end from (select employee_id, start, end,location_id, pd_start,pd_end,pd_month from champschedule_eventdetailcross JOIN champschedule_perdiemrange)t)t1)t2 group by employee_id,pd_month)t3)t4 group by employee_id"

    # a cursor object
    with connection.cursor() as cursor:
        # execute the query
        cursor.execute(query)
        # get all the rows as a list
        rows = cursor.fetchall()
    return rows
