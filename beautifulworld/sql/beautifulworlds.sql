set names utf8;
set foreign_key_checks=0;

drop database if exists beautifulworlds;
create database if not exists beautifulworlds;

use beautifulworlds;

create table user_info(
id int primary key not null auto_increment comment "ID",
user_id varchar(16) unique not null comment "ユーザーID",
password varchar(16) not null comment "パスワード",
family_name varchar(32) not null comment "姓",
first_name varchar(32) not null comment "名",
family_name_kana varchar(32) not null comment "姓かな",
first_name_kana varchar(32) not null comment "名かな",
sex tinyint not null default 0 comment "姓別",
email varchar(32) not null comment "メールアドレス",
status tinyint not null default 0 comment "ステータス",
logined tinyint not null default 0 comment "ログインフラグ",
regist_date datetime not null comment "登録日",
update_date datetime not null comment "更新日"
)
default charset=utf8
comment="会員情報テーブル"
;
insert into user_info values
(1,"guest","guest","インターノウス","ゲストユーザー","いんたーのうす","げすとゆーざー",0,"guest@gmail.com",0,0,now(),now());


create table product_info(
id int primary key not null auto_increment comment "ID",
product_id int unique not null comment "商品ID",
product_name varchar(100) unique not null comment "商品名",
product_name_kana varchar(100) not null comment "商品名かな",
product_description varchar(255) not null comment "商品詳細",
category_id int not null not null comment "カテゴリID",
price int comment "価格",
image_file_path varchar(100) comment "画像ファイルパス",
image_file_name varchar(50) comment "画像ファイル名",
release_date datetime not null comment "発売年月",
release_company varchar(50) comment "発売会社",
status tinyint not null default 0 comment "ステータス",
regist_date datetime not null comment "登録日",
update_date datetime comment "更新日",
foreign key(category_id) references m_category(category_id)
)
default charset=utf8
comment="商品情報テーブル"
;
insert into product_info values
( 1, 1,"シャンプー１","しゃんぷー１","シャンプー１の商品詳細",2,1500,"./images","syampu1.jpg",now(),"発売会社",0,now(),now()),
( 2, 2,"シャンプー２","しゃんぷー２","シャンプー２の商品詳細",2,2000,"./images","syampu2.jpg",now(),"発売会社",0,now(),now()),
( 3, 3,"シャンプー３","しゃんぷー３","シャンプー３の商品詳細",2,3000,"./images","syampu3.jpg",now(),"発売会社",0,now(),now()),
( 4, 4,"シャンプー４","しゃんぷー４","シャンプー４の商品詳細",2,1000,"./images","syampu4.jpg",now(),"発売会社",0,now(),now()),
( 5, 5,"シャンプー５","しゃんぷー５","シャンプー５の商品詳細",2,2000,"./images","syampu5.jpg",now(),"発売会社",0,now(),now()),
( 6, 6,"シャンプー６","しゃんぷー６","シャンプー６の商品詳細",2,3000,"./images","syampu6.jpg",now(),"発売会社",0,now(),now()),
( 7, 7,"シャンプー７","しゃんぷー７","シャンプー７の商品詳細",2,1600,"./images","syampu7.jpg",now(),"発売会社",0,now(),now()),
( 8, 8,"シャンプー８","しゃんぷー８","シャンプー８の商品詳細",2,2300,"./images","syampu8.jpg",now(),"発売会社",0,now(),now()),
( 9, 9,"シャンプー９","しゃんぷー９","シャンプー９の商品詳細",2,3200,"./images","syampu9.jpg",now(),"発売会社",0,now(),now()),
( 10, 10,"ワックス１","わっくす１","ワックス１の商品詳細",3,1000,"./images","wax1.jpg",now(),"発売会社",0,now(),now()),
( 11, 11,"ワックス２","わっくす２","ワックス２の商品詳細",3,800,"./images","wax2.jpg",now(),"発売会社",0,now(),now()),
( 12, 12,"ワックス３","わっくす３","ワックス３の商品詳細",3,600,"./images","wax3.jpg",now(),"発売会社",0,now(),now()),
( 13, 13,"ワックス４","わっくす４","ワックス４の商品詳細",3,900,"./images","wax4.jpg",now(),"発売会社",0,now(),now()),
( 14, 14,"ワックス５","わっくす５","ワックス５の商品詳細",3,1200,"./images","wax5.jpg",now(),"発売会社",0,now(),now()),
( 15, 15,"ワックス６","わっくす６","ワックス６の商品詳細",3,1300,"./images","wax6.jpg",now(),"発売会社",0,now(),now()),
( 16, 16,"ワックス７","わっくす７","ワックス７の商品詳細",3,1600,"./images","wax7.jpg",now(),"発売会社",0,now(),now());


