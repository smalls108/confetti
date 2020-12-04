import "select2";

const tagSelect = () => {
  $(document).ready(function() {
    $('#tag-selector').select2({
      placeholder: "Select Category",
      allowClear: true
    });
  })
};

export { tagSelect };
