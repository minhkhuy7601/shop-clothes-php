<?php
    require_once '../model/db.php';
    $sql = "SELECT * FROM products, category, sale WHERE products.category_id = category.category_id AND products.sale_id = sale.sale_id";
    $result = mysqli_query($conn, $sql);
    $json = array();
    while($item = mysqli_fetch_assoc($result)){
        $prd_id = $item['prd_id'];
        $sql1 = "SELECT * FROM detail_product, color WHERE prd_id = $prd_id AND detail_product.color_id = color.color_id";

        $result1 = mysqli_query($conn, $sql1);
        $detail = array();
        while($item1 = mysqli_fetch_assoc($result1)){
            $detail_prd_id = $item1['detail_prd_id'];
            $sql2= "SELECT * FROM detail_product_size, size WHERE detail_prd_id = $detail_prd_id AND detail_product_size.size_id = size.size_id";
            $result2 = mysqli_query($conn, $sql2);
            $size = array();
            while($item2 = mysqli_fetch_assoc($result2)){
                $size[] = ["detail_prd_size_id"=>$item2['detail_prd_size_id'], "size_name"=>$item2['size_name'], "quantity"=>$item2['quantity']];
            }
            $detail[] = ["detail_prd_id"=>$item1['detail_prd_id'], "color_name"=>$item1['color_name'], "image_front"=>$item1['image_front'], "image_back"=>$item1['image_back'], 'size'=>$size];
        }
        $json[] = ["prd_id"=>$item['prd_id'], "prd_name"=>$item['prd_name'], "price"=>$item['price'], "description"=>$item['description'], "newArrival"=>$item['newArrival'], "sale_name"=>$item['sale_name'], "percent"=>$item['percent'], "category_name"=>$item['category_name'], "detail"=>$detail];
    }

    // print_r(json_encode($json));
    // foreach($json as $i){
    //     echo $i['sale_id'];
    // }

    // $total = mysqli_num_rows($result);
    $index = 0;
?>


<style>
    
    .prd-detail{
        display: flex; 
        align-items: center;
    }

    .prd-detail .img-box{
        display:flex;
    }

    .prd-detail .img-box img{
        border: 1px solid #343a40;
        padding: 10px;
        border-radius: 10px;
        width: 50%;
    }
