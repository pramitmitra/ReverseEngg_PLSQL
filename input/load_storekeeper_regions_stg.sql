function load_storekeeper_regions_stg(p_file_name in varchar2) return varchar2 is
  v_dt     date;
  v_file   bfile;
  v_cnt    integer;
begin
   v_dt   := get_date_from_file_name(p_file_name);
   v_file := BFILENAME('DW_STG_FILES','storekeeper/'||p_file_name);

   dwadmin.etl_support_pkg.mark_begin_load('OCIDWSTG','STOREKEEPER_REGIONS_STG',v_dt);

   delete from ocidwstg.storekeeper_regions_stg where weekday = trim(to_char(v_dt,'DAY'));

   insert into ocidwstg.storekeeper_regions_stg (
      dw_dataset_date,    
      region_name,
      canonical_name,
      canonical_short_code,
      created_at_date,
      updated_at_date,
      description,
      dw_date_created
   )
   select
      v_dt,    
      region_name,
      canonical_name,
      canonical_short_code,
      to_timestamp_tz(created_at_date,'DD-MM-YYYY"T"HH24:MI:SS.FF"+00:00"') as created_at_date,
      to_timestamp_tz(updated_at_date,'DD-MM-YYYY"T"HH24:MI:SS.FF"+00:00"') as updated_at_date,
      description,
      sysdate as dw_date_created
    from
      JSON_TABLE(v_file,
        '$.data[*]' columns (
           region_name               varchar2(512)   path '$.Region_name'          error on error,
           canonical_name            varchar2(512)   path '$.Canonical_name'       error on error,
           canonical_short_code      varchar2(512)   path '$.Canonical_short_code' error on error,
           description               varchar2(512)   path '$.Description'          error on error,
           created_at_date           varchar2(512)   path '$.Created_at_date'      error on error,
           updated_at_date           varchar2(512)   path '$.Updated_at_date'      error on error
        )
      )
      where region_name not like '%rows selected%';

    v_cnt := SQL%ROWCOUNT;

    return dwadmin.etl_support_pkg.mark_finish_load(v_cnt);

exception
  when others then
    rollback;
    raise;
end load_storekeeper_regions_stg;
