Const confp = ".\data\data.dat"
const version = 131.1
tempPath = Plugin.Sys.GetDir(3)
If Right(tempPath, 1) <> "/" and Right(tempPath, 1) <> "\" Then 
    tempPath = tempPath & "\"
End If
mylogName = Replace(Replace(Now, "/", "_"), ":","_") & ".log"
mylogPath = tempPath & mylogName


' *******************************************    更新APP代码     *******************************************

' ********************************************  配置模块 -start- ********************************************
Sub Set_config()
    Call Full_config("SysInfo", "seriesno", "", confp)
    Call Full_config("SysInfo", "username", "", confp)
    Call Full_config("SysInfo", "password", "", confp)
    Call Full_config("SysInfo", "studyid", "", confp)
    If Plugin.File.IsFileExist("C:\Program Files (x86)\MuMu\emulator\nemu\EmulatorShell\NemuPlayer.exe") Then
        Call Plugin.File.WriteINI("SysInfo", "mumupath", "C:\Program Files (x86)\MuMu\emulator\nemu\EmulatorShell\NemuPlayer.exe", confp)
    ElseIf Plugin.File.IsFileExist("C:\Program Files\MuMu\emulator\nemu\EmulatorShell\NemuPlayer.exe") Then
        Call Plugin.File.WriteINI("SysInfo", "mumupath", "C:\Program Files\MuMu\emulator\nemu\EmulatorShell\NemuPlayer.exe", confp)
    Else 
        Call Full_config("SysInfo", "mumupath", "", confp)
    End If
    Call Plugin.File.WriteINI("SysInfo", "mumuname", "MuMu模拟器", confp)
    Call Plugin.File.WriteINI("UserSettings", "Endprogram", "0", confp)
    Call Plugin.File.WriteINI("UserSettings", "comment_content", "不忘初心, 牢记使命。|不忘初心, 方得始终。|不忘初心, 继续前行。", confp)
    ' Call Plugin.File.WriteINI("UserSettings", "comment_content", "不忘初心, 砥砺前行！|不忘初心, 继续前行。|不忘初心, 方得始终。|踏踏实实, 兢兢业业。|祖国强大, 人民幸福。|实事求是, 为国为民。|同心同德, 共创复兴大计。|认真履行职责, 强化使命担当。|增强四个意识, 坚定四个自信。|人民有信心, 国家有未来。|我们都在努力奔跑, 我们都是追梦人。|人民是共和国的坚实根基！|我们过得很充实、走得很坚定|大家要一起拼搏、一起奋斗。", confp)
    ' 学习机参数。需要阅读的文章视频的个数和时长
    Call Plugin.File.WriteINI("UserSettings", "watch_num", "8", confp)
    Call Plugin.File.WriteINI("UserSettings", "watch_time", "3600", confp)
    Call Plugin.File.WriteINI("UserSettings", "read_num", "8", confp)
    Call Plugin.File.WriteINI("UserSettings", "read_time", "2400", confp)
    Call Plugin.File.WriteINI("UserSettings", "mumu_start_delay", "25", confp)
    Call Plugin.File.WriteINI("UserSettings", "app_start_delay", "20", confp)
    Call Plugin.File.WriteINI("UserSettings", "is_comment", "-1", confp)
    Call Plugin.File.WriteINI("UserSettings", "is_share", "-1", confp)
    Call Plugin.File.WriteINI("UserSettings", "is_auto", "0", confp)
    Call Plugin.File.WriteINI("UserSettings", "is_everyday", "0", confp)
    Call Plugin.File.WriteINI("UserSettings", "autotime", "6:0:0", confp)

    ' // 点击网络延迟   等网速反应过来   不然会出错
    Call Plugin.File.WriteINI("Param", "net_delay", "3000", confp)
    '// APP主色调  红色   
    Call Plugin.File.WriteINI("Param", "main_red_rgb", "1624E3", confp)
    Call Plugin.File.WriteINI("Param", "ch_bg_rgb", "EFF1FE", confp)
    Call Plugin.File.WriteINI("Param", "main_info_rgb", "FA9632", confp)
    '//判断视频前的延时, 越长准确性越高
    Call Plugin.File.WriteINI("Param", "pre_video_sec", "20", confp)
    ' 判断登录页面
    Call Plugin.File.WriteINI("Param", "login_noinput_rgb", "9897FE", confp) '// 判断登录页面  "9897FE"  未输入密码时登录框的颜色
    Call Plugin.File.WriteINI("Param", "login_input_rgb", "1624E3", confp) '// 判断登录页面是否可以按下  已输入密码时登录框的颜色  3E3CF3

' ================================    位置信息 ·start·   ================================================================ 
    'mumu模拟器界面找APP的颜色值
    Call Plugin.File.WriteINI("Param", "app_comfirm_rgb", "0203D1", confp)
    Call Plugin.File.WriteINI("Param", "mumu_app_rect", "10|10|90|80", confp)
    Call Plugin.File.WriteINI("Param", "mumu_banner_home_rgb", "AAA6A5", confp)
    ' Call Plugin.File.WriteINI("Param", "make_focus_pos", "23|6", confp) '// 点击APP某处, 确保程序处于焦点

    '判断文章详情的颜色
    Call Plugin.File.WriteINI("Param", "art_judge_rgb", "FCFBFA", confp)
    ' // 状态栏   返回按钮 和 个人积分按钮    todo分辨率相关
    Call Plugin.File.WriteINI("Param", "app_back_pos", "6|6", confp)
    ' // 顶部频道栏     todo可改写  绝对地址
    Call Plugin.File.WriteINI("Param", "active_ch_rgb", "1725E3", confp)
    Call Plugin.File.WriteINI("Param", "unactive_ch_rgb", "87817C", confp)
    Call Plugin.File.WriteINI("Param", "ch_1_pos_x", "7.5", confp)
    Call Plugin.File.WriteINI("Param", "chs_man_pos_x", "95", confp)
    ' // 底下栏目栏Y轴范围   'todo 可改写绝对地址
    Call Plugin.File.WriteINI("Param", "app_col_rgb", "3130FF", confp)
    Call Plugin.File.WriteINI("Param", "app_col_study_pos_x", "50", confp)
    Call Plugin.File.WriteINI("Param", "app_col_video_pos_x", "70", confp)
    '//评论部分
    Call Plugin.File.WriteINI("Param", "comment_rgb", "F5F3F2", confp)
    Call Plugin.File.WriteINI("Param", "share_to_rect", "0|60|100|90", confp)
    Call Plugin.File.WriteINI("Param", "share_to_sms_rgb", "95C217", confp)
    Call Plugin.File.WriteINI("Param", "submit_rect", "90|80|98|98", confp)
    Call Plugin.File.WriteINI("Param", "submit_rgb", "1624E3", confp)
    ' //视频详情播放页面  红色进度条  的Y轴范围和  RGB值
    Call Plugin.File.WriteINI("Param", "video_bar_rgb", "1624E3", confp)
    ' // 未读文章区域 rgb
    Call Plugin.File.WriteINI("Param", "nr_rect", "13|16|17.5|92", confp)
    Call Plugin.File.WriteINI("Param", "nr_rgb", "404040", confp)
End Sub
' ********************************************  配置模块 -End-  ********************************************

' ********************************************  读取配置模块 -start-  ********************************************
Sub Read_config()
    Dim IsFile
    IsFile = Plugin.File.IsFileExist(confp) 
    If IsFile = False Then 
    	Confirm_file(confp)
		Call Set_config()
    End If
    sn = Plugin.File.ReadINI("SysInfo", "seriesno", confp) 
    ' version = Plugin.File.ReadINI("SysInfo", "version", confp) 
    username = Plugin.File.ReadINI("SysInfo", "username", confp) 
    password = Plugin.File.ReadINI("SysInfo", "password", confp) 
    studyid = Plugin.File.ReadINI("SysInfo", "studyid", confp) 
    mumu_path = Plugin.File.ReadINI("SysInfo", "mumupath", confp) 
    mumuname = Plugin.File.ReadINI("SysInfo", "mumuname", confp) 
    Endcode = S2N(Plugin.File.ReadINI("UserSettings", "Endprogram", confp))
    com_content = split(Plugin.File.ReadINI("UserSettings", "comment_content", confp),"|")
    ' 学习机参数。需要阅读的文章视频的个数和时长(秒)
    video_watch_num = S2N(Plugin.File.ReadINI("UserSettings", "watch_num", confp)) '//"8", confp))
    video_watch_time = S2N(Plugin.File.ReadINI("UserSettings", "watch_time", confp)) '//"3120", confp))
    art_read_num = S2N(Plugin.File.ReadINI("UserSettings", "read_num", confp)) '//"8", confp))
    art_read_time = S2N(Plugin.File.ReadINI("UserSettings", "read_time", confp)) '//"2080", confp))
    mumu_start_t = S2N(Plugin.File.ReadINI("UserSettings", "mumu_start_delay", confp))
    app_start_t = S2N(Plugin.File.ReadINI("UserSettings", "app_start_delay", confp))
    is_comment = S2N(Plugin.File.ReadINI("UserSettings", "is_comment", confp))
    is_share = S2N(Plugin.File.ReadINI("UserSettings", "is_share", confp))
    is_auto = S2N(Plugin.File.ReadINI("UserSettings", "is_auto", confp))
    is_everyday = S2N(Plugin.File.ReadINI("UserSettings", "is_everyday", confp))
    autotime = Plugin.File.ReadINI("UserSettings", "autotime", confp)
    ' 判断登录页面
    login_noinput_rgb = Plugin.File.ReadINI("Param", "login_noinput_rgb", confp) '// 判断登录页面  "9897FE"  未输入密码时的颜色
    login_input_rgb = Plugin.File.ReadINI("Param", "login_input_rgb", confp) '// 判断登录页面  "1624E3"  已输入密码时的颜色
    ' // 点击网络延迟  等网速反应过来   建议稍微大一点 
    net_delay = S2N(Plugin.File.ReadINI("Param", "net_delay", confp)) '//"2000", confp))
    main_red_rgb = Plugin.File.ReadINI("Param", "main_red_rgb", confp) '//"1624E3", confp))
    main_info_rgb = Plugin.File.ReadINI("Param", "main_info_rgb", confp) 
    ch_bg_rgb = Plugin.File.ReadINI("Param", "ch_bg_rgb", confp) '//"EFF1FE", confp))
    app_comfirm_rgb = Plugin.File.ReadINI("Param", "app_comfirm_rgb", confp) '//'mumu模拟器界面找APP的颜色值      "0203D1"
    mumu_app_rect = S2N(Plugin.File.ReadINI("Param", "mumu_app_rect", confp)) '//"14|20|85|57", confp))
    mumu_banner_home_rgb = Plugin.File.ReadINI("Param", "mumu_banner_home_rgb", confp) '//"AAA6A5", confp)

    pre_video_sec = S2N(Plugin.File.ReadINI("Param", "pre_video_sec", confp)) '//"25" '//判断视频前的延时, 越长准确性越高
    art_judge_rgb = Plugin.File.ReadINI("Param", "art_judge_rgb", confp) '//"FCFBFA" '判断文章详情的颜色
    app_back_pos = S2N(Plugin.File.ReadINI("Param", "app_back_pos", confp)) '//"6|6",   返回按钮
    active_ch_rgb = Plugin.File.ReadINI("Param", "active_ch_rgb", confp) '//"1725E3"  '// 当前频道的颜色(红色)
    unactive_ch_rgb = Plugin.File.ReadINI("Param", "unactive_ch_rgb", confp) '//"87817C"  未激活频道的颜色  todo
    ch_1_pos_x = S2N(Plugin.File.ReadINI("Param", "ch_1_pos_x", confp)) '//"7.5"  最左边频道的X位置
    chs_man_pos_x = S2N(Plugin.File.ReadINI("Param", "chs_man_pos_x", confp)) '//"95"  频道管理的X位置
    ' // 内容区Y轴范围    
    ' app_col_Y = S2N(Plugin.File.ReadINI("Param", "app_col_Y", confp)) '//"95"   底下栏目栏y
    app_col_rgb = Plugin.File.ReadINI("Param", "app_col_rgb", confp) '//"3130FF"   底下栏目栏激活颜色
    app_col_study_pos_x = S2N(Plugin.File.ReadINI("Param", "app_col_study_pos_x", confp)) '//"50"  学习栏目X值
    app_col_video_pos_x = S2N(Plugin.File.ReadINI("Param", "app_col_video_pos_x", confp)) '//"70", 视频栏目X值
    '//评论部分
    comment_rgb = Plugin.File.ReadINI("Param", "comment_rgb", confp) '//"F5F3F2"  
    share_to_rect = S2N(Plugin.File.ReadINI("Param", "share_to_rect", confp))'"0|60|100|90", 
    share_to_sms_rgb = Plugin.File.ReadINI("Param", "share_to_sms_rgb", confp)'"95C217", 
    submit_rect = S2N(Plugin.File.ReadINI("Param", "submit_rect", confp)) '//"92|83|94|92" 
    submit_rgb = Plugin.File.ReadINI("Param", "submit_rgb", confp) '//"1624E3"  
    ' //视频详情播放页面   红色进度条 的Y轴范围和 RGB值
    video_bar_rgb = Plugin.File.ReadINI("Param", "video_bar_rgb", confp) '//"1E2CE2"  
    ' // 未读文章区域  颜色
    nr_rect = S2N(Plugin.File.ReadINI("Param", "nr_rect", confp)) '//"14.08|15.44|17.42|93.02"  
    nr_rgb = Plugin.File.ReadINI("Param", "nr_rgb",  confp) '"404040",
