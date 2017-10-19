<?php
//分类
function subtree($arr,$a = '',$id=0,$lev=1) {
    $subs = array(); // 子孙数组
    foreach($arr as $k=>$v) {
        if(!empty($a)){
            if(deep_in_array($v['url'],$a)){
                 $v['true'] = '1';
            }else{
                $v['true'] = '0';
            }   
        }         
        if($v['pid'] == $id) {
            $v['lev'] = $lev;
            $subs[] = $v; // 举例说找到array('id'=>1,'name'=>'安徽','parent'=>0),
            $subs = array_merge($subs,subtree($arr,$a,$v['id'],$lev+1));
        }
    }
    return $subs;
}
function deep_in_array($value, $array) {   
    foreach($array as $item) {   
        if(!is_array($item)) {   
            if ($item == $value) {  
                return true;  
            } else {  
                continue;   
            }  
        }   
            
        if(in_array($value, $item)) {  
            return true;      
        } else if(deep_in_array($value, $item)) {  
            return true;      
        }  
    }   
    return false;   
}


//返回ip
function get_client_ip() {
    $ip = $_SERVER['REMOTE_ADDR'];
    if (isset($_SERVER['HTTP_CLIENT_IP']) && preg_match('/^([0-9]{1,3}\.){3}[0-9]{1,3}$/', $_SERVER['HTTP_CLIENT_IP'])) {
        $ip = $_SERVER['HTTP_CLIENT_IP'];
    } elseif(isset($_SERVER['HTTP_X_FORWARDED_FOR']) AND preg_match_all('#\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}#s', $_SERVER['HTTP_X_FORWARDED_FOR'], $matches)) {
        foreach ($matches[0] AS $xip) {
            if (!preg_match('#^(10|172\.16|192\.168)\.#', $xip)) {
                $ip = $xip;
                break;
            }
        }
    }
    return $ip;
}

//系统日志
function add_system_log($data){
    $CI = &get_instance();
    $CI->db->insert('h_system_log',$data);
    return true;
}

//判断权限是否拥有
function if_user_power($q,$power){
    $url = preg_replace('|[0-9]+|','',$q);
    if(substr($url,-1) == '/'){
        $url = substr($url,0,-1);
    }
    $user_power = json_decode($power,TRUE);
    if(!deep_in_array($url,$user_power)){
        return "0";
        
    }  else{
        return '1';
    }
}

//获取行业名称
function get_industryTitle($id){
    $CI = &get_instance();
    $a = $CI->db->query("select * from h_category where id ='$id'");
    $ret = $a->row_array();
    return $ret['cate_name'];
}

//获取职员组名称
function get_user_group($gid){
    $CI = &get_instance();
    $a = $CI->db->query("select * from h_user_group where gid ='$gid'");
    $ret = $a->row_array();
    return $ret['group_name'];
}


//获取用户名称
function get_username($userid){
     $CI = &get_instance();
    $a = $CI->db->query("select * from h_user_member where user_id ='$userid'");
    $ret = $a->row_array();
    return $ret['username'];
}

//获取收支信息
function ret_contract_price($type,$contractid){
     $CI = &get_instance();
    $a = $CI->db->query("select * from h_contract_account where type ='$type' and contract_id='$contractid'");
    $ret = $a->result_array();
    $price = '0';
    foreach ($ret as $key => $value) {
        $price += $value['price'];
    }
    return $price;

}

//返回合同号   合同名称
function ret_contract_number($cotractid){
      $CI = &get_instance();
    $a = $CI->db->query("select * from h_contract where contract_id ='$cotractid'");
    $ret = $a->row_array();
    return $ret['contract_number'];

}
//获取联系人地址
function get_customer_address($c_id){
    $CI = &get_instance();
    $a = $CI->db->query("select * from h_contract where contract_id ='$c_id'");
    $ret = $a->row_array();
    $b = $CI->db->query("select * from h_customer where id = '".$ret['customer_id']."'");
    $res = $b->row_array();
    return $res['address'];
}
function get_customer_name($c_id){
    $CI = &get_instance();
  
    $c = $CI->db->query("select * from h_customer_contacts where id = '$c_id'");
        $res = $c->row_array();

    return $res['name'];
}
//获取客户名称
function get_customerName($c_id){
    $CI = &get_instance();
  
    $c = $CI->db->query("select * from h_customer where id = '$c_id'");
        $res = $c->row_array();

    return $res['title'];
}


?>