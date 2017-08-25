<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require_once(APPPATH.'controllers/Public_Controller.php');
// 分类类别
class Category extends Public_Controller
{
    
    public $category = 'category';


    function __construct() {
        parent::__construct();
    }


    //行业类别
    function industry(){
        //获取行业类别
        $config['per_page'] = 10;
        //获取页码
        $current_page=intval($this->uri->segment(3));//index.php 后数第4个/

        //配置
        $config['base_url'] = site_url('/Category/industry');

        //分页配置

        $config['full_tag_open'] = '<ul class="am-pagination tpl-pagination">';

        $config['full_tag_close'] = '</ul>';

        $config['first_tag_open'] = '<li>';

        $config['first_tag_close'] = '</li>';

        $config['prev_tag_open'] = '<li>';

        $config['prev_tag_close'] = '</li>';

        $config['next_tag_open'] = '<li>';

        $config['next_tag_close'] = '</li>';

        $config['cur_tag_open'] = '<li class="am-active"><a>';

        $config['cur_tag_close'] = '</a></li>';

        $config['last_tag_open'] = '<li>';

        $config['last_tag_close'] = '</li>';

        $config['num_tag_open'] = '<li>';

        $config['num_tag_close'] = '</li>';

        $config['first_link']= '首页';

        $config['next_link']= '»';

        $config['prev_link']= '«';

        $config['last_link']= '末页';
        $config['num_links'] = 4;
        
        $total = count($this->public_model->select_where($this->category,'type','1','addtime'));
        $config['total_rows'] = $total;
    
        $this->load->library('pagination');//加载ci pagination类
        $listpage =  $this->public_model->select_page_where($this->category,'type','1',$current_page,$config['per_page'],'addtime');
        $this->pagination->initialize($config);

        $data = array('lists'=>$listpage,'pages' => $this->pagination->create_links());

        $this->load->view('industry/industryType.html',$data);
    }

    //新增行也类型
    function add_industry(){
        //判断是是否具有权限
        $q = $this->uri->uri_string();
        $ret = if_user_power($q,$_SESSION['power']);
        if($ret == '0'){
            echo "<script>alert('您暂无权限执行此操作！请联系系统管理员。');window.history.go(-1);</script>";
            exit;
        }
    
        if($_POST){
            $data = $this->input->post();
            if($this->public_model->insert($this->category,$data)){
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=>$_SESSION['users']['user_id'],
                    'username'=>$_SESSION['users']['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'1',
                    'log_message'=>"新增行业类别成功,行业名称为".$data['cate_name'],
                );
                add_system_log($arr);
                echo "<script>alert('操作成功！');window.location.href='".site_url('/Category/industry')."'</script>";                
            }else{
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=>$_SESSION['users']['user_id'],
                    'username'=>$_SESSION['users']['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'0',
                    'log_message'=>"新增行业类别失败,行业名称为".$data['cate_name'],
                );
                add_system_log($arr);
                echo "<script>alert('操作失败！');window.location.href='".site_url('/Category/industry')."'</script>";                                
            }
        }else{
            $this->load->view('404.html');
        }
    }

    //编辑行业
    function edit_industry(){
         //判断是是否具有权限
         $q = $this->uri->uri_string();
         $ret =  if_user_power($q,$_SESSION['power']);
         if($ret == '0'){
             echo "<script>alert('您暂无权限执行此操作！请联系系统管理员。');window.history.go(-1);</script>";
             exit;
         }
         if($_POST){
             $data = $this->input->post();
             if($this->public_model->updata($this->category,'id',$data['id'],$data)){
                 $arr = array(
                     'log_url'=>$this->uri->uri_string(),
                     'user_id'=>$_SESSION['users']['user_id'],
                     'username'=>$_SESSION['users']['username'],
                     'log_ip'=>get_client_ip(),
                     'log_status'=>'1',
                     'log_message'=>"修改行业类别成功,行业名称为".$data['cate_name'],
                 );
                 add_system_log($arr);
                 echo "<script>alert('操作成功！');window.location.href='".site_url('/Category/industry')."'</script>";                
             }else{
                 $arr = array(
                     'log_url'=>$this->uri->uri_string(),
                     'user_id'=>$_SESSION['users']['user_id'],
                     'username'=>$_SESSION['users']['username'],
                     'log_ip'=>get_client_ip(),
                     'log_status'=>'0',
                     'log_message'=>"修改行业类别失败,行业id为".$data['id'],
                 );
                 add_system_log($arr);
                 echo "<script>alert('操作失败！');window.location.href='".site_url('/Category/industry')."'</script>";                                
             }
         }else{
             $this->load->view('404.html');
         }
    }

