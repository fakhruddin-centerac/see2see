<style>
.blackborder{border:1px solid #000 !important;}
</style>

<?php echo $header; ?>
<div class="container">
    <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
    </ul>
</div>


<div class="container">
  
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    
    
    <div class="contact-form">
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                <div class="form-3line clearfix">
                    <div class="form-input-section">
                        <input type="text" class="blackborder" name="name" placeholder="Your Name" value="<?php echo $name; ?>" id="input-name"  />
                          <?php if ($error_name) { ?>
                          <div class="text-danger"><?php echo $error_name; ?></div>
                          <?php } ?>
                    </div>
                    <div class="form-input-section">
                        <input placeholder="Date of Birth" class="blackborder" type="text" name="dob" value="<?php echo $dob; ?>" id="dobpicker" />
                          <?php if ($error_dob) { ?>
                          <div class="text-danger"><?php echo $error_dob; ?></div>
                          <?php } ?>
                    </div>
                    <div class="form-input-section">
                        <input placeholder="Nationality" class="blackborder" type="text" name="nationality" value="<?php echo $nationality; ?>" id="input-nationality"/>
                        <?php if ($error_dob) { ?>
                            <div class="text-danger"><?php echo $error_dob; ?></div>
                        <?php } ?>
                    </div>
                </div>
                <div class="form-3line clearfix">
                    <div class="form-input-section">
                        <input type="text" class="blackborder" name="country_residence" placeholder="Current country of residence" value="<?php echo $country_residence; ?>" id="input-country-residence"  />
                          <?php if ($error_country_residence) { ?>
                          <div class="text-danger"><?php echo $country_residence; ?></div>
                          <?php } ?>
                    </div>
                    <div class="form-input-section">
                        <input placeholder="Position applying for" class="blackborder" type="text" name="apply_position" value="<?php echo $apply_position; ?>" id="input-apply-position" />
                          <?php if ($error_apply_position) { ?>
                          <div class="text-danger"><?php echo $apply_position; ?></div>
                          <?php } ?>
                    </div>
                    <div class="form-input-section">
                        <input placeholder="Current company" class="blackborder" type="text" name="current_company" value="<?php echo $current_company; ?>" id="input-current-company"/>
                       
                    </div>
                </div>
                <div class="form-3line clearfix">
                    <div class="form-input-section">
                        <input type="text" class="blackborder" name="current_designation" placeholder="Current designation" value="<?php echo $current_designation; ?>" id="input-current-designation"  />
                         
                    </div>
                    <div class="form-input-section">
                        <input placeholder="Current industry working in" class="blackborder" type="text" name="current_industry" value="<?php echo $current_industry; ?>" id="input-current-industry" />
                         
                    </div>
                    <div class="form-input-section">
                        <input placeholder="Prior companies" class="blackborder" type="text" name="prior_companies" value="<?php echo $prior_companies; ?>" id="input-prior-companies"/>
                       
                    </div>
                </div>
                <div class="form-3line clearfix">
                    <div class="form-input-section">
                        <input type="text" class="blackborder" name="prior_designation" placeholder="Prior designations" value="<?php echo $prior_designation; ?>" id="input-prior-designation"  />
                          
                    </div>
                    <div class="form-input-section">
                        <input placeholder="Prior industries worked in" class="blackborder" type="text" name="prior_industry" value="<?php echo $prior_industry; ?>" id="input-prior-industry" />
                         
                    </div>
                    <div class="form-input-section">
                        <input placeholder="Current monthly salary (please specify currency)" class="blackborder" type="text" name="current_salary" value="<?php echo $current_salary; ?>" id="input-current-salary"/>
                       
                    </div>
                </div>
                <div class="form-3line clearfix">
                    <div class="form-input-section">
                        <input type="text" class="blackborder" name="expected_salary" placeholder="Expected monthly salary (please specify currency)" value="<?php echo $expected_salary; ?>" id="input-prior-designation"  />
                         
                    </div>                                      
                </div>
                <div class="form-3line clearfix">
                    <div class="form-input-section">
                        <input type="file" class="blackborder" name="resume" placeholder="Resume"  id="input-resume"  />                          
                    </div>
                    <div class="form-input-section">
                        <input type="file" class="blackborder" name="cover_letter" placeholder="Cover Letter"  id="input-cover-letter"  />                          
                    </div>
                    <div class="form-input-section">
                        <input type="file" class="blackborder" name="documents" placeholder="Other Documents"  id="input-other-documents"  />                          
                    </div> 
                </div>    
                <div class="form-action">
                    <input type="button" value="Clear"/>
                    <input class="btn btn-primary" type="submit" value="<?php echo $button_submit; ?>" />
                </div>
            </form>
        </div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
