 $('table.paginated').each(function () {
        var currentPage = 0;
        var numPerPage = 5;
        var $table = $(this);
        $table.bind('repaginate', function () {
            $table.find('tbody tr').hide().slice(currentPage * numPerPage, (currentPage + 1) * numPerPage).show();
        });
        $table.trigger('repaginate');
        var numRows = $table.find('tbody tr').length;
        var numPages = Math.ceil(numRows / numPerPage);
        var $pager = $('<div class="pager"></div>');

        // Previous Button
        $('<button class="prev-page">Prev</button>').on('click', function () {
            if (currentPage > 0) {
                currentPage--;
                $table.trigger('repaginate');
                updatePager();
            }
        }).appendTo($pager);

        // Page Numbers
        for (var page = 0; page < numPages; page++) {
            $('<span class="page-number"></span>').text(page + 1).bind('click', {
                newPage: page
            }, function (event) {
                currentPage = event.data['newPage'];
                $table.trigger('repaginate');
                updatePager();
            }).appendTo($pager).addClass('clickable');
        }

        // Next Button
        $('<button class="next-page">Next</button>').on('click', function () {
            if (currentPage < numPages - 1) {
                currentPage++;
                $table.trigger('repaginate');
                updatePager();
            }
        }).appendTo($pager);

        // Function to update pager buttons' state
        function updatePager() {
            $pager.find('span.page-number').eq(currentPage).addClass('active').siblings().removeClass('active');
        }

        $pager.insertBefore($table).find('span.page-number:first').addClass('active');
    });