    //删除行业
    function del_industry(){
         //判断是是否具有权限
         $q = $this->uri->uri_string();
         $ret =  if_user_power($q,$_SESSION['power']);
         if($ret == '0'){
             echo "3";
             exit;
         }

         if($_POST){
            $data = $this->input->post('id');
            if($this->public_model->delete($this->category,'id',$data)){
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=>$_SESSION['users']['user_id'],
                    'username'=>$_SESSION['users']['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'1',
                    'log_message'=>"删除行业类别成功,行业id为".$data,
                );
                add_system_log($arr);
                echo "1";                
            }else{
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=>$_SESSION['users']['user_id'],
                    'username'=>$_SESSION['users']['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'0',
                    'log_message'=>"删除行业类别失败,行业id为".$data['id'],
                );
                add_system_log($arr);
                echo "2";                                
            }
        }else{
                echo "2";
        }
    }


    //服务类别
    function service(){
         //获取行业类别
         $config['per_page'] = 10;
         //获取页码
         $current_page=intval($this->uri->segment(3));//index.php 后数第4个/
 
         //配置
         $config['base_url'] = site_url('/Category/industry');
 
         //分页配置
 
         $config['full_tag_open'] = '<ul class="am-pagination tpl-pagination">';
 
         $config['full_tag_close'] = '</ul>';
 
         $config['first_tag_open'] = '<li>';
 
         $config['first_tag_close'] = '</li>';
 
         $config['prev_tag_open'] = '<li>';
 
         $config['prev_tag_close'] = '</li>';
 
         $config['next_tag_open'] = '<li>';
 
         $config['next_tag_close'] = '</li>';
 
         $config['cur_tag_open'] = '<li class="am-active"><a>';
 
         $config['cur_tag_close'] = '</a></li>';
 
         $config['last_tag_open'] = '<li>';
 
         $config['last_tag_close'] = '</li>';
 
         $config['num_tag_open'] = '<li>';
 
         $config['num_tag_close'] = '</li>';
 
         $config['first_link']= '首页';
 
         $config['next_link']= '»';
 
         $config['prev_link']= '«';
 
         $config['last_link']= '末页';
         $config['num_links'] = 4;
         
         $total = count($this->public_model->select_where($this->category,'type','2','addtime'));
         $config['total_rows'] = $total;
     
         $this->load->library('pagination');//加载ci pagination类
         $listpage =  $this->public_model->select_page_where($this->category,'type','2',$current_page,$config['per_page'],'addtime');
         $this->pagination->initialize($config);
 
         $data = array('lists'=>$listpage,'pages' => $this->pagination->create_links());
        $this->load->view('industry/serviceType.html',$data);        

    } 
    //新增服务类型
    function add_service(){
        //判断是是否具有权限
        $q = $this->uri->uri_string();
        $ret = if_user_power($q,$_SESSION['power']);
        if($ret == '0'){
            echo "<script>alert('您暂无权限执行此操作！请联系系统管理员。');window.history.go(-1);</script>";
            exit;
        }

        if($_POST){
            $data = $this->input->post();
            if($this->public_model->insert($this->category,$data)){
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=>$_SESSION['users']['user_id'],
                    'username'=>$_SESSION['users']['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'1',
                    'log_message'=>"新增服务类别成功,服务名称为".$data['cate_name'],
                );
                add_system_log($arr);
                echo "<script>alert('操作成功！');window.location.href='".site_url('/Category/service')."'</script>";                
            }else{
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=>$_SESSION['users']['user_id'],
                    'username'=>$_SESSION['users']['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'0',
                    'log_message'=>"新增服务类别失败,服务名称为".$data['cate_name'],
                );
                add_system_log($arr);
                echo "<script>alert('操作失败！');window.location.href='".site_url('/Category/service')."'</script>";                                
            }
        }else{
            $this->load->view('404.html');
        }
    }

