/* New version 1.1::2020-04-20::prammitr::BIZINT-2745  Additional checkins for new clean-and-green stage dataset */
/* Table Updated -> OCIDWSTG.STOREKEEPER_LOCATION_STG */
function load_storekeeper_location_stg(p_file_name in varchar2) return varchar2 is
  v_dt     date;
  v_file   bfile;
  v_cnt    integer;
begin
   v_dt   := get_date_from_file_name(p_file_name);
   v_file := BFILENAME('DW_STG_FILES','storekeeper/'||p_file_name);

   dwadmin.etl_support_pkg.mark_begin_load('OCIDWSTG','OCIDWSTG.STOREKEEPER_LOCATION_STG',v_dt);

   delete from OCIDWSTG.STOREKEEPER_LOCATION_STG where weekday = trim(to_char(v_dt,'DAY'));

   insert into OCIDWSTG.STOREKEEPER_LOCATION_STG (
      dw_dataset_date, 
      region_name, 
      ad_name, 
      building_name, 
      room_name, 
      room_power_kw, 
      row_name, 
      block_name, 
      block_network_ports, 
      rack_number, 
      pod_number,
      pdu_panel_a, 
      pdu_a_room_name, 
      pdu_panel_b, 
      pdu_b_room_name, 
      pdu_panel_c, 
      pdu_c_room_name, 
      pdu_panel_d, 
      pdu_d_room_name, 
      power_status, 
      power_status_updated_at, 
      infrastructure_status, 
      infra_status_updated_at, 
      activation_status, 
      activation_status_updated_at, 
      reservation_status, 
      reservation_time, 
      ticket_id, 
      platform, 
      serial_no, 
      actual_serial_no, 
      power_allocation, 
      network_ports_allocation, 
      stranded, 
      stranded_reasons, 
      stranded_updated_at, 
      comments, 
      whips_count, 
      kva_raiting, 
      region_canonical_name, 
      ad_canonical_short_code, 
      building_canonical_name, 
      room_canonical_name,
      created_at_date,
      updated_at_date,
      dw_date_created
   )
   select
      v_dt,
      region_name, 
      ad_name, 
      building_name, 
      room_name, 
      room_power_kw, 
      row_name, 
      block_name, 
      block_network_ports, 
      rack_number, 
      pod_number,
      pdu_panel_a, 
      pdu_a_room_name, 
      pdu_panel_b, 
      pdu_b_room_name, 
      pdu_panel_c, 
      pdu_c_room_name, 
      pdu_panel_d, 
      pdu_d_room_name, 
      power_status, 
      power_status_updated_at, 
      infrastructure_status, 
      infra_status_updated_at, 
      activation_status, 
      activation_status_updated_at, 
      reservation_status, 
      reservation_time, 
      ticket_id, 
      platform, 
      serial_no, 
      actual_serial_no, 
      power_allocation, 
      network_ports_allocation, 
      stranded, 
      stranded_reasons, 
      stranded_updated_at, 
      comments, 
      whips_count, 
      kva_raiting, 
      region_canonical_name, 
      ad_canonical_short_code, 
      building_canonical_name, 
      room_canonical_name,
      to_timestamp_tz(created_at_date,'DD-MM-YYYY"T"HH24:MI:SS.FF"+00:00"') as created_at_date,
      to_timestamp_tz(updated_at_date,'DD-MM-YYYY"T"HH24:MI:SS.FF"+00:00"') as updated_at_date,
      sysdate as dw_date_created
    from
      JSON_TABLE(v_file,
        '$.data[*]' columns (
           region_name            varchar2(512)   path '$.REGION_NAME'          null on error,
           ad_name            varchar2(512)   path '$.AD_NAME'          null on error,
           building_name           varchar2(512)   path '$.BUILDING_NAME'       null on error,
           room_name           varchar2(512)   path '$.ROOM_NAME'       null on error,
           room_power_kw           varchar2(512)   path '$.ROOM_POWER_KW'       null on error,
           row_name           varchar2(512)   path '$.ROW_NAME'       null on error,
           block_name           varchar2(512)   path '$.BLOCK_NAME'       null on error,
           block_network_ports           varchar2(512)   path '$.BLOCK_NETWORK_PORTS'       null on error,
           rack_number           varchar2(512)   path '$.RACK_NUMBER'       null on error,
           pod_number           varchar2(512)   path '$.POD_NUMBER'       null on error,
           pdu_panel_a           varchar2(512)   path '$.PDU_PANEL_A'       null on error,
           pdu_a_room_name           varchar2(512)   path '$.PDU_A_ROOM_NAME'       null on error,
           pdu_panel_b           varchar2(512)   path '$.PDU_PANEL_B'       null on error,
           pdu_b_room_name       varchar2(512)   path '$.PDU_B_ROOM_NAME'       null on error,
           pdu_panel_c           varchar2(512)   path '$.PDU_PANEL_C'       null on error,
           pdu_c_room_name           varchar2(512)   path '$.PDU_C_ROOM_NAME'       null on error,
           pdu_panel_d           varchar2(512)   path '$.PDU_PANEL_D'       null on error,
           pdu_d_room_name           varchar2(512)   path '$.PDU_D_ROOM_NAME'       null on error,
           power_status           varchar2(512)   path '$.POWER_STATUS'       null on error,
           power_status_updated_at           varchar2(512)   path '$.POWER_STATUS_UPDATED_AT'       null on error,
           infrastructure_status           varchar2(512)   path '$.INFRASTRUCTURE_STATUS'       null on error,
           infra_status_updated_at           varchar2(512)   path '$.INFRA_STATUS_UPDATED_AT'       null on error,
           activation_status           varchar2(512)   path '$.ACTIVATION_STATUS'       null on error,
           activation_status_updated_at           varchar2(512)   path '$.ACTIVATION_STATUS_UPDATED_AT'       null on error,
           reservation_status               varchar2(512)   path '$.RESERVATION_STATUS'       null on error,
           reservation_time           varchar2(512)   path '$.RESERVATION_TIME'       null on error,
           ticket_id           varchar2(512)   path '$.TICKET_ID'       null on error,
           platform           varchar2(512)   path '$.PLATFORM'       null on error,
           serial_no           varchar2(512)   path '$.SERIAL_NO'       null on error,
           actual_serial_no           varchar2(512)   path '$.ACTUAL_SERIAL_NO'       null on error,
           power_allocation           varchar2(512)   path '$.POWER_ALLOCATION'       null on error,
           network_ports_allocation           varchar2(512)   path '$.NETWORK_PORTS_ALLOCATION'       null on error,
           stranded           varchar2(512)   path '$.STRANDED'       null on error,
           stranded_reasons           varchar2(512)   path '$.STRANDED_REASONS'       null on error,
           stranded_updated_at           varchar2(512)   path '$.STRANDED_UPDATED_AT'       null on error,
           comments           varchar2(512)   path '$.COMMENTS'       null on error,
           whips_count               varchar2(512)   path '$.WHIPS_COUNT'       null on error,
           kva_raiting           varchar2(512)   path '$.KVA_RAITING'       null on error,
           region_canonical_name           varchar2(512)   path '$.REGION_CANONICAL_NAME'       null on error,
           ad_canonical_short_code           varchar2(512)   path '$.AD_CANONICAL_SHORT_CODE'       null on error,
           building_canonical_name           varchar2(512)   path '$.BUILDING_CANONICAL_NAME'       null on error,
           room_canonical_name           varchar2(512)   path '$.ROOM_CANONICAL_NAME'       null on error,
           created_at_date           varchar2(512)   path '$.Created_at_date'      null on error,
           updated_at_date           varchar2(512)   path '$.Updated_at_date'      null on error
        )
      )
      where room_name not like '%rows selected%';

    v_cnt := SQL%ROWCOUNT;

    return dwadmin.etl_support_pkg.mark_finish_load(v_cnt);

exception
  when others then
    rollback;
    raise;
end load_storekeeper_location_stg;
/