create table cart_info(
id int primary key not null auto_increment comment "ID",
user_id varchar(16) not null comment "ユーザーID",
temp_user_id varchar(16) comment "仮ユーザーID",
product_id int not null comment "商品ID",
product_count int not null comment "個数",
price int not null comment "金額",
regist_date datetime not null comment "登録日",
update_date datetime comment "更新日"
)
default charset=utf8
comment="カート情報テーブル"
;

create table purchase_history_info(
id int primary key not null auto_increment comment "ID",
user_id varchar(16) not null comment "ユーザーID",
product_id int not null comment "商品ID",
product_count int not null comment "個数",
price int not null comment "金額",
destination_id int not null comment "宛先情報ID",
regist_date datetime not null comment "登録日",
update_date datetime not null comment "更新日",
foreign key(user_id) references user_info(user_id),
foreign key(product_id) references product_info(product_id)
)
default charset=utf8
comment="購入履歴情報テーブル"
;



create table m_category(
id int primary key not null comment "ID",
category_id int not null unique comment "カテゴリID",
category_name varchar(20) not null unique comment "カテゴリ名",
category_description varchar(100) comment "カテゴリ詳細",
insert_date datetime not null comment "登録日",
update_date datetime comment "更新日"
)
default charset=utf8
comment="カテゴリマスタテーブル"
;
insert into m_category values
(1,1,"全てのカテゴリー","全てのカテゴリーが対象となります",now(), null),
(2,2,"シャンプー","シャンプーに関するカテゴリーが対象となります",now(),null),
(3,3,"ワックス","ワックスに関するカテゴリーが対象となります",now(),null);


create table reservation_info(
id int primary key not null auto_increment comment "ID",
staff_id int not null comment "スタッフID",
staff_name varchar(32) not null comment "スタッフ名",
month int not null comment "月",
day int not null comment "日",
hour int not null comment "時",
minute int not null comment "分"
)
default charset=utf8
comment="予約テーブル"
;
insert into reservation_info values
(1,1,"riccardo cocchi",2,26,10,0),
(2,1,"riccardo cocchi",2,27,10,0),
(3,1,"riccardo cocchi",2,28,16,0),
(4,2,"sergey surkov",2,27,11,0),
(5,1,"riccardo cocchi",3,3,14,30),
(6,2,"sergey surkov",3,4,12,30),
(7,1,"riccardo cocchi",2,27,15,0),
(8,1,"riccardo cocchi",3,2,11,0),
(9,1,"riccardo cocchi",3,1,11,30);


create table staff_colum(
id int primary key not null auto_increment comment "ID",
colum_id int not null comment "コラムID",
colum_title varchar(32) not null comment "コラムタイトル",
colum_description varchar(255) comment "コラム文章",
staff_id int not null comment "スタッフID",
image_file_path varchar(100) comment "画像ファイルパス",
image_file_name varchar(50) comment "画像ファイル名",
update_date datetime comment "更新日"
)
default charset=utf8
comment="スタッフコラム"
;

