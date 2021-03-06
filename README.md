# Shooping
Internet开发课程设计——购物系统
数据库SQL Server实现

1、购物系统登录界面
购物系统登陆分为管理员和普通用户，Login.jsp页面填写表单，数据传递到CheckLogin.jsp页面，CheckLogin.jsp页面根据表单中的用户名查询数据库，判断用户数据是否填写正确，判定用户能否登陆成功，未登陆成功则跳转回登录界面重新填写登录信息。
 ![Image text](https://raw.githubusercontent.com/ZZhouMeng/Shooping/master/%E7%95%8C%E9%9D%A2%E8%AE%BE%E8%AE%A1%E5%9B%BE%E7%89%87/%E8%B4%AD%E7%89%A9%E7%B3%BB%E7%BB%9F%E7%99%BB%E9%99%86%E7%95%8C%E9%9D%A2.png)
 
2、购物系统注册界面
用户点击“点我注册”按钮进入注册界面。注册用户时，用户需要填写用户名、密码、确认密码、邮箱和电话号码，这些内容都是必填项目且默认注册为普通用户。
![Image text](https://raw.githubusercontent.com/ZZhouMeng/Shooping/master/%E7%95%8C%E9%9D%A2%E8%AE%BE%E8%AE%A1%E5%9B%BE%E7%89%87/%E8%B4%AD%E7%89%A9%E7%B3%BB%E7%BB%9F%E6%B3%A8%E5%86%8C%E7%95%8C%E9%9D%A2.png)

3、购物系统首页
图中是还未登陆的购物系统。系统的顶部有搜索框、购物车、用户个人信息。页面的版头显示“首页”、“订单查询”、“关于我们”、类别导航栏、动态推广栏这五部分内容。爆款商品中显示的是商品库中销售量前四的热卖商品，通过点击“加入购物车”按钮能够把商品添加到购物车。
![Image text](https://raw.githubusercontent.com/ZZhouMeng/Shooping/master/%E7%95%8C%E9%9D%A2%E8%AE%BE%E8%AE%A1%E5%9B%BE%E7%89%87/%E8%B4%AD%E7%89%A9%E7%B3%BB%E7%BB%9F%E9%A6%96%E9%A1%B5.jpg)

4、商品分类页面
用户在系统左侧分类导航栏中可以任选其一分类，查看该分类下的所有货物，此处选择的是零食分类的商品。
![Image text](https://raw.githubusercontent.com/ZZhouMeng/Shooping/master/%E7%95%8C%E9%9D%A2%E8%AE%BE%E8%AE%A1%E5%9B%BE%E7%89%87/%E5%95%86%E5%93%81%E5%88%86%E7%B1%BB%E9%A1%B5%E9%9D%A2.png)

5、商品搜索页面
用户在搜索栏中输入想要搜索的商品的模糊信息，如此处关键词为“奥利奥”，系统显示含有奥利奥的“奥利奥夹心饼干”商品。搜索结果中也会显示：对于关键词“奥利奥”检索结果如下。
![Image text](https://raw.githubusercontent.com/ZZhouMeng/Shooping/master/%E7%95%8C%E9%9D%A2%E8%AE%BE%E8%AE%A1%E5%9B%BE%E7%89%87/%E5%95%86%E5%93%81%E6%90%9C%E7%B4%A2%E7%95%8C%E9%9D%A2.png)

6、查看商品详情页面
点击任意商品的图片，即进入商品的详细信息页面。包括商品的名称、商品简介、商品售卖价格以及商品评分等级，点击星星即可评分，商品分数会动态变化，计算方式为（获得的总星级/被评价的次数）。在该页面中设置“加入购物车”按钮，点击后可以将该商品添加到购物车。页面下半部分还显示爆款商品，也可点击爆款商品的商品图片进入该商品的商品详情。
![Image text](https://raw.githubusercontent.com/ZZhouMeng/Shooping/master/%E7%95%8C%E9%9D%A2%E8%AE%BE%E8%AE%A1%E5%9B%BE%E7%89%87/%E6%9F%A5%E7%9C%8B%E5%95%86%E5%93%81%E8%AF%A6%E6%83%85%E9%A1%B5%E9%9D%A2.png)

7、商品添加到购物车页面
添加到购物车的商品显示在弹出的购物车框中，用户可以在其中修改购买的商品数量，查看商品的单价，以及所有添加在购物车的商品的价格总和。确认想要购买的商品之后，点击生成订单，跳转到付款中心。如果未登录则会跳转至登录页面请求登录，登录后，上方显示用户名，且此前的购物车内容得到保留。
![Image text](https://raw.githubusercontent.com/ZZhouMeng/Shooping/master/%E7%95%8C%E9%9D%A2%E8%AE%BE%E8%AE%A1%E5%9B%BE%E7%89%87/%E8%B4%AD%E7%89%A9%E8%BD%A6%E5%AD%98%E5%9C%A8%E5%95%86%E5%93%81%E7%95%8C%E9%9D%A2.png)
![Image text](https://raw.githubusercontent.com/ZZhouMeng/Shooping/master/%E7%95%8C%E9%9D%A2%E8%AE%BE%E8%AE%A1%E5%9B%BE%E7%89%87/%E8%B4%AD%E7%89%A9%E8%BD%A6%E4%B8%8D%E5%AD%98%E5%9C%A8%E5%95%86%E5%93%81%E9%A1%B5%E9%9D%A2.png)

8、付款中心界面
购物车中的商品，点击生成订单后可以生成相应订单，并在订单页面选择相应的收货地址信息。订单默认使用用户的默认地址，确认购买的商品和商品数量之后，点击提交订单，系统会从当前用户中扣除对应金额。支付成功与失败均有相关提示。
![Image text](https://raw.githubusercontent.com/ZZhouMeng/Shooping/master/%E7%95%8C%E9%9D%A2%E8%AE%BE%E8%AE%A1%E5%9B%BE%E7%89%87/%E4%BB%98%E6%AC%BE%E4%B8%AD%E5%BF%83%E7%95%8C%E9%9D%A2.png)


9、用户个人信息界面
用户登录后，登录注册按钮变为个人信息按钮，点击可查看个人信息。同时，也可以在个人信息界面里添加收货地址和设置默认地址，也可以修改和删除已添加的收货地址信息。
 ![Image text](https://raw.githubusercontent.com/ZZhouMeng/Shooping/master/%E7%95%8C%E9%9D%A2%E8%AE%BE%E8%AE%A1%E5%9B%BE%E7%89%87/%E7%94%A8%E6%88%B7%E4%B8%AA%E4%BA%BA%E4%BF%A1%E6%81%AF.png)
 ![Image text](https://raw.githubusercontent.com/ZZhouMeng/Shooping/master/%E7%95%8C%E9%9D%A2%E8%AE%BE%E8%AE%A1%E5%9B%BE%E7%89%87/%E6%B7%BB%E5%8A%A0%E6%94%B6%E8%B4%A7%E5%9C%B0%E5%9D%80.png)

10、管理员发布商品界面
在添加商品页面，管理员可以上传商品图片，选择商品种类，填写商品的详细信息如商品名称、原价、现价和商品描述。填写完并确认信息之后，点击提交。系统自动将该商品上传到数据库，并在商品展示页面中显示。
 ![Image text](https://raw.githubusercontent.com/ZZhouMeng/Shooping/master/%E7%95%8C%E9%9D%A2%E8%AE%BE%E8%AE%A1%E5%9B%BE%E7%89%87/%E5%95%86%E5%93%81%E5%8F%91%E5%B8%83.png)
 
11、管理员商品管理
管理员可以点击“商品管理”页面，分页查看所有商品信息，可以对任一商品进行修改或删除，同时也可以在不同分类下的商品进行修改或添加商品。
![Image text](https://raw.githubusercontent.com/ZZhouMeng/Shooping/master/%E7%95%8C%E9%9D%A2%E8%AE%BE%E8%AE%A1%E5%9B%BE%E7%89%87/%E5%85%A8%E9%83%A8%E5%95%86%E5%93%81%E7%AE%A1%E7%90%86%E9%A1%B5%E9%9D%A2.png)
![Image text](https://raw.githubusercontent.com/ZZhouMeng/Shooping/master/%E7%95%8C%E9%9D%A2%E8%AE%BE%E8%AE%A1%E5%9B%BE%E7%89%87/%E5%88%86%E7%B1%BB%E5%95%86%E5%93%81%E7%AE%A1%E7%90%86%E9%A1%B5%E9%9D%A2.png)

12、管理员修改商品信息
点击“修改”按钮后会跳转到修改商品信息界面，页面上会在相应的位置显示之前发布的新闻内容，用户只需要在这个基础上进行修改就行了。然后点击“提交”，会重新跳转到商品展示界面，并会看到之前修改的商品的信息已经变成最新的了。
![Image text](https://raw.githubusercontent.com/ZZhouMeng/Shooping/master/%E7%95%8C%E9%9D%A2%E8%AE%BE%E8%AE%A1%E5%9B%BE%E7%89%87/%E5%95%86%E5%93%81%E4%BF%A1%E6%81%AF%E4%BF%AE%E6%94%B9.png)
 
13、订单管理
a.先判断用户类型，如果是管理员可以在订单管理界面中查看所有正在进行或已经结束的订单状态。如果是普通用户，可以查询当前用户的所有订单的相关信息。
b.点击订单详情查看详情。如果当前用户是管理员，则可以对待发货的订单点击变成发货处理。如果当前为普通用户，收到配送的商品后，可以对已发货的订单可以确认收货，点击后订单状态将变成已完成。已完成的订单只能查看。
![Image text](https://raw.githubusercontent.com/ZZhouMeng/Shooping/master/%E7%95%8C%E9%9D%A2%E8%AE%BE%E8%AE%A1%E5%9B%BE%E7%89%87/%E8%AE%A2%E5%8D%95%E7%AE%A1%E7%90%86%E4%B8%AD%E6%9F%A5%E7%9C%8B%E6%89%80%E6%9C%89%E8%AE%A2%E5%8D%95.png)
![Image text](https://raw.githubusercontent.com/ZZhouMeng/Shooping/master/%E7%95%8C%E9%9D%A2%E8%AE%BE%E8%AE%A1%E5%9B%BE%E7%89%87/%E7%AE%A1%E7%90%86%E5%91%98%E5%AF%B9%E8%AE%A2%E5%8D%95%E5%8F%91%E8%B4%A7%E5%A4%84%E7%90%86.png)
![Image text](https://raw.githubusercontent.com/ZZhouMeng/Shooping/master/%E7%95%8C%E9%9D%A2%E8%AE%BE%E8%AE%A1%E5%9B%BE%E7%89%87/%E6%99%AE%E9%80%9A%E7%94%A8%E6%88%B7%E7%A1%AE%E8%AE%A4%E6%94%B6%E8%B4%A7.png)



