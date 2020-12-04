import "select2";
import 'select2/dist/css/select2.css';

const tagSelect = () => {
  $(document).ready(function() {
    $('#tag-selector').select2({
      placeholder: "Select Category",
      allowClear: true
    });
  })
};

export { tagSelect };