End Sub

' 如果所选节键的值为空或者不存在, 提示用户输入, 并写入配置
Function Check_read(section, key, path)
    Dim val
    val = Plugin.File.ReadINI(section, key, path)
    If val = "" Then
        MsgBox "尚未设置参数" & key & ", 请先设置再启动"
        Call Mylog("尚未设置参数" & key & ", 请先设置再启动")
        ExitScript
    End If
    Check_config = val
End Function

' 如果所选节键的值为空或者不存在, 才写入value
Sub Full_config(section, key, value, path) 
    If Plugin.File.ReadINI(section, key, path) = "" Then
        Call Plugin.File.WriteINI(section, key, value, path)
    End If
End Sub
' ********************************************  读取配置模块 -End- ********************************************

' *****************************  参数初始化  ***************************
Sub init_param()
    ' // 鼠标按键码
    Const home_key = 36:Const left_click_down = 32769:Const left_click_up = 32770:Const right_click_down = 32773:Const right_click_up = 32774:Const mid_click_down = 32777:Const wheel_down = 32781:Const wheel_up = 23782
    '// 判断页面状态码
    Const app_art_f = 1 : const app_video_f = 2 : const app_other_f = 3 
    Const detail_art_f =11 : const detail_video_f = 100 'detail_video_f 是一个基数, 大于100说明是一个视频, 视频时长为该status-100的值
    Const score_page_f = 21 : const score_fail_f = 22
    Const other_f = 99
    Const no_regist = "学习机未注册激活, 请注册激活"
    Const expire_date = "已到期, 请激活"
    main_error = 1  ' 没有错误
    get_vbar_delay = 5  ' delay of  Get_video_bar_absY() to ensure get the video_bar_absY
    main_info_abspos = Array(-1, -1)
    video_bar_scale_absY = Array(-1, -1)
    main_menu_scale_absY = Array(-1, -1)
    ch_scale_absY = Array(-1, -1)
    body_scale_absY = Array(-1, -1)
    col_scale_absY = Array(-1, -1)
    last_study_date = Date '判断今天是否已经学习过了。默认今天已经学习过了

    ' // 读取用户设置
    Call Read_config()
    ' // 创建用户学习记录文件夹
    usererrdir = ".\" & username & "\error"
    userlogdir = ".\" & username & "\log"
    Call Confirm_dir(usererrdir)
    Call Confirm_dir(userlogdir)

    '  // 句柄初始化
    mhwnd_str = Plugin.Window.Search(mumuname)
    If InStr(mhwnd_str, "|") Then 
        mumu_hd = split(mhwnd_str,"|")(0)
        middle_hd = Plugin.Window.FindEx(mumu_hd, 0, 0, 0)
        app_hd = Plugin.Window.FindEx(middle_hd, 0, 0, 0)  '// xxqg app窗口句柄
        app_rect = split(Plugin.Window.GetClientRect(app_hd), "|")
        appx = CLng(app_rect(0)) : appy = CLng(app_rect(1)) : appw = CLng(app_rect(2)) : apph = CLng(app_rect(3))
        app_window = S2N(Plugin.Window.GetWindowRect(app_hd))
    End If
End Sub

Sub Wait_mainpage()
    Dim i
    i = 0
    Do while Plugin.Color.CountColor(appx, appy, appx + appw - 1, appy + 0.15 * apph, main_red_rgb, 1) < 10000
        Delay net_delay
        i = i + 1
        If i > 100 Then
            main_error = 111
            Call Mylog("Error111, can't wait main to get global variables. ")
            Call end_program(0)
            ExitScript
        End If
    Loop
End Sub

' 获得全局变量参数
Sub Get_global()
    Call Wait_mainpage()
    Dim jj, intX, intY  ', end_main_menuY, start_chY, end_chY, start_bodyY, end_bodyY, start_colY
    ' 主页面banner栏
    For jj = appy  To appy + apph Step 3
        IfColor appx + 1, jj, "1624E3", 1 Then
            end_main_menuY = jj - 3
            start_chY = jj + 3
            Exit For
        End If
    Next
    main_menu_scale_absY = Array(appy, end_main_menuY)
    ' 主页面banner栏Y轴范围  个人信息位置  蓝色小圆圈
    FindColorEx appx, appy, appx + appw - 1, end_main_menuY, main_info_rgb, 2, 0.9, intX, intY
    If intX > 0 and intY > 0 Then
        main_info_abspos(0) = intX
        main_info_abspos(1) = intY
    End If
    ' 频道栏Y轴范围
    For jj = jj + 3 To appy + apph Step 3
        IfColor appx + 1, jj, "EFF1FE", 1 Then
            end_chY = jj - 3
            start_bodyY = jj + 5
            Exit For
        End If
    Next
    ch_scale_absY = Array(start_chY, end_chY)
    ' 身体栏Y轴范围
    For jj = CInt(appy + apph * 0.97) To CInt(appy + apph * 0.8) Step -1
        IfColor appx + 1, jj, "FFFFFF", 1 Then
            end_bodyY = jj - 5
            start_colY = jj + 3
            Exit For
        End If
    Next
    body_scale_absY = Array(start_bodyY, end_bodyY)
    
    col_scale_absY = Array(start_colY, appy + apph - 1)
    If end_main_menuY <= 0 or end_chY > appy + apph * 0.5 Then
        Call Mylog("Error112, 获取页面错误。")
        main_error = 112
        Call end_program(0)
        ExitScript
    End If
    ' test
    app_col_absY = (col_scale_absY(0) + col_scale_absY(1)) \ 2
End Sub
' *****************************  参数初始化  ***************************
Sub Trace_variables()
    ' //下面这句是获得屏幕分辨率宽度
    ScreenW = Plugin.Sys.GetScRX()
    ScreenH = Plugin.Sys.GetScRY()
    ' //下面这句是获得屏幕色深度(颜色质量)
    Dev = Plugin.Sys.GetScDep()
    Call Mylog("screen width * height, color depth: " & ScreenW & " * " & ScreenH & ", " & Dev)
    ' //系统类型:
    ' //0:windows 95/windows 98
    ' //1:windows ME/windows NT/windows 2000/windows XP
    ' //2:windows 2003
    ' //3:windows 2008
    ' //4:vista
    ' //5:win7
    ' //6:windows CE
    sys_type=Plugin.Sys.GetOSType() 
    Call Mylog("appx appy appw apph: " & appx & ", " & appy & ", " & appw & ", " & apph)
    Call Mylog("System type: " & sys_type)
    Call Mylog("main_menu_scale: " & main_menu_scale_absY(0) & ", " & main_menu_scale_absY(1))
    Call Mylog("ch_scale: " & ch_scale_absY(0) & ", " & ch_scale_absY(1))
    Call Mylog("body_scale: " & body_scale_absY(0) & ", " & body_scale_absY(1))
    Call Mylog("col_scale: " & col_scale_absY(0) & ", " & col_scale_absY(1))
    Call Mylog("app_col: " & app_col_absY)
End Sub

' // 启动模拟器
Sub start_mumu(seconds)
    Call Check_sysinfo()        '// 启动模拟器前, 先检测系统参数是否设置完全
    RunApp mumu_path
    Delay seconds * 1000  '// 延时seconds秒, 等待程序启动
End Sub
' // 打开APP
Sub open_app(seconds)
    Dim app_pos
    app_pos = find_color_pos2(mumu_app_rect(0),mumu_app_rect(1),mumu_app_rect(2),mumu_app_rect(3),app_comfirm_rgb, 0, 1, mumu_hd)
    If app_pos(0) > 0 and app_pos(1) > 0 Then 
        MoveTo app_pos(0) + 5, app_pos(1) + 5
        Delay 500
        LeftClick 1
        ' GetCursorPos tmpx, tmpy'todo ceshi
        ' Call Mylog("点击位置: "& tmpx & ", " & tmpy)
    Else 
        Call Mylog("Error113, can't open APP.")
        main_error = 113
        Call end_program(0)
        ExitScript
    End If
    Delay seconds * 1000 '//延时seconds秒 等待程序启动
End Sub
' //启动模拟器,打开APP,并初始化句柄
Sub init(mumu_delay, app_delay)
    ' // 如果当前mumu模拟器开着的话, 先关闭
    mhwnd_str = Plugin.Window.Search(mumuname)
    If mhwnd_str <> "" Then 
        mumu_hd = split(mhwnd_str, "|")(0)
        Call Plugin.Window.Close(mumu_hd)
        Delay 2 * net_delay
    End If
    ' //启动模拟器
    Call start_mumu(mumu_delay)
    mhwnd_str = Plugin.Window.Search(mumuname)
    mumu_hd = split(mhwnd_str, "|")(0)
    Call Plugin.Window.Top(mumu_hd, 0)  '//置顶窗口
    Call open_app(app_delay)    ' // 打开APP

    middle_hd = Plugin.Window.FindEx(mumu_hd, 0, 0, 0)
    app_hd = Plugin.Window.FindEx(middle_hd, 0, 0, 0)'// xxqg app窗口句柄
    app_window = S2N(Plugin.Window.GetWindowRect(app_hd)) '//  app四个顶点的坐标
    app_rect = S2N(Plugin.Window.GetClientRect(app_hd))
    appx = CLng(app_rect(0)) : appy = CLng(app_rect(1)) : appw = CLng(app_rect(2)) : apph = CLng(app_rect(3))
    ' Call Mylog("mumu_hd: " & mumu_hd & "   app_hd: " & app_hd)
    Call Mylog("init done")

End Sub

Sub Keypress_str(str)
    Dim i,ascii
    If str <> "" Then
        For i = 1 To len(str) Step 1
            ascii = Mid(str, i, 1)
            KeyPress ascii, 1
            Delay 50
        Next
    End If
End Sub

Sub Login()
    Dim looptime, XY, ZB, X, Y, NUM, looptime2
    looptime = 0 : looptime2 = 0
    do while Plugin.Color.CountColor(appx, appy, appx + appw - 1, appy+apph, main_red_rgb, 1) < 5000
        If looptime >= 10 Then
            Call Mylog("Error114, 未知错误,登录失败. 请人工登录一次账户后再开启小鸽子自动学习机")
            MsgBox "Error114, unknown error, login failed. Login your account manually before starting program."
            main_error = 114
            Call Screen_log(usererrdir,Replace(Time, ":", "_"),app_window) '//记录错误日志
            Call end_program(0)
            ExitScript
        End If
        ' 登陆页面
        If Plugin.Color.CountColor(appx, appy, appx + appw - 1, appy+apph, login_noinput_rgb, 1) > 5000 Then
            Call Screen_log(userlogdir,Replace(Time, ":", "_"),app_window) '//记录登录日志
            KeyPress "Right", 15
            KeyPress "Backspace", 15
            Delay 500
            Call click_xy_pos(10,10)
            Call Keypress_str(username) '输入账号
            Delay 500
            KeyPress "Tab", 1           '按tab键切换到密码框
            Delay 500
            Call Keypress_str(password) '输入密码
            ' 点击登陆框 
            Call Plugin.ColorEx.PrintScreen(0, 0, appx + appw - 1, appy + apph)     
            '//下面这句在屏幕区域范围内按方式0, 查找多点颜色,返回左上角第一点颜色位置坐标   
            XY = Plugin.ColorEx.FindMultiColor(appx, appy + 0.2 * apph, appx + appw - 1, appy + apph - 1, login_input_rgb, "-30|-10|" & login_input_rgb & ",-30|2|" & login_input_rgb & ",1|1|" & login_input_rgb & ",1|-1|" & login_input_rgb, 1, 1)   
            '//下面这句用于分割字符串   
            ZB = InStr(XY, "|") 
            '//下面这句将字符串转换成数值   
            X = Clng(Left(XY, ZB - 1)): Y = Clng(Right(XY, Len(XY) - ZB)) 
            Call click_xy_abspos(X, Y)
            '//释放屏幕截图信息时请使用以下命令   
            Call Plugin.ColorEx.Free()  
        ElseIf IsSingleColor(0, 36, 100, 93, "ffffff") Then
            'IsSingleColor  0,36,100,93  ffffff  验证码页面特征
            Call Mylog("Error115, 需要输入验证码, 登陆失败. 请人工登录一次账户后再开启小鸽子自动学习机")
            MsgBox "Error115, 需要输入验证码, 登陆失败. 请人工登录一次账户后再开启小鸽子自动学习机"
            main_error = 115
            Call Screen_log(usererrdir,Replace(Time, ":", "-"),app_window) '//记录错误日志
            Call end_program(0)
            ExitScript
        ElseIf IsSingleColor(20, 5, 35, 7, "090E5B") Then
            '提示更新页面特征 IsSingleColor 20,5,35,7  090E5B    可以点击两次回车     或按更新按钮 右下角 77.57,56.38   或15,44,86,60范围内寻找FA9632颜色点 
            Call Screen_log(userlogdir,Replace(Time, ":", "-"),app_window) '//记录登录日志
            KeyPress "Enter", 1
            Delay net_delay
            KeyPress "Enter", 1
        Else
            dim intX, intY
            FindColorEx appx + appw \ 2, appy + 0.8 * apph, appx + appw - 1, appy + apph - 1, main_info_rgb, 2, 0.5, intX, intY
            If intX > 0 Then
                Call click_xy_abspos(intX, intY)
                Delay 10 * net_delay
            Else
                Call Mylog("Error116, 需要输入验证码, 登陆失败. 请人工登录一次账户后再开启小鸽子自动学习机")
                MsgBox "Error116, 需要输入验证码, 登陆失败. 请人工登录一次账户后再开启小鸽子自动学习机"
                main_error = 116
                Call end_program(0)
                ExitScript
            End If
            ' Call click_xy_pos(98,98)
        End If
        looptime = looptime + 1  
        Delay 4 * net_delay
    loop
