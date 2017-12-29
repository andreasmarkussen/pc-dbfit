select max(lineno) from trace_text;select * from trace_text order by lineno desc;

select count(lineno),trace_name from trace_text group by trace_name;

select * from trace_text where lineno > 3008050 and current_program like 'FDK%' order by lineno desc;

select uf80_lov_filter() from  dual;

select * from trace_text order by lineno desc;
select distinct(trace_name) from trace_text where timestamp<sysdate-1/24;

select * from tia_log order by timestamp desc

select * from trace_text where trace_name = :p_trace_name order by lineno desc;

select * from trace_text where trace_name = :p_trace_name 
and current_program like '%NO0%'
order by lineno desc;





select trunc(timestamp),trace_text.* from trace_text order by lineno desc;  

select trunc(timestamp),trace_text.* from trace_text where trunc(timestamp) = SYSDATE  order by lineno desc;  

where lineno - 100 > max(lineno);

SELECT index_name , column_position , column_name FROM user_ind_columns WHERE table_name = 'TRACE_TEXT' ORDER BY index_name, column_order

select * from trace_text where TRACE_NAME = 'S%FOSS%';-- and current_program not like 't8020%' order by lineno desc;  
rollback;
select to_char(timestamp,'dd-mon-yy'),count(1) from trace_text group by to_char(timestamp,'dd-mon-yy')
 order by 1 desc;  

select TRACE_NAME ,count(1) from trace_text group by TRACE_NAME
 order by 1 desc; 

select TRACE_NAME,to_char(timestamp,'dd-mon-yy'),count(1) from trace_text group by TRACE_NAME,to_char(timestamp,'dd-mon-yy')
 order by 1 desc;  


delete from trace_text where trace_name='N/A';
commit;

delete from trace_text where trace_name='BABABA';
commit;

delete from trace_text where trace_name like 'STJ_FOSS%';
commit;


select * from YDK_DMR_VEHICLE_MSG where case_item_request_id is not null and vehicle_reg_no = '1414' 
select * from YDK_DMR_VEHICLE_MSG where policy_no = 88641

569320

select * from case_item where user_comm like '%bevisnummer%' order by timestamp;

select * from case_item order by timestamp;

select * from all_source where owner = 'TIA' and name like 'BDK%' and text like '%Unknown service%'

select * from YDK_DMR_VEHICLE_MSG where case_item_request_id is not null order by timestamp desc;

BDK19
