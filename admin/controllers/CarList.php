<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require_once(APPPATH.'controllers/Public_Controller.php');
// 分类类别
class CarList extends Public_Controller
{
	public $car = "h_system_carlist";
    function __construct() {
        parent::__construct();
    }


    function index(){
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
        
        $total = count($this->public_model->select($this->car,'create_time,car_state'));
        $config['total_rows'] = $total;
    
        $this->load->library('pagination');//加载ci pagination类
        $listpage =  $this->public_model->select_page($this->car,$current_page,$config['per_page'],'create_time,car_state');
        $this->pagination->initialize($config);

        $data = array('lists'=>$listpage,'pages' => $this->pagination->create_links());

        $this->load->view('carList/carList.html',$data);
    }

    //新增车辆
    function addCar(){
    	if($_POST){
    		$data = $this->input->post();
    		$data['create_time'] = date('Y-m-d H:i:s');
    		if($this->public_model->insert($this->car,$data)){
    			 $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=>$_SESSION['users']['user_id'],
                    'username'=>$_SESSION['users']['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'1',
                    'log_message'=>"新增车辆成功,车牌号为".$data['license_plate'],
                );
                add_system_log($arr);
                echo "<script>alert('操作成功！');window.location.href='".site_url('/CarList/index')."'</script>"; 
    		}else{
    			$arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=>$_SESSION['users']['user_id'],
                    'username'=>$_SESSION['users']['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'0',
                    'log_message'=>"新增车辆失败,车牌号为".$data['license_plate'],
                );
                add_system_log($arr);
                echo "<script>alert('操作失败！');window.location.href='".site_url('/CarList/index')."'</script>"; 
    		}
    	}
    }
    //编辑车辆
    function editCar(){
    	if($_POST){
    		$data = $this->input->post();
    		$data['create_time'] = date('Y-m-d H:i:s');
    		if($this->public_model->updata($this->car,'id',$data['id'],$data)){
    			 $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=>$_SESSION['users']['user_id'],
                    'username'=>$_SESSION['users']['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'1',
                    'log_message'=>"编辑车辆成功,车牌号为".$data['license_plate'],
                );
                add_system_log($arr);
                echo "<script>alert('操作成功！');window.location.href='".site_url('/CarList/index')."'</script>"; 
    		}else{
    			$arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=>$_SESSION['users']['user_id'],
                    'username'=>$_SESSION['users']['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'0',
                    'log_message'=>"编辑车辆失败,车牌号为".$data['license_plate'],
                );
                add_system_log($arr);
                echo "<script>alert('操作失败！');window.location.href='".site_url('/CarList/index')."'</script>"; 
    		}
    	}	
    }

    //删除车辆
    function delCar(){
    	if($_POST){
    		$data = $this->input->post('id');
            if($this->public_model->delete($this->car,'id',$data)){
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=>$_SESSION['users']['user_id'],
                    'username'=>$_SESSION['users']['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'1',
                    'log_message'=>"删除车辆成功,车辆编号id为".$data,
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
                    'log_message'=>"删除车辆失败,车辆编号id为".$data,
                );
                add_system_log($arr);
                echo "2";                                
            }
    	}
    }

}