</style>
<div class="card">
                    <div class="card-header">
                        <h3>Danh s??ch s???n ph???m</h3>
                        <h6 class="total-quantity">C?? t???t c??? <span><?php echo count($json); ?></span> s???n ph???m</h6>
                        <a class="btn btn-primary" href="./index.php?layout=add&menu=1">Th??m m???i</a>

                    </div>
                    <div class="card-body">
                        <div id="title-list-products">
                                <input class="form-control mr-sm-2" type="text" placeholder="Search" id="search-box">
                                <!-- <button class="btn btn-success" type="submit">Search</button> -->
                            <h4>T??m ki???m theo danh m???c</h4>
                            <div id="filter-box" style="display:flex;">
                                <div class="form-group">
                                    <select name="newArrival" class="form-control" id="price">
                                    <option value="" selected="selected">S???p x???p theo gi?? ti???n</option>
                                    <option value="increase" >Gi?? t??ng d???n</option>
                                    <option value="decrease" >Gi?? gi???m d???n</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <select name="newArrival" class="form-control" id="category">
                                    <option value="" selected="selected">S???p x???p theo th??? lo???i</option>
                                    <?php 
                                        $sql = "SELECT * FROM category";
                                        $result = mysqli_query($conn, $sql);
                                        while($item = mysqli_fetch_assoc($result)){
                                            ?>
                                            <option value="<?php echo $item['category_name'] ?>" ><?php echo $item['category_name'] ?></option>

                                            <?php
                                        }
                                    ?>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <select name="newArrival" class="form-control" id="newArrival">
                                    <option value="" selected="selected">S???p x???p theo s???n ph???m m???i</option>
                                    <option value="1" >C??</option>
                                    <option value="0" >Kh??ng</option>
                                    </select>
                                </div>
                            </div>
                        </div>


                        <div id="renderSide">
                        <table class="table">
                            <thead class="thead-dark">
                                <tr>
                                    <th>STT</th>
                                    <th>T??n s???n ph???m</th>
                                    <th>Gi?? s???n ph???m</th>
                                    <th>Th??? lo???i</th>
                                    <th>S??? l?????ng</th>
                                    <th>S???n ph???m m???i</th>
                                    <th>Gi???m gi??</th>
                                    <th>M?? t???</th>
                                    <th>Chi ti???t</th>
                                    <th>Th??m</th>
                                    <th>S???a</th>
                                    <th>X??a</th>
                                </tr>
                            </thead>
                            <tbody>
                              
                                
                                


                            </tbody>

                        </table>
                        </div>
                    </div>
                </div>

                <script>
    function del(name){
        return confirm("B???n c?? mu???n x??a s???n ph???m: "+name+"?")
    }

    
    $(function(){
        
        $search = $('#search-box');
        $price = $('#price');
        $category = $('#category');
        $newArrival = $('#newArrival');
        $priceValue = "";
        $categoryValue = "";
        $newArrivalValue = "";
        $json = <?php print_r(json_encode($json)) ?>;
       
        $search.on('keyup', function(e){
            $searchValue = validateData($search.val());
            $data = $.grep($json, function(v) {
                return ((v['prd_name'].search($searchValue) > -1)||(v['price'].search($searchValue) > -1)||(v['category_name'].search($searchValue) > -1) || (v['description'].search($searchValue) > -1));
            });
            renderData($data)
        })


        $price.on('change', function(){
            $priceValue = $price.val();
            renderFilter($priceValue , $categoryValue, $newArrivalValue, $json);
        })

        $category.on('change', function(){
            $categoryValue = $category.val();
            renderFilter($priceValue , $categoryValue, $newArrivalValue, $json);


        })

        $newArrival.on('change', function(){
            $newArrivalValue = $newArrival.val();
            renderFilter($priceValue , $categoryValue, $newArrivalValue, $json);


        })
        renderFilter($priceValue , $categoryValue, $newArrivalValue, $json);


        function renderFilter($price , $category, $newArrival, $json){
            $data =$json;
            if($price == 'decrease'){
                $data.sort(function (a, b) {
                    return b.price - a.price;
                });
            }

            if($price == 'increase'){
                $data.sort(function (a, b) {
                    return a.price - b.price;
                });

            }
            if($category!==''){
                    $data = $.grep($data, function(v) {
                return v['category_name'] === $category;
            });
            }

            if($newArrival!=''){
                    $data = $.grep($data, function(v) {
                return v['newArrival'] == $newArrival;
            });
            }
            renderData($data)

            

        }


        function renderData($json){
            $tbody = $('tbody');
            $tbody.html('');
            $index = 0;
            $.each($json, function(index, value){
                $index++;
                $detail='';
                $totalQuantity = 0;
                $.each(value['detail'], function(ind, val){
                    $size = '';
                    $.each(val['size'], function(i, v){
                        $size+=`<li><strong>${v['size_name']}</strong>-${v['quantity']}</li>`;
                        $totalQuantity+=parseInt(v['quantity']);
                    })
                    $detail+=`<ul class="prd-detail">
                                            <li class="col-2">${val['color_name']}</li>
                                            <li class="col-3 img-box"><img src="../view/img/${val['image_front']}">
                                                <img src="../view/img/${val['image_back']}">
                                            </li>
                                            <li class="col-2">
                                                <ul>
                                                    ${$size}
                                                </ul>
                                            </li>
                                            <li class="col-2"><a href="./index.php?menu=1&layout=edit-detail&id=${value['prd_id']}&idDetail=${val['detail_prd_id']}">S???a</a></li>
                                            <li class="col-2"><a onclick="return del('${value['prd_name']}')" href="./index.php?menu=1&layout=del-detail&idDetail=${val['detail_prd_id']}">X??a</a></li>

                                            

                                        </ul>`
                    


                })

                $tbody.append(` <tr>
                                    <td>${$index}</td>
                                    <td>${value['prd_name']}</td>
                                    <td>${numberWithCommas(value['price'])}???</td>
                                    <td>${value['category_name']}</td>
                                    <td>${$totalQuantity}</td>
                                    <td>${value['newArrival']}</td>
                                    <td>${value['sale_name']}-${value['percent']}%</td>

                                    <td>${value['description']}</td>
                                    <td><button type="button" class="btn btn-info detail">Chi ti???t</button></td>
                                    <td><a href="./index.php?menu=1&layout=add-detail&id=${value['prd_id']}"><button type="button" class="btn btn-success">Th??m</button></a></td>
                                    <td><a href="./index.php?menu=1&layout=edit&id=${value['prd_id']}"><button type="button" class="btn btn-warning">S???a</button></a></td>
                                    <td><a onclick="return del('${value['prd_name']}')" href="./index.php?menu=1&layout=del&id=${value['prd_id']}"><button type="button" class="btn btn-danger">X??a</button></a></td>
                                </tr>
                                <tr style="display:none">
                                    <td colspan=11>${$detail}</td>                                   
                                    
                                </tr>
                                
                                
                                `)
            })


            $btnDetail = $('.detail');
            $btnDetail.on('click', function(){
            $extra = $(this).parent().parent().next();
            // console.log($extra);
            $extra.slideToggle();
        })  
        }


        function validateData($input) {
            return $input.replace(/[^0-9a-z???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????\s]/gi, "");

        
        }
        function numberWithCommas(x) {
            return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        }

    })
    
    
</script>