insert into staff_colum values
(1,1,"初カット！！☆☆","先日定期的にやって頂いている青木さんのカット講習で


初めて青木さんにカットして頂きました！


伸ばしていたのでもさもさの髪の毛だったのをお任せで切って頂き

バッサリイメチェン出来ました！


青木さんのカットを実際に体験できて青木さんの作るスタイルの質感、自分での扱いやすさ、


ドライの状態でも決まるスタイルの作り方など色んな勉強が出来ました！


今後にも活かしていいスタイリストになれるよう頑張ります！！！！"
,5,"./images","colum1.jpeg","2019-03-21"),
(2,2,"ミーティング	",
"こんにちは！

この前 営業前にオーナーの青木さんに誘っていただき青木さんと越賀さんと同期の藤田くんと
ランチミーティングをしました
いつもご利用させて頂いているお店の目の前のnumberAというカフェでランチをしましたがその日は天気が良くてすごい気持ちよかったです！

これからのTIECHELの事や今の自分の目標だったりなど熱くお話できてとてもいい時間とこれからの目標ができたのでそれを達成できるように頑張ります！

ご飯も美味しいので是非行ってみて下さい(^^)"
,2,"./images","colum2.jpeg","2019-03-23"),
(3,3,"silver",
"こんにちは！
最近のオススメの雑誌を紹介いたします！！
silverという雑誌でさまざまな服やスポットなどを紹介していてとても面白いです！
お店にあるのでお気軽にお声掛けください！"
,4,"./images","colum3.jpeg","2019-03-22"),
(4,4,"ふんわりボブ	",
"モデル様カットカラーしました！

ラインが出るようにボブにカットして

毛先を細いアイロンでしっかり巻いたスタイルです！

外ハネやストレートにスタイリングすると
お洒落でクールな感じになるのですが

内巻きに入れるとふんわりして
可愛い感じに仕上がります！

スタイリングで印象が変わるので
試してみて下さい！！"
,2,"./images","colum4.jpeg","2019-03-20");


create table styling_list(
id int primary key not null auto_increment comment "ID",
style_id int not null comment "スタイリングID",
category_id int not null comment "カテゴリーID",
style_theme varchar(64) comment "スタイルテーマ",
style_description varchar(255) comment "ヘアスタイルの説明",
style_popular_year varchar(32) not null comment "スタイルが流行った年",
staff_id int not null comment "スタッフID",
image_file_path varchar(100) comment "画像ファイルパス",
image_file_name varchar(50) comment "画像ファイル名",
update_date datetime comment "更新日"
)
default charset=utf8
comment="スタイリングリストテーブル"
;

insert into styling_list values
(1,1,3,"Fluffy","冬に暖かさを感じさせる柔らかい質感のヘアスタイル。モヘアやニットなどのファッションに合うフワフワ感","2016 winter",2,"./images","style1.jpeg","2016-12-01"),
(2,2,1,"大人かきあげバング×ミディアムストレート",
"ボブから伸ばしたミディアムヘア。伸ばしかけでも似合うストレートスタイルの紹介！前髪で遊ぶのもよし。前髪なしのかきあげスタイルにも似合っちゃいます！レイヤーで作る柔らかさや、ヘ丸顔・面長に悩む人も小顔になれるベーシックスタイル☆",
"2012 spring",4,"./images","style2.jpg","2012-01-14"),
(3,3,1,"うざバングと外ハネボブ",
"うざすぎる前髪がポイントです。",
"2014 winter",2,"./images","style3.jpg","2014-11-14"),
(4,4,1,"インナーカラーは青系のイルミナオーシャンをレイヤーボブにプラスしてみて",
"今流行のレイヤーボブ！レイヤーを入れることで動きも出て、インナーカラーもより際立つスタイルに。",
"2017 spring",4,"./images","style4.jpg","2017-3-14"),
(5,5,1,"スモーキーカラーなほつれウェーブBob",
"カラーリングは8トーンのスモーキーアッシュで、26mmのコテを使い、仕上げはN.のバームで柔らかい質感を作りました！",
"2018 spring",6,"./images","style5.jpg","2018-3-14");

create table staff_info(
id int primary key not null auto_increment comment "ID",
staff_id int unique not null comment "スタッフID",
staff_name varchar(255) not null comment "スタッフ名",
staff_name_kana varchar(255) comment "スタッフ名かな",
position varchar(255) comment "役職",
cut varchar(255) comment "得意なカット",
staff_pr varchar(255) comment "PR",
image_file_path varchar(100) comment "画像ファイルパス",
image_file_name varchar(50) comment "画像ファイル名",
regist_date datetime comment "登録日"
)
default charset=utf8
comment="スタッフ一覧"
;