    //编辑服务
    function edit_service(){
         //判断是是否具有权限
         $q = $this->uri->uri_string();
         $ret =  if_user_power($q,$_SESSION['power']);
         if($ret == '0'){
             echo "<script>alert('您暂无权限执行此操作！请联系系统管理员。');window.history.go(-1);</script>";
             exit;
         }

        
         if($_POST){
             $data = $this->input->post();
             if($this->public_model->updata($this->category,'id',$data['id'],$data)){
                 $arr = array(
                     'log_url'=>$this->uri->uri_string(),
                     'user_id'=>$_SESSION['users']['user_id'],
                     'username'=>$_SESSION['users']['username'],
                     'log_ip'=>get_client_ip(),
                     'log_status'=>'1',
                     'log_message'=>"修改服务类别成功,服务名称为".$data['cate_name'],
                 );
                 add_system_log($arr);
                 echo "<script>alert('操作成功！');window.location.href='".site_url('/Category/service')."'</script>";                
             }else{
                 $arr = array(
                     'log_url'=>$this->uri->uri_string(),
                     'user_id'=>$_SESSION['users']['user_id'],
                     'username'=>$_SESSION['users']['username'],
                     'log_ip'=>get_client_ip(),
                     'log_status'=>'0',
                     'log_message'=>"修改服务类别失败,服务id为".$data['id'],
                 );
                 add_system_log($arr);
                 echo "<script>alert('操作失败！');window.location.href='".site_url('/Category/service')."'</script>";                                
             }
         }else{
             $this->load->view('404.html');
         }
    }

    //删除服务
    function del_service(){
         //判断是是否具有权限
         $q = $this->uri->uri_string();
         $ret =  if_user_power($q,$_SESSION['power']);
         if($ret == '0'){
             echo "3";
             exit;
         }

         if($_POST){
            $data = $this->input->post('id');
            if($this->public_model->delete($this->category,'id',$data)){
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=>$_SESSION['users']['user_id'],
                    'username'=>$_SESSION['users']['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'1',
                    'log_message'=>"删除服务类别成功,服务id为".$data,
                );
                add_system_log($arr);
                echo "1";                
            }else{
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=>$_SESSION['users']['user_id'],
                    'username'=>$_SESSION['users']['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'0',
                    'log_message'=>"删除服务类别失败,行业id为".$data['id'],
                );
                add_system_log($arr);
                echo "2";                                
            }
        }else{
                echo "2";
        }
    }


    //技术板块
    function technology(){
          //获取行业类别
          $config['per_page'] = 10;
          //获取页码
          $current_page=intval($this->uri->segment(3));//index.php 后数第4个/
  
          //配置
          $config['base_url'] = site_url('/Category/industry');
  
          //分页配置
  
          $config['full_tag_open'] = '<ul class="am-pagination tpl-pagination">';
  
          $config['full_tag_close'] = '</ul>';
  
          $config['first_tag_open'] = '<li>';
  
          $config['first_tag_close'] = '</li>';
  
          $config['prev_tag_open'] = '<li>';
  
          $config['prev_tag_close'] = '</li>';
  
          $config['next_tag_open'] = '<li>';
  
          $config['next_tag_close'] = '</li>';
  
          $config['cur_tag_open'] = '<li class="am-active"><a>';
  
          $config['cur_tag_close'] = '</a></li>';
  
          $config['last_tag_open'] = '<li>';
  
          $config['last_tag_close'] = '</li>';
  
          $config['num_tag_open'] = '<li>';
  
          $config['num_tag_close'] = '</li>';
  
          $config['first_link']= '首页';
  
          $config['next_link']= '»';
  
          $config['prev_link']= '«';
  
          $config['last_link']= '末页';
          $config['num_links'] = 4;
          
          $total = count($this->public_model->select_where($this->category,'type','3','addtime'));
          $config['total_rows'] = $total;
      
          $this->load->library('pagination');//加载ci pagination类
          $listpage =  $this->public_model->select_page_where($this->category,'type','3',$current_page,$config['per_page'],'addtime');
          $this->pagination->initialize($config);
  
          $data = array('lists'=>$listpage,'pages' => $this->pagination->create_links());
        
        $this->load->view('industry/technologyType.html',$data);
    }
    //新增技术类型
    function add_technology(){
            //判断是是否具有权限
            $q = $this->uri->uri_string();
            $ret = if_user_power($q,$_SESSION['power']);
            if($ret == '0'){
                echo "<script>alert('您暂无权限执行此操作！请联系系统管理员。');window.history.go(-1);</script>";
                exit;
            }
    
            if($_POST){
                $data = $this->input->post();
                if($this->public_model->insert($this->category,$data)){
                    $arr = array(
                        'log_url'=>$this->uri->uri_string(),
                        'user_id'=>$_SESSION['users']['user_id'],
                        'username'=>$_SESSION['users']['username'],
                        'log_ip'=>get_client_ip(),
                        'log_status'=>'1',
                        'log_message'=>"新增技术类别成功,技术名称为".$data['cate_name'],
                    );
                    add_system_log($arr);
                    echo "<script>alert('操作成功！');window.location.href='".site_url('/Category/technology')."'</script>";                
                }else{
                    $arr = array(
                        'log_url'=>$this->uri->uri_string(),
                        'user_id'=>$_SESSION['users']['user_id'],
                        'username'=>$_SESSION['users']['username'],
                        'log_ip'=>get_client_ip(),
                        'log_status'=>'0',
                        'log_message'=>"新增技术类别失败,技术名称为".$data['cate_name'],
                    );
                    add_system_log($arr);
                    echo "<script>alert('操作失败！');window.location.href='".site_url('/Category/technology')."'</script>";                                
                }
            }else{
                $this->load->view('404.html');
            }
        }
    
