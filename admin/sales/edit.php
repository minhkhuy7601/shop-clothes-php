<?php
    require_once '../model/db.php';

    if(isset($_GET['id'])){
        $sale_id = $_GET['id'];
        $sql_get = "SELECT * FROM sale WHERE sale_id = $sale_id ";
        $result_get = mysqli_query($conn, $sql_get);
        
        if(empty(mysqli_num_rows($result_get))){
            header ('location : ./index.php?menu=4');
        }      
        $item= mysqli_fetch_assoc($result_get);
    }
    else{
        header ('location : ./index.php?menu=4&');
    }
    if(isset($_POST['sbm'])){
        if(isset($_GET['id'])){
            $sale_id = $_GET['id'];
            $sale_name = $_POST['sale_name'];
            $percent = $_POST['percent']; 
            $start = $_POST['date-start'];       
            $end = $_POST['date-end'];       
            $category = $_POST['category'];
            $date_start = substr($start, 0,10). " " .substr($start, -5 ). ":00";
            $date_end = substr($end, 0,10). " " .substr($end, -5 ). ":00";    
            $text = "where ";
            foreach($category as $i){
                if($i == 'all'){
                    break;
                }else{
                    $text.="category = '".$i. "' or ";
                }

            } 
            $text = substr($text, 0, -3);

            $sql_insert_sale = "UPDATE sale SET sale_name = '$sale_name', percent = $percent, date_start = '$date_start', date_end = '$date_end' WHERE sale_id = $sale_id ";
            $result_insert_sale = mysqli_query($conn, $sql_insert_sale);

            $sql_del = "DELETE FROM sale_detail WHERE sale_id = $sale_id";
            $result_del = mysqli_query($conn, $sql_del);

            $sql_get_prd = "SELECT * FROM products ".$text;
            $result_get_prd = mysqli_query($conn, $sql_get_prd);
            while($prd = mysqli_fetch_assoc($result_get_prd)){
                $prd_id = $prd['prd_id'];
                $sql_insert_sale_detail = "INSERT INTO sale_detail(sale_id, prd_id) VALUES($sale_id, $prd_id)";
                $result_insert_sale_detail = mysqli_query($conn, $sql_insert_sale_detail);
            }



            
            header ('location: ./index.php?menu=4');

        }
        
    }


    

?>