insert into staff_info values
(1,1,"riccardo cocchi","リカルド コッキ","トップスタイリスト","キュートボブ、ナチュラルゆるふわパーマ、愛されショートカット","ＷＤＣヘアコンテスト2016 最優秀賞受賞","./images","staff1.jpg",now()),
(2,2,"sergey surkov","セルゲイ サルコフ","クリエイティブディレクター","ハイトーンカラー","ＷＤＣカットコンテスト 特別優秀賞入賞","./images","staff2.jpg",now()),
(3,3,"nino langella","ニノ ランゲラ","マネージャー","グラデーションカット","ＷＤＣカットコンテスト 特別優秀賞入賞","./images","staff3.jpg",now()),
(4,4,"andrey gusev","アンドレイ グセフ","チーフ","レイヤーカット","","./images","staff4.jpg",now()),
(5,5,"Morten Lowe","モーテン ロウ","ディレクター","シャギーカット","","./images","staff5.jpg",now()),
(6,6,"sergey tatarenko","セルゲイ タタレンコ","店長","ボブカット","","./images","staff6.jpg",now());


create table news_table(
id int primary key not null auto_increment comment "ID",
news_id int not null comment "ニュースID",
news_title varchar(32) not null comment "ニュースタイトル",
news_description varchar(1023) comment "ニュース文章",
update_date datetime comment "更新日"
)
default charset=utf8
comment="スタッフコラム"
;

insert into news_table values
(1,1,"新卒・中途採用募集致します！！",
"＊＊募集スタッフ＊＊

新卒・中途アシスタント 【研修期間あり 】

＊＊詳細＊＊

基本給　　　165,000円〜195,000円（技術昇給あり）
交通費　　　全額支給
　　　　　　福利厚生　　厚生年金　雇用保険　労災保険　健康保険　
　　　　　　
定休日　　　毎週火曜日と公休3日
　　　　　　【アシスタント】 有休年間 7日【スタイリスト】有休年間 10日 慶弔休暇　 結婚休暇　年末年始休暇　
　　　　
※ご応募の際は、下記まで履歴書をお送りください。

＞＞履歴書の送付先＜＜
○○○-○○○○
○○県○○市○○○区○○-○○○○-○○",
"2018-09-30"),
(2,2,"ネット予約サービス開始",
"この度、新ネット予約サービスを開始致しました。

以前からもネット予約サービスをさせて頂きましたが
より、お客様に快適にお使い頂けるよう
新たな導入に至りました。


ヘッダーにResevationInfoのボタンがございます。

そちらからご登録、予約画面へと切り替わります。

ご不明な点などございましたらお気軽にTIECHELにて

お問い合わせ下さい。",
"2018-04-03"),
(3,3,"Halloweenのお知らせ☆",
"10月29日【日曜日】

仮装営業させて頂きます！！！

本気で仮装で頑張ります！！！

見て楽しんで頂けるかと思います！！


是非、このチャンスに遊びきて下さい！！！",
"2017-10-14"),
(4,4,"GW 営業時間のお知らせ",
"５月GWの営業時間のお知らせになります。

GW中は祝日になりますので水曜日、金曜日の営業時間が異なります。

５月１日　通常営業時間
５月２日　定休日
５月３日　10:00〜19:00
５月４日　通常営業時間
５月５日　10:00〜19:00",
"2017-04-29"),
(5,5,"Riccardoカットセミナー第3回【カット&パーマ】",
"僕のテクニックセミナー
「THE CUT FACTORY」の第3回目を開催します！

第３回目はパーマの為のカット、良いカールを作るワインディングがテーマです。

どのようにしてなるべく髪にダメージを出さずにスタイリングしやすいパーマをかけるか

薬剤の選定、ベースの取り方、シェーピング、巻き方、スタイリング方法など

細かく伝えます。


【第３回テーマ】
〜パーマの為のカットとワインディング〜
2017/5/16 火曜日
13:00〜16:00 ",
"2017-04-06");

