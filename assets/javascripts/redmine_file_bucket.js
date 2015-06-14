
var file_bucket_table;

$.fn.dataTable.ext.search.push(
  function(settings, data, dataIndex) {
    var is_container_matching = checked_containers.indexOf(data[0]) > -1;
    var is_subproject_matching = true;

    if (container_subproject_enabled) {
      var subprojects_checked = checked_containers.indexOf(dt_str.subprojects) > -1;

      if (!subprojects_checked) {
        is_subproject_matching = data[5] == '';
      }
    }

    return (is_container_matching && is_subproject_matching);
  }
);

$(function() {

  file_bucket_table = $('table#rfb_file_bucket').DataTable({
    // pagingType: 'full_numbers',
    autoWidth: false,
    lengthMenu: [[50, 100, 250, -1], [50, 100, 250, dt_str.all]],
    bPaginate: true,
    bSearchable: true,
    order: [[1, 'asc']],
    columns: [
      {data: 'container_type_formatted'},
      {data: 'file_name'},
      {data: 'file_size'},
      {data: 'description'},
      {data: 'location'},
      {data: 'subproject'},
      {data: 'author'},
      {data: 'created_on'},
      {data: 'downloads'},
      {data: 'action'}
    ],
    language: {
      search: '',
      lengthMenu: "_MENU_",
      emptyTable: dt_str.empty_table,
      zeroRecords: dt_str.empty_table,
      info: dt_str.info,
      infoEmpty: '',
      infoFiltered: '',
      paginate: {
        first: dt_str.first,
        last: dt_str.last,
        next: dt_str.next,
        previous: dt_str.previous
      }
    }
  });

  $('.dataTables_filter input').attr("placeholder", dt_str.search);
  file_bucket_table.rows.add(dt_data).draw();

  $('.rfb_container_checkbox').on('change', function(k) {
    checked_containers = $('.rfb_container_checkbox:checked').map(function() {
      return $(this).data('container_type')
    }).get();

    file_bucket_table.draw();
  });

});

