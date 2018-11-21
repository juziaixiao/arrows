<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/11/12 0012
 * Time: 23:02
 */

namespace app\api\service;


use app\lib\exception\TokenException;
use think\facade\Cache;
use think\facade\Session;
use think\facade\Config;
class JApi
{
    private $sendUrl = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=%s&type=jsapi";

    function __construct()
    {
        $accessToken = new AccessToken();
        $token = $accessToken->get();
        $this->sendUrl = sprintf($this->sendUrl, $token);
    }
        /*
         * 获取jsapiticket
         */
    public function getJapi($uid){
        $api_ticket=$this->getFromcache($uid);
        if(!$api_ticket){
            $api_ticket=  $this->getFromserver($uid);
        }
        return $api_ticket;
    }
    /*
     * 重新生成jsapiticket
     */
    public function getFromserver($uid)
    {

        $result=curl_get( $this->sendUrl);
        // dump(curl_get( $this->sendUrl));exit;
        $result = json_decode($result, true);
       if($result['errmsg']=='ok'){
           Cache::set($uid.'jsapi',$result['ticket'],$result['expires_in']);
           return $result['ticket'];
       }else{
           throw new TokenException([
               'code'=>500,
               'msg'=>'获取jsapi_ticket失败',
               'errorCode'=>20001
           ]);
       }

    }
        /*
         * 缓存中获取jsapiticket
         */
    public function getFromcache($uid)
    {

     $api_ticket= Cache::get($uid.'jsapi');
     return $api_ticket;
    }


    public function getJapiConfig(){
        $session_jsapi=Session::get('session_jsapi');
        if(!$session_jsapi){
            $arr_jsapi= [
                'timestamp'=>time(),
                'nonce_str'=>Config::get('secure.token_salt'),
                 'appid'=>Config::get('wx.appid'),
            ];
            Session::set('session_jsapi',$arr_jsapi);
        }

        Session::set('session_jsapi.timestamp',time());
        $session_jsapi=Session::get('session_jsapi');
        
        return $session_jsapi;

    }
}