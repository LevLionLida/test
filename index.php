<!doctype html>
<html lang="ru">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<div class="container">
    <div class="row justify-content-center ">

        <div class="col col-lg-6 border ">
            <p class=" mt-3 h5 title-add-post">Фильтр</p>
            <form id="form_data" action="handler.php" method="post" enctype="multipart/form-data">
                <div class="mb-3">
                    <label for="company_name" class="form-label">
                        Название компании
                    </label>
                    <input type="text" name="company_name" id="company_name" class="form-control" required>
                </div>

                <div class="mb-3">
                <label for="phone" class="form-label" >Номер телефона</label>
                <input type="tel" id="phone" name="phone" class="form-control" maxlength="12" required>
                </div>

                <div class="mb-3">
                    <label for="platform" class=" form-label">
                        Название интегрируемого сервиса
                    </label>
                    <select multiple class="form-control" id="platform" name="platform">
                        <option>Viber</option>
                        <option>Telegram</option>

                    </select>
                </div>


                <div class="mb-3">
                    <p> Диапазон сумм</p>
                    <label for="rangeAmountMax" class="form-label">
                        от
                    </label>
                    <input  type="text" id="rangeAmountMax"   name="rangeAmountMax" class="form-control" required>
                    <br>
                    <label for="rangeAmountMin" class="form-label">
                        до
                    </label>
                    <input  type="text" id="rangeAmountMin"   name="rangeAmountMin" class="form-control" required>

                </div>

                <button type="submit" class="submit_button btn btn-secondary btn-lg d-block w-100 mb-3">
                    Отправить
                </button>
            </form>
        </div>

    </div>

</div>
<script>
    let form_in_json_format = '';

    $('.submit_button').click(function(e) {
        e.preventDefault();

        $.ajax({
            type: "POST",
            url: 'handler.php',
            data: {
                company_name: $('#company_name').val(),
                phone: $('#phone').val(),
                platform: $('#platform').find(":selected").val(),
                range_min: $('#rangeAmountMax').val(),
                range_max: $('#rangeAmountMin').val(),
            },
            success: function(data) {
                console.log(data);
            },
            dataType: 'json'
        });
    });
</script>