        //编辑技术
        function edit_technology(){
             //判断是是否具有权限
             $q = $this->uri->uri_string();
             $ret =  if_user_power($q,$_SESSION['power']);
             if($ret == '0'){
                 echo "<script>alert('您暂无权限执行此操作！请联系系统管理员。');window.history.go(-1);</script>";
                 exit;
             }
    
            
             if($_POST){
                 $data = $this->input->post();
                 if($this->public_model->updata($this->category,'id',$data['id'],$data)){
                     $arr = array(
                         'log_url'=>$this->uri->uri_string(),
                         'user_id'=>$_SESSION['users']['user_id'],
                         'username'=>$_SESSION['users']['username'],
                         'log_ip'=>get_client_ip(),
                         'log_status'=>'1',
                         'log_message'=>"修改技术类别成功,技术名称为".$data['cate_name'],
                     );
                     add_system_log($arr);
                     echo "<script>alert('操作成功！');window.location.href='".site_url('/Category/technology')."'</script>";                
                 }else{
                     $arr = array(
                         'log_url'=>$this->uri->uri_string(),
                         'user_id'=>$_SESSION['users']['user_id'],
                         'username'=>$_SESSION['users']['username'],
                         'log_ip'=>get_client_ip(),
                         'log_status'=>'0',
                         'log_message'=>"修改技术类别失败,服务id为".$data['id'],
                     );
                     add_system_log($arr);
                     echo "<script>alert('操作失败！');window.location.href='".site_url('/Category/technology')."'</script>";                                
                 }
             }else{
                 $this->load->view('404.html');
             }
        }
    
        //删除服务
        function del_technology(){
             //判断是是否具有权限
             $q = $this->uri->uri_string();
             $ret =  if_user_power($q,$_SESSION['power']);
             if($ret == '0'){
                 echo "3";
                 exit;
             }
    
             if($_POST){
                $data = $this->input->post('id');
                if($this->public_model->delete($this->category,'id',$data)){
                    $arr = array(
                        'log_url'=>$this->uri->uri_string(),
                        'user_id'=>$_SESSION['users']['user_id'],
                        'username'=>$_SESSION['users']['username'],
                        'log_ip'=>get_client_ip(),
                        'log_status'=>'1',
                        'log_message'=>"删除技术类别成功,技术id为".$data,
                    );
                    add_system_log($arr);
                    echo "1";                
                }else{
                    $arr = array(
                        'log_url'=>$this->uri->uri_string(),
                        'user_id'=>$_SESSION['users']['user_id'],
                        'username'=>$_SESSION['users']['username'],
                        'log_ip'=>get_client_ip(),
                        'log_status'=>'0',
                        'log_message'=>"删除技术类别失败,技术id为".$data['id'],
                    );
                    add_system_log($arr);
                    echo "2";                                
                }
            }else{
                    echo "2";
            }
        }




}