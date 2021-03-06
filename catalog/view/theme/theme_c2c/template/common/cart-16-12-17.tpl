<div id="cart" class="top-cart ">
  <!--<button type="button" data-toggle="dropdown" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-inverse btn-block btn-lg dropdown-toggle"><i class="fa fa-shopping-cart"></i> <span id="cart-total"><?php echo $text_items; ?></span></button>-->
  <div class="dropdown-toggle customaddprice " data-toggle="dropdown" ><span><?php echo $text_items; ?></span></div>  
  <ul class="dropdown-menu pull-right customaddpriceshow">
    <?php if ($products || $vouchers) { ?>
    <li>
      <table class="table table-striped">
        <?php foreach ($products as $product) { ?>
        <tr>
          <td class="text-center"><?php if ($product['thumb']) { ?>
            <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
            <?php } ?></td>
          <td class="text-left"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
            <?php if ($product['option']) { ?>
            <?php foreach ($product['option'] as $option) { ?>
            <br />
            - <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small>
            <!-- custom add for product_tp=TE -->
                <?php if($product['product_tp']=='TE'){ ?>
                    <div class=""><small><?php if($option['optionprice']> 0){ ?>Adult Price- <?php   echo  $product['numberofparent']." x ".round($option['optionprice']); } ?> </small></div>
                    <div><small><?php if($option['optionchildprice']> 0){ ?>Child Price- <?php  echo $product['numberofchild']." x ".round($option['optionchildprice']); } ?></small></div>
                <?php }
                if($product['product_tp']=='LS'){ ?>
                <div><small>Total Hours- <?php echo $product['numberofparent']; ?></small></div>
             <?php } 
                   } ?>
            <?php } ?>
            <?php if ($product['recurring']) { ?>
            <br />
            - <small><?php echo $text_recurring; ?> <?php echo $product['recurring']; ?></small>
            <!--- custom add -->
            <?php if ($product['option']) { ?>
            <?php foreach ($product['option'] as $option) { ?>
            
            <?php  }  } ?>
            <!-- -->
            
            <?php } ?></td>
          <td class="text-right">x <?php echo $product['quantity']; ?>
          <!-- custom add additionally-->
          
          </td>
          <td class="text-right"><?php echo $product['total']; ?></td>
          <td class="text-center"><button type="button" onclick="cart.remove('<?php echo $product['cart_id']; ?>');" title="<?php echo $button_remove; ?>" class="btn btn-danger btn-xs"><i class="fa fa-times"></i></button></td>
        </tr>
        <?php } ?>
        <?php foreach ($vouchers as $voucher) { ?>
        <tr>
          <td class="text-center"></td>
          <td class="text-left"><?php echo $voucher['description']; ?></td>
          <td class="text-right">x&nbsp;1</td>
          <td class="text-right"><?php echo $voucher['amount']; ?></td>
          <td class="text-center text-danger"><button type="button" onclick="voucher.remove('<?php echo $voucher['key']; ?>');" title="<?php echo $button_remove; ?>" class="btn btn-danger btn-xs"><i class="fa fa-times"></i></button></td>
        </tr>
        <?php } ?>
      </table>
    </li>
    <li>
      <div class="cartshow">
         <div class="col-sm-8 myborder">
             <?php foreach ($totals as $total) { ?>
                <div class="">
                    <div class="leftcart"><?php echo $total['title']; ?></div>
                    <div class="rightcart text-right"><?php echo $total['text']; ?></div>
                </div>
            <?php } ?>
         </div>
         <div class="col-sm-4">
            <div>
                <a href="<?php echo $cart; ?>"><i class="fa fa-shopping-bag"></i><?php echo $text_cart; ?></a>
            </div>
            <div>
                <a href="<?php echo $checkout; ?>"><i class="fa fa-check-square-o"></i> <?php echo $text_checkout; ?></a>
            </div>    
         </div>
        <div class="clearfix"></div>
        <!--<table class="table table-bordered">
          <?php foreach ($totals as $total) { ?>
          <tr>
            <td class="text-right"><strong><?php echo $total['title']; ?></strong></td>
            <td class="text-right"><?php echo $total['text']; ?></td>
          </tr>
          <?php } ?>
        </table>
        <p class="text-right"><a href="<?php echo $cart; ?>"><strong><i class="fa fa-shopping-cart"></i> <?php echo $text_cart; ?></strong></a>&nbsp;&nbsp;&nbsp;<a href="<?php echo $checkout; ?>"><strong><i class="fa fa-share"></i> <?php echo $text_checkout; ?></strong></a></p>
        -->
      </div>
    </li>
    <?php } else { ?>
    <li>
      <p class="text-center"><?php echo $text_empty; ?></p>
    </li>
    <?php } ?>
  </ul>
</div>
