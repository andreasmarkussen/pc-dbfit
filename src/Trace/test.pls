/* GOAL - this must be posible to add to ANY TIA version from 6.0 and forwards
   Perhaps with version dependent code, but the concept should the same. */
set SERVEROUTPUT ON;
CREATE OR REPLACE PACKAGE TRACE_UTIL 
IS 
   g_current_program varchar2(100);
   g_parrent_program varchar2(100);   
   PROCEDURE z_program_start; 
   PROCEDURE z_program_end; 
END; 
/
CREATE OR REPLACE PACKAGE BODY TRACE_UTIL  
IS  
   PROCEDURE z_program_start  
   IS 
     v_owner      varchar2(100);
     v_name       varchar2(200);
     v_lineno     number;
     v_caller_t   varchar2(200);
   BEGIN  
      -- consider not doing anything if trace is disabled. 
      owa_util.who_called_me(v_owner,v_name,v_lineno,v_caller_t);
      DBMS_OUTPUT.put_line (' PackageName ($$psql_unit) ' || $$plsql_unit || ' - line ' || $$plsql_line );  
      DBMS_OUTPUT.put_line ('who_called_me ' 
       || 'owner ' || v_owner || ' | '
       || 'v_name ' || v_name || ' | '
       || 'v_lineno ' || v_lineno || ' | '
       || 'v_caller_type ' || v_caller_t );
      p0000.program := v_name;
      TRACE_UTIL.g_parrent_program := TRACE_UTIL.g_current_program;      
      TRACE_UTIL.g_current_program := v_name;
   END;  
   
   PROCEDURE z_program_end
   IS 
     v_owner      varchar2(100);
     v_name       varchar2(200);
     v_lineno     number;
     v_caller_t   varchar2(200);
   BEGIN  
      owa_util.who_called_me(v_owner,v_name,v_lineno,v_caller_t);
      DBMS_OUTPUT.put_line (' PackageName ($$psql_unit) ' || $$plsql_unit || ' - line ' || $$plsql_line );  
      DBMS_OUTPUT.put_line ('who_called_me ' 
       || 'owner ' || v_owner || ' | '
       || 'v_name ' || v_name || ' | '
       || 'v_lineno ' || v_lineno || ' | '
       || 'v_caller_type ' || v_caller_t );
      TRACE_UTIL.g_current_program := TRACE_UTIL.g_parrent_program;
      z_program(TRACE_UTIL.g_current_program);
   END;       
END; 
/

CREATE OR REPLACE PROCEDURE business_function  
IS  
BEGIN  
   TRACE_UTIL.z_program_start;
   DBMS_OUTPUT.put_line ('Program Unit = ' || $$plsql_unit);  
   TRACE_UTIL.z_program_end;
END; 
/

procedure test_v7_standard(p_parameter number) is
  w_program  p0000.program%type := p0000.program;
begin
  z_program('B1234.test'); --it just sets p0000.program to the parameter
  z_trace('Start');
  z_trace('parameter is :' || p_parameter);
--Do magic code
  z_trace('End');
  z_program(w_program);
exception
  when others then
    z_error_handle; --or "z_error;" in old code since it will just call z_error_handle
end test;

procedure test_v7_new(p_parameter number) is
  w_program  p0000.program%type := p0000.program;
begin
  z_program('B1234.test'); --it just sets p0000.program to the parameter
  z_trace('Start');
  z_trace('parameter is :' || p_parameter);
--Do magic code
  z_trace('End');
  z_program(w_program);
exception
  when others then
    z_error_handle; --or "z_error;" in old code since it will just call z_error_handle
end test;


begin 
   -- Block to call tia business package in e.g. B6000 or similar
   DBMS_OUTPUT.put_line ('-------------------------' );
   business_function;
end;
/