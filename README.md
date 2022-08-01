<!--

 * @Date: 2022-08-01 12:00:00
 * @LastEditors: Originat
 * @LastEditTime: 2022-08-01 14:15:25
   -->

# 使用 Fly.io 安装

1. 下载 [ARPT-Bot-fly.io](https://github.com/Originat/ARPT-Bot-paas/archive/refs/heads/main.zip)
2. 解压后，找到 `fly.toml` 文件，修改 fly.toml 文件
3. 在有 `fly.toml` 文件夹下，打开 cmd 命令界面，执行 `fly deploy`，这会应网络问题而失败，需多推送几次才能成功。

修改 fly.toml 文件，如下：

```markdowm
app = "xxx"                  # 修改为自己创建应用程序的名字
kill_signal = "SIGINT"
kill_timeout = 5
processes = []

[env]
  Api_hash = "xxx"           # 在https://my.telegram.org中注册应用后得到
  Api_id = "xxx"             # 在https://my.telegram.org中注册应用后得到
  Aria2_secret = "xxx"       # Aria2的密匙 （最好设置为字母大小写和数字组合）
  Remote = "xxx"             # 上传目的地的rclone盘符
  Telegram_bot_api = "xxx"   # Bot的API，在@BotFather申请获得
  Telegram_user_id = "xxx"   # 使用者的TG id，可在@userinfobot处获得
  Upload = "xxx"             # 上传文件夹名称，后面不需要加/
  Rclone_share = "False"
  Error_user_info = "你没有使用权限"

```

配置解释：

```markdowm
Api_hash、Api_id  这两项在https://my.telegram.org中注册应用后得到

Aria2_secret    Aria2的密匙 （最好设置为字母大小写和数字组合）

Telegram_bot_api    Bot的API，在@BotFather申请获得

Telegram_user_id    使用者的TG id（个人使用），可在@userinfobot处获得，设置为群组ID则该群组所有人员可用（多人使用），需要设置Bot的群组权限

Remote  上传目的地的rclone盘符 （安装rclone后，在手动运行 rclone config 时起的名字时需一致）

Upload  上传文件夹名称，后面不需要加/ (需要上传到网盘的文件夹名称)

Rclone_share 可不填，True 为上传网盘后返回分享链接(onedrive)，False 为关闭该功能，不设置该变量则默认关闭

Error_user_info 可不填，可设置非允许使用者发送消息时的提示，不设置该变量则使用默认语句

```

在Docker运行后访问ip:port访问文件管理器，~~在/.config/rclone下文件夹新建rclone.conf,粘贴自己的rclone配置。~~
PS:有人反馈此处配置不成功，可尝试在/root/.config/rclone也添加配置，bot运行 **/rclone 盘符:** ，可以查看是否成功
关于上传方法，将.conf文件拖入浏览器即可。

# Bot command

通过在 **@BotFather** 设置命令

```markdown
start - 查看Bot状态
help - 获取Bot的使用帮助
pixivauthor - 对pixiv画师作品操作
pixivtopall - 对pixiv排行榜进行操作
pixivtopillust - 对插画排行榜进行操作
pixivpid - 发送pixiv该id的图片
magfile - 推送种子文件至aria2下载后上传至网盘
mirror - 推送直链至aria2下载上传至网盘
mirrortg - 推送直链至aria2下载发送到TG
magnet - 推送磁力链接至aria2下载后上传至网盘
downtgfile - 发送TG文件并上传至网盘
rclonecopy - 用rclone在网盘间传输
rclonelsd - 用rclone显示网盘文件夹
rclone - 用rclone显示文件夹内详细信息
rclonecopyurl - 用rclonecopyurl的方式直接上传直链文件
getfileid - 发送文件获取fileid
getfile - 发送fileid来获取文件
video - 发送视频链接
neteaseid - 通过id获取歌曲信息
searchsong - 搜索网易云音乐歌曲
playlist - 获取歌单信息
odshare - 下载公开的od、sp分享链接文件并上传网盘
odprivate - 下载域内的od、sp分享链接上传到网盘
nhentai - 下载nhentai中对应id的本子
ehentai - 下载nhentai中对应id的本子
picacgsearch - 在哔咔中搜索本子，支持ZIP上传到网盘和发送到TG
ehentaisearch - 在ehentai中搜索本子，支持ZIP上传到网盘和发送到TG、发送网页
nhentaisearch - 在nhentai中搜索本子，支持ZIP上传到网盘和发送到TG、发送网页
```

# 基于项目

- [666wcy/ARPT-Bot](https://github.com/666wcy/ARPT-Bot)
