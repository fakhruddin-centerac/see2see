<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_install) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_install; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    
    <?php 
//    echo "<pre>";print_r($rows);exit;

$countercusvip=0;
    foreach ($rows as $row) { ?>
    
     <?php 
        if($countercusvip==1)
        {
            echo "<div class='row'>";
            foreach($mydashboard as $mydashboardserv )
            {
             ?>
                
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="tile">
                        <div class="tile-heading"><?php echo $mydashboardserv['totalheading']; ?> <span class="pull-right"> </span></div>
                        <div class="tile-body">
                            <i class="fa fa-file-text-o fw"></i>
                            <h2 class="pull-right"><?php echo $mydashboardserv['totalnumber']; ?></h2>
                        </div>
                        <div class="tile-footer">
                            <a href="<?php echo $mydashboardserv['link']; ?>">View more...</a>
                        </div>
                    </div>
                </div>
            <?php  }
            echo "</div>";  
            }
        ?>
    <div class="row">
      <?php foreach ($row as $dashboard_1) { ?>
      <?php $class = 'col-lg-' . $dashboard_1['width'] . ' col-md-3 col-sm-6'; ?>
      <?php foreach ($row as $dashboard_2) { ?>
      <?php if ($dashboard_2['width'] > 3) { ?>
      <?php $class = 'col-lg-' . $dashboard_1['width'] . ' col-md-12 col-sm-12'; ?>
      <?php } ?>
      <?php } ?>
      <div class="<?php echo $class; ?>"><?php echo $dashboard_1['output']; ?></div>
      <?php } ?>
    </div>
       
    
    <?php $countercusvip++; } ?>
    <!--- custom   add-->
    
    
    
    <!--- close   -->
    
  </div>
</div>
<?php echo $footer; ?>