End Sub

Sub getmumurel()
    Dim sx_sy_w_h, sx, sy, w, h, mx, my, ratio_x, ratio_y
    sx_sy_w_h = Plugin.Window.GetClientRect(mumu_hd)
    rect = split(sx_sy_w_h, "|")
    sx = rect(0)
    sy = rect(1)
    w = rect(2)
    h = rect(3)
    do
        last_click = WaitClick()
        ' Call Mylog last_click
        If last_click = right_click_down Then 
            GetCursorPos mx, my
            ratio_x = GetRelVal(mx, sx, w)
            ratio_y = GetRelVal(my, sy, h)
            MsgBox "X: " & FormatPercent(ratio_x/100) & "  Y: " & FormatPercent(ratio_y/100)
            Delay 500
        ElseIf last_click = mid_click_down Then
            Exit Do
        End If
    loop
End Sub
Sub getapprel()
    Dim sx_sy_w_h, sx, sy, w, h, mx, my, ratio_x, ratio_y
    sx_sy_w_h = Plugin.Window.GetClientRect(app_hd)
    rect = split(sx_sy_w_h, "|")
    sx = rect(0)
    sy = rect(1)
    w = rect(2)
    h = rect(3)
    do
        last_click = WaitClick()
        ' Call Mylog last_click
        If last_click = right_click_down Then 
            GetCursorPos mx, my
            ratio_x = GetRelVal(mx, sx, w)
            ratio_y = GetRelVal(my, sy, h)
            MsgBox "X: " & FormatPercent(ratio_x/100) & "  Y: " & FormatPercent(ratio_y/100)
            Delay 500
        ElseIf last_click = mid_click_down Then
            Exit Do
        End If
    loop
End Sub
Sub getappabs()
    Dim sx_sy_w_h, sx, sy, w, h, mx, my, ratio_x, ratio_y
    sx_sy_w_h = Plugin.Window.GetClientRect(app_hd)
    rect = split(sx_sy_w_h, "|")
    sx = rect(0) : sy = rect(1) : w = rect(2) : h = rect(3)
    do
        last_click = WaitClick()
        If last_click = right_click_down Then 
            GetCursorPos mx, my
            MsgBox "X: " & mx - sx & "  Y: " & my - sy
            Delay 500
        ElseIf last_click = mid_click_down Then
            Exit Do
        End If
    loop
