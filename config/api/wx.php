<?php
/**
 * Created by Kenneth Luff.
 * Author: Kenneth Luff
 * Email: kennethluff@outlook.com
 */

return [
    //  +---------------------------------
    //  微信相关配置
    //  +---------------------------------

    // 小程序app_id +app_secret
    'app_id' =>'wxa3d90b450ebb5dfd',
    'app_secret' =>'b14fc8f8deea233580bcecdeb191e6fe',


    /*
     * 公众号：
     * appid：wxa3d90b450ebb5dfd
     * app_secret：b14fc8f8deea233580bcecdeb191e6fe
     */
  /*juzi:
   * wx92796db25c0c716f
   * e1bbaafed240e210baed249f6c68a0a5
   */


    // 微信获取access_token的url地址
    'access_token_url' => "https://api.weixin.qq.com/cgi-bin/token?" .
        "grant_type=client_credential&appid=%s&secret=%s",
    // 用户获取code码地址


    'login_code'=>"https://open.weixin.qq.com/connect/oauth2/authorize?appid=%s&redirect_uri=%s&response_type=code&scope=snsapi_userinfo&state=1#wechat_redirect",
    //'login_url'=>'https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=%s&secret=%s',


    // 微信使用code换取用户openid及session_key的url地址
    //'login_url' => "https://api.weixin.qq.com/sns/jscode2session?" .
      //  "appid=%s&secret=%s&js_code=%s&grant_type=authorization_code",
    'login_url'=>"https://api.weixin.qq.com/sns/oauth2/access_token?appid=%s&secret=%s&code=%s&grant_type=authorization_code"





];
