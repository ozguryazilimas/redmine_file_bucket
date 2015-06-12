
var file_bucket_table;

$(function() {

  file_bucket_table = $('table#rfb_file_bucket').DataTable({
    // autoWidth: false,
    // pagingType: 'full_numbers',
    iDisplayLength: 25,
    bPaginate: true,
    bSearchable: true,
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
    },

  });

  $('.dataTables_filter input').attr("placeholder", dt_str.search);

  $('.rfb_container_checkbox').on('change', function(k) {
    var is_checked = $(this).is(':checked');
    var container_type = $(this).data('container_type');
    console.log(container_type + ': ' + is_checked);
  });

});

