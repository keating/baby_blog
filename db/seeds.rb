# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#content = %(<p>合肥晚报讯</p> 今天早晨6时许，裕丰花市小韦渔具店的卷闸门被小偷撬开，店内存放的现金和硬币被偷得一干二净，店老板尤先生说估计有六百元左右。
#
#    据尤老板说，今天早晨6点多，他正在家中睡觉，商店隔壁的人给他打电话说他的渔具店的卷闸门被撬开了，尤老板一听赶紧起床穿衣跑向店里，尤老板跑到店门口一看，卷闸门侧面已经被撬开，当他打开卷闸门，发现放置于卷闸门内侧的水桶也被小偷打翻，水桶里的水洒满店内的地面。
#
#    尤老板进店之后赶紧查看存放现金的柜子，柜子里面的三百元左右现钞和三百元硬币已经不见了，而店中的渔具等初步检查都没有丢失，尤老板赶紧拨打了报警电话。据尤老板说，由于店面比较小，平时晚上没有人员在店里值班，“门口旁边都有摄像头，还是在花市里面，都有保安，我觉得安全应该没有问题，我对花市的治安一直都很放心，没想到还是被偷了。”尤老板说店内没有安装视频监控，现在也没法记录小偷进店的场景，对于这次被偷，尤老板觉得也是不幸中的万幸，他说店内值钱的渔具都没有丢失，准备下一步购买视频监控在店中安装。
#
#    目前，辖区派出所已经联系裕丰花市的保安部门，准备调取监控，该案正在进一步调查中。
#
#    <p>（本报记者 郑静/文 马启兵/图）<p>)

user = User.create!(:name => "Keating", :email => "outofclouds@gmail.com", :password => "789456123", :password_confirmation => "789456123")
user.admin = true
user.save!
#User.create!(:name => "JI", :email => "abc@def.com", :password => "123456", :password_confirmation => "123456")
#User.create!(:name => "WN", :email => "abc@ghi.com", :password => "123456", :password_confirmation => "123456")

#article = Article.create(:title=>"清晨渔具店被盗", :content => content)
#article.user = user
#article.save!