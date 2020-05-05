/* Current version 1::2020-04-23::prammitr::BIZINT-2745  First checkin for new clean-and-green dataset */
/* Table Updated -> OCIDWSTG.STOREKEEPER_ASSETS_STG */
function load_storekeeper_assets_stg(p_file_name in varchar2) return varchar2 is
  v_dt     date;
  v_file   bfile;
  v_cnt    integer;
begin
   v_dt   := get_date_from_file_name(p_file_name);
   v_file := BFILENAME('DW_STG_FILES','storekeeper/'||p_file_name);

   dwadmin.etl_support_pkg.mark_begin_load('OCIDWSTG','STOREKEEPER_ASSETS_STG',v_dt);

   delete from ocidwstg.storekeeper_assets_stg where weekday = trim(to_char(v_dt,'DAY'));

   insert into ocidwstg.storekeeper_assets_stg (
      dw_dataset_date, 
      part_no,
      type,
      platform,
      description,
      oracle_part_no,
      procurement_ready,
      serial_control,
      cpu_model,
      cores,
      clock_speed_mhz,
      memory_storage_type,
      size_bytes,
      storage_protocol,
      link_speed,
      link_unit,
      link_duplex,
      height,
      created_at_date,
      updated_at_date,
      dw_date_created  
   )
   select
      v_dt,    
      part_no,
      type,
      platform,
      description,
      oracle_part_no,
      procurement_ready,
      serial_control,
      cpu_model,
      cores,
      clock_speed_mhz,
      memory_storage_type,
      size_bytes,
      storage_protocol,
      link_speed,
      link_unit,
      link_duplex,
      height,
      to_timestamp_tz(created_at_date,'DD-MM-YYYY"T"HH24:MI:SS.FF"+00:00"') as created_at_date,
      to_timestamp_tz(updated_at_date,'DD-MM-YYYY"T"HH24:MI:SS.FF"+00:00"') as updated_at_date,
      sysdate as dw_date_created
    from
      JSON_TABLE(v_file,
        '$.data[*]' columns (
           part_no               varchar2(512)   path '$.Part_no'          error on error,
           type                  varchar2(512)   path '$.Type'       null on error,
           platform              varchar2(512)   path '$.Platform' null on error,
           description           varchar2(512)   path '$.Description'          null on error,
           oracle_part_no        varchar2(512)   path '$.Oracle_Part_No'          null on error,
           procurement_ready     varchar2(512)   path '$.Procurement_ready'          null on error,
           serial_control        varchar2(512)   path '$.Serial_Control'          null on error, 
           cpu_model             varchar2(512)   path '$.CPU_Model'          null on error, 
           cores                 varchar2(512)   path '$.Cores'          null on error, 
           clock_speed_mhz       varchar2(512)   path '$.Clock_Speed_Mhz'          null on error, 
           memory_storage_type   varchar2(512)   path '$.Memory_Storage_Type'          null on error,
           size_bytes            varchar2(512)   path '$.Size_Bytes'          null on error, 
           storage_protocol      varchar2(512)   path '$.Storage_Protocol'          null on error,
           link_speed            varchar2(512)   path '$.Link_Speed'          null on error,
           link_unit             varchar2(512)   path '$.Link_Unit'          null on error, 
           link_duplex           varchar2(512)   path '$.Link_Duplex'          null on error,
           height                varchar2(512)   path '$.Height'          null on error,
           created_at_date       varchar2(512)   path '$.Created_at_date'      null on error,
           updated_at_date       varchar2(512)   path '$.Updated_at_date'      null on error
        )
      )
      where part_no not like '%rows selected%';

    v_cnt := SQL%ROWCOUNT;

    return dwadmin.etl_support_pkg.mark_finish_load(v_cnt);

exception
  when others then
    rollback;
    raise;
end load_storekeeper_assets_stg;
/