End Sub
Sub Confirm_dir(dir_path)
    Dim is_exist, folder_list, i, subdir
    folder_list = split(Replace(dir_path,"\","/"), "/")
    For i = 0 to Ubound(folder_list) step 1
        If i = 0 Then
            subdir = folder_list(0)
        Else
            subdir = subdir & "/" & folder_list(i)
        End If
        is_exist = IsFolderExists(subdir)        '// 判断文件夹是否存在
        If is_exist = False Then
            '// 创建文件夹
            Call Plugin.File.CreateFolder(subdir)
        End If
    Next
End Sub
Sub Confirm_file(file_path)
	Dim IsFile, fp, index
	
    IsFile = Plugin.File.IsFileExist(file_path)
    If IsFile = False Then 
		fpath = Replace(file_path, "\", "/")
    	index = InStrRev(fpath, "/")
    	Confirm_dir (Left(fpath, index - 1))
    	'Call Plugin.File.WriteFileEx(file_path, "")
    End If
End Sub
Function IsFolderExists(folder_path)
    Dim fso 
    Set fso = CreateObject("Scripting.FileSystemObject")
    IsFolderExists = fso.FolderExists(folder_path)
    Set fso = Nothing
End Function
Function S2N(str)
    Dim pos,index
    If str = "" Then
        S2N = 0
        Exit Function
    End If
    If InStr(str,"|") Then
        pos = split(str, "|")
        For index = 0 To Ubound(pos)
            If InStr(pos(index),".") Then
                pos(index) = CDbl(pos(index))
            Else 
                pos(index) = CLng(pos(index))
            End If
        Next
    Else 
        pos = str
        If InStr(pos,".") Then
            pos = CDbl(pos)
        Else 
            pos = CLng(pos)
        End If
    End If
    S2N = pos
End Function
' //获得相对位置 0-100
Function GetRelVal(absx, sx, width)
    Dim rx
    rx = 100 * (absx-sx)/width
    GetRelVal = rx
End Function
' //获得绝对位置
Function GetAbsVal(rx, sx, width)
    Dim absx
    absx = Clng(rx * width / 100 + sx)
    GetAbsVal = absx
End Function
Sub click_xy_abspos(x, y)
    MoveTo x, y
    Delay 500
    LeftClick 1
    Delay net_delay
End Sub
Sub click_arr_abspos(pos)
    Call click_xy_abspos(pos(0), pos(1))
End Sub
Sub click_xy_pos(rx, ry)
    MoveTo GetAbsVal(rx, appx, appw), GetAbsVal(ry, appy, apph)
    Delay 500
    LeftClick 1
    Delay net_delay
End Sub
Sub click_arr_pos(pos)
    Call click_xy_pos(pos(0), pos(1))
End Sub
' //获取绝对位置矩形
Function get_abs_rect(x1, y1, x2, y2)
    Dim abs_rect(3)
    abs_rect(0) = GetAbsVal(x1, appx, appw)
    abs_rect(1) = GetAbsVal(y1, appy, apph)
    abs_rect(2) = GetAbsVal(x2, appx, appw)
    abs_rect(3) = GetAbsVal(y2, appy, apph)
    get_abs_rect = abs_rect
End Function
' //获取绝对位置点坐标
Function get_abs_pos(x1, y1)
    Dim abs_pos(1)
    abs_pos(0) = GetAbsVal(x1, appx, appw)
    abs_pos(1) = GetAbsVal(y1, appy, apph)
    get_abs_pos = abs_pos
End Function
' // 随机数
Function GetRandomMath(m,n)
    Randomize
    GetRandomMath = Int(((n-m+1) * Rnd) + m)
End Function
Sub back_to_study_page()
    Dim pos, rx, red_count, intX, intY 
    Do
        '//在栏目那一行上寻找红色的点, 找到了, 说明在主页面上, 如果没找到, 则需按返回键
        ' pos = find_color_pos(0, app_col_Y, 100, app_col_Y, app_col_rgb, 0.6, 0)
        red_count = Plugin.Color.CountColor(appx, appy, appx + appw - 1, main_menu_scale_absY(1), main_red_rgb, 1) 
        ' 从右边开始找底下栏目栏的红色点
        FindColorEx appx, app_col_absY - 10, appx + appw - 1, app_col_absY + 2, app_col_rgb, 2, 0.5, intX, intY
        If intX > 0 and red_count > 10000 Then 
            rx = GetRelVal(intX,appx,appw)
            ' // 如果不在主页的学习页面上       点击学习栏
            If rx > app_col_study_pos_x + 10 or rx < app_col_study_pos_x - 10 Then
                ' Call Mylog("点击学习栏目")
                Call click_xy_abspos(appx + 0.5*appw, app_col_absY)
                Delay net_delay
            End If
            Exit Sub
        End If
        ' Call Mylog("点击返回键")
        Call click_arr_pos(app_back_pos)
    Loop
End Sub
Sub back_to_video_page()
    Dim pos, rx, red_count, intX, intY 
    Do
        '//在栏目那一行上寻找红色的点, 找到了, 说明在主页面上, 如果没找到, 则需按返回键
        ' pos = find_color_pos(0, app_col_Y, 100, app_col_Y, app_col_rgb, 0.6, 0)
        ' FindColorEx appx, col_scale_absY(0), appx + appw - 1, col_scale_absY(1), app_col_rgb, 0, 0.6, intX, intY
        red_count = Plugin.Color.CountColor(appx, appy, appx + appw - 1, main_menu_scale_absY(1), main_red_rgb, 1) 
        ' 从右边开始找底下栏目栏的红色点
        FindColorEx appx, app_col_absY - 10, appx + appw - 1, app_col_absY + 2, app_col_rgb, 2, 0.5, intX, intY
        If intX > 0 and red_count > 10000 Then 
            rx = GetRelVal(intX, appx, appw)
            ' // 如果不在主页的学习页面上       点击学习栏
            If rx > app_col_video_pos_x + 10 or rx < app_col_video_pos_x - 10 Then
                ' Call Mylog("点击视频栏目")
                Call click_xy_abspos(appx + 0.7*appw, app_col_absY)
                Delay net_delay
            End If
            Exit Sub
        End If
        ' Call Mylog("点击返回键")
        Call click_arr_pos(app_back_pos)
    Loop
End Sub
Function cur_channel_X()
    Dim intX, intY 
    FindColorEx appx,ch_scale_absY(0),appx + appw - 1,ch_scale_absY(1), active_ch_rgb, 0, 0.9, intX, intY
    If intX > 0 and intY > 0 Then 
        MoveTo intX, intY
        Delay 500
    End If
    cur_channel_X = intX
End Function 
Sub right_channel()
    Dim intX, intY 
    ' 2: 从右下往左上寻找   0.9 颜色模糊度
    FindColorEx appx, ch_scale_absY(0), appx + appw - 1, ch_scale_absY(1), active_ch_rgb, 2, 0.9, intX, intY
    If intX < GetAbsVal(78, appx, appw) Then 
        MoveTo intX + 0.115 * appw, intY
        Delay 500
        LeftClick 1
        Delay net_delay
    End If
End Sub
Sub left_channel()
    Dim intX, intY 
    ' 0: 从左上往右下寻找   0.9 颜色模糊度
    FindColorEx appx, ch_scale_absY(0), appx + appw - 1, ch_scale_absY(1), active_ch_rgb, 0, 0.9, intX, intY
    If intX > GetAbsVal(10, appx, appw) Then
        MoveTo intX - 0.115 * appw, intY
        Delay 500
        LeftClick 1
        Delay net_delay
    End If
End Sub
' 滚轮下拉  一屏为10次滚轮
Sub next_screen(cishu)
    Dim count
    If cishu <= 0 Then 
        count = 3
    Else
        count = cishu
    End If
    MoveTo appx + appw \ 2, appy + apph \ 2
    Delay 200
    RightClick 1
    Delay 200
    For count
        MouseWheel -1
        Delay 100
    Next
End sub
Sub find_color_moveto(rx1, ry1, rx2, ry2, rgb_str, fmode, mhd)
    ' //fmode 0:从左往右, 从上往下  1从中心往外   2从右往左, 从下往上找
    ' //mhd   模糊度  0.5-1之间  数值越高越严格
    ' //rgb_str       rgb字符串  FF00FF
    ' //寻找未读文章, rgb_str = "404040", mhd = 0.7
    ' //寻找视频进度的位置   find_color_moveto(0, 34.25, 100, 34.35,"1826DE", 2, 0.9)
    Dim sx_sy_w_h, sx, sy, w, h, mx, my, ratio_x, ratio_y, intX,intY
    sx_sy_w_h = Plugin.Window.GetClientRect(app_hd)
    rect = split(sx_sy_w_h, "|")
    sx = rect(0):sy = rect(1):w = rect(2):h = rect(3)
    FindColorEx GetAbsVal(rx1,sx,w),GetAbsVal(ry1,sy,h),GetAbsVal(rx2,sx,w),GetAbsVal(ry2,sy,h),rgb_str,fmode,mhd,intX,intY
    If intX > 0 And intY > 0 Then 
        MoveTo intX,intY
        Delay 500
    End If
End Sub
' //在矩形内寻找特定的颜色
Function find_color_pos(rx1, ry1, rx2, ry2, rgb_str, fmode, mhd)
    ' //fmode 0:从左往右, 从上往下  1从中心往外   2从右往左, 从下往上找
    ' //mhd   模糊度  0.5-1之间  数值越高越严格
    ' //rgb_str       rgb字符串  FF00FF
    ' //寻找未读文章, rgb_str = "404040", mhd = 0.7
    ' //寻找视频进度的位置   find_color_moveto(0, 34.25, 100, 34.35,"1826DE", 2, 0.9)
    Dim pos(1)
    pos(0) = - 1 : pos(1) = - 1 
    Dim sx_sy_w_h, sx, sy, w, h, mx, my, ratio_x, ratio_y, intX,intY
    sx_sy_w_h = Plugin.Window.GetClientRect(app_hd)
    rect = split(sx_sy_w_h, "|")
    sx = rect(0):sy = rect(1):w = rect(2):h = rect(3)
    FindColorEx GetAbsVal(rx1,sx,w),GetAbsVal(ry1,sy,h),GetAbsVal(rx2,sx,w),GetAbsVal(ry2,sy,h),rgb_str,fmode,mhd,intX,intY
    If intX > 0 And intY > 0 Then 
        pos(0) = intX : pos(1) = intY
    End If
    find_color_pos = pos
End Function
Function IsWordTitle(absx, absy, rgb_str, val)
    delta = Clng(0.015 * apph)
    ' Call Mylog("delta: "&delta)
    sx = absx - delta : sy = absy - delta : ex = absx + delta : ey = absy + delta
    color_total = (2 * delta + 1) * (2 * delta + 1)
    color_count = Plugin.Color.CountColor(sx, sy, ex, ey, "FFFFFF", 1)  '//计算该点周围  特定点的个数
    ' Call Mylog("color_count: "&color_count&"  color_total: "&color_total)
    If (color_count / color_total) > val Then 
        IsWordTitle = True
    Else 
        IsWordTitle    = False
    End If
End Function
' //  判断是不是某一矩形区域是否是单一的颜色
Function IsSingleColor(x1, y1, x2, y2, rgb)
    ' //  判断是不是文章详情页面  IsSingleColor(2, 10, 2, 90, "FCFBFA")
    Dim total, count, sx, sy, ex, ey
    sx = GetAbsVal(x1, appx, appw)
    sy = GetAbsVal(y1, appy, apph)
    ex = GetAbsVal(x2, appx, appw)
    ey = GetAbsVal(y2, appy, apph)
    total = (ex + 1 - sx) * (ey + 1 - sy)
    count = Plugin.Color.CountColor(sx, sy, ex, ey, rgb, 1)
    ' //Call Mylog("count: " & count & "    toatl: " & total
    If total = count Then 
        IsSingleColor = True
    Else 
        IsSingleColor = False
    End If
End Function
Function IsSingleColorAbs(sx, sy, ex, ey, rgb)
    Dim total, count
    total = (ex + 1 - sx) * (ey + 1 - sy)
    count = Plugin.Color.CountColor(sx, sy, ex, ey, rgb, 1)
    ' //Call Mylog("count: " & count & "    toatl: " & total
    If total = count Then 
        IsSingleColorAbs = True
    Else 
        IsSingleColorAbs = False
    End If
End Function
' //判断某点是否是某一特定颜色
Function IsTheColor(rx, ry, rgb)
    Dim cor
    cor = GetPixelColor(GetAbsVal(rx, appx, appw), GetAbsVal(ry, appy, apph))
    If cor = rgb Then 
        IsTheColor = True
    Else 
        IsTheColor = False
    End If
End Function
'//在矩形内寻找特定的颜色
Function find_color_pos2(rx1, ry1, rx2, ry2, rgb_str, fmode, mhd, mumu_app_hd)
    ' //fmode 0:从左往右, 从上往下  1从中心往外   2从右往左, 从下往上找
    ' //mhd   模糊度  0.5-1之间  数值越高越严格
    ' //rgb_str       rgb字符串  FF00FF
    ' //寻找未读文章, rgb_str = "404040", mhd = 0.7
    ' //寻找视频进度的位置   find_color_moveto(0, 34.25, 100, 34.35,"1826DE", 2, 0.9, app_hd)
    ' //寻找app的位置        find_color_pos2(mumu_app_rect(0),mumu_app_rect(1),mumu_app_rect(2),mumu_app_rect(3),app_comfirm_rgb, 0, 0.9, mumu_hd)
    Dim pos
    pos = Array(-1,-1)
    Dim sx_sy_w_h, sx, sy, w, h, intX,intY,rect
    sx_sy_w_h = Plugin.Window.GetClientRect(mumu_app_hd)
    ' //Call Mylog sx_sy_w_h
    rect = split(sx_sy_w_h, "|")
    sx = rect(0):sy = rect(1):w = rect(2):h = rect(3)
    FindColorEx GetAbsVal(rx1,sx,w),GetAbsVal(ry1,sy,h),GetAbsVal(rx2,sx,w),GetAbsVal(ry2,sy,h),rgb_str,fmode,mhd,intX,intY
    If intX > 0 And intY > 0 Then 
        pos(0) = intX : pos(1) = intY
    End If
    find_color_pos2 = pos
End Function
Function find_rgb_abspos(absx1, absy1, absx2, absy2, rgb_str, fmode, mhd)
    ' //fmode 0:从左往右, 从上往下  1从中心往外   2从右往左, 从下往上找
    ' //mhd   模糊度  0.5-1之间  数值越高越严格
    ' //rgb_str       rgb字符串  FF00FF
    ' //寻找未读文章, rgb_str = "404040", mhd = 0.7
    Dim pos
    pos = Array(-1,-1)
    Dim intX,intY
    FindColorEx absx1, absy1, absx2, absy2,rgb_str,fmode,mhd,intX,intY
    If intX > 0 And intY > 0 Then 
        pos(0) = intX : pos(1) = intY
    End If
    find_rgb_abspos = pos
End Function
' //寻找未读 文章/视频
function find_no_read()
    Dim nr_pos, wflag, newy
    nr_pos = find_color_pos2(nr_rect(0), nr_rect(1), nr_rect(2), nr_rect(3), nr_rgb, 0, 0.7, app_hd)
    Do
        If nr_pos(0) > 0 Then 
            ' Call Mylog nr_pos(0)&"  " &nr_pos(1)
            ' Call Mylog("找到未读文章的点"
            If IsWordTitle(nr_pos(0), nr_pos(1), "FFFFFF", 0.58) Then
                ' wflag = IsWordTitle(nr_pos(0), nr_pos(1), "FFFFFF", 0.58)  'rgb_str = "FFFFFF"  val = 0.58
                ' Call Mylog("该点不是图片"
                find_no_read = nr_pos
                Exit Do
            Else 
                ' Call Mylog("该点是图片。判断这个点是否是在底部, 如果是底部, 那么返回-1, 查找失败。如果不在底部, 则从下一个点再开始查找。")
                newy = GetRelVal(nr_pos(1), appy, apph)
                If newy > 80 Then 
                    nr_pos(0) = - 1  : nr_pos(1) = - 1 
                    find_no_read = nr_pos
                    Exit Function
                Else 
                    nr_pos = find_color_pos2(nr_rect(0), newy + 10, nr_rect(2), nr_rect(3), nr_rgb, 0, 0.7, app_hd)
                    '//Call Mylog("nr_pos:" &nr_pos(0)&", " &nr_pos(1))
                End If
            End If
        Else 
            Call Mylog("Warning24, can't find nr")
            find_no_read = nr_pos
            Exit Function
        End If
    Loop
End function
' *********************************  加密模块 -start- *********************************
Function Get_md5s(uname, studyid, eds, priority)
    '//用户名, 学号, 结束日期字符串, George =》md5（第一个id+1次）
    '//eds end_date_string  like"20190308"
    ' priority =>   1-9  1普通会员, 2高级会员
    dim hexcode, N, TextMD5
    N = Left(studyid, 1) + 1
    hexcode = Hex(CLng(studyid))
    TextMD5 = uname & hexcode & eds & priority & "George"
    For N 
        TextMD5 = Plugin.Encrypt.Md5String(TextMD5)
    Next
    Get_md5s = TextMD5
End Function
' 系统时间2019/3/9  => "20190309"
Function Date_to_str(date_exp) 
    Dim m, d
    If Month(date_exp) < 10 Then 
        m = "0" & Month(date_exp) 
    End If
    If Day(date_exp) < 10 Then 
        d = "0" & Day(date_exp)
    End If
    Date_to_str = Year(date_exp) & m & d
End Function
'日期加密
Function Ds_to_dsn(datestr)
    '//密钥为3个数字, 加上第一个数字乘以后面的数再十六进制。223
    '//返回加密后的字符串
    Dim sn(15), j
    For j = 1 To 8
        sn(2 * j - 2) = Left(Hex((Mid(datestr, j, 1) + 2) * 23), 1)
        sn(2 * j - 1) = Right(Hex((Mid(datestr, j, 1) + 2) * 23), 1)
    Next
    Ds_to_dsn = Join(sn,"")
End Function
' 十六进制 转 十进制
Function H2D(hexstr)
    Dim i, hexcode, b
    hexcode = UCase(hexstr)
    For i = 1 To Len(hexcode)
        Select Case Mid(hexcode, Len(hexcode) - i + 1, 1)
        Case "0": b = b + 16 ^ (i - 1) * 0
        Case "1": b = b + 16 ^ (i - 1) * 1
        Case "2": b = b + 16 ^ (i - 1) * 2
        Case "3": b = b + 16 ^ (i - 1) * 3
        Case "4": b = b + 16 ^ (i - 1) * 4
        Case "5": b = b + 16 ^ (i - 1) * 5
        Case "6": b = b + 16 ^ (i - 1) * 6
        Case "7": b = b + 16 ^ (i - 1) * 7
        Case "8": b = b + 16 ^ (i - 1) * 8
        Case "9": b = b + 16 ^ (i - 1) * 9
        Case "A": b = b + 16 ^ (i - 1) * 10
        Case "B": b = b + 16 ^ (i - 1) * 11
        Case "C": b = b + 16 ^ (i - 1) * 12
        Case "D": b = b + 16 ^ (i - 1) * 13
        Case "E": b = b + 16 ^ (i - 1) * 14
        Case "F": b = b + 16 ^ (i - 1) * 15
        End Select
    Next
    H2D = b
End Function
' 序列号注册机     得到最终的SN序列号
Function Get_finalsn(uname, studyid, eds, priority)
    '//Left(date_sn,5) & textmd5 & Right(date_sn, 11)
    Dim textmd5, date_sn
    date_sn = Ds_to_dsn(eds)
    textmd5 = Get_md5s(uname, studyid, eds, priority)
    Get_finalsn = Left(date_sn,5) & textmd5 & priority & Right(date_sn, 11)
End Function
'从序列号中提取日期
Function Get_eds(finalsn)
    Dim date_sn,yyyy,mm,dd
    date_sn = Left(finalsn, 5) & Right(finalsn, 11)
    Get_eds = Dsn_to_ds(date_sn)
End Function
'从序列号中提取权限
Function Get_priority(finalsn)
    Get_priority = CInt(Mid(finalsn, 38, 1)) ' 38 = 5+32+1
End Function
' 解密日期
Function Dsn_to_ds(datesn)
    Dim i,ds
    For i = 1 To 16 Step 2
        ds = ds + CStr(CLng(CLng(H2D(Mid(datesn, i, 2))) / 23) - 2)
    Next
    Dsn_to_ds = ds
End Function
'验证序列号
Function Check_finalsn(uname, studyid, finalsn)
    Dim eds, md5text1, md5text2, i, nowdate, nds, priority
    If len(finalsn) <> 49 Then 
        Check_finalsn = False
        Exit Function
    End If
    ' todo 校验日期
    nowdate = Lib.网络.获取网络时间()
    nds = Date_to_str(nowdate)
    eds = Get_eds(finalsn)
    If nds > eds Then
        Call Plugin.Window.Close(mumu_hd) ' 关闭程序
        Delay net_delay
        Call Mylog("Error117, software license has expired")
        main_error = 117
        MsgBox expire_date
        Delay 5 * net_delay
        Call end_program(0)
        ExitScript  '退出脚本
        ' Check_finalsn = False
        ' Exit Function
    End If
    ' 获取权限
    priority = Get_priority(finalsn)
    md5text1 = Mid(finalsn, 6, len(finalsn) - 17)
    md5text2 = Get_md5s(uname, studyid, eds, priority)
    Check_finalsn = Not (md5text1 <> md5text2)
End Function
Function Check_finalsn2(uname, sid, finalsn)
    ' 用于激活页面的验证
    Dim eds, md5text1, md5text2, i, nowdate, nds, priority
    If len(finalsn) <> 49 Then 
        Check_finalsn2 = False
        Exit Function
    End If
    ' todo 校验日期
    nowdate = Lib.网络.获取网络时间()
    nds = Date_to_str(nowdate)
    eds = Get_eds(finalsn)
    If nds > eds Then
        Call Mylog("Error118, software license has expired")
        main_error = 118
        MsgBox expire_date
        Check_finalsn2 = False
        Call end_program(0)
        ExitScript  '退出脚本
    End If
    priority = Get_priority(finalsn)
    md5text1 = Mid(finalsn, 6, len(finalsn) - 17)
    md5text2 = Get_md5s(uname, sid, eds, priority)
    Check_finalsn2 = Not (md5text1 <> md5text2)
End Function
' ***************************************  加密模块 -End-  *********************************************
Sub Get_video_bar_absY()
	Dim jj
    ' 获取视频条参数 延迟。每次
    If get_vbar_delay > 100 Then
        Call Mylog("can't get vbar. End Program")
        Call end_program(0)
        ExitScript
    End If
    Delay get_vbar_delay * 1000
	jj = CInt(appy + apph * 0.46)
	Do While jj > appy + 0.32 * apph
    	IfColor appx+1, jj, "FFFFFF", 2 Then
    	    jj = jj - 1
    	Else    '出现video_bar_rgb, 是视频页面
    		IfColor appx + 1, jj, video_bar_rgb, 2 Then
                Exit Do
            Else    '出现其他颜色, 不是视频页面
                Exit Sub
    		End If
    	End If
    Loop
    If jj > appy + 0.32 * apph Then
        video_bar_scale_absY = Array(jj - 1, jj)  '全局变量
        Call Mylog("get_vbar_delay: " & get_vbar_delay)
        Call Mylog("video_bar_scale_absY: " & video_bar_scale_absY(0) & ", " &video_bar_scale_absY(1))
    Else
        get_vbar_delay = get_vbar_delay + 5
    End If
End Sub
' // 判断页面状态
' // const app_art_f = 1 : const app_video_f=2 : const app_other_f = 3 : const detail_art_f =11 : const detail_video_f = 100 : const score_page_f = 21 : const score_fail_f = 22  const other_f = 99
'// 如果是视频页面, status返回>=100的值, 其中status-100的值为本视频剩余的秒数
Function whatpage()
    Dim status, intX0, intY0, red_count
    Dim pos, rel_x, video_bar_pos, video_bar_pos2
    ' 计算banner栏的红点数, 超过10000为APP主页面
    red_count = Plugin.Color.CountColor(appx, appy, appx + appw - 1, main_menu_scale_absY(1), main_red_rgb, 1) 
    ' 从右边开始找底下栏目栏的红色点
    FindColorEx appx, app_col_absY - 10, appx + appw - 1, app_col_absY + 2, app_col_rgb, 2, 0.5, intX0, intY0
    If intX0 > 0 and red_count > 10000 Then 
        rel_x = GetRelVal(intX0, appx, appw)
        If rel_x < 80 and rel_x > 60 Then 
            status = app_video_f
            Call Mylog("Status 1")
        ElseIf rel_x < 60 and rel_x > 40 Then
            status = app_art_f
            Call Mylog("Status 2")
        Else 
            Call Mylog("Status 3")
            status = app_other_f
        End If
    '判断文章详情的区域 
    ElseIf IsSingleColorAbs(appx + 1, ch_scale_absY(1) , appx + 2, body_scale_absY(1) - 15, art_judge_rgb) Then
        ' ElseIf IsSingleColor(1, 10, 1, 90, "FCFBFA") Then
        status = detail_art_f
        Call Mylog("Status 11")
    Else '视频页面或者 其他页面     视频页面判断:  主页面main_menu区域不是纯白色（防止把有些专题页判断为视频页面）  并且  页面有变化  
        Dim intX,intY,intX1,intY1,intX2,intY2
        
        ' Call Plugin.Pic.PrintScreen(appx, appy + 0.2 * apph, appx + appw - 1, appy + 0.5 * apph, tempPath & "judgetmp.bmp")
        Call Plugin.Pic.PrintScreen(appx, appy + 0.2 * apph, appx + appw - 1, appy + 0.5 * apph, tempPath & "judgetmp.bmp")
        Delay 10000
        ' FindPic appx, appy + 0.2 * apph, appx + appw - 1, appy + 0.5 * apph, tempPath & "judgetmp.bmp", 1.0, intX, intY
        FindPic appx, appy + 0.2 * apph, appx + appw - 1, appy + 0.5 * apph, tempPath & "judgetmp.bmp", 1.0, intX, intY
        If intX > 0 And intY > 0 Then '找到5秒前的截图, 说明画面是静止的, 不是视频页面
            status = other_f
            Call Mylog("scr moving Status 99")
        ' 画面在动, 并且main_menu区域不是纯白色（防止把有些专题页判断为视频页面）  说明确定是视频页面
        ElseIf IsSingleColorAbs(appx + 0.4 * appw, 2, appx + 0.5 * appw, main_menu_scale_absY(1)-2, "FFFFFF") = False Then
            ' Call Mylog Time & "Status 100"
            If video_bar_scale_absY(0) <= 0 Then
                ' no vbary
                Call Mylog("not got video bar")
                Call Get_video_bar_absY()
                ' 调用Get_video_bar_absY后, 如果video_bar_scale_absY依然是0 则说明这不是视频页面
                If video_bar_scale_absY(0) <= 0 Then
                    status = other_f
                    Call Mylog("can't get video bar. Status 99")
                    whatpage = status
                    Exit Function
                End If
            End If
            FindColorEx appx, video_bar_scale_absY(0), appx + appw - 1, video_bar_scale_absY(1), video_bar_rgb,2, 0.5,intX1, intY1
            If intX1 > appx Then
                Delay pre_video_sec * 1000
                FindColorEx appx, video_bar_scale_absY(0), appx + appw - 1, video_bar_scale_absY(1), video_bar_rgb,2, 0.5,intX2, intY2
                If intX2 > intX1 and intX2 <= appx + appw  Then 
                    v_duration = Clng((appx + appw - intX2)/(intX2 - intX1) * pre_video_sec )
                    Call Mylog("duration: "& v_duration)
                Else 
                    v_duration = 0
                    Call Mylog("duration: 0")
                End If
                status = detail_video_f + v_duration
            End If
        End If
    End If
    whatpage = status
End Function

sub studying(is_comment, is_share)
    Dim read_unit
    read_unit = 120
    If legality = 0 Then
        MsgBox no_regist
        ' Exit Sub
        Call Plugin.Window.Close(mumu_hd) ' 关闭程序
        ExitScript  '退出脚本
    End If
    Dim status, fn
    fn = Replace(Time, ":", "-")
    status = whatpage()
    Call Mylog("status: "&status)
    If status > detail_video_f Then 
        Call Mylog("video num left: " & video_watch_num & "   video time left: " & video_watch_time)  '//vnl:video num left    vtl:video time left
        Call Mylog("this video duration:" & status - detail_video_f)    '//tvtl: this video time left
        Call Screen_log(userlogdir,fn,app_window) '//记录
        If video_watch_time <= 10  Then '如果视频观看时间已经达标, 则无需看完整个视频
            Call Mylog("wacthing video for only 10 seconds")
            Delay 5000
            MouseWheel -1
            Delay 5000
            video_watch_num = video_watch_num - 1
            video_watch_time = video_watch_time - 10
        ElseIf video_watch_time <= (status - detail_video_f)  Then '如果剩余视频时间小于, 此视频时长   则只看 剩余视频时间
            Call Mylog("wacthing video for the rest of seconds")
            Delay video_watch_time/2
            MouseWheel -1
            Delay video_watch_time/2
            video_watch_num = video_watch_num - 1
            video_watch_time = video_watch_time - video_watch_time
        Else 
            Call Mylog("wacthing video until this video done")
            Delay (status - detail_video_f) * 1000 
            video_watch_num = video_watch_num -1
            video_watch_time = video_watch_time - (status - detail_video_f) - pre_video_sec
        End If
    elseIf status = detail_art_f Then
        Call Mylog("article num left: " & art_read_num & "   article time left: " & art_read_time)
        Call Screen_log(userlogdir,fn,app_window) '//记录
        If art_read_time <= 10 Then '如果文章观看时间已经达标, 则无需看很久
            Call Mylog("reading for 12s")
            Delay 6000
            Call next_screen(10)
            Delay 6000
            ' 收藏
            Call do_fav()
            If is_comment Then 
                Call do_comment()    
            End If
            If is_share Then 
                Call do_share()    
            End If
            art_read_num = art_read_num - 1
            art_read_time = art_read_time - 10
        Else 
            Call Mylog("reading for 4m")
            Delay read_unit * 1000
            Call next_screen(10)
            Delay read_unit * 1000
            Call do_fav()
            If is_comment Then 
                Call do_comment()    
            End If
            If is_share Then 
                Call do_share()    
            End If
            Delay net_delay
            art_read_num = art_read_num -1
            art_read_time = art_read_time - read_unit * 2
        End If
    End If
End Sub
Sub Screen_log(userlogdir, fn, scr_rect)
    ' mumu_path = "C:\Program Files (x86)\MuMu\emulator\nemu\EmulatorShell\NemuPlayer.exe"
    ' ri = InStrRev(mumu_path, "\")
    ' dir = Left(mumu_path, ri - 1)
    ' fn = Right(mumu_path, len(mumu_path) - ri)
    dim logfile_dir, daystr
    daystr = Replace(Date,"/","-")
    logfile_dir = userlogdir & "/" & daystr
    Call Confirm_dir(logfile_dir)
    ' //下面这句在屏幕区域范围内截图保存到("C:\PIC.bmp")里
    Call Plugin.Pic.PrintScreen(scr_rect(0), scr_rect(1), scr_rect(2), scr_rect(3), logfile_dir&"/" & fn & ".bmp")
End Sub

Sub Mylog(content)
    dim tc 
    tc = Now & ": " & content
    TracePrint tc
    Call Plugin.File.WriteFileEx(mylogPath, tc)
End Sub


Sub do_comment()
    If Not(com_start_absY > 0) Then
        Call Get_comment_param()
    End If
    If Not(com_start_absY > 0) Then
        Call Mylog("Error19, wrong comshare param")
        main_error = 19
        Exit Sub
    End If
    ' 判断是否有评论区域
    dim comment_exsit, i,intX,intY, absrect
    ' comment_exsit = IsSingleColor(comment_rect(0), comment_rect(1), comment_rect(2), comment_rect(3), comment_rgb)
    comment_exsit = IsSingleColorAbs(appx + CInt(0.4 * appw), com_mid_absY - 1, appx + CInt(0.45 * appw), com_mid_absY + 1, comment_rgb)
    If not(comment_exsit) Then
        Call Mylog("Warning21, No comment")
        Exit sub
    End If
    ' 进行评论
    ' Call click_xy_pos(50, comment_Y) '// 点击评论框
    Call click_xy_abspos(appx + 0.4 * appw, com_mid_absY)  '// 点击评论框
    i = GetRandomMath(0, Ubound(com_content))
    Call Plugin.Window.SEndString(app_hd, com_content(i))
    Delay net_delay
    '//点击发布按钮
    absrect = get_abs_rect(submit_rect(0), submit_rect(1), submit_rect(2), submit_rect(3))
    FindColorEx absrect(0),absrect(1),absrect(2),absrect(3),submit_rgb, 2, 0.8,intX, intY
	If intX > 0 And intY > 0 Then 
		MoveTo intX, intY
		Delay 200
		LeftClick 1
		Delay net_delay
   		Call Mylog("Submit comment: " & com_content(i))
    Else
        Call click_arr_pos(app_back_pos)
	End If
End Sub

Sub Get_comment_param()
    Dim jj
    jj = appy + apph - 20
    Do while jj > appy + 0.8 * apph
        IfColor appx + 1, jj, "FFFFFF", 1 Then      ' 0等于,  1不等于,  2近似等于
            com_start_absY = jj                     ' 评论栏起始Y轴位置
            com_mid_absY = (jj + appy + apph - 1) \ 2   ' 评论栏中间Y轴位置
            Exit Do
        End If
        jj = jj - 1
    Loop
    If com_start_absY > 0 Then
        ii = appx + appw -1
        Do while ii > appx + 0.875 * appw
        IfColor ii, com_mid_absY, "FFFFFF", 1 Then   ' 0等于,  1不等于,  2近似等于
            share_absX = ii - 3
            Exit Do
        End If
        ii = ii - 1
        Loop
    Else
        Exit Sub
    End If
    If share_absX > appx + 0.875 * appw Then
        ii = 2 * share_absX - (appx + appw -1)
        Do while ii > appx + 0.775 * appw
        IfColor ii, com_mid_absY, "FFFFFF", 1 Then   ' 0等于,  1不等于,  2近似等于
            fav_absX = ii - 3
            Exit Do
        End If
        ii = ii - 1
        Loop
    Else
        Exit Sub
    End If
End Sub

Sub Awake()
    scrX = Plugin.Sys.GetScRX 
    scrY = Plugin.Sys.GetScRY 
    MoveTo scrX, scrY
    Delay 300
    LeftClick 1
    Delay 500
    MoveTo scrX \ 2, scrY \ 2
    Delay 300
    LeftClick 1
    Delay net_delay
End sub

Sub Check_sysinfo()
    If username = "" Then
        MsgBox "未设置参数 XXQG账户 , 请设置后再启动程序."
        Call Mylog("have not set XXQG ACCOUNT , start program before setting it.")
        Call end_program(0)
        ExitScript
    End If
    If password = "" Then
        MsgBox "未设置参数 XXQG密码 , 请设置后再启动程序."
        Call Mylog("have not set XXQG PASSWORD , start program before setting it.")
        Call end_program(0)
        ExitScript
    End If
    If studyid = "" Then
        MsgBox "未设置参数 XXQG学号 , 请设置后再启动程序."
        Call Mylog("have not set XXQG STUDYID , start program before setting it.")
        Call end_program(0)
        ExitScript
    End If
    If mumu_path = "" Then
        MsgBox "未设置参数 MuMu模拟器路径 , 请设置后再启动程序."
        Call Mylog("have not set MUMU PATH , start program before setting it.")
        Call end_program(0)
        ExitScript
    End If
End Sub

Sub do_share()
    If Not(com_start_absY > 0) Then
        Call Get_comment_param()
    End If
    If Not(share_absX > 0) Then
        Call Mylog("Error20, wrong comshare param")
        main_error = 20
        Exit Sub
    End If
    Dim sms_pos
    If Not(IsSingleColorAbs(appx + 1, ch_scale_absY(1) , appx + 2, body_scale_absY(1) - 15, art_judge_rgb)) Then
        Call Mylog("Warning22, not art detail & no share")
        Exit Sub
    End If
    ' "1, 点击分享按钮 2, 找到分享到短信（绿色）点, 并点击"
    ' Call click_arr_pos(share_pos)
    Call click_xy_abspos(share_absX, com_mid_absY)  '点击分享按钮
    Delay net_delay
    sms_pos = find_color_pos2(share_to_rect(0), share_to_rect(1), share_to_rect(2), share_to_rect(3), share_to_sms_rgb, 1, 0.5, app_hd)
    If sms_pos(0) > 0 and sms_pos(1) > 0 Then
        Call click_arr_abspos(sms_pos)
    Else
        Call click_arr_pos(app_back_pos)
        Call Mylog("Error21, shfaild")
        main_error = 21
    End If
End Sub

' todo 收藏后有一个提示, 需要按掉
Sub do_fav()
    If Not(com_start_absY > 0) Then
        Call Get_comment_param()
    End If
    If Not(fav_absX > 0) Then
        Call Mylog("Error20, wrong fav param")
        main_error = 20
        Exit Sub
    End If
    If Not(IsSingleColorAbs(appx + 1, ch_scale_absY(1) , appx + 2, body_scale_absY(1) - 15, art_judge_rgb)) Then
        Call Mylog("Warning22, not art detail & no share")
        Exit Sub
    End If
    Dim iknowy, jj
    ' "1, 点击收藏按钮 2, 等待数秒"
    Call click_xy_abspos(fav_absX, com_mid_absY)  '点击收藏按钮
    Delay 4 * net_delay
    Call Mylog("do favor")
    Delay net_delay
    If IsSingleColorAbs(appx + 1, ch_scale_absY(1) , appx + 2, body_scale_absY(1) - 5, "656564") Then      '656564 弹出收藏提示时 文章页面的颜色
        for jj = CInt(appy + 0.9*apph) to (appy + apph \ 2) step -3
            IfColor CInt(appx + appw * 0.3), jj, "FFFFFF", 0 Then   ' 0等于,  1不等于,  2近似等于
                iknowy = jj - 3
                Exit for
            End If
        Next
        If iknowy > 0 Then
            Call click_xy_abspos(appx + appw \ 2, iknowy)  ' 点击我知道了
            Call Mylog("i know, do fav.  iknowy=" & iknowy)
            Delay net_delay
        End If
    End If
End Sub

Sub end_program(op)
    Delay 1000
    Call Mylog("End study")
    If op = 0 Then 
        Call Plugin.Window.Close(mumu_hd) ' 关闭程序
    Else 
        Call Plugin.Sys.ExitOS(1) ' 关机
    End If
End Sub

Sub Timing_perform(SWTime)
    Dim NowTime
    'SWTime = TimeValue(h & ":" & m & ":" & s)
    Do
        NowTime = Now
        If Hour(NowTime) = Hour(SWTime) and Minute(NowTime) = Minute(SWTime) Then ' 如果时间已经到了设定时间 并且 今天尚未学习默认今天已学习 那么开始执行下一步
            last_study_date = Date
            Exit Do 
        End If
        Delay 10000
        KeyPress 145, 2     ' KeyPress "Scroll Lock", 2 防止休眠
    Loop 
    Call Mylog("now time is:  "& NowTime &", and start timing perform task.")
End Sub
Sub Everyday_perform(start_mumu_t, start_app_t, art_num, art_sec, video_num, video_sec, is_comment, is_share, SWTime)
    dim nds, eds
    eds = Get_eds(sn)
    Do
        Call Timing_perform(SWTime)
        nds = Date_to_str(Lib.网络.获取网络时间())
        If nds > eds Then
            Call Plugin.Window.Close(mumu_hd) ' 关闭程序
            Delay net_delay
            Call Mylog("Error119, software license has expired")
            main_error = 119
            MsgBox expire_date
            Delay 5 * net_delay
            Call end_program(0)
            ExitScript  ' 退出脚本
        End If
        Call main(start_mumu_t, start_app_t, art_num, art_sec, video_num, video_sec, 0, is_comment, is_share)
    Loop
End Sub
' // todo 分享:  点击分享, 等待分享页面出来, 点击分享到学强, 等待页面出来, 返回
function get_areaY(y, sy, h)
    get_areaY = Clng((y - sy)*10/h)
End function
Function Get_studyid()
    Dim intX, intY, intX2, intY2, jj, count
    Call back_to_study_page()

    ' 点击主页面个人信息小蓝圆圈
    Call click_arr_abspos(main_info_abspos)

    ' 然后点击学强设置页面  大蓝圆圈
    FindColorEx appx + appw \ 2, appy, appx + appw - 1, appy + 0.5 * apph, "FA9632", 2, 0.9, intX, intY
    If intX < 0 or intY < 0 Then
        Call Mylog("Error122: can't get setting profile1")
        main_error = 122
        Call end_program(0)
        ExitScript
    End If
    Call click_xy_abspos(intX, intY)

    ' 然后找到个人信息页面 大蓝圆圈的坐标
    FindColorEx appx + appw \ 2, appy, appx + appw - 1, appy + 0.5 * apph, "FA9632", 2, 0.9, intX2, intY2
    If intX2 < 0 or intY2 < 0 Then
        Call Mylog("Error123: can't get profile2")
        main_error = 123
        Call end_program(0)
        ExitScript
    End If

    ' 点击学号栏
    count = 0 : jj = intY2
    Do while jj < appy + apph
        IfColor appx + appw \ 2, jj, "FFFFFF", 1 Then
            count = count + 1
            If count = 2 Then
                studyid_start_absY = jj + 3
            elseIf count = 3 Then
                studyid_end_absY = jj - 3
                Exit Do
            End If
            jj = jj + 3
        End If
        jj = jj + 1
    Loop
    Call click_xy_abspos(appx + appw \ 2, (studyid_start_absY + studyid_end_absY) \ 2)
    
    MoveTo appx + appw*0.5, appy + apph*0.5
    Delay 400
    LeftClick 1
    Delay 400
    studyid = Plugin.Sys.GetCLB()
    ' test
    Call Mylog("get studyid: " & studyid)
    If IsNumeric(studyid) = False Then 
    	Call Mylog("ERROR124, account wrong")
        main_error = 124
        Call end_program(0)
    	ExitScript
    End If
    Get_studyid = studyid
    Call back_to_study_page()
End Function
sub main(mumu_delay, app_delay, art_num, art_sec, video_num, video_sec, Endcode, is_comment, is_share)
    ' LockMouse   '锁定鼠标
    Dim nr_pos, wheel_flag, last_area, getsid
    If mumu_delay >= 25 Then
        mumu_start_t = mumu_delay
    End If
    If app_delay >= 20 Then
        app_start_t = app_delay
    End If
    If art_num >= 0 Then
        art_read_num =art_num
    End If
    If art_sec >= 0 Then
        art_read_time = art_sec 
    End If
    If video_num >= 0 Then
        video_watch_num = video_num 
    End If
    If video_sec >= 0 Then
        video_watch_time = video_sec 
    End If
    
    ' 唤醒屏幕 
    Call Awake()
    Call init(mumu_start_t,app_start_t)
    Call Login() '登录页面
    Call Get_global() '获取主页面   banner  和   channel  Y轴范围（绝对位置）
    ' todo 获得study
    getsid = Get_studyid()
    ' 验证seriesno
    legality = Check_finalsn(username, getsid, sn)
    If Not(legality) Then
        MsgBox no_regist
        ' Exit Sub
        Call Plugin.Window.Close(mumu_hd) ' 关闭程序
        ExitScript  '退出脚本
    End If
    ' Call Trace_variables() ' 打印全局变量参数
    last_pos = -1
    Do While art_read_num > 0 or art_read_time > 0
        ' 判断是否在文章学习栏目 
        ' 寻找下一个  未读文字标题 
        '     找到了 点击学习( 判断学习时间,待学习完后,再扣减阅读数量和阅读时间 )
        '     没找到 往后一个频道直至找到下一个  未读文字标题
        wheel_flag = 0
        Call back_to_study_page()
        ' Call Mylog("Call back_to_study_page()")
        do while True
            nr_pos = find_no_read()
            If nr_pos(0) > 0 and get_areaY(nr_pos(1), appy, apph) <> last_pos Then '找到的位置跟上一次的位置不一样
                Call Mylog("A got 1")
                MoveTo nr_pos(0), nr_pos(1)
                Delay 500
                LeftClick 1
                Delay net_delay
                last_pos = get_areaY(nr_pos(1), appy, apph)
                Exit do
            ElseIf wheel_flag < 2 Then
                Call Mylog("A can't got no read or find same")
                Delay 200
                Call next_screen(10)
                Delay 200
                wheel_flag = wheel_flag + 1
            Else 'wheel_flag = 2 Then
                Call Mylog("A can't got no read at all")
                Call right_channel()
                wheel_flag = 0
                last_pos = -1
                Delay net_delay
            End If
        loop
        If legality Then
            ' MsgBox no_regist
            Call studying(is_comment, is_share)
        End If
    Loop
    last_pos = -1
    Do While video_watch_num > 0 or video_watch_time > 0
        ' 判断是否在视频学习栏目 
        ' 寻找下一个  未读文字标题 
        '   找到了 点击学习( 判断学习时间,待学习完后,再扣减观看数量和观看时间 )
        '   没找到 往后一个频道直至找到下一个  未读文字标题
        ' // 视频学习  判断是否有下一集
        wheel_flag = 0
        Call back_to_video_page()
        ' Call Mylog("Call back_to_video_page()")
        do while True
            nr_pos = find_no_read()
            '//Call Mylog("Call find no read")
            '//Call Mylog("nr_pos: "& nr_pos(0) & ", " & nr_pos(1))
            If nr_pos(0) > 0 and get_areaY(nr_pos(1), appy, apph) <> last_pos Then '找到的位置跟上一次的位置不一样
                Call Mylog("got 1 video item")
                MoveTo nr_pos(0), nr_pos(1)
                Delay 500
                LeftClick 1
                Delay net_delay
                last_pos = get_areaY(nr_pos(1), appy, apph)
                Exit do
            ElseIf wheel_flag < 2 Then'找到同一个地点  
                Call Mylog("V can't got no read or find same")
                Delay 200
                Call next_screen(10)
                Delay 200
                wheel_flag = wheel_flag + 1
            ElseIf wheel_flag = 2 Then
                Call Mylog("V can't got at all")
                Call right_channel()
                wheel_flag = 0
                last_pos = -1
                Delay net_delay
            End If
        loop
        If legality Then
            ' MsgBox no_regist
            Call studying(is_comment, is_share)
        End If
    Loop
    ' //最后去积分页面判断是否学完了,若未学完再学习一个基本单位(文章4分钟,视频5分钟或一个)再判断是否学完
    ' //调用结束函数  Endcode  0:关闭程序  1:关机
    Call end_program(Endcode)
    ' UnlockMouse     '解锁鼠标
End sub


' ---------------------------------------   界面部分   ---------------------------------------
'选项卡
Event Form1.TabControl1.SelectChange
    If Form1.TabControl1.Tab = 0 Then  '主页面选项卡\
        Form1.Container0.Visible = True
        Form1.Container1.Visible = False
        Form1.Container2.Visible = False
        Form1.Container3.Visible = False
        Form1.Container4.Visible = False 
        If userpower <> 1 Then 'todo
            Form1.hourBox.Enabled = False
            Form1.minuteBox.Enabled = False
            Form1.secondBox.Enabled = False
            Form1.timingCheckBox.Enabled = False
            Form1.everydayCheckBox.Enabled = False
            huiyuanTipLabel.Visible = True
        End If
        is_comment = S2N(Plugin.File.ReadINI("UserSettings", "is_comment", confp))
        is_share = S2N(Plugin.File.ReadINI("UserSettings", "is_share", confp))
        is_auto = S2N(Plugin.File.ReadINI("UserSettings", "is_auto", confp))
        is_everyday = S2N(Plugin.File.ReadINI("UserSettings", "is_everyday", confp))
        autotime = Plugin.File.ReadINI("UserSettings", "autotime", confp)
        art_read_num = S2N(Plugin.File.ReadINI("UserSettings", "read_num", confp)) '//"8", confp))
        art_read_time = S2N(Plugin.File.ReadINI("UserSettings", "read_time", confp)) '//"2080", confp))
        video_watch_num = S2N(Plugin.File.ReadINI("UserSettings", "watch_num", confp)) '//"8", confp))
        video_watch_time = S2N(Plugin.File.ReadINI("UserSettings", "watch_time", confp)) '//"3120", confp))
        Form1.ranumBox.ListIndex = art_read_num
        Form1.ratBox.ListIndex = CInt(art_read_time / 60)
        Form1.wvnumBox.ListIndex = video_watch_num
        Form1.wvtBox.ListIndex = CInt(video_watch_time / 60)
        
        If autotime <> "" Then
            Form1.hourBox.ListIndex = Hour(autotime)
            Form1.minuteBox.ListIndex = Minute(autotime)
            Form1.secondBox.ListIndex = Second(autotime)
        End If
        If is_auto = True Then
            Form1.timingCheckBox.Value = 1
        Else
            Form1.timingCheckBox.Value = 0
        End If
        If is_everyday = True Then
            Form1.everydayCheckBox.Value = 1
        Else
            Form1.everydayCheckBox.Value = 0
        End If
        If is_comment = True Then
            Form1.commentCheckBox.Value = 1
        Else
            Form1.commentCheckBox.Value = 0
        End If
        If is_share = True Then
            Form1.shareCheckBox.Value = 1
        Else
            Form1.shareCheckBox.Value = 0
        End If

    ElseIf Form1.TabControl1.Tab = 1 Then '设置参数选项卡
        Form1.Container0.Visible = False
        Form1.Container1.Visible = True
        Form1.Container2.Visible = False
        Form1.Container3.Visible = False
        Form1.Container4.Visible = False 
        '设置参数界面初始化
        Form1.mumupathBrowse.Text = Plugin.File.ReadINI("SysInfo", "mumupath", confp)
        Form1.studyidBox.Text = Plugin.File.ReadINI("SysInfo", "studyid", confp)
        Form1.xxqgzhanghuBox.Text = Plugin.File.ReadINI("SysInfo", "username", confp)
        Form1.passwordBox.Text = Plugin.File.ReadINI("SysInfo", "password", confp)
    ElseIf Form1.TabControl1.Tab = 2 Then  '激活序列号选项卡
        Form1.Container0.Visible = False
        Form1.Container1.Visible = False
        Form1.Container2.Visible = True
        Form1.Container3.Visible = False
        Form1.Container4.Visible = False 
        
        '激活界面初始化
        Dim studyid, sn, xxqgzh
     	xxqgzh = Plugin.File.ReadINI("SysInfo", "username", confp)
     	studyid = Plugin.File.ReadINI("SysInfo", "studyid", confp)
     	sn = Plugin.File.ReadINI("SysInfo", "seriesno", confp)
     	Form1.snBox.Text = sn
     	If Check_finalsn2(xxqgzh, studyid, sn) Then 
         	Form1.activeBtn.Caption = "激活成功"
         	Form1.activeBtn.Enabled = False
     	Else 
         	Form1.activeBtn.Caption = "现在激活"
         	Form1.activeBtn.Enabled = True
     	End If
    ElseIf Form1.TabControl1.Tab = 3 Then   '设置评论选项卡
        Form1.Container0.Visible = False
        Form1.Container1.Visible = False
        Form1.Container2.Visible = False
        Form1.Container3.Visible = True 
        Form1.Container4.Visible = False
        Form1.com_contentBox.Text = Plugin.File.ReadINI("UserSettings", "comment_content", confp)
    ' ElseIf Form1.TabControl1.Tab = 4 Then   '帮助选项卡
    '     Form1.Container0.Visible = False
    '     Form1.Container1.Visible = False
    '     Form1.Container2.Visible = False
    '     Form1.Container3.Visible = False 
    '     Form1.Container4.Visible = True 
    End If
End Event
 '设置参数  点击设置按钮
Event Form1.setparamBtn.Click
    Dim mmpath
    If Form1.mumupathBrowse.Text <> "" Then  
        mmpath = Form1.mumupathBrowse.Text
        Call Plugin.File.WriteINI("SysInfo", "mumupath", mmpath, confp)
    End If
    If Form1.studyidBox.Text <> "" Then  
        Call Plugin.File.WriteINI("SysInfo", "studyid", Form1.studyidBox.Text, confp)
    End If
    If Form1.com_contentBox.Text <> "" Then  
        Call Plugin.File.WriteINI("UserSettings", "comment_content", Form1.com_contentBox.Text, confp)
    End If
    If Form1.passwordBox.Text <> "" Then  
        Call Plugin.File.WriteINI("SysInfo", "password", Form1.passwordBox.Text, confp)
    End If
    If Form1.xxqgzhanghuBox.Text <> "" Then  
        Call Plugin.File.WriteINI("SysInfo", "username", Form1.xxqgzhanghuBox.Text, confp)
    End If
    MsgBox "设置成功"
End Event

 '设置评论  点击设置按钮
Event Form1.set_comBtn.Click
    If Form1.com_contentBox.Text <> "" Then  
        Call Plugin.File.WriteINI("UserSettings", "comment_content", Form1.com_contentBox.Text, confp)
    End If
End Event


'注册页面  激活按钮
Event Form1.activeBtn.Click
    Dim sid, sn, xxqgzh
    sid = Plugin.File.ReadINI("SysInfo", "studyid", confp)
    sn = Form1.snBox.Text
    xxqgzh = Plugin.File.ReadINI("SysInfo", "username", confp)
     If Check_finalsn2(xxqgzh, sid, sn) Then 
        Call Plugin.File.WriteINI("SysInfo", "seriesno", sn, confp)
        Form1.activeBtn.Caption = "激活成功"
        Form1.activeBtn.Enabled = False
        userpower = Get_priority(sn)
        Form1.huiyuanTipLabel.Caption = "到期日期：" & Get_eds(sn)

        If userpower = 1 Then
            Form1.hourBox.Enabled = True
            Form1.minuteBox.Enabled = True
            Form1.secondBox.Enabled = True
            Form1.timingCheckBox.Enabled = True
            Form1.everydayCheckBox.Enabled = True
            huiyuanTipLabel.Visible = False
        End If
     Else 
        MsgBox "激活失败, 请注册"
     End If
End Event
 '主页面  点击学习按钮
Event Form1.studyBtn.Click
	Dim rani, rati, wvni, wvti, Endproi, iscomment, isshare, iseveryday, isauto, SWTime
	Dim read_sec, watch_sec
	rani = Form1.ranumBox.ListIndex                     '此处设计刚好下标等于值
	rati = Form1.ratBox.ListIndex                    '此处设计刚好下标等于值
	wvni = Form1.wvnumBox.ListIndex                    '此处设计刚好下标等于值
	wvti = Form1.wvtBox.ListIndex                 '此处设计刚好下标等于值
	Endproi = Form1.EndproBox.ListIndex
	
	read_sec = CLng(rati) * 60
	watch_sec = CLng(wvti) * 60

	iscomment = "0" : isshare = "0" : iseveryday = "0" : isauto = "0"
	If Form1.commentCheckBox.Value = 1 Then 
 	    iscomment = "-1"
	End If
	If Form1.shareCheckBox.Value = 1 Then 
 	    isshare = "-1"
	End If
	If Form1.everydayCheckBox.Value = 1 Then 
 	    iseveryday = "-1"
	End If
	If Form1.timingCheckBox.Value = 1 Then 
 	    isauto = "-1"
	End If
    
	SWTime = Form1.hourBox.ListIndex & ":" & Form1.minuteBox.ListIndex & ":" & Form1.secondBox.ListIndex
	' 将设置写入配置
	Call Plugin.File.WriteINI("UserSettings", "Endprogram", Endproi, confp)
 	Call Plugin.File.WriteINI("UserSettings", "watch_num", wvni, confp)
    Call Plugin.File.WriteINI("UserSettings", "watch_time", watch_sec, confp)
    Call Plugin.File.WriteINI("UserSettings", "read_num", rani, confp)
    Call Plugin.File.WriteINI("UserSettings", "read_time", read_sec, confp)
    Call Plugin.File.WriteINI("UserSettings", "is_comment", iscomment, confp)
    Call Plugin.File.WriteINI("UserSettings", "is_share", isshare, confp)
    Call Plugin.File.WriteINI("UserSettings", "is_auto", isauto, confp)
    Call Plugin.File.WriteINI("UserSettings", "is_everyday", iseveryday, confp)
    Call Plugin.File.WriteINI("UserSettings", "autotime", SWTime, confp)
 
End Event

'加载输入框文本内容初始值   
Event Form1.Load   
    '  Call init_param()
	confp = ".\data\data.dat"
    Call Read_config()
	sn = Plugin.File.ReadINI("SysInfo", "seriesno", confp) 
    If sn <> "" Then
        daoqi = "到期日期：" & Get_eds(sn)
        userpower = Get_priority(sn)
    Else
        daoqi = "未注册激活"
        userpower = -1
    End If
    ' 'test
    ' MsgBox "userpower "&userpower
End Event  

'加载完成后输入框文本内容被重新赋值   
Event Form1.LoadOver   
    ' 加载完成后显示主页面的值
    Form1.Container0.Visible = True
    Form1.Container1.Visible = False
    Form1.Container2.Visible = False
    Form1.Container3.Visible = False
    Form1.Container4.Visible = False 
    If userpower <> 1 Then 'todo
        Form1.hourBox.Enabled = False
        Form1.minuteBox.Enabled = False
        Form1.secondBox.Enabled = False
        Form1.timingCheckBox.Enabled = False
        Form1.everydayCheckBox.Enabled = False
        huiyuanTipLabel.Visible = True
    End If
    is_comment = S2N(Plugin.File.ReadINI("UserSettings", "is_comment", confp))
    is_share = S2N(Plugin.File.ReadINI("UserSettings", "is_share", confp))
    is_auto = S2N(Plugin.File.ReadINI("UserSettings", "is_auto", confp))
    is_everyday = S2N(Plugin.File.ReadINI("UserSettings", "is_everyday", confp))
    autotime = Plugin.File.ReadINI("UserSettings", "autotime", confp)
    art_read_num = S2N(Plugin.File.ReadINI("UserSettings", "read_num", confp)) '//"8", confp))
    art_read_time = S2N(Plugin.File.ReadINI("UserSettings", "read_time", confp)) '//"2080", confp))
    video_watch_num = S2N(Plugin.File.ReadINI("UserSettings", "watch_num", confp)) '//"8", confp))
    video_watch_time = S2N(Plugin.File.ReadINI("UserSettings", "watch_time", confp)) '//"3120", confp))
    Form1.ranumBox.ListIndex = art_read_num
    Form1.ratBox.ListIndex = CInt(art_read_time / 60)
    Form1.wvnumBox.ListIndex = video_watch_num
    Form1.wvtBox.ListIndex = CInt(video_watch_time / 60)
    
    Form1.huiyuanTipLabel.Caption = daoqi
    If autotime <> "" Then
        Form1.hourBox.ListIndex = Hour(autotime)
        Form1.minuteBox.ListIndex = Minute(autotime)
        Form1.secondBox.ListIndex = Second(autotime)
    End If
    If is_auto = True Then
        Form1.timingCheckBox.Value = 1
    Else
        Form1.timingCheckBox.Value = 0
    End If
    If is_everyday = True Then
        Form1.everydayCheckBox.Value = 1
    Else
        Form1.everydayCheckBox.Value = 0
    End If
    If is_comment = True Then
        Form1.commentCheckBox.Value = 1
    Else
        Form1.commentCheckBox.Value = 0
    End If
    If is_share = True Then
        Form1.shareCheckBox.Value = 1
    Else
        Form1.shareCheckBox.Value = 0
    End If

    Form1.mumupathBrowse.Text = Plugin.File.ReadINI("SysInfo", "mumupath", confp)
    Form1.com_contentBox.Text = Plugin.File.ReadINI("UserSettings", "comment_content", confp)
    Form1.xxqgzhanghuBox.Text = Plugin.File.ReadINI("SysInfo", "username", confp)
    Form1.passwordBox.Text = Plugin.File.ReadINI("SysInfo", "password", confp)
    Form1.snBox.Text = Plugin.File.ReadINI("SysInfo", "seriesno", confp)
    Form1.studyidBox.Text = Plugin.File.ReadINI("SysInfo", "studyid", confp)
End Event  

'当界面窗体被关闭后产生的事件消息   
Event Form1.UnLoad   
    ' If scrX > 0 Then
    '     Call Plugin.Sys.SetSc(scrX,scrY,32)
    ' End If
    ExitScript
End Event
'--------------------------------------------------- 界面部分 End -----------------------------------------------

'程序入口
' tempPath = Plugin.Sys.GetDir(3)
'     If Right(tempPath, 1) <> "/" and Right(tempPath, 1) <> "\" Then 
' 	    tempPath = tempPath & "\"
'     End If
' logPath = tempPath & Replace(Replace(Now, "/", "_"), ":","_") & ".log"
LogStart mylogPath & ".log"
' 初始化参数
Call init_param()
If Check_finalsn2(username, studyid, sn) Then 
    ' 获取用户权限
    swt = TimeValue(autotime)
    If is_auto = - 1  Then 
    	TracePrint "yes2"
        Call Timing_perform(swt)
        Call main(mumu_start_t, app_start_t, art_read_num, art_read_time, video_watch_num, video_watch_time, Endcode, is_comment, is_share)
    Else 
        Call main(mumu_start_t, app_start_t, art_read_num, art_read_time, video_watch_num, video_watch_time, Endcode, is_comment, is_share)
    End If
Else
    MsgBox no_regist
End If
LogStop














' //' --------------------    POST VARIABLE START    -----------------------------------------------------------
' //VBSBegin
' //    Function HTTP_POST(URL,data)
' //        Dim XML
' //        Set XML = CreateObject("WinHttp.WinHttpRequest.5.1")
' //        With XML
' //            .Open "POST",URL ,True
' //            .SetRequestHeader "Content-Type", "application/x-www-form-urlencoded"'设置HTTP头信息
' //            .SetTimeouts 300000, 300000, 300000, 60000
' //            .SEnd(data)
' //            .WaitForResponse
' //            If .Status = 200 Then'成功获取页面
' //                HTTP_POST = .ResponseBody 'GB2312ToUnicode(.ResponseBody)
' //            End If
' //        End With
' //    End Function
' //
' //    Function GB2312ToUnicode(str)
' //        With CreateObject("adodb.stream")
' //            .Type = 1 : .Open
' //            .Write str : .Position = 0
' //            .Type = 2 : .Charset = "gb2312"
' //            GB2312ToUnicode = .ReadText : .Close
' //        End With
' //    End Function
' //VBSEnd
' //' --------------------    POST VARIABLE END    -----------------------------------------------------------
' //
' //' 后台下载文件
' //    ' Dim Url, Target
' //    ' Url = "http://www.xyz500.com/static/test.zip"
' //    ' Target = "d:/test.zip"
' //    ' Download Url,Target
' //    ' Sub Download(url,target)
' //    '     Const adTypeBinary = 1
' //    '     Const adSaveCreateOverWrite = 2
' //    '     Dim http,ado
' //    '     Set http = CreateObject("Msxml2.ServerXMLHTTP")
' //    '     http.open "GET",url,False   ' False表示同步执行, 等待返回后再执行下一步
' //    '     http.sEnd
' //    '     Set ado = createobject("Adodb.Stream")
' //    '     ado.Type = adTypeBinary       '默认值为 adTypeText。但如果二进制数据最初被写入新的空 Stream 中, Type 将被更改为 adTypeBinary
' //    '     ado.Open
' //    '     ado.Write http.responseBody
' //    '     ado.SaveToFile target
' //    '     ado.Close
' //    ' End Sub
' //
' //' --------------------    POST FILE START    -----------------------
' //Sub Class_Initialize()
' //	adTypeBinary = 1 
' //	adTypeText = 2 
' //	Set xmlHttp = CreateObject("WinHttp.WinHttpRequest.5.1") 
' //    xmlHttp.SetTimeouts 300000, 300000, 300000, 60000
' //	Set objTemp = CreateObject("ADODB.Stream") 
' //	objTemp.Type = adTypeBinary 
' //	objTemp.Open 
' //	strCharset = "utf-8" 
' //	strBoundary = GetBoundary() 
' //End Sub
' //
' //Sub Class_Terminate() 
' //	objTemp.Close 
' //	Set objTemp = Nothing 
' //	Set xmlHttp = Nothing 
' //End Sub 
' //
' //'指定字符集的字符串转字节数组 
' //Function StringToBytes(strData, strCharset) 
' //	Dim objFile 
' //	Set objFile = CreateObject("ADODB.Stream") 
' //	objFile.Type = adTypeText 
' //	objFile.Charset = strCharset 
' //	objFile.Open 
' //	objFile.WriteText strData 
' //	objFile.Position = 0 
' //	objFile.Type = adTypeBinary 
' //	If UCase(strCharset) = "UNICODE" Then 
' //		objFile.Position = 2 'delete UNICODE BOM 
' //	ElseIf UCase(strCharset) = "UTF-8" Then 
' //		objFile.Position = 3 'delete UTF-8 BOM 
' //	End If 
' //	StringToBytes = objFile.Read(-1) 
' //	objFile.Close 
' //	Set objFile = Nothing 
' //End Function 
' //
' //'获取文件内容的字节数组 
' //Function GetFileBinary(strPath) 
' //	Dim objFile 
' //	Set objFile = CreateObject("ADODB.Stream") 
' //	objFile.Type = adTypeBinary 
' //	objFile.Open 
' //	objFile.LoadFromFile strPath 
' //	GetFileBinary = objFile.Read(-1) 
' //	objFile.Close 
' //	Set objFile = Nothing 
' //End Function 
' //
' //'获取自定义的表单数据分界线 
' //Function GetBoundary() 
' //	Dim ret(12) 
' //	Dim table 
' //	Dim i 
' //	table = "abcdefghijklmnopqrstuvwxzy0123456789" 
' //	Randomize 
' //	For i = 0 To UBound(ret) 
' //	ret(i) = Mid(table, Int(Rnd() * Len(table) + 1), 1) 
' //	Next 
' //	GetBoundary = "---------------------------" & Join(ret, Empty) 
' //End Function 
' //
' //'设置上传使用的字符集 
' //Sub Charset(strValue) 
' //	strCharset = strValue 
' //End Sub 
' //
' //'添加文本域的名称和值 
' //Sub AddForm(strName, strValue) 
' //	Dim tmp 
' //	tmp = "\r\n--$1\r\nContent-Disposition: form-data; name=""$2""\r\n\r\n$3" 
' //	tmp = Replace(tmp, "\r\n", vbCrLf) 
' //	tmp = Replace(tmp, "$1", strBoundary) 
' //	tmp = Replace(tmp, "$2", strName) 
' //	tmp = Replace(tmp, "$3", strValue) 
' //	objTemp.Write StringToBytes(tmp, strCharset) 
' //End Sub 
' //
' //'设置文件域的名称/文件名称/文件MIME类型/文件路径或文件字节数组 
' //Sub AddFile(strName, strFileName, strFileType, strFilePath) 
' //	Dim tmp 
' //	tmp = "\r\n--$1\r\nContent-Disposition: form-data; name=""$2""; filename=""$3""\r\nContent-Type: $4\r\n\r\n" 
' //	tmp = Replace(tmp, "\r\n", vbCrLf) 
' //	tmp = Replace(tmp, "$1", strBoundary) 
' //	tmp = Replace(tmp, "$2", strName) 
' //	tmp = Replace(tmp, "$3", strFileName) 
' //	tmp = Replace(tmp, "$4", strFileType) 
' //	objTemp.Write StringToBytes(tmp, strCharset) 
' //	objTemp.Write GetFileBinary(strFilePath) 
' //End Sub 
' //
' //'设置multipart/form-data结束标记 
' //Private Sub AddEnd() 
' //	Dim tmp 
' //	tmp = "\r\n--$1--\r\n" 
' //	tmp = Replace(tmp, "\r\n", vbCrLf) 
' //	tmp = Replace(tmp, "$1", strBoundary) 
' //	objTemp.Write StringToBytes(tmp, strCharset) 
' //	objTemp.Position = 2 
' //End Sub 
' //
' //'上传到指定的URL, 并返回服务器应答 
' //Function Upload(strURL) 
' //	Call AddEnd 
' //	xmlHttp.Open "POST", strURL, False 
' //	xmlHttp.setRequestHeader "Content-Type", "multipart/form-data; boundary=" & strBoundary 
' //	xmlHttp.setRequestHeader "Content-Length", objTemp.size 
' //	xmlHttp.SEnd objTemp 
' //	Upload = xmlHttp.responseText 
' //End Function 
' //Sub Postfile(url, cphone, sid, sno, act, name, fname, ftype, fpath)
' //	Call Class_Initialize()
' //	call Charset("utf-8")
' //	call AddForm("cellphone",cphone)	'文本域的名称和内容 
' //	call AddForm("studyid",sid)	'文本域的名称和内容 
' //	call AddForm("sn",sno)	'文本域的名称和内容 
' //	call AddForm("act",act)		 '文本域的名称和内容 
' //	call AddFile(name, fname, ftype, fpath)
' //	' AddFile(ByVal strName, ByVal strFileName, ByVal strFileType, ByVal strFilePath)
' //	repon = Upload(url)
' //	TracePrint "Postfile repon: " & repon
' //	Call Class_Terminate()
' //End Sub
' //' -----------------------------------------  POST FILE END  ------------------------------------------------------------
' //
' //Function Add_ps(post_str, key, value)
' //    Add_ps = post_str & "&" & key & "=" & value
' //End Function
' //
' //Sub Post_global(url)
' //    Dim post_content, respon
' //    post_content = "act=upvar"
' //    post_content = Add_ps(post_content,"cellphone",username)
' //    post_content = Add_ps(post_content,"studyid",studyid)
' //    post_content = Add_ps(post_content,"sn",sn)
' //    post_content = Add_ps(post_content,"version",version)
' //    post_content = Add_ps(post_content,"screenh",ScreenH)
' //    post_content = Add_ps(post_content,"screenw",ScreenW)
' //    post_content = Add_ps(post_content,"dev",Dev)
' //    post_content = Add_ps(post_content,"sys_type",sys_type)
' //    post_content = Add_ps(post_content,"appx",appx)
' //    post_content = Add_ps(post_content,"appy",appy)
' //    post_content = Add_ps(post_content,"appw",appw)
' //    post_content = Add_ps(post_content,"apph",apph)
' //    post_content = Add_ps(post_content,"end_main_menu_rY",end_main_menuY - appy)
' //    post_content = Add_ps(post_content,"start_ch_rY",start_chY - appy)
' //    post_content = Add_ps(post_content,"end_ch_rY",end_chY - appy)
' //    post_content = Add_ps(post_content,"start_body_rY",start_bodyY - appy)
' //    post_content = Add_ps(post_content,"end_body_rY",end_bodyY - appy)
' //    post_content = Add_ps(post_content,"start_col_rY",start_colY - appy)
' //    post_content = Add_ps(post_content,"app_col_rY",app_col_absY - appy)
' //    post_content = Add_ps(post_content,"share_rX",share_absX - appx)
' //    post_content = Add_ps(post_content,"start_vbar_rY",video_bar_scale_absY(0) - appy)
' //    post_content = Add_ps(post_content,"end_vbar_rY",video_bar_scale_absY(1) - appy)
' //    post_content = Add_ps(post_content,"get_vbar_delay",get_vbar_delay)
' //    post_content = Add_ps(post_content,"main_error",main_error)
' //    TracePrint post_content
' //    respon = HTTP_POST(url , post_content)
' //    ' TracePrint GB2312ToUnicode(respon)
' //End Sub
' //
' //' 脚本结束后运行
' //Sub OnScriptExit()   
' //    ' 上传log文件
' //    If main_error < 100 and main_error > 0 Then
' //        Call Post_global("http://www.xyz500.com/com/")
' //    End If
' //    If main_error > 0 Then
' //        Call Postfile("http://www.xyz500.com/com/", username, studyid, sn, "uplog", "userlog", mylogName, "text/plain",mylogPath)
' //    End If
' //    If exit_msg <> "" Then
' //        MsgBox exit_msg
' //    End If
' //End Sub