<div class="card">
                    <div class="card-header">
                        <h2>Th??m ch????ng tr??nh gi???m gi??</h2>
                    </div>
                    <div class="card-body">
                        <form action="index.php?layout=edit&menu=4&id=<?php echo $sale_id ?>" method="POST" enctype="multipart/form-data" id="form-add-sale">
                            <div class="form-group">
                                <label for="">T??n ch????ng tr??nh</label>
                                <input type="text" name="sale_name" id="sale_name" class="form-control" value="<?php  echo $item['sale_name'] ?>">
                                <small></small>
                            </div>
                            <div class="form-group">
                                <label for="">Gi???m gi??(%)</label>
                                <input type="text" name="percent" id="percent" class="form-control" value="<?php  echo $item['percent'] ?>">
                                <small></small>
                            </div>
                            <div class="form-group">
                                <label for="">Ng??y b???t ?????u gi???m gi??</label>
                                <input type="datetime-local" id="time_start" name="date-start" value="" min="2018-06-07T00:00" max="2100-06-14T00:00">

                                <small></small>
                            </div>
                            <div class="form-group">
                                <label for="">Ng??y k???t th??c gi???m gi??</label>
                                <input type="datetime-local" id="time_end" name="date-end" value="" min="2018-06-07T00:00" max="2100-06-14T00:00">
                                <small></small>
                            
                            </div>
                            <label for="">??p d???ng cho danh m???c</label>
                            <ul class="list-group list-group-flush form-group" id="prd" >                       
                            
                            <li class="list-group-item validate-li">
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input title"  id="checkAll" name='category[]' value="all">
                                    <label class="custom-control-label" for="checkAll">T???t c??? s???n ph???m</label>
                                </div>
                            </li>
                            <li class="list-group-item validate-li">
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input title"  id="checkTee" name='category[]' value="tee">
                                    <label class="custom-control-label" for="checkTee">Tee</label>
                                </div>
                            </li>
                            <li class="list-group-item validate-li">
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input title"  id="checkHoodie" name='category[]' value="hoodie">
                                    <label class="custom-control-label" for="checkHoodie">Hoodie</label>
                                </div>
                            </li>
                            <li class="list-group-item validate-li">
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input title"  id="checkJacket" name='category[]' value="jacket">
                                    <label class="custom-control-label" for="checkJacket">Jacket</label>
                                </div>
                            </li>
                            <li class="list-group-item validate-li">
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input title"  id="checkSweater" name='category[]' value="sweater">
                                    <label class="custom-control-label" for="checkSweater">Sweater</label>
                                </div>
                            </li>
                            <li class="list-group-item validate-li">
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input title"  id="checkPants" name='category[]' value="pants">
                                    <label class="custom-control-label" for="checkPants">Pants</label>
                                </div>
                            </li>
                            <li class="list-group-item validate-li">
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input title"  id="checkAccessories" name='category[]' value="accessories">
                                    <label class="custom-control-label" for="checkAccessories">Accessories</label>
                                </div>
                            </li>
                            

                        <small>error</small>

                    </ul>
                            <button type="submit" name="sbm" class="btn btn-success">Th??m</button>
                        </form>
                    </div>

                </div>

                    <script>
    //validation sign up
    const formAddSale = document.querySelector('#form-add-sale');
    const sale_name = document.querySelector('#sale_name');
    const percent = document.querySelector('#percent');
    const time_start = document.querySelector('#time_start');
    const time_end = document.querySelector('#time_end');

    const title = document.querySelectorAll('.title');
    const li = document.querySelector('.validate-li');
    




    formAddSale.addEventListener('submit', e => {
        let isSend = true;

        if (sale_name.value === '') {
            setErrorFor(sale_name, 'Ch??a c?? th??ng tin t??n ch????ng tr??nh');
            isSend = false;
        } else {
            setSuccessFor(sale_name);
            sale_name.value = validateData(sale_name.value);
        }

        if (percent.value === '') {
            setErrorFor(percent, 'Ch??a c?? th??ng tin gi???m gi??');
            isSend = false;
        } else {
            if(isNaN(percent.value) || percent.value <= 0 || percent.value>=100){
                setErrorFor(percent, 'Kh??ng h???p l???');
                isSend = false;
            }
            else
                setSuccessFor(percent);
        }

        if (time_start.value === '') {
            setErrorFor(time_start, 'Ch??a c?? th??ng tin ng??y b???t ?????u');
            isSend = false;
        } else {
            setSuccessFor(time_start);
        }


        if (time_end.value === '') {
            setErrorFor(time_end, 'Ch??a c?? th??ng tin ng??y k???t th??c');
            isSend = false;
        } else {
            setSuccessFor(time_end);
        }
        let isCheck = false;
        for(let i=0; i<title.length;i++){
            if(title[i].checked){
                isCheck=true;
            }
        }
        if(!isCheck){
            setErrorFor(li, 'Ch??a c?? th??ng tin danh m???c');
            isSend = false;
        }else {
            setSuccessFor(li);
        }

        if (!isSend) {
            e.preventDefault();
        }

    })

    let setErrorFor = (input, message) => {
        const formControl = input.parentElement;
        const small = formControl.querySelector('small');
        formControl.classList = 'form-group error';
        small.innerText = message;
    }

    let setSuccessFor = (input) => {
        const formControl = input.parentElement;
        formControl.classList = 'form-group';
    }

    function validateData(input) {
        return input.replace(/[^0-9a-z???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????\s]/gi, "");

    }

    
</script>





