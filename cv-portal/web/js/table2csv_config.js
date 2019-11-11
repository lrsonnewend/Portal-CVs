$('#downloadCSV').click(function() {
    $('#objects').table2csv({
        separator: ',',
        newline: '\n',
        excludeColumns: '',
        excludeRows: '',
        filename: 'objects.csv'
    });
});